import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/models/player_summary.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/state/view_state.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/feedback.dart';
import '../../../../core/widgets/payment_webview.dart';
import '../../../../core/widgets/player_card.dart';
import '../../../../core/widgets/state_views.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_state.dart';
import '../../../players/presentation/widgets/player_picker_sheet.dart';
import '../../domain/entities/category_detail.dart';
import '../../domain/entities/registration.dart';
import '../../domain/entities/tournament.dart';
import '../bloc/competition_cubits.dart';

/// Register flow: pick a partner → live eligibility check → confirm. Full
/// categories land on the waiting list; paid categories show the fee and
/// hand off to payment (which only the backend can confirm).
typedef RegistrationSheetResult = ({Registration registration, bool payNow});

Future<RegistrationSheetResult?> showRegistrationSheet(
  BuildContext context, {
  required Tournament tournament,
  required TournamentCategory category,
}) {
  return showModalBottomSheet<RegistrationSheetResult>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (_) => BlocProvider.value(
      value: context.read<AuthBloc>(),
      child: BlocProvider(
        create: (_) => sl<RegistrationCubit>(),
        child: _RegistrationSheet(tournament: tournament, category: category),
      ),
    ),
  );
}

/// Starts payment for a registration and opens the provider checkout. The
/// status page then polls the backend — the app never marks it paid itself.
Future<void> startRegistrationPayment(BuildContext context, Registration registration) async {
  final l10n = AppLocalizations.of(context);
  final cubit = sl<RegistrationCubit>();
  final payment = await cubit.startPayment(registration.id);
  final action = cubit.state.action;
  await cubit.close();
  if (!context.mounted) return;
  if (payment == null) {
    if (action is ActionFailure) {
      if (action.failure is ProviderUnavailableFailure) {
        showAppSnack(context, l10n.premiumCheckoutSoon, icon: Icons.rocket_launch_rounded);
      } else {
        showFailure(context, action.failure);
      }
    }
    return;
  }
  if (payment.checkoutUrl != null) await openPaymentPage(context, payment.checkoutUrl!);
  if (context.mounted) context.push(AppRoutes.payment(payment.reference));
}

class _RegistrationSheet extends StatefulWidget {
  final Tournament tournament;
  final TournamentCategory category;

  const _RegistrationSheet({required this.tournament, required this.category});

  @override
  State<_RegistrationSheet> createState() => _RegistrationSheetState();
}

class _RegistrationSheetState extends State<_RegistrationSheet> {
  final _notes = TextEditingController();
  final _teamName = TextEditingController();
  String? _paymentMethod;

  bool get _paid => widget.category.registrationFee > 0;
  PlayerSummary? _partner;
  Registration? _result;

  @override
  void initState() {
    super.initState();
    final main = context.read<AuthBloc>().state.currentPlayer?.mainPartner;
    _partner = main?.toSummary();
    _check();
  }

  @override
  void dispose() {
    _notes.dispose();
    _teamName.dispose();
    super.dispose();
  }

  void _check() => context
      .read<RegistrationCubit>()
      .check(widget.tournament.id, widget.category.id, partnerPlayerId: _partner?.playerId);

  Future<void> _pickPartner() async {
    final me = context.read<AuthBloc>().state.currentPlayer?.playerId;
    final picked = await showPlayerPicker(context, excludePlayerId: me);
    if (picked == null || !mounted) return;
    setState(() => _partner = picked);
    _check();
  }

