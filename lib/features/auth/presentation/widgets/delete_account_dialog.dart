import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/widgets/feedback.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../domain/usecases/delete_account_usecase.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';

/// Shows a confirmation dialog to delete the user's account (`DELETE auth/me`).
/// On confirmation, displays a progress indicator, calls the endpoint,
/// clears the local session, and forces routing back to the login screen.
Future<void> showDeleteAccountDialog(BuildContext context) async {
  final l10n = AppLocalizations.of(context);
  final confirmed = await confirmAction(
    context,
    title: l10n.deleteAccountTitle,
    message: l10n.deleteAccountConfirm,
    confirmLabel: l10n.deleteAccountTitle,
    cancelLabel: l10n.actionCancel,
    destructive: true,
  );

  if (!confirmed || !context.mounted) return;

  // Show a blocking progress dialog while calling the delete endpoint
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (dialogCtx) => PopScope(
      canPop: false,
      child: Center(
        child: Material(
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSpacing.xl,
              vertical: AppSpacing.lg,
            ),
            decoration: BoxDecoration(
              color: Theme.of(dialogCtx).colorScheme.surface,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(
                  width: 24,
                  height: 24,
                  child: CircularProgressIndicator(strokeWidth: 2.5),
                ),
                Gap.lg,
                Text(
                  l10n.deleteAccountLoading,
                  style: Theme.of(dialogCtx).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
        ),
      ),
    ),
  );

  final deleteAccount = sl<DeleteAccountUseCase>();
  final result = await deleteAccount();

  if (!context.mounted) return;

  // Dismiss the progress dialog
  Navigator.of(context, rootNavigator: true).pop();

  result.match(
    (failure) => showFailure(context, failure),
    (_) {
      showAppSnack(
        context,
        l10n.deleteAccountSuccess,
        icon: Icons.check_circle_outline_rounded,
      );
      // Notify AuthBloc to switch state to unauthenticated, which triggers
      // GoRouter redirect back to LoginPage.
      context.read<AuthBloc>().add(const AuthEvent.forceLogoutTriggered());
    },
  );
}
