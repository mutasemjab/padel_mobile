import '../../../../core/network/api_result.dart';
import '../entities/coach.dart';
import '../repositories/coaches_repository.dart';

class GetCoachDetailUseCase {
  final CoachesRepository repository;

  GetCoachDetailUseCase(this.repository);

  ApiResult<Coach> call(int id) => repository.getCoach(id);
}
