import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/meta/enums_service.dart';
import '../../../../core/models/section_state.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/badges.dart';
import '../../../../core/widgets/metric_widgets.dart';
import '../../../../core/widgets/player_card.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../core/widgets/stat_card.dart';
import '../../../../core/widgets/state_views.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../../casual_matches/presentation/widgets/casual_match_card.dart';
import '../../../coaches/presentation/widgets/booking_tile.dart';
import '../../../coaches/presentation/widgets/coach_card.dart';
import '../../../partners/presentation/widgets/partner_widgets.dart';
import '../../../players/domain/entities/player_stats.dart';
import '../../../players/presentation/widgets/achievement_badge.dart';
import '../../../premium/domain/entities/ai_insight.dart';
import '../../../premium/presentation/widgets/ai_insight_card.dart';
import '../../../tournaments/domain/entities/registration.dart';
import '../../../tournaments/presentation/widgets/live_match_card.dart';
import '../../../tournaments/presentation/widgets/registration_widgets.dart';
import '../../domain/entities/home_feed.dart';
import 'home_hero.dart';

/// One feed section with its header, rendered from its explicit state.
class HomeSectionView extends StatelessWidget {
  final HomeSection section;

  const HomeSectionView({super.key, required this.section});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final (title, eyebrow, action) = _header(context, l10n);

    final Widget body = switch (section.state) {
      SectionState.premiumRequired => section.key == 'ai_daily_brief'
          ? const _PremiumTeaser()
          : const AppCard(child: PremiumRequiredState(compact: true)),
      SectionState.insufficientData => AppCard(
          child: InsufficientDataState(
            message: section.key == 'ranking' ? l10n.homeInsufficientRanking : l10n.homeInsufficientGeneric,
          ),
        ),
      _ => _content(context, section.data),
    };

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(eyebrow: eyebrow, title: title, actionLabel: action?.$1, onAction: action?.$2),
        Gap.md,
        body,
      ],
    );
  }

  (String, String?, (String, VoidCallback)?) _header(BuildContext context, AppLocalizations l10n) {
    VoidCallback go(String route) => () => context.push(route);
    return switch (section.key) {
      'live_now' => (l10n.homeLiveNow, l10n.liveBadge, (l10n.homeSeeAll, () => context.go(AppRoutes.compete))),
      'next_match' => (l10n.homeNextMatch, null, null),
      'my_tournaments' => (l10n.homeMyTournaments, null, (l10n.homeSeeAll, go(AppRoutes.myRegistrations))),
      'ranking' => (l10n.homeYourSeason, null, (l10n.homeSeeAll, () => context.go(AppRoutes.rankings))),
      'stats' => (l10n.homeStats, null, null),
      'latest_achievement' => (l10n.homeLatestAchievement, null, null),
      'recommended_tournaments' => (l10n.homeRecommendedTournaments, null, (l10n.homeSeeAll, () => context.go(AppRoutes.compete))),
      'casual_opportunities' => (l10n.homeCasualOpportunities, l10n.competitionSocial, (l10n.homeSeeAll, () => context.go(AppRoutes.play))),
      'recommended_partner' => (l10n.homeRecommendedPartner, null, null),
      'recommended_coach' => (l10n.homeRecommendedCoach, null, (l10n.homeSeeAll, go(AppRoutes.coaches))),
      'upcoming_training' => (l10n.homeUpcomingTraining, null, (l10n.homeSeeAll, go(AppRoutes.myBookings))),
      'pending_partner_requests' => (l10n.partnerRequestsTitle, null, null),
      'ai_daily_brief' => (l10n.homeAiDailyBrief, l10n.premiumLabel, null),
      _ => (EnumsService.humanize(section.key), null, null),
    };
  }

  Widget _content(BuildContext context, HomeSectionData? data) {
    return switch (data) {
      LiveNowSection(:final mine, :final following) => Column(
          children: [
            for (final m in [...mine, ...following]) ...[
              LiveMatchCard(match: m, showTournament: true, highlightMine: mine.contains(m), onTap: () => openMatch(context, m)),
              Gap.md,
            ],
          ],
        ),
      NextMatchSection(:final match) => LiveMatchCard(match: match, onTap: () => openMatch(context, match)),
      MyTournamentsSection(:final registrations) => _MyTournaments(registrations: registrations),
      RankingSnapshotSection() => _RankingCard(data: data),
      StatsSection(:final stats) => _StatsStrip(stats: stats),
      LatestAchievementSection() => _LatestAchievement(section: data),
      RecommendedTournamentsSection(:final items) => _TournamentCarousel(items: items),
      CasualOpportunitiesSection(:final matches) => Column(
          children: [
            for (final m in matches.take(3)) ...[
              CasualMatchCard(match: m, onTap: () => context.push(AppRoutes.casualMatch(m.id))),
              Gap.md,
            ],
          ],
        ),
      RecommendedPartnerSection(:final player, :final reasons) => AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PlayerCard(player: player, onTap: () => context.push(AppRoutes.player(player.playerId))),
              Gap.md,
              ReasonChips(reasons: reasons),
            ],
          ),
        ),
      RecommendedCoachSection(:final coach) => CoachCard(coach: coach, onTap: () => context.push(AppRoutes.coach(coach.id))),
      UpcomingTrainingSection(:final booking) =>
        BookingTile(booking: booking, onTap: () => context.push(AppRoutes.booking(booking.id))),
      PendingPartnerRequestsSection(:final count) => AppCard(
          onTap: () => context.push(AppRoutes.partnerRequests),
          child: Row(
            children: [
              Icon(Icons.handshake_rounded, color: context.tokens.highlight),
              Gap.md,
              Expanded(child: Text(AppLocalizations.of(context).homePendingRequests(count))),
              const Icon(Icons.chevron_right_rounded),
            ],
          ),
        ),
      AiDailyBriefSection(:final insight) => AiInsightCard(
          type: AiInsightType.dailyBrief,
          insight: insight,
          compact: true,
          onTap: () => context.push(AppRoutes.aiInsights),
        ),
      _ => const SizedBox.shrink(),
    };
  }
}

