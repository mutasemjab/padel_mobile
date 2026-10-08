import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/datasources/tournaments_remote_data_source.dart';
import '../data/repositories/live_scores_repository_impl.dart';
import '../data/repositories/tournaments_repository_impl.dart';
import '../domain/repositories/live_scores_repository.dart';
import '../domain/repositories/tournaments_repository.dart';
import '../domain/usecases/competition_usecases.dart';
import '../domain/usecases/get_live_matches_usecase.dart';
import '../domain/usecases/get_match_usecase.dart';
import '../domain/usecases/get_tournament_detail_usecase.dart';
import '../domain/usecases/get_tournaments_usecase.dart';
import '../presentation/bloc/competition_cubits.dart';
import '../presentation/bloc/tournament_detail_cubit.dart';
import '../presentation/bloc/tournaments_bloc.dart';

void registerTournamentsDependencies(GetIt sl) {
  sl.registerLazySingleton<TournamentsRemoteDataSource>(() => TournamentsRemoteDataSourceImpl(sl<Dio>()));
  sl.registerLazySingleton<TournamentsRepository>(() => TournamentsRepositoryImpl(sl()));
  sl.registerLazySingleton<LiveScoresRepository>(() => LiveScoresRepositoryImpl(sl()));

  sl.registerFactory(() => GetTournamentsUseCase(sl()));
  sl.registerFactory(() => GetTournamentDetailUseCase(sl()));
  sl.registerFactory(() => GetLiveMatchesUseCase(sl()));
  sl.registerFactory(() => GetMatchUseCase(sl()));
  sl.registerFactory(() => GetCategoryDetailUseCase(sl()));
  sl.registerFactory(() => GetTournamentMatchesUseCase(sl()));
  sl.registerFactory(() => GetTournamentResultsUseCase(sl()));
  sl.registerFactory(() => GetAllLiveMatchesUseCase(sl()));
  sl.registerFactory(() => GetMatchByIdUseCase(sl()));
  sl.registerFactory(() => GetMatchLiveUseCase(sl()));
  sl.registerFactory(() => GetMatchPointsUseCase(sl()));
  sl.registerFactory(() => CheckEligibilityUseCase(sl()));
  sl.registerFactory(() => RegisterForCategoryUseCase(sl()));
  sl.registerFactory(() => GetMyRegistrationsUseCase(sl()));
  sl.registerFactory(() => CancelRegistrationUseCase(sl()));
  sl.registerFactory(() => RespondAsPartnerUseCase(sl()));
  sl.registerFactory(() => ChangeRegistrationPartnerUseCase(sl()));
  sl.registerFactory(() => PayRegistrationUseCase(sl()));

  sl.registerFactory(() => TournamentsBloc(sl()));
  sl.registerFactory(
    () => TournamentDetailCubit(
      getTournamentDetail: sl(),
      getLiveMatches: sl(),
      getMyRegistrations: sl(),
      liveScores: sl(),
    ),
  );
  sl.registerFactory(() => MyRegistrationsCubit(sl()));
  sl.registerFactory(
    () => RegistrationCubit(
      checkEligibility: sl(),
      register: sl(),
      cancelRegistration: sl(),
      changePartner: sl(),
      pay: sl(),
      respondAsPartner: sl(),
    ),
  );
}
