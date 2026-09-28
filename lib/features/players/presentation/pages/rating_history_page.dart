import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/meta/enum_labels.dart';
import '../../../../core/meta/enums_service.dart';
import '../../../../core/state/view_state.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../../core/widgets/state_builders.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../domain/entities/player_history.dart';
import '../bloc/player_tab_cubits.dart';

/// Skill Rating history (each change with its auditable breakdown) and
/// Season Points by season.
class RatingHistoryPage extends StatelessWidget {
  final String playerId;

  const RatingHistoryPage({super.key, required this.playerId});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.ratingHistoryTitle),
          bottom: TabBar(
            isScrollable: true,
            padding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.md),
            tabs: [Tab(text: l10n.metricSkillRating), Tab(text: l10n.metricSeasonPoints)],
          ),
        ),
        body: TabBarView(children: [_RatingTab(playerId: playerId), _SeasonTab(playerId: playerId)]),
      ),
    );
  }
}

class _RatingTab extends StatelessWidget {
  final String playerId;

  const _RatingTab({required this.playerId});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocProvider(
      create: (_) => RatingHistoryCubit(sl(), playerId)..load(),
      child: BlocBuilder<RatingHistoryCubit, PagedState<RatingHistoryEntry>>(
        builder: (context, state) {
          final cubit = context.read<RatingHistoryCubit>();
          return PagedStateView<RatingHistoryEntry>(
            state: state,
            onLoadMore: cubit.loadMore,
            onRefresh: cubit.refresh,
            onRetry: cubit.load,
            header: Text(l10n.officialNote, style: context.text.bodySmall),
            empty: EmptyState(icon: Icons.show_chart_rounded, title: l10n.ratingHistoryEmpty, message: l10n.officialNote),
            itemBuilder: (context, e, _) => _RatingEntryCard(entry: e),
          );
        },
      ),
    );
  }
}

class _RatingEntryCard extends StatelessWidget {
  final RatingHistoryEntry entry;

  const _RatingEntryCard({required this.entry});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final t = context.tokens;
    final up = entry.delta >= 0;
    final reason = switch (entry.reason) {
      'official_result' => l10n.ratingReasonOfficial,
      'correction_reversal' => l10n.ratingReasonCorrection,
      'inactivity' => l10n.ratingReasonInactivity,
      _ => EnumsService.humanize(entry.reason),
    };
    final breakdown = entry.breakdown;
    return AppCard(
      padding: AppSpacing.cardDense,
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: AppColors.transparent),
        child: ExpansionTile(
          tilePadding: EdgeInsets.zero,
          childrenPadding: const EdgeInsetsDirectional.only(bottom: AppSpacing.sm),
          enabled: breakdown != null && breakdown.isNotEmpty,
          trailing: breakdown == null ? const SizedBox.shrink() : null,
          leading: Text(
            Formatters.signed(entry.delta),
            style: AppTypography.number(context, size: 22, color: up ? AppColors.success : AppColors.danger),
          ),
          title: Text(entry.tournamentName ?? reason, style: context.text.titleSmall),
          subtitle: Text(
            [
              reason,
              '${entry.ratingBefore} → ${entry.ratingAfter}',
              if (entry.createdAt != null) DateFormatter.dayMonth(entry.createdAt!),
            ].join(' · '),
            style: context.text.bodySmall,
          ),
          children: [
            if (breakdown != null) ...[
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(l10n.ratingBreakdown, style: AppTypography.eyebrow(context)),
              ),
              Gap.sm,
              for (final e in breakdown.entries)
                Padding(
                  padding: const EdgeInsetsDirectional.only(bottom: AppSpacing.xs),
                  child: Row(
                    children: [
                      Expanded(child: Text(_breakdownLabel(l10n, context, e.key), style: context.text.bodySmall)),
                      Text(_value(context, e.key, e.value), style: AppTypography.number(context, size: 15, color: t.textPrimary)),
                    ],
                  ),
                ),
            ],
          ],
        ),
      ),
    );
  }

  static String _breakdownLabel(AppLocalizations l10n, BuildContext context, String key) => switch (key) {
        'expected_score' => l10n.ratingExpected,
        'effective_k' => l10n.ratingKFactor,
        'own_strength' => l10n.ratingOwnStrength,
        'opponent_strength' => l10n.ratingOpponentStrength,
        'upset' => l10n.ratingUpset,
        'stage' => l10n.ratingStage,
        _ => EnumsService.humanize(key),
      };

  static String _value(BuildContext context, String key, dynamic v) {
    if (key == 'stage' && v is String) return context.enums.label(EnumGroup.matchRounds, v);
    return switch (v) {
      null => '—',
      double d => d.toStringAsFixed(d.abs() < 1 ? 3 : 1),
      bool b => b ? '✓' : '✗',
      _ => '$v',
    };
  }
}

class _SeasonTab extends StatelessWidget {
  final String playerId;

  const _SeasonTab({required this.playerId});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocProvider(
      create: (_) => SeasonHistoryCubit(sl(), playerId)..load(),
      child: BlocBuilder<SeasonHistoryCubit, ViewState<SeasonHistory>>(
        builder: (context, state) => ViewStateView<SeasonHistory>(
          state: state,
          onRetry: () => context.read<SeasonHistoryCubit>().load(),
          builder: (context, history) {
            final seasons = history.seasons.keys.toList()..sort((a, b) => b.compareTo(a));
            return ListView(
              padding: AppSpacing.page,
              children: [
                if (seasons.length > 1)
                  Wrap(
                    spacing: AppSpacing.sm,
                    children: [
                      for (final s in seasons)
                        ChoiceChip(
                          label: Text('$s · ${history.seasons[s]}'),
                          selected: s == history.season,
                          onSelected: (_) => context.read<SeasonHistoryCubit>().selectSeason(s),
                        ),
                    ],
                  ),
                Gap.lg,
                AppCard(
                  child: Row(
                    children: [
                      const Icon(Icons.emoji_events_rounded, color: AppColors.primary, size: AppSizes.iconXl),
                      Gap.md,
                      Expanded(child: Text(history.season, style: context.text.titleMedium)),
                      Text('${history.points}', style: AppTypography.number(context, size: 36, color: AppColors.primary)),
                    ],
                  ),
                ),
                Gap.sm,
                Text(l10n.seasonBestStageNote, style: context.text.bodySmall),
                Gap.lg,
                if (history.entries.isEmpty)
                  EmptyState(icon: Icons.emoji_events_outlined, title: l10n.ratingHistoryEmpty, message: l10n.officialNote, compact: true),
                for (final e in history.entries) ...[
                  AppCard(
                    padding: AppSpacing.cardDense,
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(e.tournamentName ?? e.reason ?? '', style: context.text.titleSmall),
                              Text(
                                [
                                  if (e.categoryName != null) e.categoryName!,
                                  if (e.stage != null) context.enums.label(EnumGroup.matchRounds, e.stage),
                                  if (e.weight != null) '×${e.weight}',
                                ].join(' · '),
                                style: context.text.bodySmall,
                              ),
                            ],
                          ),
                        ),
                        Text('+${e.points}', style: AppTypography.number(context, size: 20, color: AppColors.primary)),
                      ],
                    ),
                  ),
                  Gap.sm,
                ],
              ],
            );
          },
        ),
      ),
    );
  }
}
