import '../../../../core/models/player_summary.dart';
import '../../../../core/network/api_result.dart';
import '../../../../core/network/guard.dart';
import '../../../../core/network/pagination_meta.dart';
import '../../domain/entities/achievement.dart';
import '../../domain/entities/player.dart';
import '../../domain/entities/player_history.dart';
import '../../domain/entities/player_profile.dart';
import '../../domain/entities/player_stats.dart';
import '../../domain/repositories/players_repository.dart';
import '../datasources/players_remote_data_source.dart';
import '../models/player_model.dart';

class PlayersRepositoryImpl implements PlayersRepository {
  final PlayersRemoteDataSource remote;

  PlayersRepositoryImpl(this.remote);

  @override
  ApiResult<Paginated<PlayerSummary>> searchPlayers({
    String? q,
    String? level,
    String? side,
    String? country,
    int page = 1,
  }) =>
      guard(() => remote.searchPlayers(q: q, level: level, side: side, country: country, page: page));

  @override
  ApiResult<Player> getPlayer(String playerId) =>
      guard(() async => (await remote.getPlayer(playerId)).toEntity());

  @override
  ApiResult<PlayerProfile> getProfile(String playerId) => guard(() => remote.getProfile(playerId));

  @override
  ApiResult<PlayerStatsBundle> getStats(String playerId) => guard(() => remote.getStats(playerId));

  @override
  ApiResult<Paginated<RatingHistoryEntry>> getRatingHistory(String playerId, {int page = 1}) =>
      guard(() => remote.getRatingHistory(playerId, page: page));

  @override
  ApiResult<SeasonHistory> getSeasonHistory(String playerId, {String? season}) =>
      guard(() => remote.getSeasonHistory(playerId, season: season));

  @override
  ApiResult<List<TournamentHistoryEntry>> getTournamentHistory(String playerId) =>
      guard(() => remote.getTournamentHistory(playerId));

  @override
  ApiResult<Paginated<ResultRow>> getMatches(String playerId, {int page = 1}) =>
      guard(() => remote.getMatches(playerId, page: page));

  @override
  ApiResult<List<Achievement>> getAchievements(String playerId, {bool includeLocked = false}) =>
      guard(() => remote.getAchievements(playerId, includeLocked: includeLocked));

  @override
  ApiResult<List<Achievement>> getAchievementCatalog() => guard(remote.getAchievementCatalog);

  @override
  ApiResult<Paginated<PlayerSummary>> getFollowers(String playerId, {int page = 1}) =>
      guard(() => remote.getFollowers(playerId, page: page));

  @override
  ApiResult<Paginated<PlayerSummary>> getFollowing(String playerId, {int page = 1}) =>
      guard(() => remote.getFollowing(playerId, page: page));

  @override
  ApiResult<Paginated<Challenge>> getMyChallenges({required String direction, int page = 1}) =>
      guard(() => remote.getMyChallenges(direction: direction, page: page));

  @override
  ApiResult<void> follow(String playerId) => guard(() => remote.follow(playerId));

  @override
  ApiResult<void> unfollow(String playerId) => guard(() => remote.unfollow(playerId));

  @override
  ApiResult<void> respect(String playerId) => guard(() => remote.respect(playerId));

  @override
  ApiResult<void> challenge(String playerId, {String? message}) =>
      guard(() => remote.challenge(playerId, message: message));

  @override
  ApiResult<void> respondToChallenge(int challengeId, {required bool accept}) =>
      guard(() => remote.respondToChallenge(challengeId, accept: accept));
}
