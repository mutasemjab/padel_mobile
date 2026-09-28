import 'package:equatable/equatable.dart';

/// `premium` badges render visually distinct from `competitive` ones and
/// never imply a ranking advantage.
enum AchievementCategory { competitive, social, premium }

extension AchievementCategoryX on AchievementCategory {
  static AchievementCategory fromApi(String? raw) {
    switch (raw) {
      case 'competitive':
        return AchievementCategory.competitive;
      case 'premium':
        return AchievementCategory.premium;
      case 'social':
      default:
        return AchievementCategory.social;
    }
  }
}

enum AchievementRarity {
  common,
  rare,
  epic,
  legendary;

  static AchievementRarity fromApi(String? raw) => AchievementRarity.values.firstWhere(
        (r) => r.name == raw,
        orElse: () => AchievementRarity.common,
      );
}

class AchievementProgress extends Equatable {
  final int current;
  final int target;

  const AchievementProgress({required this.current, required this.target});

  double get ratio => target <= 0 ? 0 : (current / target).clamp(0, 1).toDouble();

  @override
  List<Object?> get props => [current, target];
}

class Achievement extends Equatable {
  final String code;
  final String name;
  final String description;
  final AchievementCategory category;
  final AchievementRarity rarity;
  final int xpReward;
  final bool isPremiumBadge;
  final bool isAutomatic;
  final String? iconUrl;
  final DateTime? unlockedAt;

  /// Catalog entries only; null when the badge has no measurable progress.
  final AchievementProgress? progress;
  final Map<String, dynamic>? meta;

  const Achievement({
    required this.code,
    required this.name,
    required this.description,
    required this.category,
    this.rarity = AchievementRarity.common,
    this.xpReward = 0,
    this.isPremiumBadge = false,
    this.isAutomatic = true,
    this.iconUrl,
    this.unlockedAt,
    this.progress,
    this.meta,
  });

  bool get isUnlocked => unlockedAt != null;

  bool get isPremium => isPremiumBadge || category == AchievementCategory.premium;

  @override
  List<Object?> get props => [
        code,
        name,
        description,
        category,
        rarity,
        xpReward,
        isPremiumBadge,
        isAutomatic,
        iconUrl,
        unlockedAt,
        progress,
        meta,
      ];
}
