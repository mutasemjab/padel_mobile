import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/point_label_formatter.dart';
import '../../../../core/widgets/court_lines.dart';
import '../../../../core/widgets/player_avatar.dart';
import '../../../../core/widgets/score_widgets.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../../tournaments/domain/entities/live_payload.dart';
import '../../../tournaments/domain/entities/match.dart';

/// The flagship scoreboard: the current point in huge numerals, games
/// underneath, completed sets as chips, both teams with avatars.
class LiveScoreboard extends StatelessWidget {
  final Match match;
  final LiveEventType? lastEvent;

  const LiveScoreboard({super.key, required this.match, this.lastEvent});

  String _point(bool teamOne) {
    final d = match.currentGameDisplay;
    if (d != null) return teamOne ? d.teamOne : d.teamTwo;
    final live = match.liveScore;
    if (live == null) return '0';
    return PointLabelFormatter.format(teamOne ? live.currentGame.teamOne : live.currentGame.teamTwo, isTiebreak: live.isTiebreak);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final live = match.liveScore;
    final inProgress = match.isInProgress;
    final games = live?.currentSetGames ?? GameScore.zero;
    final sets = live?.sets ?? const <SetScore>[];

    return Container(
      decoration: BoxDecoration(
        gradient: AppGradients.court,
        borderRadius: AppRadius.xlAll,
        boxShadow: inProgress ? AppShadows.soft : null,
      ),
      clipBehavior: Clip.antiAlias,
      child: CourtLinesBackground(
        child: Padding(
          padding: const EdgeInsetsDirectional.all(AppSpacing.lg),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _TeamPanel(team: match.teamOne, winner: match.winnerTeamId, alignEnd: false)),
                  Gap.md,
                  Expanded(child: _TeamPanel(team: match.teamTwo, winner: match.winnerTeamId, alignEnd: true)),
                ],
              ),
              Gap.lg,
              if (live?.isTiebreak ?? false) ...[
                Container(
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.xs),
                  decoration: BoxDecoration(color: AppColors.clay, borderRadius: AppRadius.pillAll),
                  child: Text(
                    l10n.liveTiebreak.toUpperCase(),
                    style: AppTypography.eyebrow(context, color: AppColors.white),
                  ),
                ),
                Gap.sm,
              ],
              // The point — the largest thing on screen. Each side sits under
              // its own team panel in both LTR and RTL.
              _SplitRow(
                start: FlipDigit(value: _point(true), style: AppTypography.score(context, color: AppColors.white)),
                end: FlipDigit(value: _point(false), style: AppTypography.score(context, color: AppColors.white)),
                separator: Text('–', style: AppTypography.scoreSecondary(context, color: AppColors.textMuted)),
              ),
              Text(l10n.matchPoints.toUpperCase(), style: AppTypography.eyebrow(context, color: AppColors.textMuted)),
              Gap.md,
              PulseOnChange(
                trigger: '${games.teamOne}-${games.teamTwo}',
                child: _SplitRow(
                  start: Text('${games.teamOne}', style: AppTypography.number(context, size: 36, color: AppColors.accent)),
                  end: Text('${games.teamTwo}', style: AppTypography.number(context, size: 36, color: AppColors.accent)),
                  separator: Text('–', style: AppTypography.number(context, size: 24, color: AppColors.textMuted)),
                ),
              ),
              Text(l10n.matchGames.toUpperCase(), style: AppTypography.eyebrow(context, color: AppColors.textMuted)),
              if (sets.isNotEmpty) ...[
                Gap.lg,
                Wrap(
                  alignment: WrapAlignment.center,
                  spacing: AppSpacing.md,
                  runSpacing: AppSpacing.sm,
                  children: [
                    for (var i = 0; i < sets.length; i++)
                      _SetColumn(
                        index: i + 1,
                        set: sets[i],
                        animateIn: i == sets.length - 1 && lastEvent == LiveEventType.set,
                      ),
                  ],
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

/// Team one's value at the start side, team two's at the end, hugging a
/// centred separator — mirrors with the text direction like the panels.
class _SplitRow extends StatelessWidget {
  final Widget start;
  final Widget end;
  final Widget separator;

  const _SplitRow({required this.start, required this.end, required this.separator});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Align(alignment: AlignmentDirectional.centerEnd, child: start)),
        Padding(padding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.md), child: separator),
        Expanded(child: Align(alignment: AlignmentDirectional.centerStart, child: end)),
      ],
    );
  }
}

class _TeamPanel extends StatelessWidget {
  final MatchTeam? team;
  final int? winner;
  final bool alignEnd;

  const _TeamPanel({required this.team, required this.winner, required this.alignEnd});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final isWinner = team != null && winner == team!.id;
    final players = team?.players ?? const [];
    return Column(
      crossAxisAlignment: alignEnd ? CrossAxisAlignment.end : CrossAxisAlignment.start,
      children: [
        AvatarPair(players: players, size: AppSizes.avatarSm),
        Gap.sm,
        if (players.isEmpty)
          Text(team?.label ?? l10n.matchTbd, style: context.text.titleSmall?.copyWith(color: AppColors.white))
        else
          for (final p in players)
            Text(
              p.name,
              style: context.text.titleSmall?.copyWith(color: AppColors.white),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: alignEnd ? TextAlign.end : TextAlign.start,
            ),
        if (isWinner) ...[
          Gap.xs,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.emoji_events_rounded, color: AppColors.accent, size: AppSizes.iconSm),
              Gap.xxs,
              Text(l10n.matchWinner, style: AppTypography.eyebrow(context, color: AppColors.accent)),
            ],
          ),
        ],
      ],
    );
  }
}

class _SetColumn extends StatelessWidget {
  final int index;
  final SetScore set;
  final bool animateIn;

  const _SetColumn({required this.index, required this.set, required this.animateIn});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Column(
      children: [
        Text(l10n.matchSetLabel(index).toUpperCase(), style: AppTypography.eyebrow(context, color: AppColors.textMuted)),
        Gap.xs,
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SetChip(own: set.teamOne, other: set.teamTwo, animateIn: animateIn),
            Gap.xs,
            SetChip(own: set.teamTwo, other: set.teamOne, animateIn: animateIn),
          ],
        ),
      ],
    );
  }
}

/// "Live · realtime" / "Live · updating every 5 s".
class TransportIndicator extends StatelessWidget {
  final bool realtime;
  final int pollSeconds;

  const TransportIndicator({super.key, required this.realtime, required this.pollSeconds});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          realtime ? Icons.bolt_rounded : Icons.autorenew_rounded,
          size: AppSizes.iconSm,
          color: realtime ? context.tokens.highlight : context.tokens.textMuted,
        ),
        Gap.xxs,
        Text(
          realtime ? l10n.liveRealtime : l10n.liveUpdatingEvery(pollSeconds),
          style: context.text.labelSmall,
        ),
      ],
    );
  }
}
