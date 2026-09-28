import '../../../../core/network/api_result.dart';
import '../entities/tournament.dart';
import '../repositories/tournaments_repository.dart';

class GetTournamentDetailUseCase {
  final TournamentsRepository repository;

  GetTournamentDetailUseCase(this.repository);

  ApiResult<Tournament> call(int id) => repository.getTournament(id);
}
