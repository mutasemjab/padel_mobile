import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../domain/entities/achievement.dart';
import 'achievement_badge.dart';

/// Collectible grid: competitive + social medals, then a separate Premium
/// shelf with its own visual family.
class AchievementsCollection extends StatelessWidget {
  final List<Achievement> achievements;

  const AchievementsCollection({super.key, required this.achievements});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final competitive = achievements.where((a) => !a.isPremium && a.category == AchievementCategory.competitive).toList();
    final social = achievements.where((a) => !a.isPremium && a.category != AchievementCategory.competitive).toList();
    final premium = achievements.where((a) => a.isPremium).toList();
    final unlocked = achievements.where((a) => a.isUnlocked).length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _ProgressHeader(unlocked: unlocked, total: achievements.length),
        if (competitive.isNotEmpty) ...[
          Gap.xl,
          SectionHeader(title: l10n.achievementsCompetitive),
          Gap.md,
          _BadgeGrid(items: competitive),
        ],
        if (social.isNotEmpty) ...[
          Gap.xl,
          SectionHeader(title: l10n.achievementsSocial),
          Gap.md,
          _BadgeGrid(items: social),
        ],
        if (premium.isNotEmpty) ...[
          Gap.xl,
          AppCard(
            gradient: AppGradients.premiumSurface,
            borderColor: AppColors.premiumGold.withValues(alpha: 0.4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SectionHeader(
                  eyebrow: l10n.premiumLabel,
                  eyebrowColor: AppColors.premiumGold,
                  title: l10n.achievementsPremiumShelf,
                ),
                Gap.xs,
                Text(l10n.achievementsPremiumNote, style: context.text.bodySmall),
                Gap.md,
                _BadgeGrid(items: premium),
              ],
            ),
          ),
        ],
      ],
    );
  }
}

class _ProgressHeader extends StatelessWidget {
  final int unlocked;
  final int total;

  const _ProgressHeader({required this.unlocked, required this.total});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return AppCard(
      child: Row(
        children: [
          Icon(Icons.emoji_events_rounded, color: context.tokens.highlight, size: AppSizes.iconXl),
          Gap.md,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.achievementsProgress(unlocked, total), style: context.text.titleSmall),
                Gap.sm,
                ClipRRect(
                  borderRadius: AppRadius.pillAll,
                  child: LinearProgressIndicator(value: total == 0 ? 0 : unlocked / total),
                ),
              ],
            ),
          ),
          Gap.md,
          Text('$unlocked', style: AppTypography.number(context, size: 32, color: context.tokens.highlight)),
        ],
      ),
    );
  }
}

class _BadgeGrid extends StatelessWidget {
  final List<Achievement> items;

  const _BadgeGrid({required this.items});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = (constraints.maxWidth / 96).floor().clamp(3, 8);
        final width = constraints.maxWidth / columns;
        return Wrap(
          runSpacing: AppSpacing.md,
          children: [
            for (final a in items)
              SizedBox(
                width: width,
                child: AchievementBadge(achievement: a, onTap: () => showAchievementDetail(context, a)),
              ),
          ],
        );
      },
    );
  }
}

Future<void> showAchievementDetail(BuildContext context, Achievement a) {
  final l10n = AppLocalizations.of(context);
  final color = AchievementBadge.rarityColor(context, a.rarity);
  final rarity = switch (a.rarity) {
    AchievementRarity.common => l10n.rarityCommon,
    AchievementRarity.rare => l10n.rarityRare,
    AchievementRarity.epic => l10n.rarityEpic,
    AchievementRarity.legendary => l10n.rarityLegendary,
  };
  return showModalBottomSheet<void>(
    context: context,
    builder: (sheetContext) => SafeArea(
      child: Padding(
        padding: const EdgeInsetsDirectional.fromSTEB(AppSpacing.xxl, 0, AppSpacing.xxl, AppSpacing.xxl),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            AchievementBadge(achievement: a, size: 96, showLabel: false),
            Gap.lg,
            Text(rarity.toUpperCase(), style: AppTypography.eyebrow(sheetContext, color: color)),
            Gap.xs,
            Text(a.name, style: sheetContext.text.headlineSmall, textAlign: TextAlign.center),
            Gap.sm,
            Text(a.description, style: sheetContext.text.bodyMedium, textAlign: TextAlign.center),
            Gap.lg,
            Wrap(
              spacing: AppSpacing.lg,
              alignment: WrapAlignment.center,
              children: [
                if (a.xpReward > 0) Text(l10n.xpReward(a.xpReward), style: sheetContext.text.labelLarge),
                if (a.isUnlocked)
                  Text(l10n.achievementUnlockedOn(DateFormatter.fullDate(a.unlockedAt!)), style: sheetContext.text.labelLarge)
                else if (a.progress != null)
                  Text(l10n.progressOf(a.progress!.current, a.progress!.target), style: sheetContext.text.labelLarge)
                else
                  Text(l10n.achievementLocked, style: sheetContext.text.labelLarge),
                if (a.isAutomatic && !a.isUnlocked)
                  Text(l10n.achievementAutomatic, style: sheetContext.text.bodySmall),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
