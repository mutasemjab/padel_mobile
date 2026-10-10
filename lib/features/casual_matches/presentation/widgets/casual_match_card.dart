import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/meta/enums_service.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/badges.dart';
import '../../../../core/widgets/feedback.dart';
import '../../../../core/widgets/level_badge.dart';
import '../../../../core/widgets/player_avatar.dart';
import '../../../../core/widgets/pm_art.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../domain/entities/casual_match.dart';
import '../bloc/join_casual_match_cubit.dart';

/// A casual-match post. Wraps a per-row [JoinCasualMatchCubit] so joining
/// one match never disables the rest of the list. Clay accents mark it as
/// social play — never official.
class CasualMatchCard extends StatelessWidget {
  final CasualMatch match;
  final VoidCallback? onTap;
  final VoidCallback? onJoined;

  const CasualMatchCard({super.key, required this.match, this.onTap, this.onJoined});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      key: ValueKey('join-${match.id}'),
      create: (_) => sl<JoinCasualMatchCubit>(),
      child: _CasualMatchCardContent(match: match, onTap: onTap, onJoined: onJoined),
    );
  }
}

class _CasualMatchCardContent extends StatelessWidget {
  final CasualMatch match;
  final VoidCallback? onTap;
  final VoidCallback? onJoined;

  const _CasualMatchCardContent({required this.match, this.onTap, this.onJoined});

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final l10n = AppLocalizations.of(context);
    final enums = sl<EnumsService>();
    final location = [
      if (match.venue != null) match.venue!.displayName,
      if (match.courtName != null && match.courtName!.isNotEmpty) match.courtName!,
    ].join(' · ');

    return PmDashedBorder(
      child: AppCard(
      onTap: onTap,
      padding: const EdgeInsetsDirectional.fromSTEB(16, 14, 16, 14),
      borderColor: AppColors.transparent,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              PmChip(
                enums.label(EnumGroup.casualMatchTypes, match.matchType.apiValue),
                tone: PmChipTone.muted,
                icon: Icons.groups_rounded,
              ),
              const Spacer(),
              Icon(Icons.schedule_rounded, size: AppSizes.iconXs, color: t.textMuted),
              Gap.xxs,
              Text(DateFormatter.relative(context, match.scheduledAt), style: context.text.labelMedium),
            ],
          ),
          Gap.md,
          if (match.title != null) ...[
            Text(match.title!, style: context.text.headlineMedium?.copyWith(fontSize: 21), maxLines: 1, overflow: TextOverflow.ellipsis),
            Gap.xxs,
          ],
          Text(
            DateFormatter.weekdayDay(match.scheduledAt),
            style: context.text.headlineMedium?.copyWith(fontSize: match.title == null ? 23 : 17, height: 1.3),
          ),
          Text(DateFormatter.time(match.scheduledAt), style: context.text.bodySmall),
          if (location.isNotEmpty) ...[
            Gap.sm,
            Row(
              children: [
                Icon(Icons.place_rounded, size: AppSizes.iconXs, color: t.textMuted),
                Gap.xxs,
                Expanded(child: Text(location, style: context.text.bodySmall, maxLines: 1, overflow: TextOverflow.ellipsis)),
              ],
            ),
          ],
          Gap.md,
          Row(
            children: [
              PlayerAvatar.fromSummary(match.creator, size: AppSizes.avatarXs),
              Gap.sm,
              Expanded(
                child: Text(
                  l10n.byCreator(match.creator.name),
                  style: context.text.bodySmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              if (match.requiredLevel != null) ...[LevelBadge(level: match.requiredLevel), Gap.xs],
              if (match.preferredSide != null)
                Text(enums.label(EnumGroup.playerSides, match.preferredSide), style: context.text.labelSmall),
            ],
          ),
          if (match.notes != null && match.notes!.isNotEmpty) ...[
            Gap.sm,
            Text(match.notes!, style: context.text.bodySmall, maxLines: 2, overflow: TextOverflow.ellipsis),
          ],
          Gap.md,
          Row(
            children: [
              if (match.spotsLeft != null)
                match.spotsLeft == 0
                    ? Text(l10n.casualSpotsLeft(0), style: context.text.labelMedium?.copyWith(color: t.textMuted))
                    : PmChip(l10n.casualSpotsLeft(match.spotsLeft!), tone: PmChipTone.ball),
              const Spacer(),
              _ParticipationAction(match: match, onJoined: onJoined),
            ],
          ),
        ],
      ),
    ),
    );
  }
}

class _ParticipationAction extends StatelessWidget {
  final CasualMatch match;
  final VoidCallback? onJoined;

  const _ParticipationAction({required this.match, this.onJoined});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final t = context.tokens;
    if (match.isCreator) return PmChip(l10n.casualYourGame, tone: PmChipTone.gold, icon: Icons.star_rounded);
    final participation = match.myParticipation;
    if (participation != null) {
      return switch (participation.status) {
        ParticipantStatus.accepted => StatusChip(label: l10n.casualYouAreIn, color: AppColors.success, icon: Icons.check_rounded),
        ParticipantStatus.requested => StatusChip(label: l10n.casualRequestPending, color: AppColors.warning),
        ParticipantStatus.declined => StatusChip(label: l10n.actionDecline, color: context.tokens.textMuted),
        ParticipantStatus.invited => StatusChip(label: l10n.casualInvitedStatus, color: AppColors.info, icon: Icons.mail_rounded),
      };
    }
    if (!match.isOpen) return StatusChip(label: l10n.statusClosed, color: context.tokens.textMuted);

    return BlocConsumer<JoinCasualMatchCubit, JoinCasualMatchState>(
      listener: (context, state) {
        if (state is JoinCasualMatchJoined) {
          showAppSnack(context, l10n.joinRequestSent, icon: Icons.check_circle_rounded);
          onJoined?.call();
        } else if (state is JoinCasualMatchFailed) {
          showFailure(context, state.failure);
        }
      },
      builder: (context, state) {
        final joining = state is JoinCasualMatchJoining;
        final joined = state is JoinCasualMatchJoined;
        // `.btn.ghost` — social play asks, it doesn't compete for the gold CTA.
        return OutlinedButton(
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(104, 42),
            foregroundColor: t.isDark ? AppColors.goldSoft : AppColors.green800,
            side: BorderSide(color: (t.isDark ? AppColors.goldSoft : AppColors.green700).withValues(alpha: .5)),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
          ),
          onPressed: joining || joined ? null : () => context.read<JoinCasualMatchCubit>().join(match.id),
          child: joining ? const ButtonSpinner() : Text(joined ? l10n.actionRequested : l10n.actionJoin),
        );
      },
    );
  }
}
