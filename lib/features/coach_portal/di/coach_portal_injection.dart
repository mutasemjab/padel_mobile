import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/datasources/coach_portal_remote_data_source.dart';
import '../data/repositories/coach_portal_repository_impl.dart';
import '../domain/repositories/coach_portal_repository.dart';
import '../domain/usecases/coach_portal_usecases.dart';
import '../presentation/bloc/coach_portal_cubits.dart';

void registerCoachPortalDependencies(GetIt sl) {
  sl.registerLazySingleton<CoachPortalRemoteDataSource>(() => CoachPortalRemoteDataSourceImpl(sl<Dio>()));
  sl.registerLazySingleton<CoachPortalRepository>(() => CoachPortalRepositoryImpl(sl()));

  sl.registerFactory(() => GetCoachProfileUseCase(sl()));
  sl.registerFactory(() => UpdateCoachProfileUseCase(sl()));
  sl.registerFactory(() => GetCoachSlotsUseCase(sl()));
  sl.registerFactory(() => CreateCoachSlotsUseCase(sl()));
  sl.registerFactory(() => UpdateCoachSlotUseCase(sl()));
  sl.registerFactory(() => DeleteCoachSlotUseCase(sl()));
  sl.registerFactory(() => GetCoachBookingsUseCase(sl()));
  sl.registerFactory(() => CoachBookingActionUseCase(sl()));
  sl.registerFactory(() => RecordProgressUseCase(sl()));
  sl.registerFactory(() => GetPlayerProgressUseCase(sl()));

  sl.registerFactory(() => CoachProfileCubit(sl()));
  sl.registerFactory(() => CoachSlotsCubit(sl()));
  sl.registerFactory(
    () => CoachPortalActionCubit(
      createSlots: sl(),
      updateSlot: sl(),
      deleteSlot: sl(),
      bookingAction: sl(),
      recordProgress: sl(),
      updateProfile: sl(),
    ),
  );
}
