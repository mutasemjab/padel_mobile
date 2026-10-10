import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/widgets/pm_art.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../../tournaments/domain/entities/match.dart';
import '../../../tournaments/presentation/widgets/live_match_card.dart';
import '../../domain/entities/home_feed.dart';

/// Which section the contextual top card was built from, so the feed below
/// doesn't repeat it.
enum HeroSource { live, nextMatch, partnerRequests }

/// Picks the most relevant thing right now: a live match I'm in, then my
/// next match, then pending partner requests.
(HeroSource, Widget)? buildHomeHero(BuildContext context, HomeFeed feed) {
  final live = feed.sections['live_now']?.data;
  if (live is LiveNowSection && live.mine.isNotEmpty) {
    return (HeroSource.live, _LiveHero(match: live.mine.first));
  }
  final next = feed.sections['next_match']?.data;
  if (next is NextMatchSection) return (HeroSource.nextMatch, _NextMatchHero(match: next.match));
  final requests = feed.sections['pending_partner_requests']?.data;
  if (requests is PendingPartnerRequestsSection && requests.count > 0) {
    return (HeroSource.partnerRequests, _RequestsHero(count: requests.count));
  }
  return null;
}

void openMatch(BuildContext context, Match match) {
  final tournamentId = match.tournamentId;
  context.push(tournamentId == null ? AppRoutes.liveMatch(match.id) : AppRoutes.match(tournamentId, match.id));
}

class _HeroShell extends StatelessWidget {
  final String eyebrow;
  final bool live;
  final Widget child;

  const _HeroShell({required this.eyebrow, required this.child, this.live = false});

  @override
  Widget build(BuildContext context) {
    return PmHeroPanel(
      court: !live,
      borderColor: live ? AppColors.live.withValues(alpha: .35) : null,
      aura: live ? _liveAura : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PmChip(eyebrow, tone: live ? PmChipTone.live : PmChipTone.gold, dot: true),
          Gap.lg,
          child,
        ],
      ),
    );
  }

  static const _liveAura = RadialGradient(
    center: Alignment(0, -1.1),
    radius: 1.1,
    colors: [Color(0x38FF6A5C), Color(0x00FF6A5C)],
    stops: [0, .55],
  );
}

class _LiveHero extends StatelessWidget {
  final Match match;

  const _LiveHero({required this.match});

  @override
  Widget build(BuildContext context) {
    return _HeroShell(
      eyebrow: AppLocalizations.of(context).homeLiveYouAreIn,
      live: true,
      child: LiveMatchCard(match: match, highlightMine: true, onTap: () => openMatch(context, match)),
    );
  }
}

class _NextMatchHero extends StatelessWidget {
  final Match match;

  const _NextMatchHero({required this.match});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final when = match.scheduledAt;
    return _HeroShell(
      eyebrow: l10n.homeNextMatch,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (when != null) ...[
            Gap.huge,
            PmGoldText(DateFormatter.relative(context, when), style: AppTypography.number(context, size: 46, weight: FontWeight.w500)),
            Gap.xs,
            Text(DateFormatter.matchTime(when), style: context.text.bodySmall?.copyWith(color: AppColors.cream70)),
            Gap.lg,
          ],
          LiveMatchCard(match: match, onTap: () => openMatch(context, match)),
        ],
      ),
    );
  }
}

class _RequestsHero extends StatelessWidget {
  final int count;

  const _RequestsHero({required this.count});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return _HeroShell(
      eyebrow: l10n.partnerRequestsTitle,
      child: Row(
        children: [
          Container(
            width: 58,
            height: 58,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              gradient: const RadialGradient(center: Alignment(0, -.4), colors: [Color(0x4DDFF05A), Color(0x0FDFF05A)]),
              border: Border.all(color: const Color(0x59DFF05A)),
            ),
            child: const Icon(Icons.handshake_rounded, color: AppColors.ball, size: 28),
          ),
          Gap.md,
          Expanded(
            child: Text(
              l10n.homePendingRequests(count),
              style: context.text.headlineMedium?.copyWith(fontSize: 20, color: AppColors.cream),
            ),
          ),
          Gap.sm,
          FilledButton(
            style: FilledButton.styleFrom(minimumSize: const Size(0, 46), padding: const EdgeInsetsDirectional.symmetric(horizontal: 18)),
            onPressed: () => context.push(AppRoutes.partnerRequests),
            child: Text(l10n.homeReviewRequests),
          ),
        ],
      ),
    );
  }
}

/// Skeleton shaped like the hero card + metric row.
class HomeHeroSkeleton extends StatelessWidget {
  const HomeHeroSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    return Container(
      height: 220,
      decoration: BoxDecoration(
        color: t.isDark ? AppColors.cream08 : t.surface2,
        borderRadius: const BorderRadius.all(Radius.circular(30)),
      ),
    );
  }
}
