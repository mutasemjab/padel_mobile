import '../../../../core/network/api_result.dart';
import '../repositories/casual_matches_repository.dart';

class CreateCasualMatchUseCase {
  final CasualMatchesRepository repository;

  CreateCasualMatchUseCase(this.repository);

  ApiResult<void> call({
    String? title,
    int? venueId,
    int? courtId,
    required String matchType,
    required DateTime scheduledAt,
    String? requiredLevel,
    String? preferredSide,
    String? notes,
  }) =>
      repository.createCasualMatch(
        title: title,
        venueId: venueId,
        courtId: courtId,
        matchType: matchType,
        scheduledAt: scheduledAt,
        requiredLevel: requiredLevel,
        preferredSide: preferredSide,
        notes: notes,
      );
}