  Future<void> _submit() async {
    final registration = await context.read<RegistrationCubit>().submit(
          widget.tournament.id,
          widget.category.id,
          partnerPlayerId: _partner?.playerId,
          notes: _notes.text.trim(),
          teamName: _teamName.text.trim(),
          paymentMethod: _paid ? _paymentMethod : null,
        );
    if (registration == null || !mounted) return;
    // Online: straight to the MEPS payment page.
    if (registration.needsPayment) {
      Navigator.of(context).pop((registration: registration, payNow: true));
      return;
    }
    setState(() => _result = registration);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return BlocConsumer<RegistrationCubit, RegistrationFlowState>(
      listenWhen: (a, b) => a.action != b.action,
      listener: (context, state) {
        final action = state.action;
        if (action is ActionFailure && action.failure is! ValidationFailure) showFailure(context, action.failure);
      },
      builder: (context, state) {
        final busy = state.action is ActionInProgress;
        return Padding(
          padding: EdgeInsetsDirectional.fromSTEB(
            AppSpacing.xl,
            0,
            AppSpacing.xl,
            MediaQuery.viewInsetsOf(context).bottom + AppSpacing.xl,
          ),
          child: SingleChildScrollView(
            child: _result != null
                ? _Done(registration: _result!)
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(l10n.registerTitle2(widget.category.name), style: context.text.titleLarge),
                      Text(widget.tournament.name, style: context.text.bodySmall),
                      Gap.xl,
                      Text(l10n.registerPartner.toUpperCase(), style: AppTypography.eyebrow(context)),
                      Gap.sm,
                      if (_partner != null)
                        PlayerCard(
                          player: _partner!,
                          dense: true,
                          trailing: TextButton(onPressed: _pickPartner, child: Text(l10n.registerChangePartner)),
                        )
                      else
                        OutlinedButton.icon(
                          onPressed: _pickPartner,
                          icon: const Icon(Icons.person_add_alt_1_rounded),
                          label: Text(l10n.registerPickPartner),
                        ),
                      Gap.lg,
                      _EligibilityView(state: state.eligibility, category: widget.category),
                      Gap.lg,
                      TextField(
                        controller: _teamName,
                        maxLength: 40,
                        textCapitalization: TextCapitalization.words,
                        onChanged: (_) => setState(() {}),
                        decoration: InputDecoration(
                          labelText: l10n.registerTeamName,
                          hintText: l10n.registerTeamNameHint,
                          prefixIcon: const Icon(Icons.groups_rounded),
                        ),
                      ),
                      if (_paid) ...[
                        Gap.sm,
                        Text(l10n.registerPaymentMethod.toUpperCase(), style: AppTypography.eyebrow(context)),
                        Gap.xs,
                        Text(
                          l10n.tournamentEntryFee(Formatters.money(widget.category.registrationFee, widget.category.currency)),
                          style: context.text.bodySmall,
                        ),
                        Gap.sm,
                        _PayOption(
                          icon: Icons.credit_card_rounded,
                          title: l10n.registerPayOnline,
                          subtitle: l10n.registerPayOnlineHint,
                          selected: _paymentMethod == 'online',
                          onTap: () => setState(() => _paymentMethod = 'online'),
                        ),
                        Gap.sm,
                        _PayOption(
                          icon: Icons.payments_rounded,
                          title: l10n.registerPayCash,
                          subtitle: l10n.registerPayCashHint,
                          selected: _paymentMethod == 'cash',
                          onTap: () => setState(() => _paymentMethod = 'cash'),
                        ),
                        Gap.md,
                      ],
                      Gap.sm,
                      TextField(
                        controller: _notes,
                        maxLines: 2,
                        decoration: InputDecoration(labelText: l10n.fieldNotesOptional),
                      ),
                      Gap.xl,
                      FilledButton(
                        onPressed: busy || !_canSubmit(state.eligibility) ? null : _submit,
                        child: busy
                            ? const ButtonSpinner()
                            : Text(_paid && _paymentMethod == 'online' ? l10n.registerSubmitAndPay : l10n.registerSubmit),
                      ),
                    ],
                  ),
          ),
        );
      },
    );
  }

  bool _canSubmit(ViewState<Eligibility> state) =>
      _teamName.text.trim().length >= 2 &&
      (!_paid || _paymentMethod != null) &&
      switch (state) {
        ViewLoaded(:final data) => data.canRegister,
        _ => false,
      };
}

class _EligibilityView extends StatelessWidget {
  final ViewState<Eligibility> state;
  final TournamentCategory category;

  const _EligibilityView({required this.state, required this.category});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return switch (state) {
      ViewInitial() || ViewLoading() => Row(
          children: [
            const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2)),
            Gap.md,
            Text(l10n.registerCheckEligibility, style: context.text.bodySmall),
          ],
        ),
      ViewError(:final failure) => ErrorState(failure: failure, compact: true),
      ViewEmpty() => const SizedBox.shrink(),
      ViewLoaded(:final data) => Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            if (!data.registrationOpen)
              _Notice(icon: Icons.lock_clock_rounded, color: AppColors.warning, text: l10n.registerClosed)
            else if (data.canRegister)
              _Notice(icon: Icons.check_circle_rounded, color: AppColors.success, text: l10n.registerEligible),
            if (data.playerIssues.isNotEmpty) ...[
              Gap.sm,
              _Issues(title: l10n.registerYourIssues, issues: data.playerIssues),
            ],
            if (data.partnerIssues?.isNotEmpty ?? false) ...[
              Gap.sm,
              _Issues(title: l10n.registerPartnerIssues, issues: data.partnerIssues!),
            ],
            if (data.isFull) ...[
              Gap.sm,
              _Notice(icon: Icons.hourglass_top_rounded, color: AppColors.info, text: l10n.registerFullWaitlist),
            ],
            if (data.requiresPayment && data.registrationFee > 0) ...[
              Gap.sm,
              _Notice(
                icon: Icons.payments_rounded,
                color: context.tokens.highlight,
                text: l10n.registerFeeNote(Formatters.money(data.registrationFee, category.currency)),
              ),
            ],
          ],
        ),
    };
  }
}

