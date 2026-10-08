import 'package:dio/dio.dart';

import '../../../core/constants/api_endpoints.dart';
import '../../../core/network/api_envelope.dart';
import '../../tournaments/data/models/live_payload_model.dart';
import '../../tournaments/data/models/match_model.dart';
import '../../tournaments/domain/entities/live_payload.dart';
import '../../tournaments/domain/entities/match.dart';
import '../domain/scorekeeper_entities.dart';

/// Staff scorekeeping API. Every call carries the *staff* bearer token
/// explicitly — the AuthInterceptor leaves a pre-set Authorization header
/// alone and never force-logs-out the player session on a staff 401.
abstract class ScorekeeperRemoteDataSource {
  Future<ScorekeeperSession> login({required String login, required String password});
  Future<List<Match>> getMatches(String token);
  Future<LivePayload?> recordPoint(String token, int matchId, PointInput input);
  Future<LivePayload?> undo(String token, int matchId);
  Future<LivePayload?> endMatch(String token, int matchId, {required int winningTeamId, String? reason});
  Future<LivePayload?> correctPoint(String token, int matchId, int pointId, PointInput input, {required String reason});
  Future<LivePayload?> updateDetails(String token, int matchId, int pointId, PointInput input);
}

class ScorekeeperRemoteDataSourceImpl implements ScorekeeperRemoteDataSource {
  final Dio dio;

  ScorekeeperRemoteDataSourceImpl(this.dio);

  Options _auth(String token) => Options(headers: {'Authorization': 'Bearer $token'});

  LivePayload? _payload(Response response) {
    final data = ApiEnvelope.data(response);
    if (data is! Map || data['match_id'] == null) return null;
    return LivePayloadModel.fromJson(data.cast<String, dynamic>()).toEntity();
  }

  @override
  Future<ScorekeeperSession> login({required String login, required String password}) async {
    final response = await dio.post(ApiEndpoints.scorekeeperLogin, data: {'login': login, 'password': password});
    final data = ApiEnvelope.map(response);
    final staff = (data['staff'] as Map?)?.cast<String, dynamic>() ?? const {};
    return ScorekeeperSession(token: data['token'] as String, staffName: staff['name']?.toString(), staff: staff);
  }

  @override
  Future<List<Match>> getMatches(String token) async {
    final response = await dio.get(ApiEndpoints.scorekeeperMatches, options: _auth(token));
    return ApiEnvelope.listOf(response, matchFromJson);
  }

  @override
  Future<LivePayload?> recordPoint(String token, int matchId, PointInput input) async {
    final response = await dio.post(
      ApiEndpoints.scorekeeperPoints(matchId),
      data: input.toJson(),
      options: _auth(token),
    );
    return _payload(response);
  }

  @override
  Future<LivePayload?> undo(String token, int matchId) async {
    final response = await dio.post(ApiEndpoints.scorekeeperUndo(matchId), options: _auth(token));
    return _payload(response);
  }

  @override
  Future<LivePayload?> endMatch(String token, int matchId, {required int winningTeamId, String? reason}) async {
    final response = await dio.post(
      ApiEndpoints.scorekeeperEnd(matchId),
      data: {'winning_team_id': winningTeamId, if (reason != null && reason.isNotEmpty) 'reason': reason},
      options: _auth(token),
    );
    return _payload(response);
  }

  @override
  Future<LivePayload?> correctPoint(
    String token,
    int matchId,
    int pointId,
    PointInput input, {
    required String reason,
  }) async {
    final response = await dio.put(
      ApiEndpoints.scorekeeperPoint(matchId, pointId),
      data: {...input.toJson(), 'reason': reason},
      options: _auth(token),
    );
    return _payload(response);
  }

  @override
  Future<LivePayload?> updateDetails(String token, int matchId, int pointId, PointInput input) async {
    final json = input.toJson()..remove('winning_team_id');
    final response = await dio.patch(
      ApiEndpoints.scorekeeperPointDetails(matchId, pointId),
      data: json,
      options: _auth(token),
    );
    return _payload(response);
  }
}
