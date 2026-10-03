import 'package:fpdart/fpdart.dart';

import '../../../../core/error/exception_mapper.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/api_result.dart';
import '../../../../core/push/device_token_provider.dart';
import '../../../coaches/data/models/coach_model.dart';
import '../../../players/data/models/player_model.dart';
import '../../../players/domain/entities/player.dart';
import '../../domain/entities/auth_session.dart';
import '../../domain/entities/otp_challenge.dart';
import '../../domain/entities/social_credential.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_local_data_source.dart';
import '../datasources/auth_remote_data_source.dart';
import '../datasources/social_auth_data_source.dart';
import '../models/auth_session_model.dart';
import '../models/otp_challenge_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remote;
  final AuthLocalDataSource local;
  final DeviceTokenProvider deviceTokens;
  final SocialAuthDataSource? social;

  AuthRepositoryImpl(this.remote, this.local, [this.deviceTokens = const NoDeviceTokenProvider(), this.social]);

  @override
  ApiResult<OtpChallenge> sendOtp({required String phone}) async {
    try {
      return Right((await remote.sendOtp(phone: phone)).toEntity());
    } catch (e, s) {
      return Left(ExceptionMapper.map(e, s));
    }
  }

  @override
  ApiResult<OtpChallenge> resendOtp({required String sessionId, required String phone}) async {
    try {
      return Right((await remote.resendOtp(sessionId: sessionId, phone: phone)).toEntity());
    } catch (e, s) {
      return Left(ExceptionMapper.map(e, s));
    }
  }

  @override
  ApiResult<AuthSession> verifyOtp({required String sessionId, required String phone, required String code}) async {
    try {
      final token = await _safeDeviceToken();
      final model = await remote.verifyOtp(
        sessionId: sessionId,
        phone: phone,
        code: code,
        deviceToken: token,
        platform: token == null ? null : deviceTokens.platform,
      );
      await _persistSession(model);
      return Right(model.toEntity());
    } catch (e, s) {
      return Left(ExceptionMapper.map(e, s));
    }
  }

  @override
  ApiResult<AuthSession?> socialSignIn(SocialProvider provider) async {
    try {
      final credential = await social?.signIn(provider);
      if (credential == null) return const Right(null);
      final token = await _safeDeviceToken();
      final model = await remote.socialSignIn(
        credential,
        deviceToken: token,
        platform: token == null ? null : deviceTokens.platform,
      );
      await _persistSession(model);
      return Right(model.toEntity());
    } catch (e, s) {
      return Left(ExceptionMapper.map(e, s));
    }
  }

  @override
  ApiResult<void> logout() async {
    try {
      final token = await _safeDeviceToken();
      if (token != null) await deviceTokens.unregister();
      await remote.logout(deviceToken: token);
    } catch (_) {
      // Intentionally ignored — the token is cleared locally either way.
    } finally {
      await local.clear();
    }
    return const Right(null);
  }

  @override
  ApiResult<Player> me() async {
    try {
      final model = await remote.me();
      await local.cachePlayer(model.toJson());
      return Right(model.toEntity());
    } catch (e, s) {
      return Left(ExceptionMapper.map(e, s));
    }
  }

  @override
  ApiResult<AuthSession> restoreSession() async {
    final token = await local.readToken();
    if (token == null || token.isEmpty) return const Left(UnauthorizedFailure());
    final accountType = AccountType.fromApi(await local.readAccountType());
    try {
      final player = accountType.hasPlayerProfile ? await remote.me() : null;
      final coach = accountType.isCoach ? await remote.coachProfile() : null;
      if (player != null) await local.cachePlayer(player.toJson());
      await local.cacheCoach(coach?.toJson());
      return Right(
        AuthSession(token: token, accountType: accountType, player: player?.toEntity(), coach: coach?.toEntity()),
      );
    } catch (e, s) {
      final failure = ExceptionMapper.map(e, s);
      // Offline boot: keep the user signed in with the cached profile.
      if (failure is NetworkFailure) {
        final cachedPlayer = await local.readCachedPlayer();
        final cachedCoach = await local.readCachedCoach();
        if (cachedPlayer != null || cachedCoach != null) {
          return Right(
            AuthSession(
              token: token,
              accountType: accountType,
              player: cachedPlayer == null ? null : PlayerModel.fromJson(cachedPlayer).toEntity(),
              coach: cachedCoach == null ? null : CoachModel.fromJson(cachedCoach).toEntity(),
            ),
          );
        }
      }
      return Left(failure);
    }
  }

  @override
  ApiResult<Player> updateProfile(Map<String, dynamic> fields) => _playerCall(() => remote.updateMe(fields));

  @override
  ApiResult<Player> uploadPhoto(String filePath) => _playerCall(() => remote.uploadPhoto(filePath));

  @override
  ApiResult<void> changePassword({
    required String currentPassword,
    required String password,
    required String passwordConfirmation,
  }) async {
    try {
      await remote.changePassword(
        currentPassword: currentPassword,
        password: password,
        passwordConfirmation: passwordConfirmation,
      );
      return const Right(null);
    } catch (e, s) {
      return Left(ExceptionMapper.map(e, s));
    }
  }

  @override
  ApiResult<void> deleteAccount() async {
    try {
      final token = await _safeDeviceToken();
      if (token != null) {
        try {
          await deviceTokens.unregister();
        } catch (_) {}
      }
      await remote.deleteAccount();
      await local.clear();
      return const Right(null);
    } catch (e, s) {
      return Left(ExceptionMapper.map(e, s));
    }
  }

  @override
  Future<bool> hasStoredSession() async {
    final token = await local.readToken();
    return token != null && token.isNotEmpty;
  }

  ApiResult<Player> _playerCall(Future<PlayerModel> Function() call) async {
    try {
      final model = await call();
      await local.cachePlayer(model.toJson());
      return Right(model.toEntity());
    } catch (e, s) {
      return Left(ExceptionMapper.map(e, s));
    }
  }

  Future<String?> _safeDeviceToken() async {
    try {
      return await deviceTokens.currentToken();
    } catch (_) {
      return null;
    }
  }

  Future<void> _persistSession(AuthSessionModel model) async {
    await local.saveToken(model.token);
    await local.saveAccountType(model.accountType);
    if (model.player != null) await local.cachePlayer(model.player!.toJson());
    await local.cacheCoach(model.coach?.toJson());
  }
}
