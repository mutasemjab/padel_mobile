import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/meta/enum_labels.dart';
import '../../../../core/meta/enums_service.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/state/view_state.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_effects.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/badges.dart';
import '../../../../core/widgets/court_lines.dart';
import '../../../../core/widgets/feedback.dart';
import '../../../../core/widgets/level_badge.dart';
import '../../../../core/widgets/player_card.dart';
import '../../../../core/widgets/section_header.dart';
import '../../../../core/widgets/state_builders.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../domain/entities/casual_match.dart';
import '../bloc/casual_cubits.dart';

/// One casual game: details, players, and creator controls for requests.
class CasualMatchDetailPage extends StatelessWidget {
  final int id;

  const CasualMatchDetailPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CasualMatchDetailCubit(sl(), id)..load()),
        BlocProvider(create: (_) => sl<CasualActionCubit>()),
      ],
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.casualDetailTitle)),
        body: BlocListener<CasualActionCubit, ActionState>(
          listener: (context, state) {
            if (state is ActionFailure) showFailure(context, state.failure);
            if (state is ActionSuccess) context.read<CasualMatchDetailCubit>().refresh();
          },
          child: BlocBuilder<CasualMatchDetailCubit, ViewState<CasualMatch>>(
            builder: (context, state) => ViewStateView<CasualMatch>(
              state: state,
              onRetry: () => context.read<CasualMatchDetailCubit>().load(),
              builder: (context, match) => _Content(match: match),
            ),
          ),
        ),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  final CasualMatch match;

  const _Content({required this.match});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final accepted = match.participants.where((p) => p.status == ParticipantStatus.accepted).toList();
    final requests = match.pendingRequests;
    return RefreshIndicator(
      onRefresh: () => context.read<CasualMatchDetailCubit>().refresh(),
      child: ListView(
        padding: AppSpacing.page,
        children: [
          _Header(match: match),
          Gap.md,
          Container(
            padding: AppSpacing.cardDense,
            decoration: BoxDecoration(color: AppColors.clay.withValues(alpha: 0.1), borderRadius: AppRadius.mdAll),
            child: Row(
              children: [
                const Icon(Icons.info_outline_rounded, color: AppColors.clay),
                Gap.md,
                Expanded(child: Text(l10n.casualNote, style: context.text.bodySmall)),
              ],
            ),
          ),
          Gap.xl,
          SectionHeader(title: l10n.casualParticipants, eyebrow: '${match.acceptedCount}/${match.playersNeeded + match.acceptedCount}'),
          Gap.md,
          PlayerCard(
            player: match.creator,
            dense: true,
            onTap: () => context.push(AppRoutes.player(match.creator.playerId)),
            trailing: StatusChip(label: l10n.casualYourGame, color: AppColors.clay),
          ),
          for (final p in accepted)
            if (p.player != null) ...[
              Gap.sm,
              PlayerCard(player: p.player!, dense: true, onTap: () => context.push(AppRoutes.player(p.player!.playerId))),
            ],
          if (match.isCreator) ...[
            Gap.xl,
            SectionHeader(title: l10n.casualRequests),
            Gap.md,
            if (requests.isEmpty) Text(l10n.casualNoRequests, style: context.text.bodySmall),
            for (final r in requests)
              if (r.player != null) ...[
                _RequestRow(match: match, participant: r),
                Gap.sm,
              ],
          ],
          Gap.xxl,
          _Actions(match: match),
        ],
      ),
    );
  }
}

class _Header extends StatelessWidget {
  final CasualMatch match;

