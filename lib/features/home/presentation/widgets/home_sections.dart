import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/meta/enums_service.dart';
import '../../../../core/models/section_state.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/routing/open_route.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/app_logo.dart';
import '../../../../core/widgets/movement_indicator.dart';
import '../../../../core/widgets/pm_art.dart';
import '../../../../core/widgets/badges.dart';
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
              CasualMatchCard(match: m, onTap: () => context.openRoute(AppRoutes.casualMatch(m.id))),
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

/// The home design's player card: perspective court with the flying ball,
/// the level in gold leaf, the three metrics and the C → Elite ladder.
class _RankingCard extends StatelessWidget {
  final RankingSnapshotSection data;

  const _RankingCard({required this.data});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final level = data.level;
    return PmHeroPanel(
      ball: true,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Flexible(
                child: PmChip(
                  data.season == null ? l10n.metricSeasonPoints : '${l10n.rankingsTabSeason} ${data.season}',
                  dot: true,
                ),
              ),
              const Spacer(),
              PmSeal(l10n.competitionCertified),
            ],
          ),
          const SizedBox(height: 86),
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(l10n.statLevel, style: context.text.labelMedium?.copyWith(color: AppColors.cream70, fontWeight: FontWeight.w500)),
                    if (level == null || level.isEmpty)
                      Text(l10n.metricUnranked, style: context.text.headlineLarge?.copyWith(color: AppColors.goldSoft))
                    else
                      _BigLevel(level: level),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  _Figure(value: '${data.skillRating}', label: l10n.metricSkillRating, movement: data.skillMovement),
                  Gap.sm,
                  _Figure(value: '${data.seasonPoints}', label: l10n.metricSeasonPoints, movement: data.seasonMovement),
                  if (data.seasonPosition != null) ...[
                    Gap.sm,
                    _Figure(value: l10n.metricPosition(data.seasonPosition!), label: l10n.rankingsTabSeason),
                  ],
                ],
              ),
            ],
          ),
          Gap.lg,
          PmLevelLadder(level: level),
          Gap.md,
          Container(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: 12, vertical: 10),
            decoration: AppGlass.well(true, radius: BorderRadius.circular(14)),
            child: Row(
              children: [
                const Icon(Icons.bolt_rounded, size: 16, color: AppColors.goldSoft),
                Gap.xs,
                Expanded(
                  child: Text(l10n.metricXp, style: context.text.labelMedium?.copyWith(color: AppColors.cream70, fontWeight: FontWeight.w500)),
                ),
                Text('${data.xp}', style: AppTypography.number(context, size: 17, weight: FontWeight.w500, color: AppColors.goldSoft)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// "B" in 92px gold leaf with the "+" raised like a superscript.
class _BigLevel extends StatelessWidget {
  final String level;

  const _BigLevel({required this.level});

  @override
  Widget build(BuildContext context) {
    final plus = level.endsWith('+');
    final base = plus ? level.substring(0, level.length - 1) : level;
    final size = base.length > 2 ? 56.0 : 88.0;
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PmGoldText(base, style: AppFonts.numeral(size: size, height: 1, letterSpacing: -2)),
          if (plus)
            Padding(
              padding: EdgeInsets.only(top: size * .02, left: 2),
              child: PmGoldText('+', style: AppFonts.numeral(size: size * .5, height: 1)),
            ),
        ],
      ),
    );
  }
}

class _Figure extends StatelessWidget {
  final String value;
  final String label;
  final int? movement;

