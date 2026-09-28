import '../../../../core/network/api_result.dart';
import '../entities/match.dart';
import '../repositories/tournaments_repository.dart';

/// Powers both the tournament bracket/schedule and the live-match polling
/// screen (`live_match` feature reuses this instead of duplicating it).
class GetMatchUseCase {
  final TournamentsRepository repository;

  GetMatchUseCase(this.repository);

  ApiResult<Match> call(int tournamentId, int matchId) =>
      repository.getMatch(tournamentId, matchId);
}
