import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/scorekeeper_remote_data_source.dart';
import '../data/scorekeeper_repository.dart';

void registerScorekeeperDependencies(GetIt sl) {
  sl.registerLazySingleton<ScorekeeperRemoteDataSource>(() => ScorekeeperRemoteDataSourceImpl(sl<Dio>()));
  sl.registerLazySingleton(() => ScorekeeperRepository(sl(), sl()));
}
