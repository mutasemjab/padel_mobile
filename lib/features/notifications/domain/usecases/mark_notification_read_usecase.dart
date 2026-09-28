import '../../../../core/network/api_result.dart';
import '../repositories/notifications_repository.dart';

class MarkNotificationReadUseCase {
  final NotificationsRepository repository;

  MarkNotificationReadUseCase(this.repository);

  ApiResult<void> call(String id) => repository.markAsRead(id);
}
