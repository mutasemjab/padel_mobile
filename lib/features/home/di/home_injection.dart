import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/home_repository_impl.dart';
import '../domain/home_repository.dart';
import '../presentation/bloc/home_cubit.dart';

void registerHomeDependencies(GetIt sl) {
  sl.registerLazySingleton<HomeRemoteDataSource>(() => HomeRemoteDataSourceImpl(sl<Dio>()));
  sl.registerLazySingleton<HomeRepository>(() => HomeRepositoryImpl(sl()));
  sl.registerFactory(() => GetHomeFeedUseCase(sl()));
  sl.registerFactory(() => HomeCubit(sl()));
}
