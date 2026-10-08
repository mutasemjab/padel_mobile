import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/routing/app_routes.dart';
import '../../../../core/state/view_state.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/widgets/app_card.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../../core/widgets/feedback.dart';
import '../../../../core/widgets/player_avatar.dart';
import '../../../../core/widgets/state_builders.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../domain/entities/partner.dart';
import '../bloc/partners_cubits.dart';

/// Received / sent main-partner requests with accept, decline and cancel.
class PartnerRequestsPage extends StatelessWidget {
  const PartnerRequestsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.partnerRequestsTitle),
          actions: [
            TextButton.icon(
              onPressed: () => context.push(AppRoutes.playerSearch),
              icon: const Icon(Icons.person_search_rounded, size: 20),
              label: Text(l10n.findPartner),
            ),
          ],
          bottom: TabBar(
            isScrollable: true,
            padding: const EdgeInsetsDirectional.symmetric(horizontal: AppSpacing.md),
            tabs: [
              Tab(text: l10n.partnerRequestsIncoming),
              Tab(text: l10n.partnerRequestsOutgoing),
            ],
          ),
        ),
        body: const TabBarView(children: [_RequestsList(incoming: true), _RequestsList(incoming: false)]),
      ),
    );
  }
}

class _RequestsList extends StatelessWidget {
  final bool incoming;

  const _RequestsList({required this.incoming});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PartnerRequestsCubit(sl(), incoming: incoming)..load()),
        BlocProvider(create: (_) => sl<PartnerActionCubit>()),
      ],
      child: BlocBuilder<PartnerRequestsCubit, PagedState<PartnerRequest>>(
        builder: (context, state) {
          final cubit = context.read<PartnerRequestsCubit>();
          return PagedStateView<PartnerRequest>(
            state: state,
            onLoadMore: cubit.loadMore,
            onRefresh: cubit.refresh,
            onRetry: cubit.load,
            empty: EmptyState(
              icon: Icons.handshake_outlined,
              title: l10n.partnerRequestsEmpty,
              message: l10n.partnerNotSetHint,
              ctaLabel: l10n.findPartner,
              onCta: () => context.push(AppRoutes.playerSearch),
            ),
            itemBuilder: (context, request, _) => _RequestCard(request: request, incoming: incoming),
          );
        },
      ),
    );
  }
}

class _RequestCard extends StatelessWidget {
  final PartnerRequest request;
  final bool incoming;

  const _RequestCard({required this.request, required this.incoming});

  Future<void> _act(BuildContext context, Future<bool> Function(PartnerActionCubit c) action, String? success) async {
    final actions = context.read<PartnerActionCubit>();
    final ok = await action(actions);
    if (!context.mounted) return;
    final state = actions.state;
    if (ok) {
      context.read<PartnerRequestsCubit>().removeWhere((r) => r.id == request.id);
      if (success != null) showAppSnack(context, success, icon: Icons.check_circle_rounded);
    } else if (state is ActionFailure) {
      showFailure(context, state.failure);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    final other = incoming ? request.requester : request.target;
    return AppCard(
      onTap: () => context.push(AppRoutes.player(other.playerId)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              PlayerAvatar.fromSummary(other),
              Gap.md,
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      incoming ? l10n.partnerRequestFrom(other.name) : l10n.partnerRequestTo(other.name),
                      style: context.text.titleSmall,
                    ),
                    if (request.createdAt != null)
                      Text(DateFormatter.relative(context, request.createdAt!), style: context.text.labelSmall),
                  ],
                ),
              ),
            ],
          ),
          if (request.message != null && request.message!.isNotEmpty) ...[
            Gap.sm,
            Text('“${request.message!}”', style: context.text.bodyMedium),
          ],
          Gap.md,
          BlocBuilder<PartnerActionCubit, ActionState>(
            builder: (context, state) {
              final busy = state is ActionInProgress;
              if (!incoming) {
                return Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: OutlinedButton(
                    onPressed: busy ? null : () => _act(context, (c) => c.cancel(request.id), null),
                    child: Text(l10n.actionCancel),
                  ),
                );
              }
              return Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: busy ? null : () => _act(context, (c) => c.respond(request.id, accept: false), null),
                      child: Text(l10n.actionDecline),
                    ),
                  ),
                  Gap.sm,
                  Expanded(
                    child: FilledButton(
                      onPressed: busy
                          ? null
                          : () =>
                                _act(context, (c) => c.respond(request.id, accept: true), l10n.partnerRequestAccepted),
                      child: busy ? const ButtonSpinner() : Text(l10n.actionAccept),
                    ),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
