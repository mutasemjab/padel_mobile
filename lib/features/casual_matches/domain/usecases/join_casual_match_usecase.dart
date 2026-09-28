import '../../../../core/network/api_result.dart';
import '../repositories/casual_matches_repository.dart';

class JoinCasualMatchUseCase {
  final CasualMatchesRepository repository;

  JoinCasualMatchUseCase(this.repository);

  ApiResult<void> call(int id) => repository.joinCasualMatch(id);
}
