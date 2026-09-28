import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/models/section_state.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/state/view_state.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/player_card.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../core/widgets/shimmer_skeleton.dart';
import '../../../../core/widgets/state_builders.dart';
import '../../../../core/widgets/state_views.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../domain/entities/partner.dart';
import '../bloc/partners_cubits.dart';
import 'partner_widgets.dart';

/// `me/partners/recommended`: candidates with reason chips and factual
/// numbers. No compatibility score is ever shown.
class RecommendedPartnersSection extends StatelessWidget {
  const RecommendedPartnersSection({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocProvider(
      create: (_) => sl<RecommendedPartnersCubit>()..load(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SectionHeader(title: l10n.partnerRecommended),
          Gap.md,
          BlocBuilder<RecommendedPartnersCubit, ViewState<PartnerRecommendations>>(
            builder: (context, state) => ViewStateView<PartnerRecommendations>(
              state: state,
              loading: const PlayerCardSkeleton(),
              onRetry: () => context.read<RecommendedPartnersCubit>().load(),
              builder: (context, data) {
                if (data.state == SectionState.insufficientData || data.candidates.isEmpty) {
                  return AppCard(child: InsufficientDataState(message: l10n.partnerRecommendedEmpty));
                }
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    if (data.basis.playerRating != null)
                      Padding(
                        padding: const EdgeInsetsDirectional.only(bottom: AppSpacing.md),
                        child: Text(
                          l10n.partnerRecommendedBasis('${data.basis.playerRating}', data.basis.playerVerifiedMatches),
                          style: context.text.bodySmall,
                        ),
                      ),
                    for (final c in data.candidates) ...[CandidateCard(candidate: c), Gap.md],
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CandidateCard extends StatelessWidget {
  final PartnerCandidate candidate;

  const CandidateCard({super.key, required this.candidate});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final f = candidate.facts;
    final facts = <String>[
      if (f.ratingDifference != null) l10n.factRatingDiff(Formatters.signed(f.ratingDifference!)),
      if (f.matchesTogether != null && f.matchesTogether! > 0)
        l10n.factTogether(f.winsTogether ?? 0, f.matchesTogether!),
      if (f.candidateVerifiedMatches != null) l10n.factVerifiedMatches(f.candidateVerifiedMatches!),
      if (Formatters.percent(f.candidateWinRate) != null) l10n.factWinRate(Formatters.percent(f.candidateWinRate)!),
      if (f.candidateLastPlayedAt != null)
        l10n.factLastPlayed(DateFormatter.relative(context, f.candidateLastPlayedAt!)),
    ];
    return AppCard(
      padding: AppSpacing.cardDense,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PlayerCard(
            player: candidate.player,
            onTap: () => context.push(AppRoutes.player(candidate.player.playerId)),
            dense: true,
          ),
          Gap.sm,
          ReasonChips(reasons: candidate.reasons),
          if (facts.isNotEmpty) ...[Gap.sm, Text(facts.join(' · '), style: context.text.bodySmall)],
        ],
      ),
    );
  }
}

/// A past partnership row with its verified record.
class PartnerHistoryTile extends StatelessWidget {
  final PartnerRecord record;

  const PartnerHistoryTile({super.key, required this.record});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return PlayerCard(
      player: record.partner,
      dense: true,
      onTap: () => context.push(AppRoutes.player(record.partner.playerId)),
      subtitle: Text(l10n.partnerRecord(record.matchesWon, record.matchesPlayed)),
      trailing: Text(
        Formatters.percent(record.winRate) ?? l10n.valueDash,
        style: AppTypography.number(context, size: 18, color: context.tokens.highlight),
      ),
    );
  }
}
