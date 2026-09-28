import '../../../../core/network/api_result.dart';
import '../../../../core/network/pagination_meta.dart';
import '../../../../core/state/base_cubits.dart';
import '../../domain/entities/notification_item.dart';
import '../../domain/usecases/get_notifications_usecase.dart';
import '../../domain/usecases/mark_notification_read_usecase.dart';
import 'unread_count_cubit.dart';

/// Paginated notification center with optimistic mark-as-read. Keeps the
/// global unread badge in sync via `meta.unread_count`.
class NotificationsCubit extends PagedCubit<NotificationItem> {
  final GetNotificationsUseCase getNotifications;
  final MarkNotificationReadUseCase markNotificationRead;
  final MarkAllNotificationsReadUseCase markAllRead;
  final UnreadCountCubit? unreadCount;
  bool unreadOnly = false;

  NotificationsCubit({
    required this.getNotifications,
    required this.markNotificationRead,
    required this.markAllRead,
    this.unreadCount,
  });

  @override
  ApiResult<Paginated<NotificationItem>> fetchPage(int page) async {
    final result = await getNotifications(unreadOnly: unreadOnly, page: page);
    result.match((_) => null, (p) {
      final count = p.extra?['unread_count'];
      if (count is num) unreadCount?.set(count.toInt());
    });
    return result;
  }

  Future<void> setUnreadOnly(bool value) {
    unreadOnly = value;
    return load();
  }

  /// Prepends a notification that just arrived (push / realtime).
  void prepend(NotificationItem item) {
    if (state.items.any((n) => n.id == item.id)) return;
    emit(state.copyWith(items: [item, ...state.items]));
  }

  Future<void> markAsRead(String id) async {
    final index = state.items.indexWhere((n) => n.id == id);
    if (index == -1 || state.items[index].isRead) return;
    final original = state.items[index];
    updateWhere((n) => n.id == id, (n) => n.copyWith(readAt: DateTime.now()));
    unreadCount?.decrement();
    final result = await markNotificationRead(id);
    result.match((_) {
      updateWhere((n) => n.id == id, (_) => original);
      unreadCount?.increment();
    }, (_) => null);
  }

  Future<void> markAll() async {
    final before = state;
    final now = DateTime.now();
    emit(state.copyWith(items: [for (final n in state.items) n.isRead ? n : n.copyWith(readAt: now)]));
    unreadCount?.clear();
    final result = await markAllRead();
    result.match((_) {
      emit(before);
      unreadCount?.refresh();
    }, (_) {
      if (unreadOnly) load();
    });
  }
}
