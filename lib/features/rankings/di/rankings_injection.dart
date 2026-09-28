import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/datasources/rankings_remote_data_source.dart';
import '../data/repositories/rankings_repository_impl.dart';
import '../domain/repositories/rankings_repository.dart';
import '../domain/usecases/get_rankings_usecase.dart';
import '../presentation/bloc/rankings_cubits.dart';

void registerRankingsDependencies(GetIt sl) {
  sl.registerLazySingleton<RankingsRemoteDataSource>(() => RankingsRemoteDataSourceImpl(sl<Dio>()));
  sl.registerLazySingleton<RankingsRepository>(() => RankingsRepositoryImpl(sl()));

  sl.registerFactory(() => GetRankingsUseCase(sl()));
  sl.registerFactory(() => GetSeasonsUseCase(sl()));
  sl.registerFactory(() => GetMyRankingUseCase(sl()));

  sl.registerFactory(() => SeasonsCubit(sl()));
  sl.registerFactory(() => MyRankingCubit(sl()));
}
