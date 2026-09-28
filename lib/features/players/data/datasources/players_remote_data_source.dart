import 'package:dio/dio.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/models/player_summary.dart';
import '../../../../core/models/player_summary_model.dart';
import '../../../../core/network/api_envelope.dart';
import '../../../../core/network/pagination_meta.dart';
import '../../domain/entities/achievement.dart';
import '../../domain/entities/player_history.dart';
import '../../domain/entities/player_profile.dart';
import '../../domain/entities/player_stats.dart';
import '../models/achievement_model.dart';
import '../models/player_history_model.dart';
import '../models/player_model.dart';
import '../models/player_profile_mapper.dart';
import '../models/player_stats_model.dart';

abstract class PlayersRemoteDataSource {
  Future<Paginated<PlayerSummary>> searchPlayers({String? q, String? level, String? side, String? country, int page = 1});
  Future<PlayerModel> getPlayer(String playerId);
  Future<PlayerProfile> getProfile(String playerId);
  Future<PlayerStatsBundle> getStats(String playerId);
  Future<Paginated<RatingHistoryEntry>> getRatingHistory(String playerId, {int page = 1});
  Future<SeasonHistory> getSeasonHistory(String playerId, {String? season});
  Future<List<TournamentHistoryEntry>> getTournamentHistory(String playerId);
  Future<Paginated<ResultRow>> getMatches(String playerId, {int page = 1});
  Future<List<Achievement>> getAchievements(String playerId, {bool includeLocked = false});
  Future<List<Achievement>> getAchievementCatalog();
  Future<Paginated<PlayerSummary>> getFollowers(String playerId, {int page = 1});
  Future<Paginated<PlayerSummary>> getFollowing(String playerId, {int page = 1});
  Future<Paginated<Challenge>> getMyChallenges({required String direction, int page = 1});
  Future<void> follow(String playerId);
  Future<void> unfollow(String playerId);
  Future<void> respect(String playerId);
  Future<void> challenge(String playerId, {String? message});
  Future<void> respondToChallenge(int challengeId, {required bool accept});
}

class PlayersRemoteDataSourceImpl implements PlayersRemoteDataSource {
  final Dio dio;

  PlayersRemoteDataSourceImpl(this.dio);

  PlayerSummary _summary(Map<String, dynamic> json) => PlayerSummaryModel.fromJson(json).toEntity();

  @override
  Future<Paginated<PlayerSummary>> searchPlayers({
    String? q,
    String? level,
    String? side,
    String? country,
    int page = 1,
  }) async {
    final response = await dio.get(ApiEndpoints.players, queryParameters: {
      if (q != null && q.isNotEmpty) 'q': q,
      'level': ?level,
      'side': ?side,
      'country': ?country,
      'page': page,
    });
    return ApiEnvelope.paginated(response, _summary);
  }

  @override
  Future<PlayerModel> getPlayer(String playerId) async {
    final response = await dio.get(ApiEndpoints.player(playerId));
    return PlayerModel.fromJson(ApiEnvelope.map(response));
  }

  @override
  Future<PlayerProfile> getProfile(String playerId) async {
    final response = await dio.get(ApiEndpoints.player(playerId));
    return PlayerProfileMapper.fromJson(ApiEnvelope.map(response));
  }

  @override
  Future<PlayerStatsBundle> getStats(String playerId) async {
    final response = await dio.get(ApiEndpoints.playerStats(playerId));
    return playerStatsBundleFromJson(ApiEnvelope.map(response));
  }

  @override
  Future<Paginated<RatingHistoryEntry>> getRatingHistory(String playerId, {int page = 1}) async {
    final response = await dio.get(ApiEndpoints.playerRatingHistory(playerId), queryParameters: {'page': page});
    return ApiEnvelope.paginated(response, ratingHistoryEntryFromJson);
  }

  @override
  Future<SeasonHistory> getSeasonHistory(String playerId, {String? season}) async {
    final response = await dio.get(ApiEndpoints.playerSeasonHistory(playerId), queryParameters: {'season': ?season});
    return seasonHistoryFromJson(ApiEnvelope.map(response));
  }

  @override
  Future<List<TournamentHistoryEntry>> getTournamentHistory(String playerId) async {
    final response = await dio.get(ApiEndpoints.playerTournaments(playerId));
    return ApiEnvelope.listOf(response, (j) => TournamentHistoryModel.fromJson(j).toEntity());
  }

  @override
  Future<Paginated<ResultRow>> getMatches(String playerId, {int page = 1}) async {
    final response = await dio.get(ApiEndpoints.playerMatches(playerId), queryParameters: {'page': page});
    return ApiEnvelope.paginated(response, resultRowFromJson);
  }

  @override
  Future<List<Achievement>> getAchievements(String playerId, {bool includeLocked = false}) async {
    final response = await dio.get(
      ApiEndpoints.playerAchievements(playerId),
      queryParameters: {if (includeLocked) 'include_locked': 1},
    );
    return ApiEnvelope.listOf(response, achievementFromJson);
  }

  @override
  Future<List<Achievement>> getAchievementCatalog() async {
    final response = await dio.get(ApiEndpoints.achievements);
    return ApiEnvelope.listOf(response, achievementFromJson);
  }

  @override
  Future<Paginated<PlayerSummary>> getFollowers(String playerId, {int page = 1}) async {
    final response = await dio.get(ApiEndpoints.playerFollowers(playerId), queryParameters: {'page': page});
    return ApiEnvelope.paginated(response, _summary);
  }

  @override
  Future<Paginated<PlayerSummary>> getFollowing(String playerId, {int page = 1}) async {
    final response = await dio.get(ApiEndpoints.playerFollowing(playerId), queryParameters: {'page': page});
    return ApiEnvelope.paginated(response, _summary);
  }

  @override
  Future<Paginated<Challenge>> getMyChallenges({required String direction, int page = 1}) async {
    final response = await dio.get(
      ApiEndpoints.myChallenges,
      queryParameters: {'direction': direction, 'page': page},
    );
    return ApiEnvelope.paginated(response, (j) => ChallengeModel.fromJson(j).toEntity());
  }

  @override
  Future<void> follow(String playerId) async {
    await dio.post(ApiEndpoints.playerFollow(playerId));
  }

  @override
  Future<void> unfollow(String playerId) async {
    await dio.delete(ApiEndpoints.playerFollow(playerId));
  }

  @override
  Future<void> respect(String playerId) async {
    await dio.post(ApiEndpoints.playerRespect(playerId));
  }

  @override
  Future<void> challenge(String playerId, {String? message}) async {
    await dio.post(ApiEndpoints.playerChallenge(playerId), data: {'message': ?message});
  }

  @override
  Future<void> respondToChallenge(int challengeId, {required bool accept}) async {
    await dio.post(ApiEndpoints.challengeRespond(challengeId), data: {'accept': accept});
  }
}
