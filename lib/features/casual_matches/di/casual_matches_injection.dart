import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/datasources/casual_matches_remote_data_source.dart';
import '../data/repositories/casual_matches_repository_impl.dart';
import '../domain/repositories/casual_matches_repository.dart';
import '../domain/usecases/casual_actions_usecases.dart';
import '../domain/usecases/create_casual_match_usecase.dart';
import '../domain/usecases/get_casual_matches_usecase.dart';
import '../domain/usecases/join_casual_match_usecase.dart';
import '../presentation/bloc/casual_cubits.dart';
import '../presentation/bloc/casual_matches_bloc.dart';
import '../presentation/bloc/create_casual_match_cubit.dart';
import '../presentation/bloc/join_casual_match_cubit.dart';

void registerCasualMatchesDependencies(GetIt sl) {
  sl.registerLazySingleton<CasualMatchesRemoteDataSource>(() => CasualMatchesRemoteDataSourceImpl(sl<Dio>()));
  sl.registerLazySingleton<CasualMatchesRepository>(() => CasualMatchesRepositoryImpl(sl()));

  sl.registerFactory(() => GetCasualMatchesUseCase(sl()));
  sl.registerFactory(() => CreateCasualMatchUseCase(sl()));
  sl.registerFactory(() => JoinCasualMatchUseCase(sl()));
  sl.registerFactory(() => GetCasualMatchUseCase(sl()));
  sl.registerFactory(() => LeaveCasualMatchUseCase(sl()));
  sl.registerFactory(() => CancelCasualMatchUseCase(sl()));
  sl.registerFactory(() => RespondToParticipantUseCase(sl()));
  sl.registerFactory(() => GetMyCasualMatchesUseCase(sl()));

  sl.registerFactory(() => CasualMatchesBloc(sl()));
  sl.registerFactory(() => CreateCasualMatchCubit(sl()));
  sl.registerFactory(() => JoinCasualMatchCubit(sl()));
  sl.registerFactory(() => CasualActionCubit(join: sl(), leave: sl(), cancel: sl(), respond: sl()));
  sl.registerFactory(() => VenuesCubit(sl()));
}
