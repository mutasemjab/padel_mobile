import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/player_summary_model.dart';
import '../../../../core/utils/json_utils.dart';
import '../../domain/entities/player_history.dart';

part 'player_history_model.freezed.dart';
part 'player_history_model.g.dart';

@freezed
abstract class ResultRowModel with _$ResultRowModel {
  const factory ResultRowModel({
    @JsonKey(name: 'official_result_id') @Default(0) int officialResultId,
    @JsonKey(name: 'match_id') @Default(0) int matchId,
    @JsonKey(name: 'tournament_id') @Default(0) int tournamentId,
    @JsonKey(name: 'tournament_name') @Default('') String tournamentName,
    @JsonKey(name: 'tournament_ranked') @Default(false) bool tournamentRanked,
    @JsonKey(name: 'category_name') String? categoryName,
    String? round,
    @JsonKey(name: 'result_type') @Default('played') String resultType,
    @Default(false) bool won,
    String? score,
    @JsonKey(name: 'sets_won') @Default(0) int setsWon,
    @JsonKey(name: 'sets_lost') @Default(0) int setsLost,
    @JsonKey(name: 'rating_delta') int? ratingDelta,
    DateTime? date,
    PlayerSummaryModel? partner,
  }) = _ResultRowModel;

  factory ResultRowModel.fromJson(Map<String, dynamic> json) => _$ResultRowModelFromJson(json);
}

extension ResultRowModelX on ResultRowModel {
  ResultRow toEntity() => ResultRow(
        officialResultId: officialResultId,
        matchId: matchId,
        tournamentId: tournamentId,
        tournamentName: tournamentName,
        tournamentRanked: tournamentRanked,
        categoryName: categoryName,
        round: round,
        resultType: resultType,
        won: won,
        score: score,
        setsWon: setsWon,
        setsLost: setsLost,
        ratingDelta: ratingDelta,
        date: date,
        partner: partner?.toEntity(),
      );
}

ResultRow resultRowFromJson(Map<String, dynamic> json) => ResultRowModel.fromJson(json).toEntity();

RatingHistoryEntry ratingHistoryEntryFromJson(Map<String, dynamic> json) {
  final tournament = Json.map(json['tournament']);
  return RatingHistoryEntry(
    id: Json.integer(json['id']) ?? 0,
    ratingBefore: Json.integer(json['rating_before']) ?? 0,
    ratingAfter: Json.integer(json['rating_after']) ?? 0,
    delta: Json.integer(json['delta']) ?? 0,
    reason: Json.string(json['reason']) ?? 'official_result',
    officialResultId: Json.integer(json['official_result_id']),
    tournamentId: Json.integer(tournament?['id']),
    tournamentName: Json.string(tournament?['name']),
    breakdown: Json.map(json['breakdown']),
    createdAt: Json.date(json['created_at']),
  );
}

SeasonPointsEntry seasonPointsEntryFromJson(Map<String, dynamic> json) {
  final tournament = json['tournament'];
  final category = json['category'];
  return SeasonPointsEntry(
    id: Json.integer(json['id']) ?? 0,
    season: Json.string(json['season']) ?? '',
    points: Json.integer(json['points']) ?? 0,
    stage: Json.string(json['stage']),
    weight: Json.number(json['weight']),
    reason: Json.string(json['reason']),
    tournamentId: tournament is Map ? Json.integer(tournament['id']) : null,
    tournamentName: tournament is Map ? Json.string(tournament['name']) : Json.string(tournament),
    categoryName: category is Map ? Json.string(category['name']) : Json.string(category),
    createdAt: Json.date(json['created_at']),
  );
}

SeasonHistory seasonHistoryFromJson(Map<String, dynamic> json) => SeasonHistory(
      season: Json.string(json['season']) ?? '',
      points: Json.integer(json['points']) ?? 0,
      seasons: Json.intMap(json['seasons']),
      entries: Json.listOfMaps(json['entries']).map(seasonPointsEntryFromJson).toList(),
    );

@freezed
abstract class TournamentHistoryModel with _$TournamentHistoryModel {
  const factory TournamentHistoryModel({
    @JsonKey(name: 'tournament_id') required int tournamentId,
    @JsonKey(name: 'tournament_name') @Default('') String tournamentName,
    @JsonKey(name: 'category_id') int? categoryId,
    @JsonKey(name: 'category_name') String? categoryName,
    @Default(false) bool ranked,
    @JsonKey(name: 'best_round') String? bestRound,
    String? placement,
    @Default(0) int matches,
    @Default(0) int wins,
    @JsonKey(name: 'last_played_at') DateTime? lastPlayedAt,
  }) = _TournamentHistoryModel;

  factory TournamentHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$TournamentHistoryModelFromJson(json);
}

extension TournamentHistoryModelX on TournamentHistoryModel {
  TournamentHistoryEntry toEntity() => TournamentHistoryEntry(
        tournamentId: tournamentId,
        tournamentName: tournamentName,
        categoryId: categoryId,
        categoryName: categoryName,
        ranked: ranked,
        bestRound: bestRound,
        placement: placement,
        matches: matches,
        wins: wins,
        lastPlayedAt: lastPlayedAt,
      );
}

@freezed
abstract class ChallengeModel with _$ChallengeModel {
  const factory ChallengeModel({
    required int id,
    @Default('pending') String status,
    String? message,
    required PlayerSummaryModel challenger,
    required PlayerSummaryModel challenged,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _ChallengeModel;

  factory ChallengeModel.fromJson(Map<String, dynamic> json) => _$ChallengeModelFromJson(json);
}

extension ChallengeModelX on ChallengeModel {
  Challenge toEntity() => Challenge(
        id: id,
        status: status,
        message: message,
        challenger: challenger.toEntity(),
        challenged: challenged.toEntity(),
        createdAt: createdAt,
      );
}
