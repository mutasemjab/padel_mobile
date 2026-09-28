import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../l10n/gen/app_localizations.dart';

/// Follow · Respect · Challenge · Request as main partner.
class SocialActionBar extends StatelessWidget {
  final bool isFollowing;
  final bool hasRespected;
  final VoidCallback onFollowToggle;
  final VoidCallback onRespect;
  final VoidCallback onChallenge;
  final VoidCallback? onRequestPartner;

  const SocialActionBar({
    super.key,
    required this.isFollowing,
    required this.onFollowToggle,
    required this.onRespect,
    required this.onChallenge,
    this.hasRespected = false,
    this.onRequestPartner,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Row(
      children: [
        Expanded(
          child: isFollowing
              ? OutlinedButton.icon(
                  onPressed: onFollowToggle,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.white,
                    side: const BorderSide(color: AppColors.textMuted),
                  ),
                  icon: const Icon(Icons.check_rounded),
                  label: Text(l10n.actionFollowing),
                )
              : FilledButton.icon(
                  onPressed: onFollowToggle,
                  icon: const Icon(Icons.person_add_alt_1_rounded),
                  label: Text(l10n.actionFollow),
                ),
        ).animate(key: ValueKey(isFollowing)).fadeIn(duration: 150.ms),
        Gap.sm,
        _RoundAction(
          icon: hasRespected ? Icons.thumb_up_alt_rounded : Icons.thumb_up_alt_outlined,
          tooltip: l10n.tooltipRespect,
          onPressed: hasRespected ? null : onRespect,
          active: hasRespected,
        ),
        Gap.sm,
        _RoundAction(icon: Icons.sports_tennis_rounded, tooltip: l10n.tooltipChallenge, onPressed: onChallenge),
        if (onRequestPartner != null) ...[
          Gap.sm,
          _RoundAction(icon: Icons.handshake_rounded, tooltip: l10n.partnerRequestAsMain, onPressed: onRequestPartner),
        ],
      ],
    );
  }
}

class _RoundAction extends StatelessWidget {
  final IconData icon;
  final String tooltip;
  final VoidCallback? onPressed;
  final bool active;

  const _RoundAction({required this.icon, required this.tooltip, this.onPressed, this.active = false});

  @override
  Widget build(BuildContext context) {
    return IconButton.filled(
      tooltip: tooltip,
      onPressed: onPressed,
      style: IconButton.styleFrom(
        backgroundColor: AppColors.white.withValues(alpha: 0.12),
        foregroundColor: active ? AppColors.accent : AppColors.white,
        disabledBackgroundColor: AppColors.white.withValues(alpha: 0.12),
        disabledForegroundColor: active ? AppColors.accent : AppColors.textMuted,
        minimumSize: const Size(AppSizes.buttonHeight, AppSizes.buttonHeight),
      ),
      icon: Icon(icon),
    );
  }
}
