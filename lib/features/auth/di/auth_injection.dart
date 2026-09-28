import 'package:dio/dio.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

import '../data/datasources/auth_local_data_source.dart';
import '../data/datasources/auth_remote_data_source.dart';
import '../data/datasources/social_auth_data_source.dart';
import '../data/repositories/auth_repository_impl.dart';
import '../domain/repositories/auth_repository.dart';
import '../domain/usecases/get_current_player_usecase.dart';
import '../domain/usecases/logout_usecase.dart';
import '../domain/usecases/sign_in_usecases.dart';
import '../domain/usecases/profile_usecases.dart';
import '../presentation/bloc/auth_bloc.dart';
import '../presentation/bloc/edit_profile_cubit.dart';

void registerAuthDependencies(GetIt sl) {
  sl.registerLazySingleton<AuthRemoteDataSource>(() => AuthRemoteDataSourceImpl(sl<Dio>()));
  sl.registerLazySingleton(() => AuthLocalDataSource(sl<FlutterSecureStorage>()));
  sl.registerLazySingleton<SocialAuthDataSource>(SocialAuthDataSourceImpl.new);
  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl(), sl(), sl(), sl()));

  sl.registerFactory(() => LogoutUseCase(sl()));
  sl.registerFactory(() => GetCurrentPlayerUseCase(sl()));
  sl.registerFactory(() => RestoreSessionUseCase(sl()));
  sl.registerFactory(() => UpdateProfileUseCase(sl()));
  sl.registerFactory(() => UploadProfilePhotoUseCase(sl()));
  sl.registerFactory(() => ChangePasswordUseCase(sl()));
  sl.registerFactory(() => SendOtpUseCase(sl()));
  sl.registerFactory(() => ResendOtpUseCase(sl()));
  sl.registerFactory(() => VerifyOtpUseCase(sl()));
  sl.registerFactory(() => SocialSignInUseCase(sl()));

  // Singleton: the app root creates exactly one AuthBloc for the whole
  // session and every screen reads it via BlocProvider.value.
  sl.registerLazySingleton(() => AuthBloc(logoutUseCase: sl(), getCurrentPlayerUseCase: sl(), authRepository: sl()));
  sl.registerFactory(() => EditProfileCubit(updateProfile: sl(), uploadPhoto: sl(), changePassword: sl()));
}
