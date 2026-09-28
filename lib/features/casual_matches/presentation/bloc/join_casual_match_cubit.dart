import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure.dart';
import '../../domain/usecases/join_casual_match_usecase.dart';

sealed class JoinCasualMatchState extends Equatable {
  const JoinCasualMatchState();
  @override
  List<Object?> get props => [];
}

class JoinCasualMatchIdle extends JoinCasualMatchState {
  const JoinCasualMatchIdle();
}

class JoinCasualMatchJoining extends JoinCasualMatchState {
  const JoinCasualMatchJoining();
}

class JoinCasualMatchJoined extends JoinCasualMatchState {
  const JoinCasualMatchJoined();
}

class JoinCasualMatchFailed extends JoinCasualMatchState {
  final Failure failure;
  const JoinCasualMatchFailed(this.failure);
  @override
  List<Object?> get props => [failure];
}

/// Backs the per-row "Join" button — instantiated once per row (via a keyed
/// BlocProvider inside [CasualMatchCard]) so joining one match doesn't
/// disable the whole list.
class JoinCasualMatchCubit extends Cubit<JoinCasualMatchState> {
  final JoinCasualMatchUseCase joinCasualMatch;

  JoinCasualMatchCubit(this.joinCasualMatch) : super(const JoinCasualMatchIdle());

  Future<void> join(int id) async {
    emit(const JoinCasualMatchJoining());
    final result = await joinCasualMatch(id);
    result.match(
      (failure) => emit(JoinCasualMatchFailed(failure)),
      (_) => emit(const JoinCasualMatchJoined()),
    );
  }
}
