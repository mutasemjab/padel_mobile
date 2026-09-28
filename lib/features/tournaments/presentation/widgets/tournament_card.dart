import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_network_image.dart';
import '../../../../core/widgets/badges.dart';
import '../../../../core/widgets/court_lines.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../domain/entities/tournament.dart';
import 'tournament_status_badge.dart';

/// Tournament list card: hero image (or court texture) with the competition
/// badge always visible, then name, venue, dates and live/fee facts.
class TournamentCard extends StatelessWidget {
  final Tournament tournament;
  final VoidCallback onTap;

  /// Carousel variant: shorter image, fixed width set by the parent.
  final bool compact;

  const TournamentCard({super.key, required this.tournament, required this.onTap, this.compact = false});

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final l10n = AppLocalizations.of(context);
    final fees = tournament.categories.map((c) => c.registrationFee).where((f) => f > 0).toList();
    final minFee = fees.isEmpty ? null : fees.reduce((a, b) => a < b ? a : b);
    final currency = tournament.categories.isEmpty ? null : tournament.categories.first.currency;

    return Material(
      color: t.surface,
      shape: RoundedRectangleBorder(borderRadius: AppRadius.lgAll, side: BorderSide(color: t.outline)),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            AspectRatio(
              aspectRatio: compact ? 2.1 : 16 / 8,
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: 'tournament-image-${tournament.id}',
                    child: AppNetworkImage(
                      url: tournament.imageUrl,
                      fallback: const DecoratedBox(
                        decoration: BoxDecoration(gradient: AppGradients.court),
                        child: CourtLinesBackground(),
                      ),
                    ),
                  ),
                  const DecoratedBox(decoration: BoxDecoration(gradient: AppGradients.imageScrim)),
                  PositionedDirectional(
                    top: AppSpacing.md,
                    start: AppSpacing.md,
                    child: CompetitionBadge(competitionType: tournament.competitionType.apiValue),
                  ),
                  if (tournament.liveMatchesCount > 0)
                    PositionedDirectional(
                      top: AppSpacing.md,
                      end: AppSpacing.md,
                      child: const LiveIndicator(),
                    ),
                  PositionedDirectional(
                    bottom: AppSpacing.md,
                    start: AppSpacing.md,
                    end: AppSpacing.md,
                    child: Text(
                      tournament.name,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: context.text.headlineMedium?.copyWith(color: AppColors.white, height: 1.1),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: AppSpacing.cardDense,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      TournamentStatusBadge(status: tournament.status),
                      const Spacer(),
                      if (tournament.liveMatchesCount > 0)
                        Text(
                          l10n.tournamentLiveCount(tournament.liveMatchesCount),
                          style: context.text.labelMedium?.copyWith(color: AppColors.live),
                        )
                      else if (minFee != null)
                        Text(
                          l10n.tournamentFee(Formatters.money(minFee, currency)),
                          style: context.text.labelMedium,
                        ),
                    ],
                  ),
                  Gap.sm,
                  _Fact(
                    icon: Icons.place_rounded,
                    text: tournament.venue?.displayName ?? l10n.venueTba,
                  ),
                  Gap.xs,
                  _Fact(
                    icon: Icons.calendar_month_rounded,
                    text: DateFormatter.dateRange(tournament.startDate, tournament.endDate),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _Fact extends StatelessWidget {
  final IconData icon;
  final String text;

  const _Fact({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, size: AppSizes.iconXs, color: context.tokens.textMuted),
        Gap.xs,
        Expanded(child: Text(text, style: context.text.bodySmall, maxLines: 1, overflow: TextOverflow.ellipsis)),
      ],
    );
  }
}
