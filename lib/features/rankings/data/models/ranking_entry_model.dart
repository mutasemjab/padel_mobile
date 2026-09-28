import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/json_utils.dart';
import '../../domain/entities/ranking_entry.dart';

part 'ranking_entry_model.freezed.dart';
part 'ranking_entry_model.g.dart';

@freezed
abstract class TrendPointModel with _$TrendPointModel {
  const factory TrendPointModel({
    required DateTime date,
    @Default(0) num value,
    int? position,
  }) = _TrendPointModel;

  factory TrendPointModel.fromJson(Map<String, dynamic> json) => _$TrendPointModelFromJson(json);
}

@freezed
abstract class RankingEntryModel with _$RankingEntryModel {
  const factory RankingEntryModel({
    @JsonKey(name: 'player_id') required String playerId,
    required String name,
    @JsonKey(name: 'photo_url') String? photoUrl,
    @Default('') String level,
    @JsonKey(name: 'skill_rating') @Default(0) int skillRating,
    @JsonKey(name: 'season_ranking_points') @Default(0) int seasonRankingPoints,
    @JsonKey(name: 'season_points') int? seasonPoints,
    @Default(0) int xp,
    String? country,
    String? side,
    @JsonKey(name: 'is_premium') @Default(false) bool isPremium,
    int? position,
    @JsonKey(name: 'previous_position') int? previousPosition,
    int? movement,
    @Default([]) List<TrendPointModel> trend,
  }) = _RankingEntryModel;

  factory RankingEntryModel.fromJson(Map<String, dynamic> json) =>
      _$RankingEntryModelFromJson(json);
}

extension RankingEntryModelX on RankingEntryModel {
  RankingEntry toEntity() => RankingEntry(
        playerId: playerId,
        name: name,
        photoUrl: photoUrl,
        level: level,
        skillRating: skillRating,
        seasonRankingPoints: seasonRankingPoints,
        seasonPoints: seasonPoints,
        xp: xp,
        country: country,
        side: side,
        isPremium: isPremium,
        position: position,
        previousPosition: previousPosition,
        movement: movement,
        trend: trend
            .map((t) => TrendPoint(date: t.date, value: t.value, position: t.position))
            .toList(),
      );
}

@freezed
abstract class SeasonModel with _$SeasonModel {
  const factory SeasonModel({
    required String code,
    required String name,
    @JsonKey(name: 'starts_on') DateTime? startsOn,
    @JsonKey(name: 'ends_on') DateTime? endsOn,
    @JsonKey(name: 'is_active') @Default(false) bool isActive,
  }) = _SeasonModel;

  factory SeasonModel.fromJson(Map<String, dynamic> json) => _$SeasonModelFromJson(json);
}

extension SeasonModelX on SeasonModel {
  Season toEntity() =>
      Season(code: code, name: name, startsOn: startsOn, endsOn: endsOn, isActive: isActive);
}

MyRanking myRankingFromJson(Map<String, dynamic> json) {
  final season = Json.map(json['season']);
  final skill = Json.map(json['skill']);
  final xp = Json.map(json['xp']);
  return MyRanking(
    season: Json.string(season?['season']),
    seasonPoints: Json.integer(season?['points']) ?? 0,
    seasonPosition: Json.integer(season?['position']),
    seasonMovement: Json.integer(season?['movement']),
    skillRating: Json.integer(skill?['rating']) ?? 0,
    level: Json.string(skill?['level']),
    skillPosition: Json.integer(skill?['position']),
    levelPosition: Json.integer(skill?['level_position']),
    skillMovement: Json.integer(skill?['movement']),
    xp: Json.integer(xp?['xp']) ?? 0,
    xpPosition: Json.integer(xp?['position']),
  );
}
