import 'package:flutter/material.dart';

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
              Text(title, style: context.text.titleLarge, maxLines: 1, overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
        ?trailing,
        if (actionLabel != null && onAction != null) TextButton(onPressed: onAction, child: Text(actionLabel!)),
      ],
    );
  }
}
