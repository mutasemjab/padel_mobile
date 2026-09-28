import '../../../../core/models/player_summary.dart';
import '../../../../core/network/api_result.dart';
import '../../../../core/network/pagination_meta.dart';
import '../entities/achievement.dart';
import '../entities/player.dart';
import '../entities/player_history.dart';
import '../entities/player_profile.dart';
import '../entities/player_stats.dart';

abstract class PlayersRepository {
  ApiResult<Paginated<PlayerSummary>> searchPlayers({String? q, String? level, String? side, String? country, int page = 1});
  ApiResult<Player> getPlayer(String playerId);
  ApiResult<PlayerProfile> getProfile(String playerId);
  ApiResult<PlayerStatsBundle> getStats(String playerId);
  ApiResult<Paginated<RatingHistoryEntry>> getRatingHistory(String playerId, {int page = 1});
  ApiResult<SeasonHistory> getSeasonHistory(String playerId, {String? season});
  ApiResult<List<TournamentHistoryEntry>> getTournamentHistory(String playerId);
  ApiResult<Paginated<ResultRow>> getMatches(String playerId, {int page = 1});
  ApiResult<List<Achievement>> getAchievements(String playerId, {bool includeLocked = false});
  ApiResult<List<Achievement>> getAchievementCatalog();
  ApiResult<Paginated<PlayerSummary>> getFollowers(String playerId, {int page = 1});
  ApiResult<Paginated<PlayerSummary>> getFollowing(String playerId, {int page = 1});
  ApiResult<Paginated<Challenge>> getMyChallenges({required String direction, int page = 1});
  ApiResult<void> follow(String playerId);
  ApiResult<void> unfollow(String playerId);
  ApiResult<void> respect(String playerId);
  ApiResult<void> challenge(String playerId, {String? message});
  ApiResult<void> respondToChallenge(int challengeId, {required bool accept});
}
