import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/localization/locale_controller.dart';
import '../../../../core/push/push_notification_service.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/theme/theme_controller.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/feedback.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../../auth/domain/entities/auth_session.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_event.dart';
import '../../../auth/presentation/bloc/auth_state.dart';
import '../../../auth/presentation/pages/edit_profile_page.dart';
import '../../../auth/presentation/widgets/delete_account_dialog.dart';

/// Language, theme, notifications, account shortcuts and logout.
class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final auth = context.watch<AuthBloc>().state;
    final accountType = auth is AuthAuthenticated ? auth.accountType : AccountType.player;

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsTitle)),
      body: ListView(
        padding: AppSpacing.page,
        children: [
          _Section(title: l10n.settingsLanguage),
          ValueListenableBuilder<String>(
            valueListenable: LocaleController.instance.languageCode,
            builder: (context, code, _) => SegmentedButton<String>(
              segments: [
                ButtonSegment(value: 'ar', label: Text(l10n.settingsLanguageArabic)),
                ButtonSegment(value: 'en', label: Text(l10n.settingsLanguageEnglish)),
              ],
              selected: {code},
              onSelectionChanged: (s) => LocaleController.instance.setLanguage(s.first),
            ),
          ),
          _Section(title: l10n.settingsAppearance),
          ValueListenableBuilder<ThemeMode>(
            valueListenable: ThemeController.instance.themeMode,
            builder: (context, mode, _) => SegmentedButton<ThemeMode>(
              segments: [
                ButtonSegment(value: ThemeMode.dark, label: Text(l10n.themeDark), icon: const Icon(Icons.dark_mode_rounded)),
                ButtonSegment(value: ThemeMode.light, label: Text(l10n.themeLight), icon: const Icon(Icons.light_mode_rounded)),
                ButtonSegment(value: ThemeMode.system, label: Text(l10n.themeSystem)),
              ],
              selected: {mode},
              onSelectionChanged: (s) => ThemeController.instance.setThemeMode(s.first),
            ),
          ),
          _Section(title: l10n.settingsNotifications),
          const _PushTile(),
          Gap.sm,
          AppCard(
            padding: EdgeInsets.zero,
            child: _Link(
              icon: Icons.tune_rounded,
              label: l10n.notificationSettingsTitle,
              onTap: () => context.push(AppRoutes.notificationSettings),
            ),
          ),
          _Section(title: l10n.settingsAccount),
          AppCard(
            padding: EdgeInsets.zero,
            child: Column(
              children: [
                if (accountType.hasPlayerProfile) ...[
                  _Link(icon: Icons.edit_rounded, label: l10n.profileEdit, onTap: () => context.push(AppRoutes.editProfile)),
                  _Link(icon: Icons.diamond_rounded, label: l10n.settingsPremium, color: AppColors.premiumGold, onTap: () => context.push(AppRoutes.premium)),
                  _Link(icon: Icons.event_note_rounded, label: l10n.settingsMyTraining, onTap: () => context.push(AppRoutes.myBookings)),
                  _Link(icon: Icons.confirmation_number_rounded, label: l10n.myRegistrationsTitle, onTap: () => context.push(AppRoutes.myRegistrations)),
                  _Link(icon: Icons.receipt_long_rounded, label: l10n.settingsPayments, onTap: () => context.push(AppRoutes.payments)),
                  _Link(icon: Icons.person_search_rounded, label: l10n.searchPlayersTitle, onTap: () => context.push(AppRoutes.playerSearch)),
                  _Link(icon: Icons.stadium_rounded, label: l10n.venuesTitle, onTap: () => context.push(AppRoutes.venues)),
                ],
                if (accountType.isCoach)
                  _Link(icon: Icons.sports_rounded, label: l10n.coachPortalOpen, color: AppColors.info, onTap: () => context.go(AppRoutes.coachPortal)),
                _Link(icon: Icons.lock_reset_rounded, label: l10n.changePasswordTitle, onTap: () => showChangePasswordSheet(context)),
                _Link(icon: Icons.scoreboard_rounded, label: l10n.settingsStaff, onTap: () => context.push(AppRoutes.scorekeeperLogin)),
                _Link(icon: Icons.delete_forever_rounded, label: l10n.deleteAccountTitle, color: AppColors.danger, onTap: () => showDeleteAccountDialog(context)),
              ],
            ),
          ),
          Gap.xl,
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(foregroundColor: AppColors.danger, side: const BorderSide(color: AppColors.danger)),
            onPressed: () async {
              final ok = await confirmAction(
                context,
                title: l10n.settingsLogOut,
                message: l10n.settingsLogOutConfirm,
                confirmLabel: l10n.settingsLogOut,
                cancelLabel: l10n.actionCancel,
                destructive: true,
              );
              if (ok && context.mounted) context.read<AuthBloc>().add(const AuthEvent.logoutRequested());
            },
            icon: const Icon(Icons.logout_rounded),
            label: Text(l10n.settingsLogOut),
          ),
          Gap.sm,
          TextButton.icon(
            style: TextButton.styleFrom(foregroundColor: AppColors.danger),
            onPressed: () => showDeleteAccountDialog(context),
            icon: const Icon(Icons.delete_forever_rounded, size: 20),
            label: Text(l10n.deleteAccountTitle),
          ),
          Gap.lg,
          Center(child: Text(l10n.settingsVersion('1.0.0'), style: context.text.labelSmall)),
        ],
      ),
    );
  }
}

class _Section extends StatelessWidget {
  final String title;

  const _Section({required this.title});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsetsDirectional.only(top: AppSpacing.xl, bottom: AppSpacing.sm),
        child: Text(title.toUpperCase(), style: AppTypography.eyebrow(context)),
      );
}

class _Link extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final Color? color;

  const _Link({required this.icon, required this.label, required this.onTap, this.color});

  @override
  Widget build(BuildContext context) => ListTile(
        leading: Icon(icon, color: color ?? context.tokens.textMuted),
        title: Text(label),
        trailing: const Icon(Icons.chevron_right_rounded),
        onTap: onTap,
      );
}

class _PushTile extends StatefulWidget {
  const _PushTile();

  @override
  State<_PushTile> createState() => _PushTileState();
}

class _PushTileState extends State<_PushTile> {
  final _push = sl<PushNotificationService>();
  late Future<AuthorizationStatus?> _status = _push.permissionStatus();

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return FutureBuilder<AuthorizationStatus?>(
      future: _status,
      builder: (context, snap) {
        final status = snap.data;
        final enabled = status == AuthorizationStatus.authorized || status == AuthorizationStatus.provisional;
        return AppCard(
          child: Row(
            children: [
              Icon(
                enabled ? Icons.notifications_active_rounded : Icons.notifications_off_rounded,
                color: enabled ? context.tokens.highlight : context.tokens.textMuted,
              ),
              Gap.md,
              Expanded(
                child: Text(
                  !_push.isAvailable
                      ? l10n.settingsPushUnavailable
                      : enabled
                          ? l10n.settingsPushEnabled
                          : l10n.settingsPushDisabled,
                ),
              ),
              if (_push.isAvailable && !enabled)
                TextButton(
                  onPressed: () async {
                    await _push.requestPermission();
                    setState(() => _status = _push.permissionStatus());
                  },
                  child: Text(l10n.settingsPushEnable),
                ),
            ],
          ),
        );
      },
    );
  }
}
