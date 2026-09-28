import '../../../../core/network/api_result.dart';
import '../../../../core/network/pagination_meta.dart';
import '../entities/coach.dart';
import '../repositories/coaches_repository.dart';

class GetCoachesUseCase {
  final CoachesRepository repository;

  GetCoachesUseCase(this.repository);

  ApiResult<Paginated<Coach>> call({
    String? q,
    String? city,
    String? specialty,
    String? trainingType,
    num? maxPrice,
    String? sort,
    int page = 1,
  }) =>
      repository.getCoaches(
        q: q,
        city: city,
        specialty: specialty,
        trainingType: trainingType,
        maxPrice: maxPrice,
        sort: sort,
        page: page,
      );
}
