import 'package:flutter/material.dart';

import '../../l10n/gen/app_localizations.dart';
import '../theme/app_colors.dart';
import '../theme/app_effects.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_tokens.dart';
import 'animated_counter.dart';
import 'level_badge.dart';
import 'movement_indicator.dart';

/// The three competitive metrics deliberately look different so they're
/// never confused:
/// - **Skill Rating**: volt, bold numerals, shield icon, level chip
/// - **Season Points**: court green, trophy icon, `#position`
/// - **XP**: muted, bolt icon, quiet — XP never affects ranking
enum MetricKind { skill, season, xp }

class _MetricStyle {
  final Color color;
  final IconData icon;

  const _MetricStyle(this.color, this.icon);

  static _MetricStyle of(BuildContext context, MetricKind kind) => switch (kind) {
    MetricKind.skill => _MetricStyle(context.tokens.isDark ? AppColors.goldSoft : AppColors.green800, Icons.shield_rounded),
    MetricKind.season => _MetricStyle(context.tokens.isDark ? AppColors.ball : AppColors.green600, Icons.emoji_events_rounded),
    MetricKind.xp => _MetricStyle(context.tokens.textMuted, Icons.bolt_rounded),
  };
}

/// A large metric tile for the athlete card / home ranking card.
class MetricTile extends StatelessWidget {
  final MetricKind kind;
  final num? value;
  final int? position;
  final int? movement;
  final String? level;
  final bool compact;

  const MetricTile({
    super.key,
    required this.kind,
    required this.value,
    this.position,
    this.movement,
    this.level,
    this.compact = false,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final t = context.tokens;
    final style = _MetricStyle.of(context, kind);
    final label = switch (kind) {
      MetricKind.skill => l10n.metricSkillRating,
      MetricKind.season => l10n.metricSeasonPoints,
      MetricKind.xp => l10n.metricXp,
    };
    final isXp = kind == MetricKind.xp;

    return Container(
      padding: EdgeInsetsDirectional.all(compact ? AppSpacing.md : AppSpacing.lg),
      // Glass tile; the two ranking metrics carry a tinted edge and wash,
      // XP stays quiet glass.
      decoration: isXp
          ? AppGlass.card(t.isDark, radius: AppRadius.controlAll)
          : BoxDecoration(
              borderRadius: AppRadius.controlAll,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [style.color.withValues(alpha: t.isDark ? .13 : .1), style.color.withValues(alpha: .03)],
              ),
              border: Border.all(color: style.color.withValues(alpha: 0.38)),
            ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Icon(style.icon, size: AppSizes.iconSm, color: style.color),
              Gap.xs,
              Flexible(
                child: Text(
                  label.toUpperCase(),
                  style: AppTypography.eyebrow(context, color: isXp ? t.textMuted : style.color),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
          Gap.sm,
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Flexible(
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  alignment: AlignmentDirectional.centerStart,
                  child: value == null
                      ? Text(l10n.valueDash, style: AppTypography.number(context, size: compact ? 28 : 36))
                      : AnimatedCounter(
                          value: value!,
                          style: AppTypography.number(
                            context,
                            size: compact ? 28 : (isXp ? 30 : 38),
                            weight: FontWeight.w500,
                            color: isXp ? t.textPrimary : style.color,
                          ),
                        ),
                ),
              ),
              Gap.xs,
              MovementIndicator(movement: movement, compact: true),
            ],
          ),
          if (kind == MetricKind.skill && level != null) ...[Gap.sm, LevelBadge(level: level)],
          if (kind == MetricKind.season) ...[
            Gap.sm,
            Text(
              position == null ? l10n.metricUnranked : l10n.metricPosition(position!),
              style: AppTypography.number(context, size: 16, color: t.textPrimary),
            ),
          ],
        ],
      ),
    );
  }
}

/// Inline Skill Rating: "1016 · B+".
class RatingWidget extends StatelessWidget {
  final int rating;
  final String? level;
  final double size;

  const RatingWidget({super.key, required this.rating, this.level, this.size = 18});

  @override
  Widget build(BuildContext context) {
    final color = context.tokens.highlight;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.shield_rounded, size: size * 0.8, color: color),
        Gap.xxs,
        Text(
          '$rating',
          style: AppTypography.number(context, size: size, color: color),
        ),
        if (level != null) ...[Gap.xs, LevelBadge(level: level)],
      ],
    );
  }
}

/// Inline Season Points: "70 pts · #12".
class SeasonPointsWidget extends StatelessWidget {
  final int points;
  final int? position;
  final double size;

  const SeasonPointsWidget({super.key, required this.points, this.position, this.size = 18});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.emoji_events_rounded, size: size * 0.8, color: AppColors.primary),
        Gap.xxs,
        Text(
          '$points',
          style: AppTypography.number(context, size: size, color: AppColors.primary),
        ),
        Gap.xxs,
        Text(l10n.ptsLabel, style: context.text.labelSmall),
        if (position != null) ...[
          Gap.xs,
          Text(l10n.metricPosition(position!), style: AppTypography.number(context, size: size * 0.8)),
        ],
      ],
    );
  }
}

/// Inline XP — intentionally quiet.
class XpWidget extends StatelessWidget {
  final int xp;
  final double size;

  const XpWidget({super.key, required this.xp, this.size = 16});

  @override
  Widget build(BuildContext context) {
    final muted = context.tokens.textMuted;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.bolt_rounded, size: size * 0.9, color: muted),
        Text(
          '$xp',
          style: AppTypography.number(context, size: size, weight: FontWeight.w600, color: muted),
        ),
        Gap.xxs,
        Text(AppLocalizations.of(context).metricXp, style: context.text.labelSmall),
      ],
    );
  }
}

/// "#3" with medal colors for the podium.
class PlayerRankBadge extends StatelessWidget {
  final int? position;
  final double size;

  const PlayerRankBadge({super.key, required this.position, this.size = 36});

  @override
  Widget build(BuildContext context) {
    final p = position;
    final metal = AppMetals.forPlace(p);
    final text = Text(
      p == null ? AppLocalizations.of(context).valueDash : '$p',
      textAlign: TextAlign.center,
      style: AppTypography.number(
        context,
        size: metal != null ? 15 : 17,
        weight: FontWeight.w700,
        color: metal != null ? const Color(0xFF2A1E08) : context.tokens.textMuted,
      ),
    );
    // Top three sit in a brushed-metal coin; everyone else is a quiet numeral.
    return SizedBox(
      width: size,
      child: metal == null
          ? text
          : Center(
              child: Container(
                width: 28,
                height: 28,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: AppMetals.fill(metal),
                  boxShadow: [BoxShadow(color: metal[1].withValues(alpha: .45), blurRadius: 12, spreadRadius: -2)],
                ),
                child: text,
              ),
            ),
    );
  }
}

