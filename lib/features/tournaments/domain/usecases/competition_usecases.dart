import '../../../../core/network/api_result.dart';
import '../../../../core/network/pagination_meta.dart';
import '../../../premium/domain/entities/premium.dart';
import '../entities/category_detail.dart';
import '../entities/live_payload.dart';
import '../entities/match.dart';
import '../entities/registration.dart';
import '../repositories/tournaments_repository.dart';

class GetCategoryDetailUseCase {
  final TournamentsRepository repository;
  GetCategoryDetailUseCase(this.repository);
  ApiResult<CategoryDetail> call(int tournamentId, int categoryId) =>
      repository.getCategoryDetail(tournamentId, categoryId);
}

class GetTournamentMatchesUseCase {
  final TournamentsRepository repository;
  GetTournamentMatchesUseCase(this.repository);
  ApiResult<List<Match>> call(int tournamentId, {int? categoryId, String? status, String? round, DateTime? date}) =>
      repository.getMatches(tournamentId, categoryId: categoryId, status: status, round: round, date: date);
}

class GetTournamentResultsUseCase {
  final TournamentsRepository repository;
  GetTournamentResultsUseCase(this.repository);
  ApiResult<List<Match>> call(int tournamentId) => repository.getResults(tournamentId);
}

class GetAllLiveMatchesUseCase {
  final TournamentsRepository repository;
  GetAllLiveMatchesUseCase(this.repository);
  ApiResult<List<Match>> call() => repository.getAllLiveMatches();
}

class GetMatchByIdUseCase {
  final TournamentsRepository repository;
  GetMatchByIdUseCase(this.repository);
  ApiResult<Match> call(int matchId) => repository.getMatchById(matchId);
}

class GetMatchLiveUseCase {
  final TournamentsRepository repository;
  GetMatchLiveUseCase(this.repository);
  ApiResult<LivePayload> call(int matchId, {int? sinceVersion}) =>
      repository.getMatchLive(matchId, sinceVersion: sinceVersion);
}

class GetMatchPointsUseCase {
  final TournamentsRepository repository;
  GetMatchPointsUseCase(this.repository);
  ApiResult<List<PointEvent>> call(int matchId, {bool includeVoided = false}) =>
      repository.getMatchPoints(matchId, includeVoided: includeVoided);
}

class CheckEligibilityUseCase {
  final TournamentsRepository repository;
  CheckEligibilityUseCase(this.repository);
  ApiResult<Eligibility> call(int tournamentId, int categoryId, {String? partnerPlayerId}) =>
      repository.getEligibility(tournamentId, categoryId, partnerPlayerId: partnerPlayerId);
}

class RegisterForCategoryUseCase {
  final TournamentsRepository repository;
  RegisterForCategoryUseCase(this.repository);
  ApiResult<Registration> call(int tournamentId, int categoryId, {String? partnerPlayerId, String? notes, String? teamName, String? paymentMethod}) =>
      repository.register(tournamentId, categoryId, partnerPlayerId: partnerPlayerId, notes: notes, teamName: teamName, paymentMethod: paymentMethod);
}

class GetMyRegistrationsUseCase {
  final TournamentsRepository repository;
  GetMyRegistrationsUseCase(this.repository);
  ApiResult<Paginated<Registration>> call({String? status, int page = 1}) =>
      repository.getMyRegistrations(status: status, page: page);
}

class RenameTeamUseCase {
  final TournamentsRepository repository;
  RenameTeamUseCase(this.repository);
  ApiResult<Registration?> call(int registrationId, String teamName) => repository.renameTeam(registrationId, teamName);
}

class RespondAsPartnerUseCase {
  final TournamentsRepository repository;
  RespondAsPartnerUseCase(this.repository);
  ApiResult<Registration?> call(int registrationId, {required bool accept}) =>
      repository.respondAsPartner(registrationId, accept: accept);
}

class CancelRegistrationUseCase {
  final TournamentsRepository repository;
  CancelRegistrationUseCase(this.repository);
  ApiResult<Registration?> call(int registrationId) => repository.cancelRegistration(registrationId);
}

class ChangeRegistrationPartnerUseCase {
  final TournamentsRepository repository;
  ChangeRegistrationPartnerUseCase(this.repository);
  ApiResult<Registration?> call(int registrationId, String partnerPlayerId) =>
      repository.changePartner(registrationId, partnerPlayerId);
}

class PayRegistrationUseCase {
  final TournamentsRepository repository;
  PayRegistrationUseCase(this.repository);
  ApiResult<Payment> call(int registrationId) => repository.payRegistration(registrationId);
}
