import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/di/injection.dart';
import '../../../../core/state/view_state.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/utils/date_formatter.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../../core/widgets/paginated_list_view.dart';
import '../../../../core/widgets/shimmer_skeleton.dart';
import '../../../../core/widgets/state_views.dart';
import '../../../../l10n/gen/app_localizations.dart';
import '../../../auth/domain/entities/auth_session.dart';
import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/bloc/auth_state.dart';
import '../../domain/entities/notification_item.dart';
import '../bloc/notifications_cubit.dart';
import '../notification_router.dart';
import '../widgets/achievement_celebration_overlay.dart';
import '../widgets/notification_tile.dart';

/// Notification center: grouped by day, unread filter, mark all read,
/// deep links for every type.
class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<NotificationsCubit>()..load(),
      child: const _NotificationsView(),
    );
  }
}

class _NotificationsView extends StatelessWidget {
  const _NotificationsView();

  Future<void> _open(BuildContext context, NotificationItem n) async {
    final cubit = context.read<NotificationsCubit>();
    final auth = context.read<AuthBloc>().state;
    final wasUnread = !n.isRead;
    cubit.markAsRead(n.id);
    if (wasUnread && n.type == NotificationType.achievementUnlocked) {
      final lang = Localizations.localeOf(context).languageCode;
      await showAchievementCelebration(context, achievementMessage: n.title(lang) ?? n.message(lang) ?? '');
      if (!context.mounted) return;
    }
    final route = NotificationRouter.routeFor(
      n,
      coachAccount: auth is AuthAuthenticated && auth.accountType == AccountType.coach,
      myPlayerId: auth.currentPlayer?.playerId,
    );
    if (route != null) context.push(route);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.notificationsTitle),
        actions: [
          TextButton(
            onPressed: () => context.read<NotificationsCubit>().markAll(),
            child: Text(l10n.notificationsMarkAllRead),
          ),
        ],
      ),
      body: BlocBuilder<NotificationsCubit, PagedState<NotificationItem>>(
        builder: (context, state) {
          final cubit = context.read<NotificationsCubit>();
          return Column(
            children: [
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(AppSpacing.gutter, 0, AppSpacing.gutter, AppSpacing.sm),
                child: Row(
                  children: [
                    ChoiceChip(
                      label: Text(l10n.notificationsFilterAll),
                      selected: !cubit.unreadOnly,
                      onSelected: (_) => cubit.setUnreadOnly(false),
                    ),
                    Gap.sm,
                    ChoiceChip(
                      label: Text(l10n.notificationsFilterUnread),
                      selected: cubit.unreadOnly,
                      onSelected: (_) => cubit.setUnreadOnly(true),
                    ),
                  ],
                ),
              ),
              Expanded(child: _body(context, state, cubit)),
            ],
          );
        },
      ),
    );
  }

  Widget _body(BuildContext context, PagedState<NotificationItem> state, NotificationsCubit cubit) {
    final l10n = AppLocalizations.of(context);
    switch (state.status) {
      case PagedStatus.initial:
      case PagedStatus.loading:
        return SkeletonList(itemBuilder: () => const PlayerCardSkeleton());
      case PagedStatus.error:
        return ErrorState(failure: state.failure!, onRetry: cubit.load);
      case PagedStatus.empty:
        return EmptyState(
          icon: Icons.notifications_none_rounded,
          title: l10n.emptyNotificationsTitle,
          message: l10n.emptyNotificationsMessage,
        );
      case PagedStatus.loaded:
        final rows = <Object>[];
        String? bucket;
        for (final n in state.items) {
          final b = DateFormatter.dayBucket(context, n.createdAt);
          if (b != bucket) {
            rows.add(b);
            bucket = b;
          }
          rows.add(n);
        }
        return PaginatedListView<Object>(
          items: rows,
          hasMore: state.hasMore,
          isLoadingMore: state.isLoadingMore,
          onLoadMore: cubit.loadMore,
          onRefresh: cubit.refresh,
          padding: EdgeInsets.zero,
          separator: const SizedBox.shrink(),
          animateEntrance: false,
          itemBuilder: (context, row, _) => row is String
              ? Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(AppSpacing.gutter, AppSpacing.lg, AppSpacing.gutter, AppSpacing.xs),
                  child: Text(row.toUpperCase(), style: AppTypography.eyebrow(context)),
                )
              : NotificationTile(
                  notification: row as NotificationItem,
                  onTap: () => _open(context, row),
                ),
        );
    }
  }
}
