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
import '../../../../l10n/gen/app_localizations.dart';
import '../../domain/entities/player_history.dart';

/// One verified result: W/L block, tournament + stage, score, and the
/// Skill Rating delta when the result actually moved the rating.
class ResultRowTile extends StatelessWidget {
  final ResultRow result;
  final VoidCallback? onTap;

  const ResultRowTile({super.key, required this.result, this.onTap});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final t = context.tokens;
    final color = result.won ? AppColors.success : AppColors.danger;
    final stage = [
      if (result.categoryName != null) result.categoryName!,
      if (result.round != null) context.enums.label(EnumGroup.matchRounds, result.round),
      if (result.resultType != 'played') context.enums.label(EnumGroup.resultTypes, result.resultType),
    ].join(' · ');

    return AppCard(
      onTap: onTap,
      padding: AppSpacing.cardDense,
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(color: color.withValues(alpha: 0.15), borderRadius: AppRadius.mdAll),
            child: Text(
              result.won ? l10n.resultWon : l10n.resultLost,
              style: AppTypography.number(context, size: 20, color: color),
            ),
          ),
          Gap.md,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        result.tournamentName,
                        style: context.text.titleSmall,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    if (result.tournamentRanked) ...[
                      Gap.xs,
                      Icon(Icons.verified_user_rounded, size: AppSizes.iconXs, color: t.highlight),
                    ],
                  ],
                ),
                if (stage.isNotEmpty) Text(stage, style: context.text.bodySmall, maxLines: 1, overflow: TextOverflow.ellipsis),
                Text(
                  [
                    if (result.date != null) DateFormatter.dayMonth(result.date!),
                    if (result.partner != null) l10n.resultWithPartner(result.partner!.name),
                  ].join(' · '),
                  style: context.text.labelSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          Gap.sm,
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (result.score != null)
                Text(result.score!, style: AppTypography.number(context, size: 16), textDirection: TextDirection.ltr),
              if (result.ratingDelta != null)
                Text(
                  Formatters.signed(result.ratingDelta!),
                  style: AppTypography.number(
                    context,
                    size: 15,
                    color: result.ratingDelta! >= 0 ? AppColors.success : AppColors.danger,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
