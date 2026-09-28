import '../../../../core/models/player_summary.dart';
import '../../../../core/network/api_result.dart';
import '../../../../core/network/pagination_meta.dart';
import '../entities/achievement.dart';
import '../entities/player_history.dart';
import '../entities/player_profile.dart';
import '../entities/player_stats.dart';
import '../repositories/players_repository.dart';

/// Read-only player use cases backing the athlete card and its tabs.
class GetPlayerProfileUseCase {
  final PlayersRepository repository;
  GetPlayerProfileUseCase(this.repository);
  ApiResult<PlayerProfile> call(String playerId) => repository.getProfile(playerId);
}

class SearchPlayersUseCase {
  final PlayersRepository repository;
  SearchPlayersUseCase(this.repository);
  ApiResult<Paginated<PlayerSummary>> call({String? q, String? level, String? side, String? country, int page = 1}) =>
      repository.searchPlayers(q: q, level: level, side: side, country: country, page: page);
}

class GetPlayerStatsUseCase {
  final PlayersRepository repository;
  GetPlayerStatsUseCase(this.repository);
  ApiResult<PlayerStatsBundle> call(String playerId) => repository.getStats(playerId);
}

class GetRatingHistoryUseCase {
  final PlayersRepository repository;
  GetRatingHistoryUseCase(this.repository);
  ApiResult<Paginated<RatingHistoryEntry>> call(String playerId, {int page = 1}) =>
      repository.getRatingHistory(playerId, page: page);
}

class GetSeasonHistoryUseCase {
  final PlayersRepository repository;
  GetSeasonHistoryUseCase(this.repository);
  ApiResult<SeasonHistory> call(String playerId, {String? season}) =>
      repository.getSeasonHistory(playerId, season: season);
}

class GetTournamentHistoryUseCase {
  final PlayersRepository repository;
  GetTournamentHistoryUseCase(this.repository);
  ApiResult<List<TournamentHistoryEntry>> call(String playerId) => repository.getTournamentHistory(playerId);
}

class GetPlayerMatchesUseCase {
  final PlayersRepository repository;
  GetPlayerMatchesUseCase(this.repository);
  ApiResult<Paginated<ResultRow>> call(String playerId, {int page = 1}) =>
      repository.getMatches(playerId, page: page);
}

class GetAchievementCatalogUseCase {
  final PlayersRepository repository;
  GetAchievementCatalogUseCase(this.repository);

  /// With a [playerId], the player's catalog with progress
  /// (`?include_locked=1`); otherwise the global catalog.
  ApiResult<List<Achievement>> call({String? playerId}) => playerId == null
      ? repository.getAchievementCatalog()
      : repository.getAchievements(playerId, includeLocked: true);
}

class GetFollowersUseCase {
  final PlayersRepository repository;
  GetFollowersUseCase(this.repository);
  ApiResult<Paginated<PlayerSummary>> call(String playerId, {required bool following, int page = 1}) =>
      following ? repository.getFollowing(playerId, page: page) : repository.getFollowers(playerId, page: page);
}

class GetMyChallengesUseCase {
  final PlayersRepository repository;
  GetMyChallengesUseCase(this.repository);
  ApiResult<Paginated<Challenge>> call({required bool incoming, int page = 1}) =>
      repository.getMyChallenges(direction: incoming ? 'incoming' : 'outgoing', page: page);
}
