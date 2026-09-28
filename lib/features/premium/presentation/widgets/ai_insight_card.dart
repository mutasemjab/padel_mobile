import 'package:flutter/material.dart';

import '../../../../core/meta/enums_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/state_views.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../domain/entities/ai_insight.dart';

String aiTypeLabel(AppLocalizations l10n, AiInsightType type) => switch (type) {
      AiInsightType.playerInsights => l10n.aiTypePlayerInsights,
      AiInsightType.performanceSummary => l10n.aiTypePerformanceSummary,
      AiInsightType.partnerRecommendation => l10n.aiTypePartnerRecommendation,
      AiInsightType.tournamentRecommendation => l10n.aiTypeTournamentRecommendation,
      AiInsightType.coachRecommendation => l10n.aiTypeCoachRecommendation,
      AiInsightType.developmentRecommendation => l10n.aiTypeDevelopmentRecommendation,
      AiInsightType.dailyBrief => l10n.aiTypeDailyBrief,
    };

IconData aiTypeIcon(AiInsightType type) => switch (type) {
      AiInsightType.playerInsights => Icons.psychology_rounded,
      AiInsightType.performanceSummary => Icons.insights_rounded,
      AiInsightType.partnerRecommendation => Icons.handshake_rounded,
      AiInsightType.tournamentRecommendation => Icons.emoji_events_rounded,
      AiInsightType.coachRecommendation => Icons.sports_rounded,
      AiInsightType.developmentRecommendation => Icons.trending_up_rounded,
      AiInsightType.dailyBrief => Icons.wb_sunny_rounded,
    };

/// Renders one AI insight in all its states. Without a narrative the facts
/// are shown as a structured card; coverage and the disclaimer are always
/// visible.
class AiInsightCard extends StatelessWidget {
  final AiInsightType type;
  final AiInsight? insight;
  final bool busy;
  final bool compact;
  final VoidCallback? onGenerate;
  final VoidCallback? onTap;

  const AiInsightCard({
    super.key,
    required this.type,
    required this.insight,
    this.busy = false,
    this.compact = false,
    this.onGenerate,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final i = insight;
    final working = busy || (i?.status.isWorking ?? false);

    return AppCard(
      onTap: onTap,
      borderColor: AppColors.premiumGold.withValues(alpha: 0.35),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(aiTypeIcon(type), size: AppSizes.iconMd, color: AppColors.premiumGold),
              Gap.sm,
              Expanded(
                child: Text(
                  aiTypeLabel(l10n, type).toUpperCase(),
                  style: AppTypography.eyebrow(context, color: AppColors.premiumGold),
                ),
              ),
              if (onGenerate != null && !working)
                TextButton.icon(
                  onPressed: onGenerate,
                  icon: Icon(i == null ? Icons.auto_awesome_rounded : Icons.refresh_rounded, size: AppSizes.iconSm),
                  label: Text(i == null ? l10n.aiGenerate : l10n.aiRefresh),
                ),
            ],
          ),
          Gap.md,
          if (working)
            Row(
              children: [
                const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2)),
                Gap.md,
                Expanded(child: Text(l10n.aiWorking, style: context.text.bodySmall)),
              ],
            )
          else if (i == null)
            Text(l10n.aiNotGenerated, style: context.text.bodySmall)
          else if (i.status == AiInsightStatus.insufficientData)
            _Insufficient(insight: i)
          else if (i.status == AiInsightStatus.failed)
            Text(i.error ?? l10n.aiFailed, style: context.text.bodySmall?.copyWith(color: AppColors.danger))
          else if (i.narrative != null)
            _Narrative(narrative: i.narrative!, compact: compact)
          else
            _Facts(facts: i.facts, compact: compact),
          if (i != null && !working) ...[
            Gap.md,
            _Footer(insight: i, compact: compact),
          ],
        ],
      ),
    );
  }
}

class _Insufficient extends StatelessWidget {
  final AiInsight insight;

  const _Insufficient({required this.insight});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final progress = insight.insufficientData?.progress;
    return InsufficientDataState(
      message: insight.insufficientData?.reason ?? l10n.homeInsufficientGeneric,
      current: progress?.$1,
      target: progress?.$2,
    );
  }
}

class _Narrative extends StatelessWidget {
  final AiNarrative narrative;
  final bool compact;

