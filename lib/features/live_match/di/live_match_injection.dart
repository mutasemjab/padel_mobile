import 'package:get_it/get_it.dart';

import '../presentation/bloc/live_match_cubit.dart';

void registerLiveMatchDependencies(GetIt sl) {
  // Param1 = matchId, Param2 = tournamentId (null for `/matches/:id`) — only
  // known at navigation time, so the cubit is created per screen.
  sl.registerFactoryParam<LiveMatchCubit, int, int?>(
    (matchId, tournamentId) => LiveMatchCubit(
      getMatch: sl(),
      getMatchById: sl(),
      getPoints: sl(),
      liveScores: sl(),
      matchId: matchId,
      tournamentId: tournamentId,
    ),
  );
}
