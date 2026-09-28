import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../../../core/meta/enum_labels.dart';
import '../../../../core/meta/enums_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/badges.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../core/widgets/stat_card.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../domain/entities/player_stats.dart';

/// Verified record grid. Null win rate (0 matches) renders "—".
class StatsSummaryGrid extends StatelessWidget {
  final PlayerStats stats;

  const StatsSummaryGrid({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final streak = stats.currentStreak;
    final streakValue = streak.type == null || streak.count == 0
        ? null
        : streak.type == StreakType.win
            ? l10n.streakWins(streak.count)
            : l10n.streakLosses(streak.count);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        StatGrid(
          children: [
            StatCard(label: l10n.statMatches, value: '${stats.matchesPlayed}', icon: Icons.sports_tennis_rounded),
            StatCard(
              label: l10n.statWinRate,
              value: Formatters.percent(stats.winRate),
              icon: Icons.percent_rounded,
              accent: context.tokens.highlight,
            ),
            StatCard(label: l10n.statWins, value: '${stats.wins}', icon: Icons.trending_up_rounded, accent: AppColors.success),
            StatCard(label: l10n.statLosses, value: '${stats.losses}', icon: Icons.trending_down_rounded),
            StatCard(label: l10n.statStreak, value: streakValue, icon: Icons.local_fire_department_rounded),
            StatCard(label: l10n.statBestStreak, value: '${stats.bestWinStreak}', icon: Icons.whatshot_rounded),
            StatCard(label: l10n.statSets, value: '${stats.setsWon}–${stats.setsLost}', icon: Icons.grid_view_rounded),
            StatCard(label: l10n.statGames, value: '${stats.gamesWon}–${stats.gamesLost}', icon: Icons.apps_rounded),
            StatCard(label: l10n.statTournaments, value: '${stats.tournamentsPlayed}', icon: Icons.emoji_events_outlined),
            StatCard(label: l10n.statTitles, value: '${stats.titles}', icon: Icons.emoji_events_rounded, accent: AppColors.premiumGold),
            StatCard(label: l10n.statFinals, value: '${stats.finalsReached}', icon: Icons.military_tech_rounded),
            StatCard(
              label: l10n.statWalkovers,
              value: '${stats.walkoverWins}–${stats.walkoverLosses}',
              icon: Icons.directions_walk_rounded,
            ),
          ],
        ),
        if (stats.lastPlayedAt != null) ...[
          Gap.sm,
          Text(l10n.statLastPlayed(DateFormatter.fullDate(stats.lastPlayedAt!)), style: context.text.bodySmall),
        ],
      ],
    );
  }
}

/// Premium-owner analytics. Point analytics always show their coverage and
/// are labelled "limited data" below ~30%.
class AdvancedStatsView extends StatelessWidget {
  final AdvancedStats stats;

  const AdvancedStatsView({super.key, required this.stats});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final ps = stats.pointStats;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SectionHeader(eyebrow: l10n.premiumLabel, title: l10n.statsAdvanced, eyebrowColor: AppColors.premiumGold),
        Gap.md,
        if (stats.ratingTimeline.length >= 2) ...[
          AppCard(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.statsRatingTimeline, style: context.text.titleSmall),
                Gap.md,
                SizedBox(height: 160, child: RatingTimelineChart(points: stats.ratingTimeline)),
              ],
            ),
          ),
          Gap.md,
        ],
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(l10n.statsByStage, style: context.text.titleSmall),
              Gap.sm,
              for (final e in stats.byStage.entries)
                _RecordBar(
                  label: switch (e.key) {
                    'group' => l10n.statsGroupStage,
                    'knockout' => l10n.statsKnockout,
                    _ => EnumsService.humanize(e.key),
                  },
                  record: e.value,
                ),
              _RecordBar(label: l10n.statsDecidingSets, record: stats.decidingSets),
              if (stats.byCompetition.isNotEmpty) ...[
                Gap.md,
                Text(l10n.statsByCompetition, style: context.text.titleSmall),
                Gap.sm,
                for (final e in stats.byCompetition.entries)
                  _RecordBar(
                    label: e.key == 'ranked' ? l10n.resultRanked : l10n.resultUnranked,
                    record: e.value,
                  ),
              ],
            ],
          ),
        ),
        Gap.md,
        AppCard(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Expanded(child: Text(l10n.statsPointAnalytics, style: context.text.titleSmall)),
                  StatusChip(
                    label: l10n.statsCoverage(Formatters.percent(ps.coverage) ?? l10n.valueDash),
                    color: ps.isLimited ? AppColors.warning : AppColors.success,
                  ),
                ],
              ),
              if (ps.isLimited) ...[
                Gap.xs,
                Text(l10n.statsLimitedData, style: context.text.labelMedium?.copyWith(color: AppColors.warning)),
              ],
              Gap.md,
              _Breakdown(title: l10n.statsWinnersByShot, values: ps.winnersByShot, group: EnumGroup.shotTypes, color: AppColors.success),
              Gap.md,
              _Breakdown(title: l10n.statsErrorsByType, values: ps.errorsByType, group: EnumGroup.errorTypes, color: AppColors.danger),
            ],
          ),
        ),
      ],
    );
  }
}

