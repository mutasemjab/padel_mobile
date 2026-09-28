import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../data/datasources/players_remote_data_source.dart';
import '../data/repositories/players_repository_impl.dart';
import '../domain/repositories/players_repository.dart';
import '../domain/usecases/get_achievements_usecase.dart';
import '../domain/usecases/get_player_usecase.dart';
import '../domain/usecases/player_insight_usecases.dart';
import '../domain/usecases/social_actions_usecases.dart';
import '../presentation/bloc/challenge_cubit.dart';
import '../presentation/bloc/player_profile_cubit.dart';

void registerPlayersDependencies(GetIt sl) {
  sl.registerLazySingleton<PlayersRemoteDataSource>(() => PlayersRemoteDataSourceImpl(sl<Dio>()));
  sl.registerLazySingleton<PlayersRepository>(() => PlayersRepositoryImpl(sl()));

  sl.registerFactory(() => GetPlayerUseCase(sl()));
  sl.registerFactory(() => GetAchievementsUseCase(sl()));
  sl.registerFactory(() => GetPlayerProfileUseCase(sl()));
  sl.registerFactory(() => SearchPlayersUseCase(sl()));
  sl.registerFactory(() => GetPlayerStatsUseCase(sl()));
  sl.registerFactory(() => GetRatingHistoryUseCase(sl()));
  sl.registerFactory(() => GetSeasonHistoryUseCase(sl()));
  sl.registerFactory(() => GetTournamentHistoryUseCase(sl()));
  sl.registerFactory(() => GetPlayerMatchesUseCase(sl()));
  sl.registerFactory(() => GetAchievementCatalogUseCase(sl()));
  sl.registerFactory(() => GetFollowersUseCase(sl()));
  sl.registerFactory(() => GetMyChallengesUseCase(sl()));
  sl.registerFactory(() => FollowPlayerUseCase(sl()));
  sl.registerFactory(() => UnfollowPlayerUseCase(sl()));
  sl.registerFactory(() => RespectPlayerUseCase(sl()));
  sl.registerFactory(() => ChallengePlayerUseCase(sl()));
  sl.registerFactory(() => RespondToChallengeUseCase(sl()));

  sl.registerFactory(
    () => PlayerProfileCubit(getProfile: sl(), followPlayer: sl(), unfollowPlayer: sl(), respectPlayer: sl()),
  );
  sl.registerFactory(() => ChallengeCubit(sl()));
}
