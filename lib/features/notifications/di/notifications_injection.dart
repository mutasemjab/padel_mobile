import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/datasources/notifications_remote_data_source.dart';
import '../data/repositories/notifications_repository_impl.dart';
import '../domain/repositories/notifications_repository.dart';
import '../domain/usecases/get_notifications_usecase.dart';
import '../domain/usecases/mark_notification_read_usecase.dart';
import '../presentation/bloc/notifications_cubit.dart';
import '../presentation/bloc/unread_count_cubit.dart';

void registerNotificationsDependencies(GetIt sl) {
  sl.registerLazySingleton<NotificationsRemoteDataSource>(() => NotificationsRemoteDataSourceImpl(sl<Dio>()));
  sl.registerLazySingleton<NotificationsRepository>(() => NotificationsRepositoryImpl(sl()));

  sl.registerFactory(() => GetNotificationsUseCase(sl()));
  sl.registerFactory(() => MarkNotificationReadUseCase(sl()));
  sl.registerFactory(() => GetUnreadCountUseCase(sl()));
  sl.registerFactory(() => MarkAllNotificationsReadUseCase(sl()));

  // One badge for the whole app.
  sl.registerLazySingleton(() => UnreadCountCubit(sl()));
  sl.registerFactory(
    () => NotificationsCubit(
      getNotifications: sl(),
      markNotificationRead: sl(),
      markAllRead: sl(),
      unreadCount: sl(),
    ),
  );
}