class _RankingCard extends StatelessWidget {
  final RankingSnapshotSection data;

  const _RankingCard({required this.data});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final wide = constraints.maxWidth > 520;
        final season = MetricTile(
          kind: MetricKind.season,
          value: data.seasonPoints,
          position: data.seasonPosition,
          movement: data.seasonMovement,
          compact: !wide,
        );
        final skill = MetricTile(
          kind: MetricKind.skill,
          value: data.skillRating,
          level: data.level,
          movement: data.skillMovement,
          compact: !wide,
        );
        final xp = MetricTile(kind: MetricKind.xp, value: data.xp, compact: !wide);
        if (wide) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: season),
              Gap.sm,
              Expanded(child: skill),
              Gap.sm,
              Expanded(child: xp),
            ],
          );
        }
        return Column(
          children: [
            season,
            Gap.sm,
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Expanded(child: skill), Gap.sm, Expanded(child: xp)],
            ),
          ],
        );
      },
    );
  }
}

class _StatsStrip extends StatelessWidget {
  final PlayerStats stats;

  const _StatsStrip({required this.stats});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final streak = stats.currentStreak;
    final streakText = streak.type == null || streak.count == 0
        ? null
        : streak.type == StreakType.win
            ? l10n.streakWins(streak.count)
            : l10n.streakLosses(streak.count);
    final cards = [
      StatCard(label: l10n.statMatches, value: '${stats.matchesPlayed}', icon: Icons.sports_tennis_rounded),
      StatCard(label: l10n.statWinRate, value: Formatters.percent(stats.winRate), icon: Icons.percent_rounded),
      StatCard(label: l10n.statStreak, value: streakText, icon: Icons.local_fire_department_rounded),
      StatCard(label: l10n.statTitles, value: '${stats.titles}', icon: Icons.emoji_events_rounded),
    ];
    return SizedBox(
      height: 112,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: cards.length,
        separatorBuilder: (_, _) => Gap.sm,
        itemBuilder: (_, i) => SizedBox(width: 132, child: cards[i]),
      ),
    );
  }
}

class _LatestAchievement extends StatelessWidget {
  final LatestAchievementSection section;

