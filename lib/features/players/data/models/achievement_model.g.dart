// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'achievement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AchievementProgressModel _$AchievementProgressModelFromJson(
  Map<String, dynamic> json,
) => _AchievementProgressModel(
  current: (json['current'] as num?)?.toInt() ?? 0,
  target: (json['target'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$AchievementProgressModelToJson(
  _AchievementProgressModel instance,
) => <String, dynamic>{'current': instance.current, 'target': instance.target};

_AchievementModel _$AchievementModelFromJson(Map<String, dynamic> json) =>
    _AchievementModel(
      code: json['code'] as String,
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      category: json['category'] as String? ?? 'social',
      rarity: json['rarity'] as String? ?? 'common',
      xpReward: (json['xp_reward'] as num?)?.toInt() ?? 0,
      isPremiumBadge: json['is_premium_badge'] as bool? ?? false,
      isAutomatic: json['is_automatic'] as bool? ?? true,
      iconUrl: json['icon_url'] as String?,
      unlockedAt: json['unlocked_at'] == null
          ? null
          : DateTime.parse(json['unlocked_at'] as String),
      progress: json['progress'] == null
          ? null
          : AchievementProgressModel.fromJson(
              json['progress'] as Map<String, dynamic>,
            ),
      meta: json['meta'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$AchievementModelToJson(_AchievementModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'name': instance.name,
      'description': instance.description,
      'category': instance.category,
      'rarity': instance.rarity,
      'xp_reward': instance.xpReward,
      'is_premium_badge': instance.isPremiumBadge,
      'is_automatic': instance.isAutomatic,
      'icon_url': instance.iconUrl,
      'unlocked_at': instance.unlockedAt?.toIso8601String(),
      'progress': instance.progress?.toJson(),
      'meta': instance.meta,
    };
