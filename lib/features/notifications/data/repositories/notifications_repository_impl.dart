import '../../../../core/network/api_result.dart';
import '../../../../core/network/guard.dart';
import '../../../../core/network/pagination_meta.dart';
import '../../domain/entities/notification_item.dart';
import '../../domain/repositories/notifications_repository.dart';
import '../datasources/notifications_remote_data_source.dart';

class NotificationsRepositoryImpl implements NotificationsRepository {
  final NotificationsRemoteDataSource remote;

  NotificationsRepositoryImpl(this.remote);

  @override
  ApiResult<Paginated<NotificationItem>> getNotifications({bool unreadOnly = false, int page = 1}) =>
      guard(() => remote.getNotifications(unreadOnly: unreadOnly, page: page));

  @override
  ApiResult<int> getUnreadCount() => guard(remote.getUnreadCount);

  @override
  ApiResult<void> markAsRead(String id) => guard(() => remote.markAsRead(id));

  @override
  ApiResult<void> markAllAsRead() => guard(remote.markAllAsRead);
}
