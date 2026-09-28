import 'package:dio/dio.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/api_envelope.dart';
import '../../../../core/network/pagination_meta.dart';
import '../../domain/entities/notification_item.dart';
import '../models/notification_item_model.dart';

abstract class NotificationsRemoteDataSource {
  /// `meta.unread_count` comes back in [Paginated.extra].
  Future<Paginated<NotificationItem>> getNotifications({bool unreadOnly = false, int page = 1});
  Future<int> getUnreadCount();
  Future<void> markAsRead(String id);
  Future<void> markAllAsRead();
}

class NotificationsRemoteDataSourceImpl implements NotificationsRemoteDataSource {
  final Dio dio;

  NotificationsRemoteDataSourceImpl(this.dio);

  @override
  Future<Paginated<NotificationItem>> getNotifications({bool unreadOnly = false, int page = 1}) async {
    final response = await dio.get(ApiEndpoints.notifications, queryParameters: {
      if (unreadOnly) 'unread': 1,
      'page': page,
    });
    return ApiEnvelope.paginated(response, notificationFromJson);
  }

  @override
  Future<int> getUnreadCount() async {
    final response = await dio.get(ApiEndpoints.notificationsUnreadCount);
    final data = ApiEnvelope.data(response);
    if (data is num) return data.toInt();
    if (data is Map) return (data['unread_count'] as num?)?.toInt() ?? (data['count'] as num?)?.toInt() ?? 0;
    return 0;
  }

  @override
  Future<void> markAsRead(String id) async {
    await dio.post(ApiEndpoints.notificationRead(id));
  }

  @override
  Future<void> markAllAsRead() async {
    await dio.post(ApiEndpoints.notificationsReadAll);
  }
}
