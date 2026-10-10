import '../../../../core/network/api_result.dart';
import '../../../../core/network/guard.dart';
import '../../../../core/network/pagination_meta.dart';
import '../../../premium/domain/entities/premium.dart';
import '../../domain/entities/category_detail.dart';
import '../../domain/entities/live_payload.dart';
import '../../domain/entities/match.dart';
import '../../domain/entities/registration.dart';
import '../../domain/entities/tournament.dart';
import '../../domain/repositories/tournaments_repository.dart';
import '../datasources/tournaments_remote_data_source.dart';
import '../models/match_model.dart';
import '../models/tournament_model.dart';

class TournamentsRepositoryImpl implements TournamentsRepository {
  final TournamentsRemoteDataSource remote;

  TournamentsRepositoryImpl(this.remote);

  @override
  ApiResult<Paginated<Tournament>> getTournaments({
    String? status,
    String? competitionType,
    String? q,
    String? city,
    bool upcoming = false,
    int page = 1,
  }) =>
      guard(() async {
        final result = await remote.getTournaments(
          query: TournamentQuery(status: status, competitionType: competitionType, q: q, city: city, upcoming: upcoming),
          page: page,
        );
        return result.map((t) => t.toEntity());
      });

  @override
  ApiResult<Tournament> getTournament(int id) => guard(() async => (await remote.getTournament(id)).toEntity());

  @override
  ApiResult<CategoryDetail> getCategoryDetail(int tournamentId, int categoryId) =>
      guard(() => remote.getCategoryDetail(tournamentId, categoryId));

  @override
  ApiResult<List<Match>> getMatches(
    int tournamentId, {
    int? categoryId,
    String? status,
    String? round,
    DateTime? date,
  }) =>
      guard(() => remote.getMatches(
            tournamentId,
            query: MatchQuery(categoryId: categoryId, status: status, round: round, date: date),
          ));

  @override
  ApiResult<List<Match>> getResults(int tournamentId) => guard(() => remote.getResults(tournamentId));

  @override
  ApiResult<List<Match>> getLiveMatches(int tournamentId) =>
      guard(() async => (await remote.getLiveMatches(tournamentId)).map((m) => m.toEntity()).toList());

  @override
  ApiResult<Match> getMatch(int tournamentId, int matchId) =>
      guard(() async => (await remote.getMatch(tournamentId, matchId)).toEntity());

  @override
  ApiResult<List<Match>> getAllLiveMatches() => guard(remote.getAllLiveMatches);

  @override
  ApiResult<Match> getMatchById(int matchId) => guard(() => remote.getMatchById(matchId));

  @override
  ApiResult<LivePayload> getMatchLive(int matchId, {int? sinceVersion}) =>
      guard(() => remote.getMatchLive(matchId, sinceVersion: sinceVersion));

  @override
  ApiResult<List<PointEvent>> getMatchPoints(int matchId, {bool includeVoided = false}) =>
      guard(() => remote.getMatchPoints(matchId, includeVoided: includeVoided));

  @override
  ApiResult<Eligibility> getEligibility(int tournamentId, int categoryId, {String? partnerPlayerId}) =>
      guard(() => remote.getEligibility(tournamentId, categoryId, partnerPlayerId: partnerPlayerId));

  @override
  ApiResult<Registration> register(int tournamentId, int categoryId, {String? partnerPlayerId, String? notes, String? teamName, String? paymentMethod}) =>
      guard(() => remote.register(tournamentId, categoryId, partnerPlayerId: partnerPlayerId, notes: notes, teamName: teamName, paymentMethod: paymentMethod));

  @override
  ApiResult<Registration?> renameTeam(int registrationId, String teamName) =>
      guard(() => remote.renameTeam(registrationId, teamName));

  @override
  ApiResult<Paginated<Registration>> getMyRegistrations({String? status, int page = 1}) =>
      guard(() => remote.getMyRegistrations(status: status, page: page));

  @override
  ApiResult<Registration?> cancelRegistration(int registrationId) =>
      guard(() => remote.cancelRegistration(registrationId));

  @override
  ApiResult<Registration?> changePartner(int registrationId, String partnerPlayerId) =>
      guard(() => remote.changePartner(registrationId, partnerPlayerId));

  @override
  ApiResult<Registration?> respondAsPartner(int registrationId, {required bool accept}) =>
      guard(() => remote.respondAsPartner(registrationId, accept: accept));

  @override
  ApiResult<Payment> payRegistration(int registrationId) => guard(() => remote.payRegistration(registrationId));
}
