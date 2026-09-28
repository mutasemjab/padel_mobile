import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/meta/enum_labels.dart';
import '../../../../core/meta/enums_service.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/animated_counter.dart';
import '../../../../core/widgets/badges.dart';
import '../../../../core/widgets/court_lines.dart';
import '../../../../core/widgets/metric_widgets.dart';
import '../../../../core/widgets/player_avatar.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../domain/entities/player.dart';
import '../../domain/entities/player_profile.dart';

/// Full-bleed athlete card: photo with level ring / premium halo, name,
/// flag, Player ID, side, social counts and the three distinct metric tiles.
class AthleteHeader extends StatelessWidget {
  final PlayerProfile profile;
  final Widget actions;

  const AthleteHeader({super.key, required this.profile, required this.actions});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final player = profile.player;
    final flag = Formatters.flag(player.country);
    final rankings = profile.rankings;

    return DecoratedBox(
      decoration: const BoxDecoration(gradient: AppGradients.court),
      child: CourtLinesBackground(
        child: Padding(
            padding: const EdgeInsetsDirectional.fromSTEB(AppSpacing.gutter, AppSpacing.sm, AppSpacing.gutter, AppSpacing.xl),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PlayerAvatar(
                      name: player.name,
                      photoUrl: player.photoUrl,
                      level: player.level?.label,
                      isPremium: player.isPremium,
                      size: AppSizes.avatarXl,
                      heroTag: 'player-avatar-${player.playerId}',
                    ),
                    Gap.lg,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (player.isPremium) ...[const PremiumBadge(), Gap.sm],
                          Text(
                            player.name,
                            style: context.text.displaySmall?.copyWith(color: AppColors.white, height: 1.05),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Gap.xs,
                          Wrap(
                            spacing: AppSpacing.sm,
                            runSpacing: AppSpacing.xxs,
                            crossAxisAlignment: WrapCrossAlignment.center,
                            children: [
                              Text(
                                player.playerId,
                                style: AppTypography.number(context, size: 15, color: AppColors.accent),
                                textDirection: TextDirection.ltr,
                              ),
                              if (flag.isNotEmpty) Text(flag, style: context.text.titleMedium),
                              if (player.side != null)
                                Text(
                                  context.enums.label(EnumGroup.playerSides, player.side!.name),
                                  style: context.text.labelMedium?.copyWith(color: AppColors.textPrimary),
                                ),
                            ],
                          ),
                          if (player.memberSince != null) ...[
                            Gap.xxs,
                            Text(
                              l10n.profileMemberSince(DateFormatter.monthYear(player.memberSince!)),
                              style: context.text.labelSmall?.copyWith(color: AppColors.textMuted),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
                if (player.bio != null && player.bio!.isNotEmpty) ...[
                  Gap.md,
                  Text(
                    player.bio!,
                    style: context.text.bodySmall?.copyWith(color: AppColors.textPrimary),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                Gap.lg,
                _SocialCounts(profile: profile),
                Gap.lg,
                actions,
                Gap.lg,
                _MetricRow(
                  skill: rankings?.skill.rating ?? player.skillRating,
                  level: rankings?.skill.level ?? player.level?.label,
                  skillMovement: rankings?.skill.movement,
                  season: rankings?.season.points ?? player.seasonRankingPoints,
                  seasonPosition: rankings?.season.position,
                  seasonMovement: rankings?.season.movement,
                  xp: rankings?.xp ?? player.xp,
                ),
              ],
            ),
          ),
      ),
    );
  }
}

class _SocialCounts extends StatelessWidget {
  final PlayerProfile profile;

  const _SocialCounts({required this.profile});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final id = profile.player.playerId;
    final social = profile.social;
    Widget count(String label, int value, VoidCallback? onTap) => InkWell(
          onTap: onTap,
          borderRadius: AppRadius.smAll,
          child: Padding(
            padding: const EdgeInsetsDirectional.symmetric(vertical: AppSpacing.xs, horizontal: AppSpacing.xxs),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedCounter(value: value, style: AppTypography.number(context, size: 20, color: AppColors.white)),
                Text(label, style: context.text.labelSmall?.copyWith(color: AppColors.textMuted)),
              ],
            ),
          ),
        );
    return Row(
      children: [
        count(l10n.profileFollowers, social.followers, () => context.push(AppRoutes.playerFollowers(id))),
        Gap.xl,
        count(l10n.profileFollowing, social.following, () => context.push(AppRoutes.playerFollowing(id))),
        Gap.xl,
        count(l10n.profileRespects, social.respects, null),
      ],
    );
  }
}

class _MetricRow extends StatelessWidget {
  final int skill;
  final String? level;
  final int? skillMovement;
  final int season;
  final int? seasonPosition;
  final int? seasonMovement;
  final int xp;

  const _MetricRow({
    required this.skill,
    required this.level,
    required this.skillMovement,
    required this.season,
    required this.seasonPosition,
    required this.seasonMovement,
    required this.xp,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: MetricTile(kind: MetricKind.skill, value: skill, level: level, movement: skillMovement, compact: true),
        ),
        Gap.sm,
        Expanded(
          child: MetricTile(
            kind: MetricKind.season,
            value: season,
            position: seasonPosition,
            movement: seasonMovement,
            compact: true,
          ),
        ),
        Gap.sm,
        Expanded(child: MetricTile(kind: MetricKind.xp, value: xp, compact: true)),
      ],
    );
  }
}
