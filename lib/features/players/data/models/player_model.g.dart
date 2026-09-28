// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlayerRefModel _$PlayerRefModelFromJson(Map<String, dynamic> json) =>
    _PlayerRefModel(
      playerId: json['player_id'] as String,
      name: json['name'] as String,
      photoUrl: json['photo_url'] as String?,
      level: json['level'] as String?,
    );

Map<String, dynamic> _$PlayerRefModelToJson(_PlayerRefModel instance) =>
    <String, dynamic>{
      'player_id': instance.playerId,
      'name': instance.name,
      'photo_url': instance.photoUrl,
      'level': instance.level,
    };

_PlayerModel _$PlayerModelFromJson(Map<String, dynamic> json) => _PlayerModel(
  playerId: json['player_id'] as String,
  name: json['name'] as String,
  email: json['email'] as String? ?? '',
  phone: json['phone'] as String?,
  dateOfBirth: json['date_of_birth'] as String?,
  photoUrl: json['photo_url'] as String?,
  country: json['country'] as String?,
  gender: json['gender'] as String?,
  side: json['side'] as String?,
  bio: json['bio'] as String?,
  level: json['level'] as String?,
  skillRating: (json['skill_rating'] as num?)?.toInt() ?? 0,
  seasonRankingPoints: (json['season_ranking_points'] as num?)?.toInt() ?? 0,
  xp: (json['xp'] as num?)?.toInt() ?? 0,
  profileTier: json['profile_tier'] as String?,
  isPremium: json['is_premium'] as bool? ?? false,
  isActive: json['is_active'] as bool? ?? true,
  isOwner: json['is_owner'] as bool? ?? false,
  memberSince: json['member_since'] as String?,
  mainPartner: json['main_partner'] == null
      ? null
      : PlayerRefModel.fromJson(json['main_partner'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PlayerModelToJson(_PlayerModel instance) =>
    <String, dynamic>{
      'player_id': instance.playerId,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'date_of_birth': instance.dateOfBirth,
      'photo_url': instance.photoUrl,
      'country': instance.country,
      'gender': instance.gender,
      'side': instance.side,
      'bio': instance.bio,
      'level': instance.level,
      'skill_rating': instance.skillRating,
      'season_ranking_points': instance.seasonRankingPoints,
      'xp': instance.xp,
      'profile_tier': instance.profileTier,
      'is_premium': instance.isPremium,
      'is_active': instance.isActive,
      'is_owner': instance.isOwner,
      'member_since': instance.memberSince,
      'main_partner': instance.mainPartner?.toJson(),
    };
