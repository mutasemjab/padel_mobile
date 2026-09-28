import '../../../../core/network/api_result.dart';
import '../repositories/players_repository.dart';

/// Follow / respect / challenge are single-call, idempotent-ish actions on a
/// player, so they're grouped in one file rather than five near-empty ones.
class FollowPlayerUseCase {
  final PlayersRepository repository;
  FollowPlayerUseCase(this.repository);
  ApiResult<void> call(String playerId) => repository.follow(playerId);
}

class UnfollowPlayerUseCase {
  final PlayersRepository repository;
  UnfollowPlayerUseCase(this.repository);
  ApiResult<void> call(String playerId) => repository.unfollow(playerId);
}

class RespectPlayerUseCase {
  final PlayersRepository repository;
  RespectPlayerUseCase(this.repository);
  ApiResult<void> call(String playerId) => repository.respect(playerId);
}

class ChallengePlayerUseCase {
  final PlayersRepository repository;
  ChallengePlayerUseCase(this.repository);
  ApiResult<void> call(String playerId, {String? message}) =>
      repository.challenge(playerId, message: message);
}

class RespondToChallengeUseCase {
  final PlayersRepository repository;
  RespondToChallengeUseCase(this.repository);
  ApiResult<void> call(int challengeId, {required bool accept}) =>
      repository.respondToChallenge(challengeId, accept: accept);
}
