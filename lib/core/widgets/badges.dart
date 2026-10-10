import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../l10n/gen/app_localizations.dart';
import '../theme/app_colors.dart';
import '../theme/app_effects.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_tokens.dart';

/// Generic colored pill for statuses (booking, registration, verification…).
class StatusChip extends StatelessWidget {
  final String label;
  final Color color;
  final IconData? icon;
  final bool filled;

  const StatusChip({super.key, required this.label, required this.color, this.icon, this.filled = false});

  @override
  Widget build(BuildContext context) {
    final fg = filled ? (color.computeLuminance() > 0.45 ? AppColors.onAccent : AppColors.white) : color;
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.sm + 2, vertical: AppSpacing.xxs + 1),
      decoration: BoxDecoration(
        color: filled ? color : color.withValues(alpha: 0.12),
        borderRadius: AppRadius.pillAll,
        border: filled ? null : Border.all(color: color.withValues(alpha: 0.38)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) ...[Icon(icon, size: AppSizes.iconXs, color: fg), Gap.xs],
          Text(
            label,
            style: context.text.labelMedium?.copyWith(color: fg, fontWeight: FontWeight.w600, fontSize: 11.5, letterSpacing: 0),
          ),
        ],
      ),
    );
  }
}

/// Always visible on tournament cards and headers.
/// ranked = volt "VERIFIED · RANKED" + shield · certified = green outline
/// "OFFICIAL" · social = clay "SOCIAL".
class CompetitionBadge extends StatelessWidget {
  /// `ranked | certified | social`.
  final String competitionType;
  final bool large;

  const CompetitionBadge({super.key, required this.competitionType, this.large = false});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final t = context.tokens;
    // ranked = the gold seal; certified = gold-outlined glass; social = clay glass.
    final (label, color, icon, filled) = switch (competitionType) {
      'ranked' => (l10n.competitionRanked, AppColors.gold, Icons.verified_rounded, true),
      'certified' => (l10n.competitionCertified, AppColors.goldSoft, Icons.workspace_premium_outlined, false),
      _ => (l10n.competitionSocial, AppColors.clay, Icons.groups_rounded, false),
    };
    final fg = filled ? AppColors.green900 : (t.isDark ? color : Color.lerp(color, AppColors.green900, .45)!);
    return Container(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: large ? AppSpacing.md : AppSpacing.sm,
        vertical: large ? AppSpacing.xs + 1 : AppSpacing.xxs + 1,
      ),
      decoration: BoxDecoration(
        gradient: filled ? AppGradients.goldButton : null,
        color: filled ? null : (t.isDark ? const Color(0x8C06261F) : color.withValues(alpha: .1)),
        borderRadius: BorderRadius.circular(8),
        border: filled ? null : Border.all(color: color.withValues(alpha: .45)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: large ? AppSizes.iconSm : AppSizes.iconXs, color: fg),
          Gap.xs,
          Text(
            label,
            style: AppTypography.eyebrow(context, color: fg).copyWith(fontSize: large ? 12 : 11, fontWeight: FontWeight.w700),
          ),
        ],
      ),
    );
  }
}

/// Distinct gold visual language for Premium — a subscription marker, never
/// a ranking cue.
class PremiumBadge extends StatelessWidget {
  final bool compact;

  const PremiumBadge({super.key, this.compact = false});

  @override
  Widget build(BuildContext context) {
    if (compact) {
      return const Icon(Icons.diamond_rounded, size: AppSizes.iconXs, color: AppColors.premiumGold);
    }
    return Container(
      padding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.xxs + 1),
      decoration: const BoxDecoration(gradient: AppGradients.premium, borderRadius: AppRadius.pillAll),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Icon(Icons.diamond_rounded, size: AppSizes.iconXs, color: AppColors.onPremium),
          Gap.xs,
          Text(
            AppLocalizations.of(context).premiumLabel,
            style: context.text.labelMedium?.copyWith(color: AppColors.onPremium, fontWeight: FontWeight.w800),
          ),
        ],
      ),
    );
  }
}

/// Pulsing red dot. Signals "this updates itself" — no pull-to-refresh needed.
class LivePulseDot extends StatelessWidget {
  final double size;

  const LivePulseDot({super.key, this.size = AppSizes.dot});

  @override
  Widget build(BuildContext context) {
    final dot = Container(
      width: size,
      height: size,
      decoration: const BoxDecoration(color: AppColors.live, shape: BoxShape.circle),
    );
    if (context.reduceMotion) return dot;
    return dot
        .animate(onPlay: (c) => c.repeat(reverse: true))
        .fadeIn(duration: 700.ms, begin: 0.35)
        .scaleXY(begin: 0.85, end: 1.1, duration: 700.ms);
  }
}

/// "● LIVE" pill.
class LiveIndicator extends StatelessWidget {
  final bool large;

  const LiveIndicator({super.key, this.large = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsetsDirectional.symmetric(
        horizontal: large ? AppSpacing.md : AppSpacing.sm,
        vertical: large ? AppSpacing.xs : AppSpacing.xxs,
      ),
      decoration: BoxDecoration(
        color: AppColors.live.withValues(alpha: 0.14),
        borderRadius: AppRadius.pillAll,
        border: Border.all(color: AppColors.live.withValues(alpha: 0.5)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          LivePulseDot(size: large ? AppSizes.dot + 2 : AppSizes.dot - 1),
          Gap.xs,
          Text(
            AppLocalizations.of(context).liveBadge,
            style: AppTypography.eyebrow(context, color: AppColors.live).copyWith(fontSize: large ? 13 : 11),
          ),
        ],
      ),
    );
  }
}
