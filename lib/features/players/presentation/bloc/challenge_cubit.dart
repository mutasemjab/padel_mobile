import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure.dart';
import '../../domain/usecases/social_actions_usecases.dart';

sealed class ChallengeActionState extends Equatable {
  const ChallengeActionState();
  @override
  List<Object?> get props => [];
}

class ChallengeActionIdle extends ChallengeActionState {
  const ChallengeActionIdle();
}

class ChallengeActionSending extends ChallengeActionState {
  const ChallengeActionSending();
}

class ChallengeActionSent extends ChallengeActionState {
  const ChallengeActionSent();
}

class ChallengeActionFailed extends ChallengeActionState {
  final Failure failure;
  const ChallengeActionFailed(this.failure);
  @override
  List<Object?> get props => [failure];
}

/// Backs the "challenge this player" dialog/button — deliberately separate
/// from [PlayerProfileCubit] so a failed challenge doesn't clobber the
/// already-loaded profile state.
class ChallengeCubit extends Cubit<ChallengeActionState> {
  final ChallengePlayerUseCase challengePlayer;

  ChallengeCubit(this.challengePlayer) : super(const ChallengeActionIdle());

  Future<void> send(String playerId, {String? message}) async {
    emit(const ChallengeActionSending());
    final result = await challengePlayer(playerId, message: message);
    result.match(
      (failure) => emit(ChallengeActionFailed(failure)),
      (_) => emit(const ChallengeActionSent()),
    );
  }

  void reset() => emit(const ChallengeActionIdle());
}
