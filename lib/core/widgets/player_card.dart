import 'package:flutter/material.dart';

import '../models/player_summary.dart';
import '../theme/app_spacing.dart';
import '../theme/app_tokens.dart';
import '../utils/formatters.dart';
import 'app_card.dart';
import 'badges.dart';
import 'level_badge.dart';
import 'metric_widgets.dart';
import 'player_avatar.dart';

/// Reusable player row: avatar (Hero → profile), name + flag, level and
/// Skill Rating. The caller owns navigation via [onTap] so this stays
/// feature-agnostic; [trailing] replaces the rating when given.
class PlayerCard extends StatelessWidget {
  final PlayerSummary player;
  final VoidCallback? onTap;
  final Widget? trailing;
  final Widget? subtitle;
  final bool dense;
  final bool highlighted;

  /// Hero avatar → profile. Only enable where a player appears once per
  /// screen (duplicate hero tags break the transition).
  final bool hero;

  const PlayerCard({
    super.key,
    required this.player,
    this.onTap,
    this.trailing,
    this.subtitle,
    this.dense = false,
    this.highlighted = false,
    this.hero = false,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final flag = Formatters.flag(player.country);
    return AppCard(
      onTap: onTap,
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: AppSpacing.md,
        vertical: dense ? AppSpacing.sm : AppSpacing.md,
      ),
      borderColor: highlighted ? t.highlight : null,
      color: highlighted ? t.highlight.withValues(alpha: 0.08) : null,
      child: Row(
        children: [
          PlayerAvatar.fromSummary(player, size: dense ? AppSizes.avatarSm : AppSizes.avatarMd, hero: hero),
          Gap.md,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        player.name,
                        style: context.text.titleSmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (flag.isNotEmpty) ...[Gap.xs, Text(flag)],
                    if (player.isPremium) ...[Gap.xs, const PremiumBadge(compact: true)],
                  ],
                ),
                if (subtitle != null) ...[
                  Gap.xxs,
                  DefaultTextStyle.merge(style: context.text.bodySmall, child: subtitle!),
                ] else if (!dense && player.level != null) ...[
                  Gap.xs,
                  LevelBadge(level: player.level),
                ],
              ],
            ),
          ),
          Gap.sm,
          trailing ??
              (player.skillRating != null
                  ? RatingWidget(rating: player.skillRating!, size: dense ? 15 : 17)
                  : const SizedBox.shrink()),
        ],
      ),
    );
  }
}
