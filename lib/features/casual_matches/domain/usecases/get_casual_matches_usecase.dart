import '../../../../core/network/api_result.dart';
import '../../../../core/network/pagination_meta.dart';
import '../entities/casual_match.dart';
import '../repositories/casual_matches_repository.dart';

class GetCasualMatchesUseCase {
  final CasualMatchesRepository repository;

  GetCasualMatchesUseCase(this.repository);

  ApiResult<Paginated<CasualMatch>> call({
    String? matchType,
    String? level,
    int? venueId,
    String? city,
    int page = 1,
  }) =>
      repository.getCasualMatches(matchType: matchType, level: level, venueId: venueId, city: city, page: page);
}
