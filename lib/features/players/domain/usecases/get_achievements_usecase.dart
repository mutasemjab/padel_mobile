import '../../../../core/network/api_result.dart';
import '../entities/achievement.dart';
import '../repositories/players_repository.dart';

class GetAchievementsUseCase {
  final PlayersRepository repository;

  GetAchievementsUseCase(this.repository);

  ApiResult<List<Achievement>> call(String playerId) =>
      repository.getAchievements(playerId);
}
