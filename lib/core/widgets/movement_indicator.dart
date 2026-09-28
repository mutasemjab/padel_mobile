import 'package:flutter/material.dart';

import '../../l10n/gen/app_localizations.dart';
import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_tokens.dart';

/// ▲ n / ▼ n / – . Renders nothing when [movement] is null (no snapshot yet)
/// — never a fake "0".
class MovementIndicator extends StatelessWidget {
  final int? movement;
  final bool compact;

  const MovementIndicator({super.key, required this.movement, this.compact = false});

  @override
  Widget build(BuildContext context) {
    final m = movement;
    if (m == null) return const SizedBox.shrink();
    final l10n = AppLocalizations.of(context);
    final (icon, color, label) = switch (m) {
      > 0 => (Icons.arrow_drop_up_rounded, AppColors.success, l10n.movementUp(m)),
      < 0 => (Icons.arrow_drop_down_rounded, AppColors.danger, l10n.movementDown(-m)),
      _ => (Icons.remove_rounded, context.tokens.textMuted, l10n.movementSame),
    };
    return Semantics(
      label: label,
      excludeSemantics: true,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, color: color, size: compact ? AppSizes.iconMd : AppSizes.iconLg),
          if (m != 0)
            Text(
              '${m.abs()}',
              style: AppTypography.number(context, size: compact ? 13 : 15, color: color),
            ),
        ],
      ),
    );
  }
}
