import 'package:flutter/material.dart';

import '../../../../core/meta/enums_service.dart';
import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/utils/point_label_formatter.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/badges.dart';
import '../../../../core/widgets/player_avatar.dart';
import '../../../../core/widgets/score_widgets.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../domain/entities/match.dart';

/// Scoreboard card for a match in any list (live, schedule, bracket, home).
/// Handles bracket placeholders (no teams yet), byes and walkovers.
class LiveMatchCard extends StatelessWidget {
  final Match match;
  final VoidCallback? onTap;

  /// Shows the tournament name (global "live now" lists).
  final bool showTournament;
  final bool highlightMine;

  const LiveMatchCard({
    super.key,
    required this.match,
    this.onTap,
    this.showTournament = false,
    this.highlightMine = false,
  });

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final live = match.isInProgress;
    return AppCard(
      onTap: onTap,
      padding: AppSpacing.cardDense,
      borderColor: live ? AppColors.live.withValues(alpha: 0.45) : (highlightMine ? t.highlight : null),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _Header(match: match, showTournament: showTournament),
          Gap.md,
          _TeamLine(match: match, isTeamOne: true),
          Gap.sm,
          _TeamLine(match: match, isTeamOne: false),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final Match match;
  final bool showTournament;

  const _Header({required this.match, required this.showTournament});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final enums = sl<EnumsService>();
    final parts = <String>[
      if (showTournament && match.tournament != null) match.tournament!.name,
      if (match.category != null) match.category!.name,
      match.roundLabel ?? (match.round == null ? '' : enums.label(EnumGroup.matchRounds, match.round)),
      if (match.group != null) match.group!.name,
    ].where((p) => p.isNotEmpty).toList();

    return Row(
      children: [
        if (match.isInProgress) ...[const LiveIndicator(), Gap.sm],
        Expanded(
          child: Text(
            parts.join(' · '),
            style: AppTypography.eyebrow(context),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        if (match.court != null) ...[
          Gap.sm,
          Icon(Icons.stadium_rounded, size: AppSizes.iconXs, color: context.tokens.textMuted),
          Gap.xxs,
          Text(match.court!, style: context.text.labelSmall),
        ] else if (!match.isInProgress && match.scheduledAt != null)
          Text(DateFormatter.matchTime(match.scheduledAt!), style: context.text.labelSmall),
        if (match.status == MatchStatus.walkover) ...[
          Gap.sm,
          StatusChip(label: l10n.matchWalkover, color: AppColors.warning),
        ],
      ],
    );
  }
}

class _TeamLine extends StatelessWidget {
  final Match match;
  final bool isTeamOne;

  const _TeamLine({required this.match, required this.isTeamOne});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final t = context.tokens;
    final team = isTeamOne ? match.teamOne : match.teamTwo;
    final isWinner = team != null && match.winnerTeamId == team.id;
    final finished = match.status.isFinished;
    final dimmed = finished && match.winnerTeamId != null && !isWinner;
    final live = match.liveScore;
    final sets = live?.sets ?? const <SetScore>[];

    final label = team?.label ?? (match.isBye && !isTeamOne ? l10n.matchBye : l10n.matchTbd);
    final nameStyle = context.text.titleSmall?.copyWith(
      color: dimmed ? t.textMuted : t.textPrimary,
      fontWeight: isWinner ? FontWeight.w800 : FontWeight.w600,
    );

    return Row(
      children: [
        AvatarPair(players: team?.players ?? const [], size: AppSizes.avatarXs),
        Gap.sm,
        Expanded(
          child: Row(
            children: [
              if (team?.seed != null) ...[
                Text('[${team!.seed}]', style: AppTypography.number(context, size: 13, color: t.textMuted)),
                Gap.xs,
              ],
              Flexible(child: Text(label, style: nameStyle, maxLines: 1, overflow: TextOverflow.ellipsis)),
              if (isWinner) ...[
                Gap.xs,
                Icon(Icons.emoji_events_rounded, size: AppSizes.iconSm, color: t.highlight),
              ],
            ],
          ),
        ),
        for (final set in sets) ...[
          Gap.xs,
          SetChip(own: isTeamOne ? set.teamOne : set.teamTwo, other: isTeamOne ? set.teamTwo : set.teamOne, compact: true),
        ],
        if (match.isInProgress && live != null) ...[
          Gap.sm,
          Text(
            '${isTeamOne ? live.currentSetGames.teamOne : live.currentSetGames.teamTwo}',
            style: AppTypography.number(context, size: 18, color: t.textPrimary),
          ),
          Gap.sm,
          Container(
            constraints: const BoxConstraints(minWidth: 34),
            padding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.xs, vertical: AppSpacing.xxs),
            decoration: BoxDecoration(color: t.highlight.withValues(alpha: 0.14), borderRadius: AppRadius.smAll),
            alignment: Alignment.center,
            child: FlipDigit(
              value: _point(context, match, isTeamOne),
              style: AppTypography.number(context, size: 18, color: t.highlight),
            ),
          ),
        ] else if (sets.isEmpty && finished) ...[
          Gap.sm,
          Text(
            '${isTeamOne ? match.setsWonTeamOne : match.setsWonTeamTwo}',
            style: AppTypography.number(context, size: 20, color: isWinner ? t.highlight : t.textMuted),
          ),
        ],
      ],
    );
  }

  /// Built here from the raw counts so Deuce / Advantage follow the app's language.
  static String _point(BuildContext context, Match match, bool teamOne) {
    final live = match.liveScore;
    if (live == null) {
      final display = match.currentGameDisplay;
      return display == null ? '0' : (teamOne ? display.teamOne : display.teamTwo);
    }
    final l10n = AppLocalizations.of(context);
    final game = live.currentGame;
    return PointLabelFormatter.label(
      teamOne ? game.teamOne : game.teamTwo,
      teamOne ? game.teamTwo : game.teamOne,
      isTiebreak: live.isTiebreak,
      deuce: match.deuceEnabled,
      deuceText: l10n.scoreDeuce,
      advantageText: l10n.scoreAdvantage,
    );
  }
}
