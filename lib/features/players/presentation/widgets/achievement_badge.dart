import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/widgets/app_network_image.dart';
import '../../../../core/widgets/progress_ring.dart';
import '../../domain/entities/achievement.dart';

/// Collectible badge. Rarity decides the frame (common = outline, rare =
/// blue, epic = purple, legendary = gold glow). Premium badges use a gold
/// diamond shape so they never read as competitive medals. Locked badges
/// are desaturated with a progress ring when progress is known.
class AchievementBadge extends StatelessWidget {
  final Achievement achievement;
  final double size;
  final bool showLabel;
  final VoidCallback? onTap;

  const AchievementBadge({
    super.key,
    required this.achievement,
    this.size = 64,
    this.showLabel = true,
    this.onTap,
  });

  static Color rarityColor(BuildContext context, AchievementRarity rarity) => switch (rarity) {
        AchievementRarity.common => context.tokens.textMuted,
        AchievementRarity.rare => AppColors.rarityRare,
        AchievementRarity.epic => AppColors.rarityEpic,
        AchievementRarity.legendary => AppColors.rarityLegendary,
      };

  @override
  Widget build(BuildContext context) {
    final unlocked = achievement.isUnlocked;
    final badge = achievement.isPremium
        ? _PremiumDiamond(achievement: achievement, size: size)
        : _MedalFrame(achievement: achievement, size: size);

    Widget visual = unlocked
        ? badge
        : Stack(
            alignment: Alignment.center,
            children: [
              Opacity(opacity: 0.35, child: ColorFiltered(colorFilter: _greyscale, child: badge)),
              if (achievement.progress != null)
                ProgressRing(value: achievement.progress!.ratio, size: size + 8, stroke: 3)
              else
                Icon(Icons.lock_rounded, size: size * 0.3, color: context.tokens.textMuted),
            ],
          );

    visual = SizedBox(width: size + 8, height: size + 8, child: Center(child: visual));

    return Semantics(
      label: achievement.name,
      button: onTap != null,
      child: InkWell(
        onTap: onTap,
        borderRadius: AppRadius.mdAll,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            visual,
            if (showLabel) ...[
              Gap.xs,
              SizedBox(
                width: size + 20,
                child: Text(
                  achievement.name,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: context.text.labelSmall?.copyWith(
                    color: unlocked ? context.tokens.textPrimary : context.tokens.textMuted,
                    letterSpacing: 0,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  static const ColorFilter _greyscale = ColorFilter.matrix(<double>[
    0.2126, 0.7152, 0.0722, 0, 0, //
    0.2126, 0.7152, 0.0722, 0, 0, //
    0.2126, 0.7152, 0.0722, 0, 0, //
    0, 0, 0, 1, 0,
  ]);
}

class _MedalFrame extends StatelessWidget {
  final Achievement achievement;
  final double size;

  const _MedalFrame({required this.achievement, required this.size});

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final color = AchievementBadge.rarityColor(context, achievement.rarity);
    final legendary = achievement.rarity == AchievementRarity.legendary;
    return Container(
      width: size,
      height: size,
      padding: const EdgeInsets.all(3),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: legendary ? AppGradients.premium : null,
        color: legendary ? null : color,
        boxShadow: legendary && achievement.isUnlocked ? AppShadows.gold : null,
      ),
      child: Container(
        decoration: BoxDecoration(shape: BoxShape.circle, color: t.surface2),
        clipBehavior: Clip.antiAlias,
        child: AppNetworkImage(
          url: achievement.iconUrl,
          fit: BoxFit.cover,
          fallback: Icon(
            achievement.category == AchievementCategory.social ? Icons.handshake_rounded : Icons.emoji_events_rounded,
            color: color,
            size: size * 0.46,
          ),
        ),
      ),
    );
  }
}

/// Premium badges: a gold diamond — visibly a different family from medals.
class _PremiumDiamond extends StatelessWidget {
  final Achievement achievement;
  final double size;

  const _PremiumDiamond({required this.achievement, required this.size});

  @override
  Widget build(BuildContext context) {
    final inner = size * 0.72;
    return SizedBox(
      width: size,
      height: size,
      child: Center(
        child: Transform.rotate(
          angle: math.pi / 4,
          child: Container(
            width: inner,
            height: inner,
            decoration: BoxDecoration(
              gradient: AppGradients.premium,
              borderRadius: AppRadius.mdAll,
              boxShadow: achievement.isUnlocked ? AppShadows.gold : null,
            ),
            child: Transform.rotate(
              angle: -math.pi / 4,
              child: Center(
                child: achievement.iconUrl == null
                    ? Icon(Icons.diamond_rounded, color: AppColors.onPremium, size: inner * 0.5)
                    : ClipOval(
                        child: SizedBox(
                          width: inner * 0.6,
                          height: inner * 0.6,
                          child: AppNetworkImage(url: achievement.iconUrl),
                        ),
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
