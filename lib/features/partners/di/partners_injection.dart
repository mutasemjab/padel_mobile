import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/datasources/partners_remote_data_source.dart';
import '../data/repositories/partners_repository_impl.dart';
import '../domain/repositories/partners_repository.dart';
import '../domain/usecases/partners_usecases.dart';
import '../presentation/bloc/duo_3d_cubit.dart';
import '../presentation/bloc/partners_cubits.dart';

void registerPartnersDependencies(GetIt sl) {
  sl.registerLazySingleton<PartnersRemoteDataSource>(() => PartnersRemoteDataSourceImpl(sl<Dio>()));
  sl.registerLazySingleton<PartnersRepository>(() => PartnersRepositoryImpl(sl()));

  sl.registerFactory(() => GetPartnersUseCase(sl()));
  sl.registerFactory(() => GetRecommendedPartnersUseCase(sl()));
  sl.registerFactory(() => GetPartnerRequestsUseCase(sl()));
  sl.registerFactory(() => SendPartnerRequestUseCase(sl()));
  sl.registerFactory(() => RespondPartnerRequestUseCase(sl()));
  sl.registerFactory(() => CancelPartnerRequestUseCase(sl()));
  sl.registerFactory(() => RemoveMainPartnerUseCase(sl()));
  sl.registerFactory(() => GetDuo3dUseCase(sl()));
  sl.registerFactory(() => RequestDuo3dUseCase(sl()));
  sl.registerFactory(() => Duo3dCubit(getDuo: sl(), requestDuo: sl()));

  sl.registerFactory(() => RecommendedPartnersCubit(sl()));
  sl.registerFactory(
    () => PartnerActionCubit(sendRequest: sl(), respondRequest: sl(), cancelRequest: sl(), removeMainPartner: sl()),
  );
}
