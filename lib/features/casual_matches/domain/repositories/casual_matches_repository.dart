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
}
