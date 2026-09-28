import '../../../../core/models/player_summary.dart';
import '../../../../core/network/api_result.dart';
import '../../../../core/network/pagination_meta.dart';
import '../../../../core/state/base_cubits.dart';
import '../../domain/entities/achievement.dart';
import '../../domain/entities/player_history.dart';
import '../../domain/entities/player_stats.dart';
import '../../domain/usecases/player_insight_usecases.dart';

/// Results tab — paginated verified results.
class PlayerResultsCubit extends PagedCubit<ResultRow> {
  final GetPlayerMatchesUseCase getMatches;
  final String playerId;

  PlayerResultsCubit(this.getMatches, this.playerId);

  @override
  ApiResult<Paginated<ResultRow>> fetchPage(int page) => getMatches(playerId, page: page);
}

/// Tournament history timeline.
class TournamentHistoryCubit extends ViewCubit<List<TournamentHistoryEntry>> {
  final GetTournamentHistoryUseCase getHistory;
  final String playerId;

  TournamentHistoryCubit(this.getHistory, this.playerId);

  @override
  ApiResult<List<TournamentHistoryEntry>> fetch() => getHistory(playerId);
}

/// Achievements catalog with progress for one player.
class PlayerAchievementsCubit extends ViewCubit<List<Achievement>> {
  final GetAchievementCatalogUseCase getCatalog;
  final String playerId;

  PlayerAchievementsCubit(this.getCatalog, this.playerId);

  @override
  ApiResult<List<Achievement>> fetch() => getCatalog(playerId: playerId);
}

/// Stats tab: summary plus Premium-owner advanced analytics.
class PlayerStatsCubit extends ViewCubit<PlayerStatsBundle> {
  final GetPlayerStatsUseCase getStats;
  final String playerId;

  PlayerStatsCubit(this.getStats, this.playerId);

  @override
  ApiResult<PlayerStatsBundle> fetch() => getStats(playerId);

  @override
  bool isEmpty(PlayerStatsBundle data) => false;
}

class RatingHistoryCubit extends PagedCubit<RatingHistoryEntry> {
  final GetRatingHistoryUseCase getHistory;
  final String playerId;

  RatingHistoryCubit(this.getHistory, this.playerId);

  @override
  ApiResult<Paginated<RatingHistoryEntry>> fetchPage(int page) => getHistory(playerId, page: page);
}

class SeasonHistoryCubit extends ViewCubit<SeasonHistory> {
  final GetSeasonHistoryUseCase getHistory;
  final String playerId;
  String? season;

  SeasonHistoryCubit(this.getHistory, this.playerId);

  @override
  ApiResult<SeasonHistory> fetch() => getHistory(playerId, season: season);

  @override
  bool isEmpty(SeasonHistory data) => false;

  Future<void> selectSeason(String value) {
    season = value;
    return load();
  }
}

/// Followers / following lists.
class FollowListCubit extends PagedCubit<PlayerSummary> {
  final GetFollowersUseCase getFollowers;
  final String playerId;
  final bool following;

  FollowListCubit(this.getFollowers, {required this.playerId, required this.following});

  @override
  ApiResult<Paginated<PlayerSummary>> fetchPage(int page) =>
      getFollowers(playerId, following: following, page: page);
}

/// Player search (`GET players?q=&level=&side=&country=`).
class PlayerSearchCubit extends PagedCubit<PlayerSummary> {
  final SearchPlayersUseCase searchPlayers;
  String query = '';
  String? level;
  String? side;

  PlayerSearchCubit(this.searchPlayers);

  @override
  ApiResult<Paginated<PlayerSummary>> fetchPage(int page) =>
      searchPlayers(q: query, level: level, side: side, page: page);

  Future<void> search({String? q, String? level, String? side, bool clearLevel = false, bool clearSide = false}) {
    if (q != null) query = q;
    if (level != null || clearLevel) this.level = level;
    if (side != null || clearSide) this.side = side;
    return load();
  }
}

class ChallengesCubit extends PagedCubit<Challenge> {
  final GetMyChallengesUseCase getChallenges;
  final bool incoming;

  ChallengesCubit(this.getChallenges, {required this.incoming});

  @override
  ApiResult<Paginated<Challenge>> fetchPage(int page) => getChallenges(incoming: incoming, page: page);
}
