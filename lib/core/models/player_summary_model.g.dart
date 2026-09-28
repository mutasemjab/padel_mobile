// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlayerSummaryModel _$PlayerSummaryModelFromJson(Map<String, dynamic> json) =>
    _PlayerSummaryModel(
      playerId: json['player_id'] as String,
      name: json['name'] as String,
      photoUrl: json['photo_url'] as String?,
      level: json['level'] as String?,
      skillRating: (json['skill_rating'] as num?)?.toInt(),
      side: json['side'] as String?,
      country: json['country'] as String?,
      isPremium: json['is_premium'] as bool? ?? false,
    );

Map<String, dynamic> _$PlayerSummaryModelToJson(_PlayerSummaryModel instance) =>
    <String, dynamic>{
      'player_id': instance.playerId,
      'name': instance.name,
      'photo_url': instance.photoUrl,
      'level': instance.level,
      'skill_rating': instance.skillRating,
      'side': instance.side,
      'country': instance.country,
      'is_premium': instance.isPremium,
    };
