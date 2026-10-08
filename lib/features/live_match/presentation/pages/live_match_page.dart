import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/meta/enum_labels.dart';
import '../../../../core/meta/enums_service.dart';
import '../../../../core/realtime/realtime_client.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/routing/open_route.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/badges.dart';
import '../../../../core/widgets/feedback.dart';
import '../../../../core/widgets/shimmer_skeleton.dart';
import '../../../../core/widgets/state_views.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../../notifications/presentation/widgets/achievement_celebration_overlay.dart';
import '../../../tournaments/domain/entities/live_payload.dart';
import '../../../tournaments/domain/entities/match.dart';
import '../bloc/live_match_cubit.dart';
import '../bloc/live_match_state.dart';
import '../widgets/live_scoreboard.dart';
import '../widgets/point_feed.dart';

/// The match centre: realtime scoreboard, context, and point-by-point feed.
class LiveMatchPage extends StatelessWidget {
  final int? tournamentId;
  final int matchId;

  const LiveMatchPage({super.key, this.tournamentId, required this.matchId});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocProvider(
      create: (_) => sl<LiveMatchCubit>(param1: matchId, param2: tournamentId)..start(),
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.liveTitle),
          actions: [
            BlocSelector<LiveMatchCubit, LiveMatchState, bool>(
              selector: (s) => s is LiveMatchLoaded && s.match.isInProgress,
              builder: (context, live) => live
                  ? const Padding(
                      padding: EdgeInsetsDirectional.only(end: AppSpacing.lg),
                      child: Center(child: LiveIndicator()),
                    )
                  : const SizedBox.shrink(),
            ),
          ],
        ),
        body: BlocConsumer<LiveMatchCubit, LiveMatchState>(
          listenWhen: (a, b) =>
              b is LiveMatchLoaded && (a is! LiveMatchLoaded || a.eventSeq != b.eventSeq),
          listener: _onEvent,
          builder: (context, state) {
            return switch (state) {
              LiveMatchInitial() || LiveMatchLoading() => const _LiveSkeleton(),
              LiveMatchError(:final failure) =>
                ErrorState(failure: failure, onRetry: () => context.read<LiveMatchCubit>().start()),
              LiveMatchLoaded() => _LiveContent(state: state),
            };
          },
        ),
      ),
    );
  }

  static void _onEvent(BuildContext context, LiveMatchState state) {
    if (state is! LiveMatchLoaded) return;
    final l10n = AppLocalizations.of(context);
    switch (state.lastEvent) {
      case LiveEventType.undo:
      case LiveEventType.correction:
        showAppSnack(context, l10n.correctedToast, icon: Icons.history_rounded);
      case LiveEventType.matchCompleted:
        final winner = state.match.winner;
        if (winner != null && !context.reduceMotion) {
          showAchievementCelebration(context, achievementMessage: l10n.liveWinnerTitle(winner.label));
        }
      default:
        break;
    }
  }
}

class _LiveContent extends StatelessWidget {
  final LiveMatchLoaded state;

  const _LiveContent({required this.state});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final match = state.match;
    return RefreshIndicator(
      onRefresh: () => context.read<LiveMatchCubit>().start(),
      child: ListView(
        padding: AppSpacing.page,
        children: [
          Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: AppSpacing.maxContentWidth),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _ContextStrip(match: match),
                  Gap.md,
                  LiveScoreboard(match: match, lastEvent: state.lastEvent),
                  Gap.md,
                  _StatusLine(state: state),
                  if (match.status.isFinished) ...[
                    Gap.md,
                    _FinishedBanner(match: match),
                  ],
                  Gap.xl,
                  AppCard(
                    padding: EdgeInsets.zero,
                    child: ExpansionTile(
                      initiallyExpanded: true,
                      shape: const Border(),
                      title: Text(l10n.livePointFeed, style: context.text.titleMedium),
                      childrenPadding: const EdgeInsetsDirectional.fromSTEB(AppSpacing.lg, 0, AppSpacing.lg, AppSpacing.md),
                      children: [PointFeed(points: state.points, match: match)],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _ContextStrip extends StatelessWidget {
  final Match match;

  const _ContextStrip({required this.match});

  @override
  Widget build(BuildContext context) {
    final parts = [
      if (match.tournament != null) match.tournament!.name,
      if (match.category != null) match.category!.name,
      match.roundLabel ?? (match.round == null ? '' : context.enums.label(EnumGroup.matchRounds, match.round)),
      if (match.group != null) match.group!.name,
      if (match.court != null) match.court!,
    ].where((p) => p.isNotEmpty).toList();
    return InkWell(
      onTap: match.tournamentId == null ? null : () => context.openRoute(AppRoutes.tournament(match.tournamentId!)),
      child: Text(parts.join(' · ').toUpperCase(), style: AppTypography.eyebrow(context), textAlign: TextAlign.center),
    );
  }
}

class _StatusLine extends StatelessWidget {
  final LiveMatchLoaded state;

  const _StatusLine({required this.state});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final match = state.match;
    if (match.isInProgress) {
      return Center(
        child: TransportIndicator(
          realtime: state.transport == RealtimeTransport.realtime,
          pollSeconds: state.pollSeconds,
        ),
      );
    }
    if (match.status == MatchStatus.scheduled) {
      return Center(
        child: Text(
          match.scheduledAt == null ? l10n.liveNotStarted : l10n.matchStartsAt(DateFormatter.matchTime(match.scheduledAt!)),
          style: context.text.bodySmall,
        ),
      );
    }
    return const SizedBox.shrink();
  }
}

class _FinishedBanner extends StatelessWidget {
  final Match match;

  const _FinishedBanner({required this.match});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final winner = match.winner;
    final result = match.result;
    final verified = result?.verificationStatus.name == 'verified';
    return AppCard(
      borderColor: context.tokens.highlight.withValues(alpha: 0.5),
      child: Row(
        children: [
          Icon(Icons.emoji_events_rounded, color: context.tokens.highlight, size: AppSizes.iconXl),
          Gap.md,
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  winner == null ? l10n.liveMatchOver : l10n.liveWinnerTitle(winner.label),
                  style: context.text.titleMedium,
                ),
                if (result != null && result.resultType != 'played')
                  Text(context.enums.label(EnumGroup.resultTypes, result.resultType), style: context.text.bodySmall),
              ],
            ),
          ),
          StatusChip(
            label: verified ? l10n.matchVerified : l10n.matchPendingVerification,
            color: verified ? AppColors.success : AppColors.warning,
            icon: verified ? Icons.verified_rounded : Icons.hourglass_top_rounded,
          ),
        ],
      ),
    );
  }
}

class _LiveSkeleton extends StatelessWidget {
  const _LiveSkeleton();

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: AppSpacing.page,
      child: Column(
        children: [
          ShimmerBox(width: 220, height: 14),
          Gap.md,
          ShimmerBox(height: 320, borderRadius: AppRadius.xlAll),
          Gap.xl,
          ShimmerBox(height: 56, borderRadius: AppRadius.lgAll),
        ],
      ),
    );
  }
}
