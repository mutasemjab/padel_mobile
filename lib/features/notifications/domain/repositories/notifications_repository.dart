import '../../../../core/network/api_result.dart';
import '../../../../core/network/pagination_meta.dart';
import '../entities/notification_item.dart';

abstract class NotificationsRepository {
  ApiResult<Paginated<NotificationItem>> getNotifications({bool unreadOnly = false, int page = 1});
  ApiResult<int> getUnreadCount();
  ApiResult<void> markAsRead(String id);
  ApiResult<void> markAllAsRead();
}
