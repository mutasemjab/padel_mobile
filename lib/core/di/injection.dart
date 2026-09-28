import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../../features/auth/di/auth_injection.dart';
import '../../features/casual_matches/di/casual_matches_injection.dart';
import '../../features/coach_portal/di/coach_portal_injection.dart';
import '../../features/coaches/di/coaches_injection.dart';
import '../../features/home/di/home_injection.dart';
import '../../features/live_match/di/live_match_injection.dart';
import '../../features/notifications/di/notifications_injection.dart';
import '../../features/partners/di/partners_injection.dart';
import '../../features/players/di/players_injection.dart';
import '../../features/premium/di/premium_injection.dart';
import '../../features/rankings/di/rankings_injection.dart';
import '../../features/scorekeeper/di/scorekeeper_injection.dart';
import '../../features/tournaments/di/tournaments_injection.dart';
import '../../features/venues/di/venues_injection.dart';
import '../meta/enums_service.dart';
import '../network/dio_client.dart';
import '../push/device_token_provider.dart';
import '../push/push_notification_service.dart';
import '../realtime/realtime_service.dart';

/// App-wide get_it service locator. DI is registered by hand (not
/// code-generated via injectable) — manual registration stays more
/// transparent than debugging generated locator code.
final GetIt sl = GetIt.instance;

Future<void> configureDependencies() async {
  // Core
  sl.registerLazySingleton(() => const FlutterSecureStorage());
  sl.registerLazySingleton<Dio>(() => DioClient(sl()).dio);
  sl.registerLazySingleton(() => EnumsService(sl()));
  sl.registerLazySingleton(() => RealtimeService(dio: sl(), storage: sl()));
  sl.registerLazySingleton(() => PushNotificationService(sl()));
  sl.registerLazySingleton<DeviceTokenProvider>(() => sl<PushNotificationService>());

  // Features
  registerAuthDependencies(sl);
  registerHomeDependencies(sl);
  registerPlayersDependencies(sl);
  registerPartnersDependencies(sl);
  registerTournamentsDependencies(sl);
  registerLiveMatchDependencies(sl);
  registerRankingsDependencies(sl);
  registerCoachesDependencies(sl);
  registerCoachPortalDependencies(sl);
  registerCasualMatchesDependencies(sl);
  registerVenuesDependencies(sl);
  registerNotificationsDependencies(sl);
  registerPremiumDependencies(sl);
  registerScorekeeperDependencies(sl);
}
