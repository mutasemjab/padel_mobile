import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/state/view_state.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/utils/formatters.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../../core/widgets/feedback.dart';
import '../../../../core/widgets/player_avatar.dart';
import '../../../../core/widgets/state_builders.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../../players/presentation/widgets/player_picker_sheet.dart';
import '../../domain/entities/registration.dart';
import '../bloc/competition_cubits.dart';
import '../widgets/registration_sheet.dart';
import '../widgets/registration_widgets.dart';

/// All my tournament registrations with cancel / change partner / pay.
class MyRegistrationsPage extends StatelessWidget {
  const MyRegistrationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => sl<MyRegistrationsCubit>()..load()),
        BlocProvider(create: (_) => sl<RegistrationCubit>()),
      ],
      child: Scaffold(
        appBar: AppBar(title: Text(l10n.myRegistrationsTitle)),
        body: BlocBuilder<MyRegistrationsCubit, PagedState<Registration>>(
          builder: (context, state) {
            final cubit = context.read<MyRegistrationsCubit>();
            return PagedStateView<Registration>(
              state: state,
              onLoadMore: cubit.loadMore,
              onRefresh: cubit.refresh,
              onRetry: cubit.load,
              empty: EmptyState(
                icon: Icons.confirmation_number_outlined,
                title: l10n.myRegistrationsEmpty,
                message: l10n.homeEmptyMessage,
                ctaLabel: l10n.homeFindTournament,
                onCta: () => context.go(AppRoutes.compete),
              ),
              itemBuilder: (context, r, _) => _RegistrationCard(registration: r),
            );
          },
        ),
      ),
    );
  }
}

class _RegistrationCard extends StatelessWidget {
  final Registration registration;

  const _RegistrationCard({required this.registration});

  Future<void> _cancel(BuildContext context) async {
    final l10n = AppLocalizations.of(context);
    final ok = await confirmAction(
      context,
      title: l10n.registrationCancel,
      message: l10n.registrationCancelConfirm,
      confirmLabel: l10n.registrationCancel,
      cancelLabel: l10n.actionBack,
      destructive: true,
    );
    if (!ok || !context.mounted) return;
    final flow = context.read<RegistrationCubit>();
    if (await flow.cancel(registration.id)) {
      if (!context.mounted) return;
      showAppSnack(context, l10n.registrationCancelled);
      context.read<MyRegistrationsCubit>().refresh();
    } else if (context.mounted && flow.state.action is ActionFailure) {
      showFailure(context, (flow.state.action as ActionFailure).failure);
    }
  }

  Future<void> _changePartner(BuildContext context) async {
    final l10n = AppLocalizations.of(context);
    final picked = await showPlayerPicker(context, excludePlayerId: registration.player?.playerId);
    if (picked == null || !context.mounted) return;
    final flow = context.read<RegistrationCubit>();
    if (await flow.updatePartner(registration.id, picked.playerId)) {
      if (!context.mounted) return;
      showAppSnack(context, l10n.registrationPartnerChanged);
      context.read<MyRegistrationsCubit>().refresh();
    } else if (context.mounted && flow.state.action is ActionFailure) {
      showFailure(context, (flow.state.action as ActionFailure).failure);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final r = registration;
    return AppCard(
      onTap: () => context.push(AppRoutes.tournament(r.category.tournamentId)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(r.category.tournamentName, style: context.text.titleMedium),
                    Text(
                      [
                        r.category.name,
                        if (r.category.tournamentStartDate != null) DateFormatter.fullDate(r.category.tournamentStartDate!),
                        if (r.category.registrationFee > 0) Formatters.money(r.category.registrationFee),
                      ].join(' · '),
                      style: context.text.bodySmall,
                    ),
                  ],
                ),
              ),
              RegistrationStatusChip(status: r.status),
            ],
          ),
          if (r.partner != null) ...[
            Gap.md,
            Row(
              children: [
                PlayerAvatar.fromSummary(r.partner!, size: AppSizes.avatarXs),
                Gap.sm,
                Expanded(child: Text(l10n.resultWithPartner(r.partner!.name), style: context.text.bodyMedium)),
              ],
            ),
          ],
          if (r.reviewNote != null && r.reviewNote!.isNotEmpty &&
              (r.status == RegistrationStatus.changesRequested || r.status == RegistrationStatus.rejected)) ...[
            Gap.md,
            Container(
              width: double.infinity,
              padding: AppSpacing.cardDense,
              decoration: BoxDecoration(
                color: (r.status == RegistrationStatus.rejected ? AppColors.danger : AppColors.warning).withValues(alpha: 0.12),
                borderRadius: AppRadius.mdAll,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.registrationOrganizerNote, style: context.text.labelMedium),
                  Gap.xxs,
                  Text(r.reviewNote!, style: context.text.bodyMedium),
                  if (r.status == RegistrationStatus.changesRequested) ...[
                    Gap.xs,
                    Text(l10n.registrationChangesHint, style: context.text.bodySmall),
                  ],
                ],
              ),
            ),
          ],
          if (r.promotedAt != null) ...[
            Gap.xs,
            Text(l10n.registrationPromoted(DateFormatter.dayMonth(r.promotedAt!)), style: context.text.labelSmall),
          ],
          Gap.sm,
          PaymentStatusChip(status: r.paymentStatus),
          if (r.canCancel || r.canEdit || r.needsPayment) ...[
            Gap.md,
            Wrap(
              spacing: AppSpacing.sm,
              runSpacing: AppSpacing.sm,
              children: [
                if (r.needsPayment)
                  FilledButton.icon(
                    onPressed: () => startRegistrationPayment(context, r),
                    icon: const Icon(Icons.payments_rounded),
                    label: Text(l10n.registrationPay),
                  ),
                if (r.canEdit) OutlinedButton(onPressed: () => _changePartner(context), child: Text(l10n.registerChangePartner)),
                if (r.canCancel) TextButton(onPressed: () => _cancel(context), child: Text(l10n.registrationCancel)),
              ],
            ),
          ],
        ],
      ),
    );
  }
}