  const _LatestAchievement({required this.section});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final a = section.achievement;
    final color = AchievementBadge.rarityColor(context, a.rarity);
    final rarity = switch (a.rarity.name) {
      'rare' => l10n.rarityRare,
      'epic' => l10n.rarityEpic,
      'legendary' => l10n.rarityLegendary,
      _ => l10n.rarityCommon,
    };
    return AppCard(
      shadows: AppShadows.glow(color, strength: 0.28),
      borderColor: color.withValues(alpha: 0.6),
      child: Row(
        children: [
          AchievementBadge(achievement: a, size: 72, showLabel: false),
          Gap.lg,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(rarity.toUpperCase(), style: AppTypography.eyebrow(context, color: color)),
                Gap.xxs,
                Text(a.name, style: context.text.titleMedium),
                Gap.xxs,
                Text(a.description, style: context.text.bodySmall, maxLines: 2, overflow: TextOverflow.ellipsis),
                if (a.xpReward > 0) ...[
                  Gap.xs,
                  Text(l10n.xpReward(a.xpReward), style: context.text.labelMedium),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _MyTournaments extends StatelessWidget {
  final List<Registration> registrations;

  const _MyTournaments({required this.registrations});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 124,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: registrations.length,
        separatorBuilder: (_, _) => Gap.sm,
        itemBuilder: (context, i) {
          final r = registrations[i];
          return SizedBox(
            width: AppSizes.carouselCardWidth,
            child: AppCard(
              onTap: () => context.push(AppRoutes.tournament(r.category.tournamentId)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(r.category.tournamentName, style: context.text.titleSmall, maxLines: 1, overflow: TextOverflow.ellipsis),
                  Gap.xxs,
                  Text(r.category.name, style: context.text.bodySmall),
                  const Spacer(),
                  Row(
                    children: [
                      RegistrationStatusChip(status: r.status),
                      const Spacer(),
                      if (r.category.tournamentStartDate != null)
                        Text(DateFormatter.dayMonth(r.category.tournamentStartDate!), style: context.text.labelSmall),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _TournamentCarousel extends StatelessWidget {
  final List<RecommendedTournament> items;

  const _TournamentCarousel({required this.items});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return SizedBox(
      height: 164,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: items.length,
        separatorBuilder: (_, _) => Gap.sm,
        itemBuilder: (context, i) {
          final item = items[i];
          return SizedBox(
            width: AppSizes.carouselCardWidth,
            child: AppCard(
              gradient: AppGradients.court,
              borderColor: AppColors.transparent,
              onTap: () => context.push(AppRoutes.tournament(item.tournamentId)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CompetitionBadge(competitionType: item.ranked ? 'ranked' : 'social'),
                  Gap.sm,
                  Text(
                    item.tournamentName,
                    style: context.text.titleMedium?.copyWith(color: AppColors.white),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (item.categoryName != null)
                    Text(item.categoryName!, style: context.text.bodySmall?.copyWith(color: AppColors.textMuted)),
                  const Spacer(),
                  Row(
                    children: [
                      Text(
                        [
                          if (item.startDate != null) DateFormatter.dayMonth(item.startDate!),
                          if (item.city != null) item.city!,
                        ].join(' · '),
                        style: context.text.labelMedium?.copyWith(color: AppColors.textPrimary),
                      ),
                      const Spacer(),
                      if (item.spotsLeft != null)
                        Text(
                          l10n.tournamentSpotsLeft(item.spotsLeft!),
                          style: context.text.labelMedium?.copyWith(color: AppColors.accent),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _PremiumTeaser extends StatelessWidget {
  const _PremiumTeaser();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return AppCard(
      gradient: AppGradients.premiumSurface,
      borderColor: AppColors.premiumGold.withValues(alpha: 0.5),
      onTap: () => context.push(AppRoutes.premium),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const PremiumBadge(),
          Gap.md,
          Text(l10n.homePremiumTeaserTitle, style: context.text.titleLarge?.copyWith(color: AppColors.white)),
          Gap.xs,
          Text(l10n.homePremiumTeaserBody, style: context.text.bodySmall?.copyWith(color: AppColors.textMuted)),
          Gap.md,
          Text(
            l10n.premiumNeverAffectsDefault,
            style: context.text.labelSmall?.copyWith(color: AppColors.premiumGoldLight, letterSpacing: 0),
          ),
        ],
      ),
    );
  }
}