  const _Header({required this.match});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final location = [
      if (match.venue != null) match.venue!.displayName,
      if (match.courtName != null) match.courtName!,
    ].join(' · ');
    return Container(
      decoration: const BoxDecoration(gradient: AppGradients.clay, borderRadius: AppRadius.xlAll),
      clipBehavior: Clip.antiAlias,
      child: CourtLinesBackground(
        child: Padding(
          padding: AppSpacing.card,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                context.enums.label(EnumGroup.casualMatchTypes, match.matchType.apiValue).toUpperCase(),
                style: AppTypography.eyebrow(context, color: AppColors.white),
              ),
              Gap.sm,
              Text(DateFormatter.weekdayDay(match.scheduledAt), style: AppTypography.number(context, size: 34, color: AppColors.white)),
              Text(
                '${DateFormatter.time(match.scheduledAt)} · ${DateFormatter.relative(context, match.scheduledAt)}',
                style: context.text.bodyMedium?.copyWith(color: AppColors.white),
              ),
              if (location.isNotEmpty) ...[
                Gap.sm,
                Text(location, style: context.text.bodySmall?.copyWith(color: AppColors.white)),
              ],
              Gap.md,
              Wrap(
                spacing: AppSpacing.sm,
                children: [
                  if (match.requiredLevel != null) LevelBadge(level: match.requiredLevel),
                  if (match.preferredSide != null)
                    StatusChip(label: context.enums.label(EnumGroup.playerSides, match.preferredSide), color: AppColors.white),
                  if (match.spotsLeft != null) StatusChip(label: l10n.casualSpotsLeft(match.spotsLeft!), color: AppColors.white),
                ],
              ),
              if (match.notes != null && match.notes!.isNotEmpty) ...[
                Gap.md,
                Text(match.notes!, style: context.text.bodyMedium?.copyWith(color: AppColors.white)),
              ],
            ],
          ),
        ),
      ),
    );
  }
}

class _RequestRow extends StatelessWidget {
  final CasualMatch match;
  final CasualParticipant participant;

  const _RequestRow({required this.match, required this.participant});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final actions = context.read<CasualActionCubit>();
    return AppCard(
      padding: AppSpacing.cardDense,
      child: Column(
        children: [
          PlayerCard(
            player: participant.player!,
            dense: true,
            onTap: () => context.push(AppRoutes.player(participant.player!.playerId)),
          ),
          Gap.sm,
          Row(
            children: [
              Expanded(
                child: OutlinedButton(
                  onPressed: () => actions.respondTo(match.id, participant.id, accept: false),
                  child: Text(l10n.actionDecline),
                ),
              ),
              Gap.sm,
              Expanded(
                child: FilledButton(
                  onPressed: () => actions.respondTo(match.id, participant.id, accept: true),
                  child: Text(l10n.actionAccept),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Actions extends StatelessWidget {
  final CasualMatch match;

  const _Actions({required this.match});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final actions = context.read<CasualActionCubit>();
    return BlocBuilder<CasualActionCubit, ActionState>(
      builder: (context, state) {
        final busy = state is ActionInProgress;
        if (match.isCreator) {
          if (!match.isOpen) return const SizedBox.shrink();
          return OutlinedButton.icon(
            style: OutlinedButton.styleFrom(foregroundColor: AppColors.danger),
            onPressed: busy
                ? null
                : () async {
                    final ok = await confirmAction(
                      context,
                      title: l10n.casualCancelGame,
                      message: l10n.casualCancelConfirm,
                      confirmLabel: l10n.casualCancelGame,
                      cancelLabel: l10n.actionBack,
                      destructive: true,
                    );
                    if (ok && await actions.cancelMatch(match.id) && context.mounted) {
                      showAppSnack(context, l10n.casualCancelled);
                    }
                  },
            icon: const Icon(Icons.event_busy_rounded),
            label: Text(l10n.casualCancelGame),
          );
        }
        if (match.myParticipation != null && match.myParticipation!.status != ParticipantStatus.declined) {
          return OutlinedButton.icon(
            onPressed: busy
                ? null
                : () async {
                    if (await actions.leaveMatch(match.id) && context.mounted) showAppSnack(context, l10n.casualLeft);
                  },
            icon: const Icon(Icons.logout_rounded),
            label: Text(l10n.casualLeave),
          );
        }
        if (!match.isOpen) return const SizedBox.shrink();
        return FilledButton(
          style: FilledButton.styleFrom(backgroundColor: AppColors.clay, foregroundColor: AppColors.white),
          onPressed: busy
              ? null
              : () async {
                  if (await actions.joinMatch(match.id) && context.mounted) {
                    showAppSnack(context, l10n.joinRequestSent, icon: Icons.check_circle_rounded);
                  }
                },
          child: busy ? const ButtonSpinner() : Text(l10n.actionJoin),
        );
      },
    );
  }
}