class _Notice extends StatelessWidget {
  final IconData icon;
  final Color color;
  final String text;

  const _Notice({required this.icon, required this.color, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppSpacing.cardDense,
      decoration: BoxDecoration(color: color.withValues(alpha: 0.12), borderRadius: AppRadius.mdAll),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: color, size: AppSizes.iconMd),
          Gap.md,
          Expanded(child: Text(text, style: context.text.bodySmall?.copyWith(color: context.tokens.textPrimary))),
        ],
      ),
    );
  }
}

class _Issues extends StatelessWidget {
  final String title;
  final List<String> issues;

  const _Issues({required this.title, required this.issues});

  @override
  Widget build(BuildContext context) {
    return AppCard(
      borderColor: AppColors.danger.withValues(alpha: 0.5),
      padding: AppSpacing.cardDense,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title.toUpperCase(), style: AppTypography.eyebrow(context, color: AppColors.danger)),
          Gap.xs,
          for (final issue in issues)
            Padding(
              padding: const EdgeInsetsDirectional.only(top: AppSpacing.xxs),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Icon(Icons.close_rounded, size: AppSizes.iconSm, color: AppColors.danger),
                  Gap.xs,
                  Expanded(child: Text(issue, style: context.text.bodySmall)),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

/// One payment choice (online card / cash at the venue).
class _PayOption extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;
  final bool selected;
  final VoidCallback onTap;

  const _PayOption({required this.icon, required this.title, required this.subtitle, required this.selected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    final t = context.tokens;
    final color = selected ? t.highlight : t.textMuted;
    return Material(
      color: selected ? t.highlight.withValues(alpha: 0.10) : Colors.transparent,
      borderRadius: AppRadius.mdAll,
      child: InkWell(
        borderRadius: AppRadius.mdAll,
        onTap: onTap,
        child: Container(
          padding: AppSpacing.cardDense,
          decoration: BoxDecoration(
            borderRadius: AppRadius.mdAll,
            border: Border.all(color: selected ? t.highlight : t.outline, width: selected ? 2 : 1),
          ),
          child: Row(
            children: [
              Icon(icon, color: color),
              Gap.md,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: context.text.titleSmall),
                    Text(subtitle, style: context.text.bodySmall),
                  ],
                ),
              ),
              Icon(selected ? Icons.radio_button_checked_rounded : Icons.radio_button_off_rounded, color: color),
            ],
          ),
        ),
      ),
    );
  }
}

class _Done extends StatelessWidget {
  final Registration registration;

  const _Done({required this.registration});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final waitlisted = registration.status == RegistrationStatus.waitlisted;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Icon(
          waitlisted ? Icons.hourglass_top_rounded : Icons.check_circle_rounded,
          size: 64,
          color: waitlisted ? AppColors.info : AppColors.success,
        ),
        Gap.md,
        Text(
          waitlisted ? l10n.registerWaitlisted : l10n.registerDone,
          style: context.text.titleLarge,
          textAlign: TextAlign.center,
        ),
        if (waitlisted) ...[
          Gap.sm,
          Text(l10n.registerFullWaitlist, style: context.text.bodySmall, textAlign: TextAlign.center),
        ],
        if (registration.cashDue) ...[
          Gap.sm,
          Text(
            l10n.registrationCashDue(Formatters.money(registration.category.registrationFee)),
            style: context.text.bodySmall,
            textAlign: TextAlign.center,
          ),
        ],
        Gap.xl,
        if (registration.needsPayment) ...[
          FilledButton.icon(
            onPressed: () => Navigator.of(context).pop((registration: registration, payNow: true)),
            icon: const Icon(Icons.payments_rounded),
            label: Text(l10n.registrationPay),
          ),
          Gap.sm,
        ],
        OutlinedButton(
          onPressed: () => Navigator.of(context).pop((registration: registration, payNow: false)),
          child: Text(l10n.actionClose),
        ),
      ],
    );
  }
}
