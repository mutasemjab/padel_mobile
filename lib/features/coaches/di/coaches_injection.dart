import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/datasources/coaches_remote_data_source.dart';
import '../data/repositories/coaches_repository_impl.dart';
import '../domain/repositories/coaches_repository.dart';
import '../domain/usecases/booking_usecases.dart';
import '../domain/usecases/get_coach_detail_usecase.dart';
import '../domain/usecases/get_coaches_usecase.dart';
import '../presentation/bloc/coaches_cubits.dart';

void registerCoachesDependencies(GetIt sl) {
  sl.registerLazySingleton<CoachesRemoteDataSource>(() => CoachesRemoteDataSourceImpl(sl<Dio>()));
  sl.registerLazySingleton<CoachesRepository>(() => CoachesRepositoryImpl(sl()));

  sl.registerFactory(() => GetCoachesUseCase(sl()));
  sl.registerFactory(() => GetCoachDetailUseCase(sl()));
  sl.registerFactory(() => GetCoachAvailabilityUseCase(sl()));
  sl.registerFactory(() => GetCoachReviewsUseCase(sl()));
  sl.registerFactory(() => BookCoachUseCase(sl()));
  sl.registerFactory(() => GetMyBookingsUseCase(sl()));
  sl.registerFactory(() => GetMyBookingUseCase(sl()));
  sl.registerFactory(() => CancelBookingUseCase(sl()));
  sl.registerFactory(() => ReviewBookingUseCase(sl()));
  sl.registerFactory(() => GetTrainingProgressUseCase(sl()));

  sl.registerFactory(() => CoachesCubit(sl()));
  sl.registerFactory(() => BookCoachCubit(sl()));
  sl.registerFactory(() => BookingActionCubit(cancelBooking: sl(), reviewBooking: sl()));
  sl.registerFactory(() => TrainingProgressCubit(sl()));
}
