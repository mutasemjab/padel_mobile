import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/error/failure.dart';
import '../../../core/network/api_result.dart';
import '../../../core/state/base_cubits.dart';
import '../../tournaments/domain/entities/live_payload.dart';
import '../../tournaments/domain/entities/match.dart';
import '../data/scorekeeper_repository.dart';
import '../domain/scorekeeper_entities.dart';

class ScorekeeperMatchesCubit extends ViewCubit<List<Match>> {
  final ScorekeeperRepository repository;

  ScorekeeperMatchesCubit(this.repository);

  @override
  ApiResult<List<Match>> fetch() => repository.getMatches();
}

class ScorekeeperLoginCubit extends ActionCubit {
  final ScorekeeperRepository repository;

  ScorekeeperLoginCubit(this.repository);

  Future<bool> login(String login, String password) => run(() => repository.login(login: login, password: password));
}

class ScoringState {
  final Match match;
  final bool sending;
  final PointEvent? lastPoint;
  final Failure? failure;

  const ScoringState({required this.match, this.sending = false, this.lastPoint, this.failure});

  ScoringState copyWith({Match? match, bool? sending, PointEvent? lastPoint, Failure? failure, bool clearFailure = false}) =>
      ScoringState(
        match: match ?? this.match,
        sending: sending ?? this.sending,
        lastPoint: lastPoint ?? this.lastPoint,
        failure: clearFailure ? null : (failure ?? this.failure),
      );
}

/// Records points instantly (team only); detail is attached afterwards and
/// never blocks the score.
class ScoringCubit extends Cubit<ScoringState> {
  final ScorekeeperRepository repository;

  ScoringCubit(this.repository, Match match) : super(ScoringState(match: match));

  void _apply(LivePayload? payload) {
    if (payload == null) {
      emit(state.copyWith(sending: false));
      return;
    }
    emit(ScoringState(match: payload.applyTo(state.match), lastPoint: payload.lastPoint ?? state.lastPoint));
  }

  Future<void> point(int winningTeamId) => _send(() => repository.recordPoint(state.match.id, PointInput(winningTeamId: winningTeamId)));

  Future<void> undo() => _send(() => repository.undo(state.match.id));

  Future<void> details(PointInput input) async {
    final point = state.lastPoint;
    if (point == null) return;
    await _send(() => repository.updateDetails(state.match.id, point.id, input));
  }

  Future<void> _send(ApiResult<LivePayload?> Function() call) async {
    emit(state.copyWith(sending: true, clearFailure: true));
    final result = await call();
    if (isClosed) return;
    result.match((f) => emit(state.copyWith(sending: false, failure: f)), _apply);
  }
}
