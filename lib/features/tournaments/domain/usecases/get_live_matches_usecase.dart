import '../../../../core/network/api_result.dart';
import '../entities/match.dart';
import '../repositories/tournaments_repository.dart';

class GetLiveMatchesUseCase {
  final TournamentsRepository repository;

  GetLiveMatchesUseCase(this.repository);

  ApiResult<List<Match>> call(int tournamentId) => repository.getLiveMatches(tournamentId);
}
