import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/badges.dart';
import '../../../../core/widgets/level_badge.dart';
import '../../../../core/widgets/metric_widgets.dart';
import '../../../../core/widgets/movement_indicator.dart';
import '../../../../core/widgets/player_avatar.dart';
import '../../../../core/widgets/pm_art.dart';
import '../../../../core/widgets/trend_sparkline.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../domain/entities/ranking_entry.dart';

Color boardColor(BuildContext context, RankingType type) => switch (type) {
      RankingType.season => AppColors.primary,
      RankingType.skill => context.tokens.highlight,
      RankingType.xp => context.tokens.textMuted,
    };

/// A leaderboard row: position, movement, avatar, name + level, the ONE
/// value for this board, and its trend.
class RankingRow extends StatelessWidget {
  final RankingEntry entry;
  final RankingType type;
  final int fallbackPosition;
  final VoidCallback onTap;
  final bool isMe;

  const RankingRow({
    super.key,
    required this.entry,
    required this.type,
    required this.fallbackPosition,
    required this.onTap,
    this.isMe = false,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final flag = Formatters.flag(entry.country);
    final trend = entry.trend.map((p) => p.value).toList();
    return AppCard(
      onTap: onTap,
      padding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.sm),
      borderColor: isMe ? t.highlight : null,
      color: isMe ? t.highlight.withValues(alpha: 0.08) : null,
      child: Row(
        children: [
          PlayerRankBadge(position: entry.position ?? fallbackPosition),
          SizedBox(width: 30, child: Center(child: MovementIndicator(movement: entry.movement, compact: true))),
          PlayerAvatar.fromSummary(entry.toSummary(), size: AppSizes.avatarSm),
          Gap.md,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(entry.name, style: context.text.titleSmall, maxLines: 1, overflow: TextOverflow.ellipsis),
                    ),
                    if (flag.isNotEmpty) ...[Gap.xs, Text(flag)],
                    if (entry.isPremium) ...[Gap.xs, const PremiumBadge(compact: true)],
                  ],
                ),
                Gap.xxs,
                LevelBadge(level: entry.level),
              ],
            ),
          ),
          if (trend.length >= 2) ...[
            TrendSparkline(values: trend),
            Gap.sm,
          ],
          SizedBox(
            width: 60,
            child: Text(
              '${entry.valueFor(type)}',
              textAlign: TextAlign.end,
              style: AppTypography.number(context, size: 20, color: boardColor(context, type)),
            ),
          ),
        ],
      ),
    );
  }
}

/// Top three, champion-style.
class RankingPodium extends StatelessWidget {
  final List<RankingEntry> top;
  final RankingType type;
  final void Function(RankingEntry entry) onTap;

  const RankingPodium({super.key, required this.top, required this.type, required this.onTap});

  @override
  Widget build(BuildContext context) {
    if (top.length < 3) return const SizedBox.shrink();
    // Visual order: 2nd, 1st, 3rd (Row mirrors itself in RTL).
    final order = [top[1], top[0], top[2]];
    const heights = [92.0, 124.0, 76.0];
    const metals = [AppMetals.silver, AppMetals.gold, AppMetals.bronze];
    const places = [2, 1, 3];
    // The home hero court with the ball flying over three brushed-metal plinths.
    return PmHeroPanel(
      ball: true,
      padding: const EdgeInsetsDirectional.fromSTEB(AppSpacing.md, AppSpacing.xl, AppSpacing.md, 0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          for (var i = 0; i < 3; i++)
            Expanded(
              child: GestureDetector(
                onTap: () => onTap(order[i]),
                child: Column(
                  children: [
                    if (i == 1) const Icon(Icons.workspace_premium_rounded, color: AppColors.goldSoft, size: 26) else const SizedBox(height: 26),
                    Gap.xxs,
                    DecoratedBox(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [BoxShadow(color: metals[i][1].withValues(alpha: .5), blurRadius: i == 1 ? 30 : 18)],
                      ),
                      child: PlayerAvatar.fromSummary(order[i].toSummary(), size: i == 1 ? AppSizes.avatarLg : AppSizes.avatarMd),
                    ),
                    Gap.sm,
                    Text(
                      order[i].name.split(' ').first,
                      style: context.text.labelLarge?.copyWith(color: AppColors.cream),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      '${order[i].valueFor(type)}',
                      style: AppTypography.number(context, size: 18, weight: FontWeight.w500, color: i == 1 ? AppColors.goldSoft : AppColors.cream70),
                    ),
                    Gap.sm,
                    Container(
                      height: heights[i],
                      margin: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.xs),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [metals[i][1].withValues(alpha: .42), metals[i][2].withValues(alpha: .12)],
                        ),
                        border: Border(top: BorderSide(color: metals[i][0], width: 2)),
                        borderRadius: const BorderRadius.vertical(top: Radius.circular(AppRadius.control)),
                      ),
                      alignment: Alignment.center,
                      child: ShaderMask(
                        blendMode: BlendMode.srcIn,
                        shaderCallback: (r) => LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: metals[i],
                        ).createShader(r),
                        child: Text('${places[i]}', style: AppFonts.numeral(size: i == 1 ? 46 : 36, height: 1, color: AppColors.white)),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }
}

/// Sticky "You" row for the current board.
class MyRankingBar extends StatelessWidget {
  final MyRanking me;
  final RankingType type;
  final VoidCallback onTap;

  const MyRankingBar({super.key, required this.me, required this.type, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final t = context.tokens;
    final position = me.positionFor(type);
    // Floating gold-edged glass pill above the dock, like the home hero edge.
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(AppSpacing.md, AppSpacing.xs, AppSpacing.md, AppSpacing.sm),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          borderRadius: AppRadius.cardAll,
          child: Ink(
            decoration: BoxDecoration(
              borderRadius: AppRadius.cardAll,
              gradient: t.isDark
                  ? const LinearGradient(colors: [AppColors.green700, AppColors.green900])
                  : const LinearGradient(colors: [AppColors.ivory, AppColors.lightSurface2]),
              border: Border.all(color: t.isDark ? AppColors.goldSoft.withValues(alpha: .45) : AppColors.green700.withValues(alpha: .4)),
              boxShadow: const [BoxShadow(color: Color(0x80000000), blurRadius: 30, offset: Offset(0, 14), spreadRadius: -14)],
            ),
            padding: const EdgeInsetsDirectional.fromSTEB(AppSpacing.md, AppSpacing.md, AppSpacing.lg, AppSpacing.md),
            child: Row(
              children: [
                PlayerRankBadge(position: position),
                SizedBox(width: 30, child: Center(child: MovementIndicator(movement: me.movementFor(type), compact: true))),
                Gap.sm,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(l10n.rankingsYou.toUpperCase(), style: AppTypography.eyebrow(context, color: t.isDark ? AppColors.goldSoft : AppColors.green700)),
                      if (type == RankingType.skill && me.levelPosition != null && me.level != null)
                        Text(l10n.rankingsLevelPosition(me.levelPosition!, me.level!), style: context.text.bodySmall)
                      else if (position == null)
                        Text(l10n.metricUnranked, style: context.text.bodySmall),
                    ],
                  ),
                ),
                if (t.isDark)
                  PmGoldText('${me.valueFor(type)}', style: AppTypography.number(context, size: 26, weight: FontWeight.w500))
                else
                  Text(
                    '${me.valueFor(type)}',
                    style: AppTypography.number(context, size: 26, weight: FontWeight.w500, color: AppColors.green800),
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
