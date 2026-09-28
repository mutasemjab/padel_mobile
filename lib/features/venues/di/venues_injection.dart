import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/datasources/venues_remote_data_source.dart';
import '../data/repositories/venues_repository_impl.dart';
import '../domain/repositories/venues_repository.dart';
import '../domain/usecases/venues_usecases.dart';

void registerVenuesDependencies(GetIt sl) {
  sl.registerLazySingleton<VenuesRemoteDataSource>(() => VenuesRemoteDataSourceImpl(sl<Dio>()));
  sl.registerLazySingleton<VenuesRepository>(() => VenuesRepositoryImpl(sl()));
  sl.registerFactory(() => GetVenuesUseCase(sl()));
  sl.registerFactory(() => GetVenueUseCase(sl()));
}
