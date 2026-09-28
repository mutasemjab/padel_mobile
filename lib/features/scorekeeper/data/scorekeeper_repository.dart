import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:fpdart/fpdart.dart';

import '../../../core/constants/storage_keys.dart';
import '../../../core/error/failure.dart';
import '../../../core/network/api_result.dart';
import '../../../core/network/guard.dart';
import '../../tournaments/domain/entities/live_payload.dart';
import '../../tournaments/domain/entities/match.dart';
import '../domain/scorekeeper_entities.dart';
import 'scorekeeper_remote_data_source.dart';

/// Owns the staff session (kept separate from the player session) and
/// forwards scoring calls with the staff token.
class ScorekeeperRepository {
  final ScorekeeperRemoteDataSource remote;
  final FlutterSecureStorage storage;

  ScorekeeperRepository(this.remote, this.storage);

  ScorekeeperSession? _session;

  ScorekeeperSession? get session => _session;

  Future<ScorekeeperSession?> restore() async {
    final token = await storage.read(key: StorageKeys.scorekeeperToken);
    if (token == null) return null;
    final rawStaff = await storage.read(key: StorageKeys.scorekeeperStaff);
    final staff = rawStaff == null ? <String, dynamic>{} : (jsonDecode(rawStaff) as Map).cast<String, dynamic>();
    return _session = ScorekeeperSession(token: token, staffName: staff['name']?.toString(), staff: staff);
  }

  ApiResult<ScorekeeperSession> login({required String login, required String password}) => guard(() async {
        final session = await remote.login(login: login, password: password);
        await storage.write(key: StorageKeys.scorekeeperToken, value: session.token);
        await storage.write(key: StorageKeys.scorekeeperStaff, value: jsonEncode(session.staff));
        return _session = session;
      });

  Future<void> logout() async {
    _session = null;
    await storage.delete(key: StorageKeys.scorekeeperToken);
    await storage.delete(key: StorageKeys.scorekeeperStaff);
  }

  ApiResult<T> _withToken<T>(Future<T> Function(String token) call) async {
    final token = _session?.token ?? (await restore())?.token;
    if (token == null) return const Left(UnauthorizedFailure());
    return guard(() => call(token));
  }

  ApiResult<List<Match>> getMatches() => _withToken(remote.getMatches);

  ApiResult<LivePayload?> recordPoint(int matchId, PointInput input) =>
      _withToken((t) => remote.recordPoint(t, matchId, input));

  ApiResult<LivePayload?> undo(int matchId) => _withToken((t) => remote.undo(t, matchId));

  ApiResult<LivePayload?> correctPoint(int matchId, int pointId, PointInput input, {required String reason}) =>
      _withToken((t) => remote.correctPoint(t, matchId, pointId, input, reason: reason));

  ApiResult<LivePayload?> updateDetails(int matchId, int pointId, PointInput input) =>
      _withToken((t) => remote.updateDetails(t, matchId, pointId, input));
}
