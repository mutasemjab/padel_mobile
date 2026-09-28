import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/datasources/premium_remote_data_source.dart';
import '../data/repositories/premium_repository_impl.dart';
import '../domain/repositories/premium_repository.dart';
import '../domain/usecases/premium_usecases.dart';
import '../presentation/bloc/premium_cubits.dart';

void registerPremiumDependencies(GetIt sl) {
  sl.registerLazySingleton<PremiumRemoteDataSource>(() => PremiumRemoteDataSourceImpl(sl<Dio>()));
  sl.registerLazySingleton<PremiumRepository>(() => PremiumRepositoryImpl(sl()));

  sl.registerFactory(() => GetPremiumPlansUseCase(sl()));
  sl.registerFactory(() => GetPremiumStatusUseCase(sl()));
  sl.registerFactory(() => StartCheckoutUseCase(sl()));
  sl.registerFactory(() => GetMyPaymentsUseCase(sl()));
  sl.registerFactory(() => GetPaymentUseCase(sl()));
  sl.registerFactory(() => GetAiInsightsUseCase(sl()));
  sl.registerFactory(() => GenerateAiInsightUseCase(sl()));
  sl.registerFactory(() => GetAiInsightUseCase(sl()));
  sl.registerFactory(() => GetMy3dProfileUseCase(sl()));
  sl.registerFactory(() => Request3dProfileUseCase(sl()));
  sl.registerFactory(() => GetPlayer3dProfileUseCase(sl()));

  sl.registerFactory(() => PremiumCubit(getPlans: sl(), getStatus: sl()));
  sl.registerFactory(() => CheckoutCubit(sl()));
  sl.registerFactory(() => PaymentsCubit(sl()));
  sl.registerFactory(() => AiInsightsCubit(getInsights: sl(), generate: sl(), getInsight: sl()));
  sl.registerFactory(() => ThreeDCubit(getProfile: sl(), request: sl()));
}
