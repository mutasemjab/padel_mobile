import '../../../../core/network/api_result.dart';
import '../../../../core/network/pagination_meta.dart';
import '../entities/tournament.dart';
import '../repositories/tournaments_repository.dart';

class GetTournamentsUseCase {
  final TournamentsRepository repository;

  GetTournamentsUseCase(this.repository);

  ApiResult<Paginated<Tournament>> call({
    String? status,
    String? competitionType,
    String? q,
    bool upcoming = false,
    int page = 1,
  }) =>
      repository.getTournaments(
        status: status,
        competitionType: competitionType,
        q: q,
        upcoming: upcoming,
        page: page,
      );
}
