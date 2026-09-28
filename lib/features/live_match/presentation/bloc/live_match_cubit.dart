import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/network/api_result.dart';
import '../../../tournaments/domain/entities/live_payload.dart';
import '../../../tournaments/domain/entities/match.dart';
import '../../../tournaments/domain/repositories/live_scores_repository.dart';
import '../../../tournaments/domain/usecases/competition_usecases.dart';
import '../../../tournaments/domain/usecases/get_match_usecase.dart';
import 'live_match_state.dart';

/// Live scoring for one match. Payloads from the socket (or the identical
/// polling fallback) are applied **in place** — no refetch — unless the
/// `version` sequence has a gap (> +1) or goes backwards outside an
/// undo/correction, in which case the match is refetched once.
class LiveMatchCubit extends Cubit<LiveMatchState> {
  final GetMatchUseCase getMatch;
  final GetMatchByIdUseCase getMatchById;
  final GetMatchPointsUseCase getPoints;
  final LiveScoresRepository liveScores;
  final int? tournamentId;
  final int matchId;

  StreamSubscription<LivePayload>? _sub;
  bool _refetching = false;

  LiveMatchCubit({
    required this.getMatch,
    required this.getMatchById,
    required this.getPoints,
    required this.liveScores,
    required this.matchId,
    this.tournamentId,
  }) : super(const LiveMatchState.initial());

  ApiResult<Match> _fetchMatch() =>
      tournamentId == null ? getMatchById(matchId) : getMatch(tournamentId!, matchId);

  Future<void> start() async {
    emit(const LiveMatchState.loading());
    final result = await _fetchMatch();
    if (isClosed) return;
    await result.match(
      (failure) async => emit(LiveMatchState.error(failure)),
      (match) async {
        final points = (await getPoints(matchId)).getOrElse((_) => const []);
        if (isClosed) return;
        emit(LiveMatchState.loaded(
          match: match,
          points: _sorted(points),
          transport: liveScores.transport.value,
          pollSeconds: liveScores.pollInterval.inSeconds,
        ));
        _listen();
      },
    );
  }

  void _listen() {
    liveScores.transport.addListener(_onTransport);
    _sub ??= liveScores.watchMatch(matchId).listen(onPayload);
  }

  void _onTransport() {
    final current = state;
    if (current is LiveMatchLoaded && !isClosed) {
      emit(current.copyWith(transport: liveScores.transport.value));
    }
  }

  /// Visible for tests.
  Future<void> onPayload(LivePayload payload) async {
    final current = state;
    if (current is! LiveMatchLoaded || payload.matchId != matchId) return;
    final version = current.match.version;

    // Duplicate (e.g. socket + poll overlap) — nothing new.
    if (payload.version == version && !payload.event.mayRewind) return;

    final gap = payload.version > version + 1;
    final illegalRewind = payload.version < version && !payload.event.mayRewind;
    if (gap || illegalRewind) {
      await _refetch(current);
      return;
    }

    var points = current.points;
    final last = payload.lastPoint;
    switch (payload.event) {
      case LiveEventType.undo:
      case LiveEventType.correction:
      case LiveEventType.detailsUpdated:
        points = _sorted((await getPoints(matchId)).getOrElse((_) => current.points));
      default:
        if (last != null && !points.any((p) => p.id == last.id)) points = _sorted([...points, last]);
    }
    if (isClosed) return;
    emit(current.copyWith(
      match: payload.applyTo(current.match),
      points: points,
      lastEvent: payload.event,
      eventSeq: current.eventSeq + 1,
      pollSeconds: payload.pollIntervalSeconds ?? current.pollSeconds,
    ));
  }

  Future<void> _refetch(LiveMatchLoaded current) async {
    if (_refetching) return;
    _refetching = true;
    final result = await _fetchMatch();
    final points = await getPoints(matchId);
    _refetching = false;
    if (isClosed) return;
    result.match(
      (_) => null,
      (match) => emit(current.copyWith(
        match: match,
        points: _sorted(points.getOrElse((_) => current.points)),
        lastEvent: LiveEventType.correction,
        eventSeq: current.eventSeq + 1,
      )),
    );
  }

  static List<PointEvent> _sorted(List<PointEvent> points) =>
      [...points.where((p) => !p.isVoided)]..sort((a, b) => b.sequence.compareTo(a.sequence));

  @override
  Future<void> close() {
    _sub?.cancel();
    liveScores.transport.removeListener(_onTransport);
    liveScores.stopMatch(matchId);
    return super.close();
  }
}
