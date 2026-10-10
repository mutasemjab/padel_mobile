import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/point_label_formatter.dart';
import '../../../../core/widgets/pm_art.dart';
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

  String _point(AppLocalizations l10n, bool teamOne) {
    final live = match.liveScore;
    if (live == null) {
      final d = match.currentGameDisplay;
      return d == null ? '0' : (teamOne ? d.teamOne : d.teamTwo);
    }
    final game = live.currentGame;
    // At deuce both sides read 40 here; the word is shown under the score.
    return PointLabelFormatter.label(
      teamOne ? game.teamOne : game.teamTwo,
      teamOne ? game.teamTwo : game.teamOne,
      isTiebreak: live.isTiebreak,
      deuce: match.deuceEnabled,
      deuceText: '40',
      advantageText: l10n.scoreAdvantage,
    );
  }

  String? _situation(AppLocalizations l10n) {
    final live = match.liveScore;
    if (live == null || !match.isInProgress) return null;
    return PointLabelFormatter.situation(
      live.currentGame.teamOne,
      live.currentGame.teamTwo,
      isTiebreak: live.isTiebreak,
      deuce: match.deuceEnabled,
      deuceText: l10n.scoreDeuce,
      advantageText: l10n.scoreAdvantage,
      goldenPointText: l10n.scoreGoldenPoint,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final live = match.liveScore;
    final inProgress = match.isInProgress;
    final games = live?.currentSetGames ?? GameScore.zero;
    final sets = live?.sets ?? const <SetScore>[];

    // The home hero's court panel; red aura and edge while the match is live.
    return PmHeroPanel(
      borderColor: inProgress ? AppColors.live.withValues(alpha: .38) : null,
      aura: inProgress
          ? const RadialGradient(
              center: Alignment(0, -1.1),
              radius: 1.1,
              colors: [Color(0x33FF6A5C), Color(0x00FF6A5C)],
              stops: [0, .55],
            )
          : null,
      padding: const EdgeInsetsDirectional.fromSTEB(18, 18, 18, 20),
      child: Column(
            children: [
              if (inProgress) ...[
                PmChip(l10n.liveBadge, tone: PmChipTone.live, dot: true),
                Gap.lg,
              ],
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: _TeamPanel(team: match.teamOne, winner: match.winnerTeamId, alignEnd: false)),
                  Padding(
                    padding: const EdgeInsets.only(top: 14),
                    child: Text('vs', style: AppFonts.numeral(size: 15, italic: true, color: AppColors.goldSoft)),
                  ),
                  Expanded(child: _TeamPanel(team: match.teamTwo, winner: match.winnerTeamId, alignEnd: true)),
                ],
              ),
              Gap.lg,
              if (live?.isTiebreak ?? false) ...[
                Container(
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.xs),
                  decoration: BoxDecoration(gradient: AppGradients.goldButton, borderRadius: AppRadius.pillAll),
                  child: Text(
                    l10n.liveTiebreak.toUpperCase(),
                    style: AppTypography.eyebrow(context, color: AppColors.green900),
                  ),
                ),
                Gap.sm,
              ],
              // The point — the largest thing on screen. Each side sits under
              // its own team panel in both LTR and RTL.
              _SplitRow(
                start: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: PmGoldDigit(value: _point(l10n, true)),
                ),
                end: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: PmGoldDigit(value: _point(l10n, false)),
                ),
                separator: Text('–', style: AppTypography.scoreSecondary(context, color: AppColors.cream40)),
              ),
              if (_situation(l10n) case final situation?)
                Container(
                  padding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.xxs),
                  decoration: BoxDecoration(
                    color: const Color(0x1FDFF05A),
                    borderRadius: AppRadius.pillAll,
                    border: Border.all(color: const Color(0x47DFF05A)),
                  ),
                  child: Text(situation.toUpperCase(), style: AppTypography.eyebrow(context, color: AppColors.ball)),
                )
              else
                Text(l10n.matchPoints.toUpperCase(), style: AppTypography.eyebrow(context, color: AppColors.cream40)),
              Gap.md,
              PulseOnChange(
                trigger: '${games.teamOne}-${games.teamTwo}',
                child: _SplitRow(
                  start: Text('${games.teamOne}', style: AppTypography.number(context, size: 38, weight: FontWeight.w500, color: AppColors.ball)),
                  end: Text('${games.teamTwo}', style: AppTypography.number(context, size: 38, weight: FontWeight.w500, color: AppColors.ball)),
                  separator: Text('–', style: AppTypography.number(context, size: 24, color: AppColors.cream40)),
                ),
              ),
              Text(l10n.matchGames.toUpperCase(), style: AppTypography.eyebrow(context, color: AppColors.cream40)),
              if (sets.isNotEmpty) ...[
                Gap.lg,
                Container(
                  width: double.infinity,
                  padding: const EdgeInsetsDirectional.symmetric(vertical: AppSpacing.md, horizontal: AppSpacing.sm),
                  decoration: AppGlass.well(true),
                  child: Wrap(
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
                ),
              ],
            ],
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
        AvatarPair(players: players, size: 44),
        Gap.sm,
        if (players.isEmpty)
          Text(team?.label ?? l10n.matchTbd, style: context.text.titleSmall?.copyWith(color: AppColors.cream))
        else
          for (final p in players)
            Text(
              p.name,
              style: context.text.titleSmall?.copyWith(color: AppColors.cream, fontSize: 13.5),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: alignEnd ? TextAlign.end : TextAlign.start,
            ),
        if (isWinner) ...[
          Gap.xs,
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.emoji_events_rounded, color: AppColors.goldSoft, size: AppSizes.iconSm),
              Gap.xxs,
              Text(l10n.matchWinner, style: AppTypography.eyebrow(context, color: AppColors.goldSoft)),
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
        Text(l10n.matchSetLabel(index).toUpperCase(), style: AppTypography.eyebrow(context, color: AppColors.cream40)),
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
