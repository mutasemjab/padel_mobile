import '../../../../core/network/api_result.dart';
import '../../../../core/network/pagination_meta.dart';
import '../entities/notification_item.dart';
import '../repositories/notifications_repository.dart';

class GetNotificationsUseCase {
  final NotificationsRepository repository;

  GetNotificationsUseCase(this.repository);

  ApiResult<Paginated<NotificationItem>> call({bool unreadOnly = false, int page = 1}) =>
      repository.getNotifications(unreadOnly: unreadOnly, page: page);
}

class GetUnreadCountUseCase {
  final NotificationsRepository repository;

  GetUnreadCountUseCase(this.repository);

  ApiResult<int> call() => repository.getUnreadCount();
}

class MarkAllNotificationsReadUseCase {
  final NotificationsRepository repository;

  MarkAllNotificationsReadUseCase(this.repository);

  ApiResult<void> call() => repository.markAllAsRead();
}
