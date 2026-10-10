import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/pm_art.dart';
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
        _ProgressHeader(unlocked: unlocked, total: achievements.length, achievements: achievements),
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

/// The title cabinet's plate: count in gold leaf, the bar, and how many
/// titles sit at each grade (bronze · silver · gold dots).
class _ProgressHeader extends StatelessWidget {
  final int unlocked;
  final int total;
  final List<Achievement> achievements;

  const _ProgressHeader({required this.unlocked, required this.total, required this.achievements});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final earned = achievements.where((a) => a.isUnlocked && !a.isPremium).toList();
    return PmHeroPanel(
      court: false,
      padding: const EdgeInsetsDirectional.fromSTEB(18, 16, 18, 16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.achievementsProgress(unlocked, total), style: context.text.titleSmall?.copyWith(color: AppColors.cream)),
                Gap.sm,
                ClipRRect(
                  borderRadius: AppRadius.pillAll,
                  child: LinearProgressIndicator(value: total == 0 ? 0 : unlocked / total, minHeight: 6),
                ),
                Gap.sm,
                Row(
                  children: [
                    for (final g in TitleGrade.values.reversed) ...[
                      Container(
                        width: 9,
                        height: 9,
                        decoration: BoxDecoration(shape: BoxShape.circle, gradient: AppMetals.fill(g.metal)),
                      ),
                      Gap.xs,
                      Text(
                        '${earned.where((a) => TitleGrade.of(a.rarity) == g).length}',
                        style: AppTypography.number(context, size: 13, weight: FontWeight.w500, color: AppColors.cream70),
                      ),
                      Gap.md,
                    ],
                  ],
                ),
              ],
            ),
          ),
          Gap.md,
          PmGoldText('$unlocked', style: AppFonts.numeral(size: 52, height: 1)),
        ],
      ),
    );
  }
}

/// Wrap of title tiles — each a glass slot washed in its grade's metal.
class _BadgeGrid extends StatelessWidget {
  final List<Achievement> items;

  const _BadgeGrid({required this.items});

  @override
  Widget build(BuildContext context) {
    final sorted = [...items]..sort((a, b) {
        if (a.isUnlocked != b.isUnlocked) return a.isUnlocked ? -1 : 1;
        return b.rarity.index - a.rarity.index;
      });
    return LayoutBuilder(
      builder: (context, constraints) {
        final columns = (constraints.maxWidth / 104).floor().clamp(3, 8);
        const gap = AppSpacing.sm;
        final width = (constraints.maxWidth - gap * (columns - 1)) / columns;
        return Wrap(
          spacing: gap,
          runSpacing: gap,
          children: [
            for (final a in sorted) SizedBox(width: width, child: _TitleTile(achievement: a)),
          ],
        );
      },
    );
  }
}

class _TitleTile extends StatelessWidget {
  final Achievement achievement;

  const _TitleTile({required this.achievement});

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final metal = TitleGrade.of(achievement.rarity).metal[1];
    final on = achievement.isUnlocked;
    return Container(
      height: 128,
      alignment: Alignment.topCenter,
      padding: const EdgeInsetsDirectional.fromSTEB(4, 10, 4, 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        gradient: on
            ? LinearGradient(begin: Alignment.bottomCenter, end: Alignment.topCenter, colors: [metal.withValues(alpha: .16), metal.withValues(alpha: 0)])
            : null,
        color: on ? null : (t.isDark ? const Color(0x0AF3EEDF) : AppColors.ivory),
        border: Border.all(color: on ? metal.withValues(alpha: .4) : (t.isDark ? AppColors.cream08 : AppColors.lightOutline)),
      ),
      child: AchievementBadge(achievement: achievement, size: 58, onTap: () => showAchievementDetail(context, achievement)),
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
            DecoratedBox(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(colors: [color.withValues(alpha: .3), color.withValues(alpha: 0)]),
              ),
              child: Padding(
                padding: const EdgeInsets.all(18),
                child: AchievementBadge(achievement: a, size: 132, showLabel: false),
              ),
            ),
            Gap.md,
            Text(rarity.toUpperCase(), style: AppTypography.eyebrow(sheetContext, color: color)),
            Gap.xs,
            Text(a.name, style: sheetContext.text.headlineLarge?.copyWith(fontSize: 28), textAlign: TextAlign.center),
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
