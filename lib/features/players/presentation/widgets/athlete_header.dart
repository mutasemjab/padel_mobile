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
import '../../../../core/widgets/app_logo.dart';
import '../../../../core/widgets/level_badge.dart';
import '../../../../core/widgets/pm_art.dart';
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

    final level = rankings?.skill.level ?? player.level?.label;
    // The login's emblem moment for the athlete: court art and the flying
    // ball behind a haloed portrait, name in Amiri, ID in gold leaf, then
    // the social strip, actions, metrics and the level ladder.
    final dark = context.tokens.isDark;
    return PmNightCourt(
      child: DecoratedBox(
        // On light the athlete keeps the night-court stage, rounded into the page.
        decoration: dark
            ? const BoxDecoration()
            : const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [Color(0xFF0F4B3D), AppColors.green800, AppColors.green900],
                ),
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(30)),
              ),
        child: Stack(
      children: [
        const Positioned.fill(child: DecoratedBox(decoration: BoxDecoration(gradient: AppGlass.aura))),
        const Positioned(top: 0, left: 0, right: 0, height: 360, child: PmCourtArt(opacity: .8)),
        Padding(
          padding: const EdgeInsetsDirectional.fromSTEB(AppSpacing.gutter, AppSpacing.xl, AppSpacing.gutter, AppSpacing.xl),
          child: Column(
            children: [
              DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: (player.isPremium ? AppColors.gold : AppColors.greenGlow).withValues(alpha: .55),
                      blurRadius: 50,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: PlayerAvatar(
                  name: player.name,
                  photoUrl: player.photoUrl,
                  level: player.level?.label,
                  isPremium: player.isPremium,
                  size: AppSizes.avatarXl,
                  heroTag: 'player-avatar-${player.playerId}',
                ),
              ),
              Gap.md,
              if (player.isPremium) ...[const PremiumBadge(), Gap.sm],
              Text(
                player.name,
                textAlign: TextAlign.center,
                style: context.text.displaySmall?.copyWith(color: AppColors.cream, height: 1.15),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              Gap.xs,
              Wrap(
                alignment: WrapAlignment.center,
                spacing: AppSpacing.sm,
                runSpacing: AppSpacing.xs,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    textDirection: TextDirection.ltr,
                    children: [
                      const AppLogo(height: 12, colors: [AppColors.goldSoft, AppColors.goldSoft]),
                      const SizedBox(width: 6),
                      Text(player.playerId, style: AppFonts.numeral(size: 13, color: AppColors.goldSoft, letterSpacing: 1.4)),
                    ],
                  ),
                  if (level != null) LevelBadge(level: level),
                  if (player.side != null)
                    PmChip(context.enums.label(EnumGroup.playerSides, player.side!.name), tone: PmChipTone.muted),
                  if (flag.isNotEmpty) Text(flag, style: context.text.titleMedium),
                ],
              ),
              if (player.memberSince != null) ...[
                Gap.xs,
                Text(
                  l10n.profileMemberSince(DateFormatter.monthYear(player.memberSince!)),
                  style: context.text.labelSmall?.copyWith(color: AppColors.cream40),
                ),
              ],
              if (player.bio != null && player.bio!.isNotEmpty) ...[
                Gap.md,
                Text(
                  player.bio!,
                  textAlign: TextAlign.center,
                  style: context.text.bodySmall?.copyWith(color: AppColors.cream70),
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
                level: level,
                skillMovement: rankings?.skill.movement,
                season: rankings?.season.points ?? player.seasonRankingPoints,
                seasonPosition: rankings?.season.position,
                seasonMovement: rankings?.season.movement,
                xp: rankings?.xp ?? player.xp,
              ),
              if (level != null) ...[Gap.lg, PmLevelLadder(level: level)],
            ],
          ),
        ),
      ],
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
    Widget count(String label, int value, VoidCallback? onTap) => Expanded(
          child: InkWell(
            onTap: onTap,
            borderRadius: AppRadius.mdAll,
            child: Padding(
              padding: const EdgeInsetsDirectional.symmetric(vertical: AppSpacing.sm),
              child: Column(
                children: [
                  AnimatedCounter(value: value, style: AppTypography.number(context, size: 21, weight: FontWeight.w500, color: AppColors.cream)),
                  Gap.xxs,
                  Text(label, style: context.text.labelSmall?.copyWith(color: AppColors.cream40, letterSpacing: 0)),
                ],
              ),
            ),
          ),
        );
    Widget rule() => Container(width: 1, height: 28, color: AppColors.cream08);
    return Container(
      decoration: AppGlass.well(true, radius: AppRadius.controlAll),
      child: Row(
        children: [
          count(l10n.profileFollowers, social.followers, () => context.push(AppRoutes.playerFollowers(id))),
          rule(),
          count(l10n.profileFollowing, social.following, () => context.push(AppRoutes.playerFollowing(id))),
          rule(),
          count(l10n.profileRespects, social.respects, null),
        ],
      ),
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
