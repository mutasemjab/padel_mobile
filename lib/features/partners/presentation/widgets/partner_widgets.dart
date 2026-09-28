import 'package:flutter/material.dart';

import '../../../../core/models/section_state.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/level_badge.dart';
import '../../../../core/widgets/player_avatar.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../domain/entities/partner.dart';

/// Why a partner was suggested — factual chips only.
class ReasonChips extends StatelessWidget {
  final List<RecommendationReason> reasons;

  const ReasonChips({super.key, required this.reasons});

  static (String, IconData)? describe(AppLocalizations l10n, RecommendationReason reason) => switch (reason) {
    RecommendationReason.complementarySide => (l10n.reasonComplementarySide, Icons.swap_horiz_rounded),
    RecommendationReason.similarSkillRating => (l10n.reasonSimilarRating, Icons.balance_rounded),
    RecommendationReason.previousPartnership => (l10n.reasonPreviousPartnership, Icons.handshake_rounded),
    RecommendationReason.activeRecently => (l10n.reasonActiveRecently, Icons.bolt_rounded),
    RecommendationReason.sameCountry => (l10n.reasonSameCountry, Icons.flag_rounded),
    RecommendationReason.unknown => null,
  };

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final t = context.tokens;
    final items = reasons.map((r) => describe(l10n, r)).whereType<(String, IconData)>().toList();
    if (items.isEmpty) return const SizedBox.shrink();
    return Wrap(
      spacing: AppSpacing.xs,
      runSpacing: AppSpacing.xs,
      children: [
        for (final (label, icon) in items)
          Container(
            padding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.xxs + 1),
            decoration: BoxDecoration(
              color: t.surface2,
              borderRadius: AppRadius.pillAll,
              border: Border.all(color: t.outline),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, size: AppSizes.iconXs, color: t.highlight),
                Gap.xs,
                Text(label, style: context.text.labelMedium),
              ],
            ),
          ),
      ],
    );
  }
}

enum PartnerSlotKind { main, bestHistorical, mostPlayed }

/// One of the Main / Best historical / Most played cards, rendering its
/// explicit state (ok / not set / insufficient data) — never invented stats.
class PartnerSlotCard extends StatelessWidget {
  final PartnerSlotKind kind;
  final PartnerSlot slot;
  final void Function(String playerId)? onOpenPlayer;
  final Widget? action;

  const PartnerSlotCard({super.key, required this.kind, required this.slot, this.onOpenPlayer, this.action});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final t = context.tokens;
    final (title, icon, color) = switch (kind) {
      PartnerSlotKind.main => (l10n.partnerMain, Icons.favorite_rounded, t.highlight),
      PartnerSlotKind.bestHistorical => (
        l10n.partnerBestHistorical,
        Icons.military_tech_rounded,
        AppColors.premiumGold,
      ),
      PartnerSlotKind.mostPlayed => (l10n.partnerMostPlayed, Icons.repeat_rounded, AppColors.info),
    };
    final record = slot.record;

    return AppCard(
      onTap: record == null || onOpenPlayer == null ? null : () => onOpenPlayer!(record.partner.playerId),
      borderColor: slot.state.isOk && kind == PartnerSlotKind.main ? t.highlight.withValues(alpha: 0.6) : null,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, size: AppSizes.iconSm, color: color),
              Gap.xs,
              Expanded(
                child: Text(title.toUpperCase(), style: AppTypography.eyebrow(context, color: color)),
              ),
            ],
          ),
          Gap.md,
          if (slot.state.isOk && record != null)
            _PartnerRecordRow(record: record, showRecord: kind != PartnerSlotKind.main)
          else
            _SlotMessage(
              message: switch (slot.state) {
                SectionState.notSet => l10n.partnerNotSetHint,
                SectionState.insufficientData => l10n.partnerUnlockHint(slot.minMatchesRequired ?? 3),
                _ => l10n.partnerNoHistory,
              },
              title: slot.state == SectionState.notSet ? l10n.partnerNotSet : null,
            ),
          if (action != null) ...[Gap.md, action!],
        ],
      ),
    );
  }
}

class _PartnerRecordRow extends StatelessWidget {
  final PartnerRecord record;
  final bool showRecord;

  const _PartnerRecordRow({required this.record, required this.showRecord});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final winRate = Formatters.percent(record.winRate);
    return Row(
      children: [
        PlayerAvatar.fromSummary(record.partner, size: AppSizes.avatarMd),
        Gap.md,
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(record.partner.name, style: context.text.titleSmall, maxLines: 1, overflow: TextOverflow.ellipsis),
              Gap.xxs,
              if (showRecord)
                Text(l10n.partnerRecord(record.matchesWon, record.matchesPlayed), style: context.text.bodySmall)
              else
                LevelBadge(level: record.partner.level),
            ],
          ),
        ),
        if (showRecord)
          Text(
            winRate ?? l10n.valueDash,
            style: AppTypography.number(context, size: 24, color: context.tokens.highlight),
          ),
      ],
    );
  }
}

class _SlotMessage extends StatelessWidget {
  final String? title;
  final String message;

  const _SlotMessage({required this.message, this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (title != null) ...[Text(title!, style: context.text.titleSmall), Gap.xxs],
        Text(message, style: context.text.bodySmall),
      ],
    );
  }
}
