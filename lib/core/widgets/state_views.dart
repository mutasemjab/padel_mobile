import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../l10n/gen/app_localizations.dart';
import '../error/failure.dart';
import '../error/failure_l10n.dart';
import '../routing/app_routes.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_tokens.dart';
import 'empty_state.dart';
import 'progress_ring.dart';

/// Renders any [Failure] as the right state: offline (retry), Premium
/// required (paywall CTA), provider not configured (coming soon), or a
/// generic error with retry. The single place a Failure becomes UI.
class ErrorState extends StatelessWidget {
  final Failure failure;
  final VoidCallback? onRetry;
  final bool compact;

  const ErrorState({super.key, required this.failure, this.onRetry, this.compact = false});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final f = failure;
    if (f.isPremiumRequired) return PremiumRequiredState(compact: compact);
    if (f is ProviderUnavailableFailure) {
      return ComingSoonState(message: f.localizedMessage(context), compact: compact);
    }
    if (f is NetworkFailure) {
      return EmptyState(
        icon: Icons.wifi_off_rounded,
        title: l10n.stateOfflineTitle,
        message: l10n.stateOfflineMessage,
        ctaLabel: onRetry == null ? null : l10n.actionRetry,
        onCta: onRetry,
        accent: context.tokens.textMuted,
        compact: compact,
      );
    }
    return EmptyState(
      icon: switch (f) {
        UnauthorizedFailure() || ForbiddenFailure() => Icons.lock_outline_rounded,
        NotFoundFailure() => Icons.search_off_rounded,
        ServerFailure() => Icons.dns_outlined,
        _ => Icons.error_outline_rounded,
      },
      title: l10n.stateErrorTitle,
      message: f.localizedMessage(context),
      ctaLabel: onRetry == null ? null : l10n.actionRetry,
      onCta: onRetry,
      accent: AppColors.danger,
      compact: compact,
    );
  }
}

/// Backwards-compatible name used by the original screens.
class ErrorView extends ErrorState {
  const ErrorView({super.key, required super.failure, super.onRetry});
}

/// Explains what's missing instead of inventing numbers, e.g.
/// "Play 3 verified matches to unlock insights: 1/3".
class InsufficientDataState extends StatelessWidget {
  final String message;
  final int? current;
  final int? target;
  final bool compact;
  final IconData icon;

  const InsufficientDataState({
    super.key,
    required this.message,
    this.current,
    this.target,
    this.compact = true,
    this.icon = Icons.query_stats_rounded,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final hasProgress = current != null && target != null && target! > 0;
    return EmptyState(
      icon: icon,
      title: l10n.stateInsufficientDataTitle,
      message: message,
      accent: AppColors.info,
      compact: compact,
      footer: hasProgress
          ? ProgressRing(
              value: current! / target!,
              size: 52,
              color: AppColors.info,
              child: Text(l10n.progressOf(current!, target!), style: context.text.labelMedium),
            )
          : null,
    );
  }
}

/// Friendly state for 503 provider codes — never looks like a crash.
class ComingSoonState extends StatelessWidget {
  final String? message;
  final bool compact;

  const ComingSoonState({super.key, this.message, this.compact = false});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return EmptyState(
      icon: Icons.rocket_launch_outlined,
      title: l10n.stateComingSoonTitle,
      message: message ?? l10n.failureProviderUnavailable,
      accent: AppColors.info,
      compact: compact,
    );
  }
}

/// `PREMIUM_REQUIRED` → a teaser with a path to the paywall. Always states
/// that Premium never affects competitive standing.
class PremiumRequiredState extends StatelessWidget {
  final bool compact;
  final String? message;

  const PremiumRequiredState({super.key, this.compact = false, this.message});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return EmptyState(
      icon: Icons.diamond_rounded,
      title: l10n.statePremiumTitle,
      message: message ?? l10n.statePremiumMessage,
      ctaLabel: l10n.actionGoPremium,
      onCta: () => context.push(AppRoutes.premium),
      accent: AppColors.premiumGold,
      compact: compact,
    );
  }
}

/// Thin banner shown above content that is stale because we're offline.
class OfflineBanner extends StatelessWidget {
  final VoidCallback? onRetry;

  const OfflineBanner({super.key, this.onRetry});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final t = context.tokens;
    return Material(
      color: t.surface2,
      child: Padding(
        padding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.lg, vertical: AppSpacing.sm),
        child: Row(
          children: [
            Icon(Icons.wifi_off_rounded, size: AppSizes.iconSm, color: t.textMuted),
            Gap.sm,
            Expanded(child: Text(l10n.stateOfflineBanner, style: context.text.bodySmall)),
            if (onRetry != null) TextButton(onPressed: onRetry, child: Text(l10n.actionRetry)),
          ],
        ),
      ),
    );
  }
}
