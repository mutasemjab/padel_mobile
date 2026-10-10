import 'package:flutter/material.dart';

import '../theme/app_colors.dart';
import '../theme/app_spacing.dart';
import '../theme/app_text_styles.dart';
import '../theme/app_tokens.dart';

/// Eyebrow + title + optional trailing action ("See all").
class SectionHeader extends StatelessWidget {
  final String? eyebrow;
  final String title;
  final String? actionLabel;
  final VoidCallback? onAction;
  final Widget? trailing;
  final Color? eyebrowColor;

  const SectionHeader({
    super.key,
    this.eyebrow,
    required this.title,
    this.actionLabel,
    this.onAction,
    this.trailing,
    this.eyebrowColor,
  });

  @override
  Widget build(BuildContext context) {
    final dark = context.tokens.isDark;
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              if (eyebrow != null) ...[
                Text(eyebrow!.toUpperCase(), style: AppTypography.eyebrow(context, color: eyebrowColor)),
                Gap.xxs,
              ],
              Text(
                title,
                style: context.text.headlineMedium?.copyWith(fontSize: 24, height: 1.25),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        ?trailing,
        if (actionLabel != null && onAction != null)
          TextButton(
            onPressed: onAction,
            style: TextButton.styleFrom(
              foregroundColor: dark ? AppColors.goldSoft : AppColors.green800,
              padding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.sm),
              visualDensity: VisualDensity.compact,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(actionLabel!, style: context.text.labelMedium?.copyWith(color: dark ? AppColors.goldSoft : AppColors.green800)),
                const SizedBox(width: 4),
                const Icon(Icons.arrow_forward_rounded, size: 14),
              ],
            ),
          ),
      ],
    );
  }
}
