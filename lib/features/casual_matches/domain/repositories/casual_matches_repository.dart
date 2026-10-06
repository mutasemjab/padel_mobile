import '../../../../core/network/api_result.dart';
import '../../../../core/network/pagination_meta.dart';
import '../entities/casual_match.dart';

abstract class CasualMatchesRepository {
  ApiResult<Paginated<CasualMatch>> getCasualMatches({
    String? matchType,
    String? level,
    int? venueId,
    String? city,
    int page = 1,
  });

  ApiResult<CasualMatch> getCasualMatch(int id);

  ApiResult<void> createCasualMatch({
    String? title,
    int? venueId,
    int? courtId,
    required String matchType,
    required DateTime scheduledAt,
    String? requiredLevel,
    String? preferredSide,
    String? notes,
  });

  ApiResult<void> joinCasualMatch(int id);
  ApiResult<void> leaveCasualMatch(int id);
  ApiResult<void> cancelCasualMatch(int id);
  ApiResult<void> respondToParticipant(int id, int participantId, {required bool accept});

  /// `role`: `created | joined`.
  ApiResult<Paginated<CasualMatch>> getMyCasualMatches({required bool created, int page = 1});

  /// Creator edits (title, scheduled_at, venue_id, court_id, notes); players are notified of time/place changes.
  ApiResult<void> updateCasualMatch(int id, Map<String, dynamic> fields);
  ApiResult<void> invitePlayer(int id, String playerId);
  ApiResult<void> respondToInvitation(int id, {required bool accept});
}
