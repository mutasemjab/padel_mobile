import 'package:flutter/material.dart';

import '../../../../core/meta/enum_labels.dart';
import '../../../../core/meta/enums_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/widgets/badges.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../../tournaments/domain/entities/live_payload.dart';
import '../../../tournaments/domain/entities/match.dart';

IconData _shotIcon(String? shot) => switch (shot) {
      'smash' => Icons.bolt_rounded,
      'volley' => Icons.sports_tennis_rounded,
      'lob' => Icons.north_east_rounded,
      'bandeja' || 'vibora' => Icons.swipe_down_alt_rounded,
      'serve' => Icons.rocket_launch_rounded,
      _ => Icons.sports_baseball_rounded,
    };

/// Newest-first point-by-point feed with shot / error detail. Detail is
/// optional — points without it just show who won them.
class PointFeed extends StatelessWidget {
  final List<PointEvent> points;
  final Match match;

  const PointFeed({super.key, required this.points, required this.match});

  String _teamName(BuildContext context, int? teamId) {
    if (teamId == null) return '';
    if (match.teamOne?.id == teamId) return match.teamOne!.label;
    if (match.teamTwo?.id == teamId) return match.teamTwo!.label;
    return '';
  }

  String? _playerName(String? playerId) {
    if (playerId == null) return null;
    for (final team in [match.teamOne, match.teamTwo]) {
      for (final p in team?.players ?? const []) {
        if (p.playerId == playerId) return p.name;
      }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    if (points.isEmpty) {
      return Padding(
        padding: const EdgeInsetsDirectional.symmetric(vertical: AppSpacing.lg),
        child: Text(l10n.livePointFeedEmpty, style: context.text.bodySmall),
      );
    }
    return Column(
      children: [
        for (final p in points.take(60)) _PointRow(
          point: p,
          teamName: _teamName(context, p.winningTeamId),
          playerName: _playerName(p.primaryPlayerId),
          teamOneWon: match.teamOne?.id == p.winningTeamId,
        ),
      ],
    );
  }
}

class _PointRow extends StatelessWidget {
  final PointEvent point;
  final String teamName;
  final String? playerName;
  final bool teamOneWon;

  const _PointRow({required this.point, required this.teamName, required this.playerName, required this.teamOneWon});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final t = context.tokens;
    final details = <String>[
      if (point.endingType != null) context.enums.label(EnumGroup.pointEndingTypes, point.endingType),
      if (point.shotType != null) context.enums.label(EnumGroup.shotTypes, point.shotType),
      if (point.errorType != null) context.enums.label(EnumGroup.errorTypes, point.errorType),
      if (point.serveOutcome != null) context.enums.label(EnumGroup.serveOutcomes, point.serveOutcome),
      ?playerName,
    ];
    final color = teamOneWon ? t.highlight : AppColors.info;
    return Padding(
      padding: const EdgeInsetsDirectional.symmetric(vertical: AppSpacing.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 34,
            child: Text('#${point.sequence}', style: AppTypography.number(context, size: 13, color: t.textMuted)),
          ),
          Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(color: color.withValues(alpha: 0.15), shape: BoxShape.circle),
            child: Icon(
              point.errorType != null ? Icons.error_outline_rounded : _shotIcon(point.shotType),
              size: AppSizes.iconSm,
              color: point.errorType != null ? AppColors.danger : color,
            ),
          ),
          Gap.md,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  teamName.isEmpty ? l10n.matchPoints : l10n.livePointBy(teamName),
                  style: context.text.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (details.isNotEmpty) Text(details.join(' · '), style: context.text.bodySmall),
              ],
            ),
          ),
          if (point.coverage == 'partial') ...[
            StatusChip(label: l10n.livePartialDetail, color: t.textMuted),
            Gap.xs,
          ],
          if (point.correctedFromId != null) ...[
            StatusChip(label: l10n.liveCorrected, color: AppColors.warning),
            Gap.xs,
          ],
          if (point.recordedAt != null) Text(DateFormatter.time(point.recordedAt!), style: context.text.labelSmall),
        ],
      ),
    );
  }
}