class _RecordBar extends StatelessWidget {
  final String label;
  final WinRecord record;

  const _RecordBar({required this.label, required this.record});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final rate = record.rate;
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: AppSpacing.sm),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(label, style: context.text.bodySmall)),
              Text(l10n.statsRecord(record.wins, record.matches), style: AppTypography.number(context, size: 15)),
              Gap.sm,
              Text(
                Formatters.percent(rate) ?? l10n.valueDash,
                style: AppTypography.number(context, size: 15, color: context.tokens.highlight),
              ),
            ],
          ),
          Gap.xs,
          ClipRRect(
            borderRadius: AppRadius.pillAll,
            child: LinearProgressIndicator(value: rate ?? 0, minHeight: 6),
          ),
        ],
      ),
    );
  }
}

class _Breakdown extends StatelessWidget {
  final String title;
  final Map<String, int> values;
  final String group;
  final Color color;

  const _Breakdown({required this.title, required this.values, required this.group, required this.color});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final entries = values.entries.toList()..sort((a, b) => b.value.compareTo(a.value));
    final max = entries.isEmpty ? 1 : entries.first.value.clamp(1, 1 << 30);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: AppTypography.eyebrow(context)),
        Gap.sm,
        if (entries.isEmpty) Text(l10n.valueDash, style: context.text.bodySmall),
        for (final e in entries)
          Padding(
            padding: const EdgeInsetsDirectional.only(bottom: AppSpacing.xs),
            child: Row(
              children: [
                SizedBox(width: 96, child: Text(context.enums.label(group, e.key), style: context.text.bodySmall)),
                Expanded(
                  child: ClipRRect(
                    borderRadius: AppRadius.pillAll,
                    child: LinearProgressIndicator(value: e.value / max, color: color, minHeight: 8),
                  ),
                ),
                Gap.sm,
                SizedBox(width: 28, child: Text('${e.value}', style: AppTypography.number(context, size: 14), textAlign: TextAlign.end)),
              ],
            ),
          ),
      ],
    );
  }
}

/// Skill Rating over time.
class RatingTimelineChart extends StatelessWidget {
  final List<RatingPoint> points;

  const RatingTimelineChart({super.key, required this.points});

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final spots = [for (var i = 0; i < points.length; i++) FlSpot(i.toDouble(), points[i].rating.toDouble())];
    final ratings = points.map((p) => p.rating);
    final minY = ratings.reduce((a, b) => a < b ? a : b) - 10;
    final maxY = ratings.reduce((a, b) => a > b ? a : b) + 10;
    return LineChart(
      LineChartData(
        minY: minY.toDouble(),
        maxY: maxY.toDouble(),
        gridData: FlGridData(
          drawVerticalLine: false,
          getDrawingHorizontalLine: (_) => FlLine(color: t.outline, strokeWidth: 1),
        ),
        borderData: FlBorderData(show: false),
        titlesData: const FlTitlesData(
          topTitles: AxisTitles(),
          rightTitles: AxisTitles(),
          bottomTitles: AxisTitles(),
        ),
        lineTouchData: LineTouchData(
          touchTooltipData: LineTouchTooltipData(
            getTooltipColor: (_) => t.surface2,
            getTooltipItems: (spots) => [
              for (final s in spots)
                LineTooltipItem(
                  '${s.y.round()}\n${DateFormatter.dayMonth(points[s.x.round()].date)}',
                  AppTypography.number(context, size: 13),
                ),
            ],
          ),
        ),
        lineBarsData: [
          LineChartBarData(
            spots: spots,
            isCurved: true,
            preventCurveOverShooting: true,
            color: t.highlight,
            barWidth: 3,
            dotData: const FlDotData(show: false),
            belowBarData: BarAreaData(show: true, color: t.highlight.withValues(alpha: 0.12)),
          ),
        ],
      ),
    );
  }
}