  const _Figure({required this.value, required this.label, this.movement});

  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.end,
    children: [
      Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (movement != null && movement != 0) MovementIndicator(movement: movement, compact: true),
          Text(value, style: AppTypography.number(context, size: 21, weight: FontWeight.w500, color: AppColors.cream)),
        ],
      ),
      Text(label, style: context.text.labelSmall?.copyWith(fontSize: 10.5, color: AppColors.cream40, letterSpacing: 0)),
    ],
  );
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
    return PmHeroPanel(
      court: false,
      borderColor: color.withValues(alpha: .45),
      aura: RadialGradient(
        center: const Alignment(-.6, -.2),
        radius: 1,
        colors: [color.withValues(alpha: .28), color.withValues(alpha: 0)],
      ),
      padding: const EdgeInsetsDirectional.fromSTEB(16, 16, 18, 16),
      child: Row(
        children: [
          AchievementBadge(achievement: a, size: 84, showLabel: false),
          Gap.lg,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                PmChip(rarity, tone: PmChipTone.gold),
                Gap.sm,
                Text(a.name, style: context.text.headlineMedium?.copyWith(fontSize: 22, color: AppColors.cream)),
                Gap.xxs,
                Text(
                  a.description,
                  style: context.text.bodySmall?.copyWith(color: AppColors.cream70),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                if (a.xpReward > 0) ...[
                  Gap.xs,
                  Text(l10n.xpReward(a.xpReward), style: AppTypography.number(context, size: 14, weight: FontWeight.w500, color: AppColors.ball)),
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
              onTap: () => context.openRoute(AppRoutes.tournament(r.category.tournamentId)),
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
    return SizedBox(
      height: 196,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        itemCount: items.length,
        separatorBuilder: (_, _) => Gap.md,
        itemBuilder: (context, i) => SizedBox(
          width: 286,
          child: _TournamentTicket(item: items[i], featured: i == 0),
        ),
      ),
    );
  }
}

/// The design's tournament ticket: the first one in gold leaf, the rest in
/// deep court green.
class _TournamentTicket extends StatelessWidget {
  final RecommendedTournament item;
  final bool featured;

  const _TournamentTicket({required this.item, required this.featured});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final ink = featured ? AppColors.green900 : AppColors.cream;
    final muted = featured ? AppColors.green900.withValues(alpha: .62) : AppColors.cream70;
    const radius = BorderRadius.all(Radius.circular(26));
    return DecoratedBox(
      decoration: featured
          ? const BoxDecoration(
              borderRadius: radius,
              gradient: CssLinearGradient(150, colors: [Color(0xFFF1E3BC), AppColors.goldSoft, AppColors.gold]),
              boxShadow: [BoxShadow(color: Color(0x80C9A86A), blurRadius: 40, offset: Offset(0, 22), spreadRadius: -20)],
            )
          : AppGlass.hero(radius: radius),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          borderRadius: radius,
          onTap: () => context.openRoute(AppRoutes.tournament(item.tournamentId)),
          child: Stack(
            children: [
              if (!featured) const Positioned.fill(child: ClipRRect(borderRadius: radius, child: PmCourtArt(opacity: .7))),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(18, 16, 18, 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (item.ranked)
                      featured ? const _DarkSeal() : const PmSeal('Playmaker Ranked')
                    else
                      PmChip(l10n.competitionSocial, tone: PmChipTone.muted),
                    const Spacer(),
                    Text(
                      item.tournamentName,
                      style: context.text.headlineMedium?.copyWith(fontSize: 24, height: 1.2, color: ink),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Gap.xxs,
                    Text(
                      [
                        if (item.startDate != null) DateFormatter.dayMonth(item.startDate!),
                        if (item.city != null) item.city!,
                        if (item.categoryName != null) item.categoryName!,
                      ].join(' · '),
                      style: context.text.labelMedium?.copyWith(color: muted, fontWeight: FontWeight.w500),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Gap.md,
                    Row(
                      children: [
                        if (item.registrationFee > 0)
                          Text(
                            Formatters.money(item.registrationFee, null),
                            style: AppTypography.number(context, size: 15, weight: FontWeight.w500, color: ink),
                          ),
                        const Spacer(),
                        if (item.spotsLeft != null)
                          Container(
                            padding: const EdgeInsetsDirectional.symmetric(horizontal: 10, vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(99),
                              color: featured ? AppColors.green900 : const Color(0x1FDFF05A),
                              border: featured ? null : Border.all(color: const Color(0x47DFF05A)),
                            ),
                            child: Text(
                              l10n.tournamentSpotsLeft(item.spotsLeft!),
                              style: context.text.labelSmall?.copyWith(color: featured ? AppColors.goldSoft : AppColors.ball, letterSpacing: 0),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Seal inverted for the gold ticket (green plate, gold ink).
class _DarkSeal extends StatelessWidget {
  const _DarkSeal();

  @override
  Widget build(BuildContext context) => Container(
    padding: const EdgeInsetsDirectional.fromSTEB(9, 4, 10, 4),
    decoration: BoxDecoration(color: AppColors.green900, borderRadius: BorderRadius.circular(8)),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      textDirection: TextDirection.ltr,
      children: [
        const AppLogo(height: 10, colors: [AppColors.goldSoft, AppColors.goldSoft]),
        const SizedBox(width: 6),
        Text('PLAYMAKER RANKED', style: AppFonts.body(size: 10, weight: FontWeight.w700, color: AppColors.goldSoft, letterSpacing: .3)),
      ],
    ),
  );
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
