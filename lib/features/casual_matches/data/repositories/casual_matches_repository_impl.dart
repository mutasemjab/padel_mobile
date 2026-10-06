import '../../../../core/network/api_result.dart';
import '../../../../core/network/guard.dart';
import '../../../../core/network/pagination_meta.dart';
import '../../domain/entities/casual_match.dart';
import '../../domain/repositories/casual_matches_repository.dart';
import '../datasources/casual_matches_remote_data_source.dart';
import '../models/casual_match_model.dart';

class CasualMatchesRepositoryImpl implements CasualMatchesRepository {
  final CasualMatchesRemoteDataSource remote;

  CasualMatchesRepositoryImpl(this.remote);

  @override
  ApiResult<Paginated<CasualMatch>> getCasualMatches({
    String? matchType,
    String? level,
    int? venueId,
    String? city,
    int page = 1,
  }) =>
      guard(() async {
        final result = await remote.getCasualMatches(
          matchType: matchType,
          level: level,
          venueId: venueId,
          city: city,
          page: page,
        );
        return result.map((e) => e.toEntity());
      });

  @override
  ApiResult<CasualMatch> getCasualMatch(int id) => guard(() => remote.getCasualMatch(id));

  @override
  ApiResult<void> createCasualMatch({
    String? title,
    int? venueId,
    int? courtId,
    required String matchType,
    required DateTime scheduledAt,
    String? requiredLevel,
    String? preferredSide,
    String? notes,
  }) =>
      guard(() => remote.createCasualMatch(
            title: title,
            venueId: venueId,
            courtId: courtId,
            matchType: matchType,
            scheduledAt: scheduledAt,
            requiredLevel: requiredLevel,
            preferredSide: preferredSide,
            notes: notes,
          ));

  @override
  ApiResult<void> joinCasualMatch(int id) => guard(() => remote.joinCasualMatch(id));

  @override
  ApiResult<void> leaveCasualMatch(int id) => guard(() => remote.leaveCasualMatch(id));

  @override
  ApiResult<void> cancelCasualMatch(int id) => guard(() => remote.cancelCasualMatch(id));

  @override
  ApiResult<void> respondToParticipant(int id, int participantId, {required bool accept}) =>
      guard(() => remote.respondToParticipant(id, participantId, accept: accept));

  @override
  ApiResult<Paginated<CasualMatch>> getMyCasualMatches({required bool created, int page = 1}) =>
      guard(() => remote.getMyCasualMatches(role: created ? 'created' : 'joined', page: page));

  @override
  ApiResult<void> updateCasualMatch(int id, Map<String, dynamic> fields) => guard(() => remote.updateCasualMatch(id, fields));

  @override
  ApiResult<void> invitePlayer(int id, String playerId) => guard(() => remote.invitePlayer(id, playerId));

  @override
  ApiResult<void> respondToInvitation(int id, {required bool accept}) =>
      guard(() => remote.respondToInvitation(id, accept: accept));
}
