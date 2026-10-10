import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_network_image.dart';
import '../../../../core/widgets/badges.dart';
import '../../../../core/widgets/pm_art.dart';
import '../../../../core/theme/app_text_styles.dart';
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
    final l10n = AppLocalizations.of(context);
    final fees = tournament.categories.map((c) => c.registrationFee).where((f) => f > 0).toList();
    final minFee = fees.isEmpty ? null : fees.reduce((a, b) => a < b ? a : b);
    final currency = tournament.categories.isEmpty ? null : tournament.categories.first.currency;

    const radius = BorderRadius.all(Radius.circular(26));
    final ranked = tournament.competitionType.apiValue == 'ranked';
    // A tournament ticket: the home hero's court panel (or the poster when
    // there is one), the seal, the name in Amiri and a frosted facts strip.
    return DecoratedBox(
      decoration: AppGlass.hero(radius: radius),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: onTap,
          borderRadius: radius,
          child: ClipRRect(
            borderRadius: radius,
            // In a fixed-height grid cell (tablets) the poster takes the
            // remaining height; in lists it keeps its ratio.
            child: LayoutBuilder(
              builder: (context, box) {
                final poster = Stack(
                    fit: StackFit.expand,
                    children: [
                      Hero(
                        tag: 'tournament-image-${tournament.id}',
                        child: AppNetworkImage(
                          url: tournament.imageUrl,
                          fallback: const DecoratedBox(
                            decoration: BoxDecoration(gradient: AppGlass.aura),
                            child: PmCourtArt(),
                          ),
                        ),
                      ),
                      const DecoratedBox(decoration: BoxDecoration(gradient: AppGradients.imageScrim)),
                      PositionedDirectional(
                        top: AppSpacing.md + 2,
                        start: AppSpacing.md + 2,
                        child: ranked
                            ? const PmSeal('Playmaker Ranked')
                            : CompetitionBadge(competitionType: tournament.competitionType.apiValue),
                      ),
                      if (tournament.liveMatchesCount > 0)
                        PositionedDirectional(
                          top: AppSpacing.md + 2,
                          end: AppSpacing.md + 2,
                          child: PmChip(l10n.tournamentLiveCount(tournament.liveMatchesCount), tone: PmChipTone.live, dot: true),
                        ),
                      PositionedDirectional(
                        bottom: AppSpacing.md,
                        start: AppSpacing.lg,
                        end: AppSpacing.lg,
                        child: Text(
                          tournament.name,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: context.text.headlineLarge?.copyWith(color: AppColors.cream, height: 1.15, fontSize: 28),
                        ),
                      ),
                    ],
                  );
                final facts = Container(
                  padding: const EdgeInsetsDirectional.fromSTEB(AppSpacing.lg, AppSpacing.md, AppSpacing.lg, AppSpacing.md + 2),
                  decoration: const BoxDecoration(
                    color: Color(0x66041C16),
                    border: Border(top: BorderSide(color: AppColors.cream08)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          TournamentStatusBadge(status: tournament.status),
                          const Spacer(),
                          if (minFee != null)
                            Text(
                              Formatters.money(minFee, currency),
                              style: AppTypography.number(context, size: 16, weight: FontWeight.w500, color: AppColors.goldSoft),
                            ),
                        ],
                      ),
                      Gap.sm,
                      _Fact(icon: Icons.place_rounded, text: tournament.venue?.displayName ?? l10n.venueTba),
                      Gap.xs,
                      _Fact(icon: Icons.calendar_month_rounded, text: DateFormatter.dateRange(tournament.startDate, tournament.endDate)),
                    ],
                  ),
                );
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (box.hasBoundedHeight)
                      Expanded(child: poster)
                    else
                      AspectRatio(aspectRatio: compact ? 2.1 : 16 / 8.4, child: poster),
                    facts,
                  ],
                );
              },
            ),
          ),
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
        Icon(icon, size: AppSizes.iconXs, color: AppColors.goldSoft.withValues(alpha: .8)),
        Gap.xs,
        Expanded(
          child: Text(
            text,
            style: context.text.bodySmall?.copyWith(color: AppColors.cream70),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}