  const _Narrative({required this.narrative, required this.compact});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (narrative.headline != null) Text(narrative.headline!, style: context.text.titleMedium),
        if (narrative.summary != null) ...[
          Gap.xs,
          Text(
            narrative.summary!,
            style: context.text.bodyMedium,
            maxLines: compact ? 3 : null,
            overflow: compact ? TextOverflow.ellipsis : null,
          ),
        ],
        if (!compact && narrative.highlights.isNotEmpty) ...[
          Gap.md,
          Text(l10n.aiHighlights, style: AppTypography.eyebrow(context)),
          Gap.xs,
          for (final h in narrative.highlights) _Bullet(text: h, icon: Icons.star_rounded),
        ],
        if (!compact && narrative.recommendations.isNotEmpty) ...[
          Gap.md,
          Text(l10n.aiRecommendations, style: AppTypography.eyebrow(context)),
          Gap.xs,
          for (final r in narrative.recommendations) _Bullet(text: r, icon: Icons.arrow_forward_rounded),
        ],
      ],
    );
  }
}

class _Bullet extends StatelessWidget {
  final String text;
  final IconData icon;

  const _Bullet({required this.text, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(bottom: AppSpacing.xs),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsetsDirectional.only(top: 3),
            child: Icon(icon, size: AppSizes.iconXs, color: AppColors.premiumGold),
          ),
          Gap.sm,
          Expanded(child: Text(text, style: context.text.bodyMedium)),
        ],
      ),
    );
  }
}

/// Structured fallback when there is no narrative: every fact is shown as a
/// labelled value exactly as the backend computed it.
class _Facts extends StatelessWidget {
  final Map<String, dynamic> facts;
  final bool compact;

  const _Facts({required this.facts, required this.compact});

  String _value(dynamic v) => switch (v) {
        null => '—',
        num n => n is double ? n.toStringAsFixed(n.abs() < 1 ? 2 : 1) : '$n',
        bool b => b ? '✓' : '✗',
        List l => l.map(_value).join(', '),
        Map m => m.entries.map((e) => '${EnumsService.humanize('${e.key}')}: ${_value(e.value)}').join(' · '),
        _ => '$v',
      };

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final entries = facts.entries.toList();
    final shown = compact ? entries.take(4).toList() : entries;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(l10n.aiFacts, style: AppTypography.eyebrow(context)),
        Gap.sm,
        for (final e in shown)
          Padding(
            padding: const EdgeInsetsDirectional.only(bottom: AppSpacing.xs),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 5, child: Text(EnumsService.humanize(e.key), style: context.text.bodySmall)),
                Gap.sm,
                Expanded(
                  flex: 6,
                  child: Text(
                    _value(e.value),
                    style: context.text.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                    textAlign: TextAlign.end,
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}

class _Footer extends StatelessWidget {
  final AiInsight insight;
  final bool compact;

  const _Footer({required this.insight, required this.compact});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final t = context.tokens;
    final coverage = switch (insight.dataCoverage) {
      DataCoverage.none => l10n.aiCoverageNone,
      DataCoverage.low => l10n.aiCoverageLow,
      DataCoverage.medium => l10n.aiCoverageMedium,
      DataCoverage.high => l10n.aiCoverageHigh,
    };
    final coverageColor = switch (insight.dataCoverage) {
      DataCoverage.high => AppColors.success,
      DataCoverage.medium => AppColors.info,
      _ => AppColors.warning,
    };
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          spacing: AppSpacing.sm,
          runSpacing: AppSpacing.xs,
          crossAxisAlignment: WrapCrossAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.data_usage_rounded, size: AppSizes.iconXs, color: coverageColor),
                Gap.xxs,
                Text(l10n.aiCoverage(coverage), style: context.text.labelSmall?.copyWith(color: coverageColor)),
              ],
            ),
            if (insight.matchesUsed != null) Text(l10n.aiMatchesUsed(insight.matchesUsed!), style: context.text.labelSmall),
            if (!compact && insight.generatedAt != null)
              Text(l10n.aiGeneratedAt(DateFormatter.relative(context, insight.generatedAt!)), style: context.text.labelSmall),
          ],
        ),
        if (insight.disclaimer != null) ...[
          Gap.xs,
          Text(
            insight.disclaimer!,
            style: context.text.bodySmall?.copyWith(fontStyle: FontStyle.italic, color: t.textMuted),
            maxLines: compact ? 2 : null,
            overflow: compact ? TextOverflow.ellipsis : null,
          ),
        ],
      ],
    );
  }
}
