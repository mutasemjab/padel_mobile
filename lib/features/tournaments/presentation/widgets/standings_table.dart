import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/badges.dart';
import '../../../../core/widgets/metric_widgets.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../domain/entities/category_detail.dart';
import '../../domain/entities/match.dart';

/// Group standings with the backend's tie-break ordering (positions come
/// from the API, never recomputed here).
class StandingsTable extends StatelessWidget {
  final CategoryGroup group;

  const StandingsTable({super.key, required this.group});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final t = context.tokens;
    final headStyle = AppTypography.eyebrow(context);
    Widget num(String v, {Color? color, bool bold = false}) => SizedBox(
          width: 34,
          child: Text(
            v,
            textAlign: TextAlign.center,
            style: AppTypography.number(context, size: 15, color: color, weight: bold ? FontWeight.w700 : FontWeight.w500),
          ),
        );

    return AppCard(
      padding: AppSpacing.cardDense,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(child: Text(group.name, style: context.text.headlineMedium?.copyWith(fontSize: 21))),
              if (group.finished) StatusChip(label: l10n.groupFinished, color: t.textMuted),
            ],
          ),
          Gap.md,
          Container(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.xs, vertical: AppSpacing.sm),
            decoration: AppGlass.well(t.isDark, radius: AppRadius.mdAll),
            child: Row(
            children: [
              SizedBox(width: 30, child: Text('#', style: headStyle, textAlign: TextAlign.center)),
              Expanded(child: Text(l10n.standingsTeam, style: headStyle)),
              for (final h in [l10n.standingsPlayed, l10n.standingsWins, l10n.standingsLosses, l10n.standingsSetDiff, l10n.standingsGameDiff, l10n.standingsPoints])
                SizedBox(width: 34, child: Text(h, textAlign: TextAlign.center, style: headStyle)),
            ],
          ),
          ),
          Gap.xs,
          for (final row in group.standings)
            Padding(
              padding: const EdgeInsetsDirectional.symmetric(vertical: AppSpacing.xs + 2, horizontal: AppSpacing.xs),
              child: Row(
                children: [
                  // Medal coins for the top three, like the rankings podium.
                  PlayerRankBadge(position: row.position, size: 30),
                  Expanded(
                    child: Text(
                      row.team.label,
                      style: context.text.bodyMedium?.copyWith(
                        decoration: row.team.status == TeamStatus.active ? null : TextDecoration.lineThrough,
                        color: row.team.status == TeamStatus.active ? t.textPrimary : t.textMuted,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  num('${row.played}'),
                  num('${row.wins}', color: AppColors.success),
                  num('${row.losses}'),
                  num(Formatters.signed(row.setDifference)),
                  num(Formatters.signed(row.gameDifference)),
                  num('${row.points}', color: t.isDark ? AppColors.goldSoft : AppColors.green800, bold: true),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
