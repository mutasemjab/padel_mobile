import '../../../../core/network/api_result.dart';
import '../../../../core/network/pagination_meta.dart';
import '../../../premium/domain/entities/premium.dart';
import '../entities/category_detail.dart';
import '../entities/live_payload.dart';
import '../entities/match.dart';
import '../entities/registration.dart';
import '../entities/tournament.dart';

abstract class TournamentsRepository {
  ApiResult<Paginated<Tournament>> getTournaments({
    String? status,
    String? competitionType,
    String? q,
    String? city,
    bool upcoming = false,
    int page = 1,
  });
  ApiResult<Tournament> getTournament(int id);
  ApiResult<CategoryDetail> getCategoryDetail(int tournamentId, int categoryId);
  ApiResult<List<Match>> getMatches(int tournamentId, {int? categoryId, String? status, String? round, DateTime? date});
  ApiResult<List<Match>> getResults(int tournamentId);
  ApiResult<List<Match>> getLiveMatches(int tournamentId);
  ApiResult<Match> getMatch(int tournamentId, int matchId);
  ApiResult<List<Match>> getAllLiveMatches();
  ApiResult<Match> getMatchById(int matchId);
  ApiResult<LivePayload> getMatchLive(int matchId, {int? sinceVersion});
  ApiResult<List<PointEvent>> getMatchPoints(int matchId, {bool includeVoided = false});
  ApiResult<Eligibility> getEligibility(int tournamentId, int categoryId, {String? partnerPlayerId});
  ApiResult<Registration> register(int tournamentId, int categoryId, {String? partnerPlayerId, String? notes, String? teamName});

  /// The pair's team name; changeable until the tournament starts.
  ApiResult<Registration?> renameTeam(int registrationId, String teamName);
  ApiResult<Paginated<Registration>> getMyRegistrations({String? status, int page = 1});
  ApiResult<Registration?> cancelRegistration(int registrationId);
  ApiResult<Registration?> changePartner(int registrationId, String partnerPlayerId);

  /// The named partner accepts or declines the invitation (before the organizer reviews it).
  ApiResult<Registration?> respondAsPartner(int registrationId, {required bool accept});

  /// Payment, or `ProviderUnavailableFailure(PAYMENT_PROVIDER_NOT_CONFIGURED)`.
  ApiResult<Payment> payRegistration(int registrationId);
}
