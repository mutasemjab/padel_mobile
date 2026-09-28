import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/match.dart';
import '../../domain/entities/registration.dart';
import '../../domain/repositories/live_scores_repository.dart';
import '../../domain/usecases/competition_usecases.dart';
import '../../domain/usecases/get_live_matches_usecase.dart';
import '../../domain/usecases/get_tournament_detail_usecase.dart';
import 'tournament_detail_state.dart';

/// Tournament + its live matches (kept current in place from the live
/// channel) + the player's registrations in it.
class TournamentDetailCubit extends Cubit<TournamentDetailState> {
  final GetTournamentDetailUseCase getTournamentDetail;
  final GetLiveMatchesUseCase getLiveMatches;
  final GetMyRegistrationsUseCase? getMyRegistrations;
  final LiveScoresRepository? liveScores;

  StreamSubscription<TournamentLiveEvent>? _liveSub;
  int? _tournamentId;

  TournamentDetailCubit({
    required this.getTournamentDetail,
    required this.getLiveMatches,
    this.getMyRegistrations,
    this.liveScores,
  }) : super(const TournamentDetailState.initial());

  Future<void> load(int tournamentId, {bool silent = false}) async {
    _tournamentId = tournamentId;
    if (!silent || state is! TournamentDetailLoaded) emit(const TournamentDetailState.loading());
    final result = await getTournamentDetail(tournamentId);
    if (isClosed) return;
    await result.match(
      (failure) async {
        if (!silent || state is! TournamentDetailLoaded) emit(TournamentDetailState.error(failure));
      },
      (tournament) async {
        final live = (await getLiveMatches(tournamentId)).getOrElse((_) => []);
        final regs = getMyRegistrations == null
            ? const <Registration>[]
            : (await getMyRegistrations!()).match((_) => const <Registration>[], (page) => page.items);
        if (isClosed) return;
        emit(TournamentDetailState.loaded(
          tournament: tournament,
          liveMatches: live,
          myRegistrations: regs.where((r) => r.category.tournamentId == tournamentId).toList(),
        ));
        _watchLive(tournamentId);
      },
    );
  }

  Future<void> refresh() async {
    final id = _tournamentId;
    if (id != null) await load(id, silent: true);
  }

  void _watchLive(int tournamentId) {
    if (_liveSub != null || liveScores == null) return;
    _liveSub = liveScores!.watchTournament(tournamentId).listen(_onLiveEvent);
  }

  void _onLiveEvent(TournamentLiveEvent event) {
    final current = state;
    if (current is! TournamentDetailLoaded) return;
    switch (event) {
      case TournamentLiveSnapshot(:final matches):
        emit(current.copyWith(liveMatches: matches));
      case TournamentLiveScore(:final payload):
        final index = current.liveMatches.indexWhere((m) => m.id == payload.matchId);
        if (index == -1) {
          // A match just went live — pick it up with its full team data.
          if (payload.status == MatchStatus.inProgress) _refreshLive();
          return;
        }
        final updated = payload.applyTo(current.liveMatches[index]);
        final list = [...current.liveMatches];
        if (updated.status == MatchStatus.inProgress) {
          list[index] = updated;
        } else {
          list.removeAt(index);
        }
        emit(current.copyWith(liveMatches: list));
    }
  }

  Future<void> _refreshLive() async {
    final id = _tournamentId;
    if (id == null) return;
    final live = await getLiveMatches(id);
    final current = state;
    if (isClosed || current is! TournamentDetailLoaded) return;
    live.match((_) => null, (matches) => emit(current.copyWith(liveMatches: matches)));
  }

  @override
  Future<void> close() {
    _liveSub?.cancel();
    final id = _tournamentId;
    if (id != null) liveScores?.stopTournament(id);
    return super.close();
  }
}
