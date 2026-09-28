import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../error/failure.dart';
import '../error/failure_l10n.dart';
import '../routing/app_routes.dart';
import '../theme/app_spacing.dart';
import '../theme/app_tokens.dart';

/// Shows a floating snackbar.
void showAppSnack(BuildContext context, String message, {IconData? icon}) {
  ScaffoldMessenger.of(context)
    ..hideCurrentSnackBar()
    ..showSnackBar(
      SnackBar(
        content: Row(
          children: [
            if (icon != null) ...[Icon(icon, size: AppSizes.iconMd, color: context.tokens.highlight), Gap.md],
            Expanded(child: Text(message)),
          ],
        ),
      ),
    );
}

/// Surfaces an action failure: `PREMIUM_REQUIRED` goes to the paywall,
/// everything else is a snackbar with the localized message.
void showFailure(BuildContext context, Failure failure) {
  if (failure.isPremiumRequired) {
    context.push(AppRoutes.premium);
    return;
  }
  showAppSnack(context, failure.localizedMessage(context), icon: Icons.info_outline_rounded);
}

/// Confirmation dialog; resolves to true only on explicit confirmation.
Future<bool> confirmAction(
  BuildContext context, {
  required String title,
  required String message,
  required String confirmLabel,
  required String cancelLabel,
  bool destructive = false,
}) async {
  final result = await showDialog<bool>(
    context: context,
    builder: (dialogContext) => AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(onPressed: () => Navigator.of(dialogContext).pop(false), child: Text(cancelLabel)),
        FilledButton(
          style: destructive
              ? FilledButton.styleFrom(backgroundColor: Theme.of(dialogContext).colorScheme.error)
              : null,
          onPressed: () => Navigator.of(dialogContext).pop(true),
          child: Text(confirmLabel),
        ),
      ],
    ),
  );
  return result ?? false;
}

/// Staggered entrance for list items (fade + slight rise). A no-op when the
/// OS asks for reduced motion.
extension StaggeredEntrance on Widget {
  Widget staggered(BuildContext context, int index) {
    if (context.reduceMotion) return this;
    final delay = Duration(milliseconds: 40 * (index.clamp(0, 10)));
    return animate()
        .fadeIn(delay: delay, duration: 220.ms, curve: Curves.easeOut)
        .moveY(begin: 12, end: 0, delay: delay, duration: 220.ms, curve: Curves.easeOut);
  }
}

/// Inline spinner sized for buttons.
class ButtonSpinner extends StatelessWidget {
  const ButtonSpinner({super.key});

  @override
  Widget build(BuildContext context) => SizedBox(
    width: 20,
    height: 20,
    child: CircularProgressIndicator(strokeWidth: 2.5, color: DefaultTextStyle.of(context).style.color),
  );
}
