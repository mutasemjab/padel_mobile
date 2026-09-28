import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/achievement.dart';

part 'achievement_model.freezed.dart';
part 'achievement_model.g.dart';

@freezed
abstract class AchievementProgressModel with _$AchievementProgressModel {
  const factory AchievementProgressModel({
    @Default(0) int current,
    @Default(0) int target,
  }) = _AchievementProgressModel;

  factory AchievementProgressModel.fromJson(Map<String, dynamic> json) =>
      _$AchievementProgressModelFromJson(json);
}

@freezed
abstract class AchievementModel with _$AchievementModel {
  const factory AchievementModel({
    required String code,
    required String name,
    @Default('') String description,
    @Default('social') String category,
    @Default('common') String rarity,
    @JsonKey(name: 'xp_reward') @Default(0) int xpReward,
    @JsonKey(name: 'is_premium_badge') @Default(false) bool isPremiumBadge,
    @JsonKey(name: 'is_automatic') @Default(true) bool isAutomatic,
    @JsonKey(name: 'icon_url') String? iconUrl,
    @JsonKey(name: 'unlocked_at') DateTime? unlockedAt,
    AchievementProgressModel? progress,
    Map<String, dynamic>? meta,
  }) = _AchievementModel;

  factory AchievementModel.fromJson(Map<String, dynamic> json) =>
      _$AchievementModelFromJson(json);
}

extension AchievementModelX on AchievementModel {
  Achievement toEntity() => Achievement(
        code: code,
        name: name,
        description: description,
        category: AchievementCategoryX.fromApi(category),
        rarity: AchievementRarity.fromApi(rarity),
        xpReward: xpReward,
        isPremiumBadge: isPremiumBadge,
        isAutomatic: isAutomatic,
        iconUrl: iconUrl,
        unlockedAt: unlockedAt,
        progress: progress == null
            ? null
            : AchievementProgress(current: progress!.current, target: progress!.target),
        meta: meta,
      );
}

Achievement achievementFromJson(Map<String, dynamic> json) =>
    AchievementModel.fromJson(json).toEntity();
