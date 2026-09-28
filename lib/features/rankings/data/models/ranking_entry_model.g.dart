// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ranking_entry_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TrendPointModel _$TrendPointModelFromJson(Map<String, dynamic> json) =>
    _TrendPointModel(
      date: DateTime.parse(json['date'] as String),
      value: json['value'] as num? ?? 0,
      position: (json['position'] as num?)?.toInt(),
    );

Map<String, dynamic> _$TrendPointModelToJson(_TrendPointModel instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'value': instance.value,
      'position': instance.position,
    };

_RankingEntryModel _$RankingEntryModelFromJson(Map<String, dynamic> json) =>
    _RankingEntryModel(
      playerId: json['player_id'] as String,
      name: json['name'] as String,
      photoUrl: json['photo_url'] as String?,
      level: json['level'] as String? ?? '',
      skillRating: (json['skill_rating'] as num?)?.toInt() ?? 0,
      seasonRankingPoints:
          (json['season_ranking_points'] as num?)?.toInt() ?? 0,
      seasonPoints: (json['season_points'] as num?)?.toInt(),
      xp: (json['xp'] as num?)?.toInt() ?? 0,
      country: json['country'] as String?,
      side: json['side'] as String?,
      isPremium: json['is_premium'] as bool? ?? false,
      position: (json['position'] as num?)?.toInt(),
      previousPosition: (json['previous_position'] as num?)?.toInt(),
      movement: (json['movement'] as num?)?.toInt(),
      trend:
          (json['trend'] as List<dynamic>?)
              ?.map((e) => TrendPointModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$RankingEntryModelToJson(_RankingEntryModel instance) =>
    <String, dynamic>{
      'player_id': instance.playerId,
      'name': instance.name,
      'photo_url': instance.photoUrl,
      'level': instance.level,
      'skill_rating': instance.skillRating,
      'season_ranking_points': instance.seasonRankingPoints,
      'season_points': instance.seasonPoints,
      'xp': instance.xp,
      'country': instance.country,
      'side': instance.side,
      'is_premium': instance.isPremium,
      'position': instance.position,
      'previous_position': instance.previousPosition,
      'movement': instance.movement,
      'trend': instance.trend.map((e) => e.toJson()).toList(),
    };

_SeasonModel _$SeasonModelFromJson(Map<String, dynamic> json) => _SeasonModel(
  code: json['code'] as String,
  name: json['name'] as String,
  startsOn: json['starts_on'] == null
      ? null
      : DateTime.parse(json['starts_on'] as String),
  endsOn: json['ends_on'] == null
      ? null
      : DateTime.parse(json['ends_on'] as String),
  isActive: json['is_active'] as bool? ?? false,
);

Map<String, dynamic> _$SeasonModelToJson(_SeasonModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'starts_on': instance.startsOn?.toIso8601String(),
      'ends_on': instance.endsOn?.toIso8601String(),
      'is_active': instance.isActive,
    };
