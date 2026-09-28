import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/widgets/court_lines.dart';
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
  final Gradient gradient;
  final String eyebrow;
  final Color eyebrowColor;
  final Widget child;
  final List<BoxShadow>? shadows;

  const _HeroShell({
    required this.gradient,
    required this.eyebrow,
    required this.eyebrowColor,
    required this.child,
    this.shadows,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: gradient, borderRadius: AppRadius.xlAll, boxShadow: shadows),
      clipBehavior: Clip.antiAlias,
      child: CourtLinesBackground(
        child: Padding(
          padding: const EdgeInsetsDirectional.all(AppSpacing.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(eyebrow.toUpperCase(), style: AppTypography.eyebrow(context, color: eyebrowColor)),
              Gap.md,
              child,
            ],
          ),
        ),
      ),
    );
  }
}

class _LiveHero extends StatelessWidget {
  final Match match;

  const _LiveHero({required this.match});

  @override
  Widget build(BuildContext context) {
    return _HeroShell(
      gradient: AppGradients.court,
      eyebrow: AppLocalizations.of(context).homeLiveYouAreIn,
      eyebrowColor: AppColors.accent,
      shadows: AppShadows.live,
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
      gradient: AppGradients.court,
      eyebrow: l10n.homeNextMatch,
      eyebrowColor: AppColors.accent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (when != null) ...[
            Text(
              DateFormatter.relative(context, when),
              style: AppTypography.number(context, size: 40, color: AppColors.white),
            ),
            Text(DateFormatter.matchTime(when), style: context.text.bodySmall?.copyWith(color: AppColors.textMuted)),
            Gap.md,
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
      gradient: AppGradients.court,
      eyebrow: l10n.partnerRequestsTitle,
      eyebrowColor: AppColors.accent,
      child: Row(
        children: [
          const Icon(Icons.handshake_rounded, color: AppColors.accent, size: AppSizes.iconXl),
          Gap.md,
          Expanded(
            child: Text(
              l10n.homePendingRequests(count),
              style: context.text.titleMedium?.copyWith(color: AppColors.white),
            ),
          ),
          FilledButton(
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
      height: 180,
      decoration: BoxDecoration(color: t.surface2, borderRadius: AppRadius.xlAll),
    );
  }
}
