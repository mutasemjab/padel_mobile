import 'package:dio/dio.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/api_envelope.dart';
import '../../../../core/network/pagination_meta.dart';
import '../../domain/entities/casual_match.dart';
import '../models/casual_match_model.dart';

abstract class CasualMatchesRemoteDataSource {
  Future<Paginated<CasualMatchModel>> getCasualMatches({
    String? matchType,
    String? level,
    int? venueId,
    String? city,
    int page = 1,
  });

  Future<CasualMatch> getCasualMatch(int id);

  Future<CasualMatch?> createCasualMatch({
    int? venueId,
    int? courtId,
    required String matchType,
    required DateTime scheduledAt,
    String? requiredLevel,
    String? preferredSide,
    String? notes,
  });

  Future<CasualMatch?> joinCasualMatch(int id);
  Future<void> leaveCasualMatch(int id);
  Future<void> cancelCasualMatch(int id);
  Future<CasualMatch?> respondToParticipant(int id, int participantId, {required bool accept});
  Future<Paginated<CasualMatch>> getMyCasualMatches({required String role, int page = 1});
}

class CasualMatchesRemoteDataSourceImpl implements CasualMatchesRemoteDataSource {
  final Dio dio;

  CasualMatchesRemoteDataSourceImpl(this.dio);

  CasualMatch? _optional(Response response) {
    final data = ApiEnvelope.data(response);
    return data is Map ? casualMatchFromJson(data.cast<String, dynamic>()) : null;
  }

  @override
  Future<Paginated<CasualMatchModel>> getCasualMatches({
    String? matchType,
    String? level,
    int? venueId,
    String? city,
    int page = 1,
  }) async {
    final response = await dio.get(ApiEndpoints.casualMatches, queryParameters: {
      'match_type': ?matchType,
      'level': ?level,
      'venue_id': ?venueId,
      if (city != null && city.isNotEmpty) 'city': city,
      'page': page,
    });
    return ApiEnvelope.paginated(response, CasualMatchModel.fromJson);
  }

  @override
  Future<CasualMatch> getCasualMatch(int id) async {
    final response = await dio.get(ApiEndpoints.casualMatch(id));
    return casualMatchFromJson(ApiEnvelope.map(response));
  }

  @override
  Future<CasualMatch?> createCasualMatch({
    int? venueId,
    int? courtId,
    required String matchType,
    required DateTime scheduledAt,
    String? requiredLevel,
    String? preferredSide,
    String? notes,
  }) async {
    final response = await dio.post(ApiEndpoints.casualMatches, data: {
      'venue_id': ?venueId,
      'court_id': ?courtId,
      'match_type': matchType,
      'scheduled_at': scheduledAt.toIso8601String(),
      'required_level': ?requiredLevel,
      'preferred_side': ?preferredSide,
      if (notes != null && notes.isNotEmpty) 'notes': notes,
    });
    return _optional(response);
  }

  @override
  Future<CasualMatch?> joinCasualMatch(int id) async {
    final response = await dio.post(ApiEndpoints.casualMatchJoin(id));
    return _optional(response);
  }

  @override
  Future<void> leaveCasualMatch(int id) async {
    await dio.post(ApiEndpoints.casualMatchLeave(id));
  }

  @override
  Future<void> cancelCasualMatch(int id) async {
    await dio.post(ApiEndpoints.casualMatchCancel(id));
  }

  @override
  Future<CasualMatch?> respondToParticipant(int id, int participantId, {required bool accept}) async {
    final response = await dio.post(
      ApiEndpoints.casualParticipantRespond(id, participantId),
      data: {'accept': accept},
    );
    return _optional(response);
  }

  @override
  Future<Paginated<CasualMatch>> getMyCasualMatches({required String role, int page = 1}) async {
    final response = await dio.get(ApiEndpoints.myCasualMatches, queryParameters: {'role': role, 'page': page});
    return ApiEnvelope.paginated(response, casualMatchFromJson);
  }
}
