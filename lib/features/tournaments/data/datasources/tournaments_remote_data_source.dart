import 'package:dio/dio.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/api_envelope.dart';
import '../../../../core/network/pagination_meta.dart';
import '../../../premium/data/models/premium_models.dart';
import '../../../premium/domain/entities/premium.dart';
import '../../domain/entities/category_detail.dart';
import '../../domain/entities/live_payload.dart';
import '../../domain/entities/match.dart';
import '../../domain/entities/registration.dart';
import '../models/category_detail_model.dart';
import '../models/live_payload_model.dart';
import '../models/match_model.dart';
import '../models/registration_model.dart';
import '../models/tournament_model.dart';

class TournamentQuery {
  final String? status;
  final String? competitionType;
  final String? q;
  final String? city;
  final bool upcoming;

  const TournamentQuery({this.status, this.competitionType, this.q, this.city, this.upcoming = false});

  Map<String, dynamic> toQuery() => {
        'status': ?status,
        'competition_type': ?competitionType,
        if (q != null && q!.isNotEmpty) 'q': q,
        if (city != null && city!.isNotEmpty) 'city': city,
        if (upcoming) 'upcoming': 1,
      };
}

class MatchQuery {
  final int? categoryId;
  final String? status;
  final String? round;
  final DateTime? date;

  const MatchQuery({this.categoryId, this.status, this.round, this.date});

  Map<String, dynamic> toQuery() => {
        'category_id': ?categoryId,
        'status': ?status,
        'round': ?round,
        if (date != null)
          'date': '${date!.year.toString().padLeft(4, '0')}-${date!.month.toString().padLeft(2, '0')}-${date!.day.toString().padLeft(2, '0')}',
      };
}

abstract class TournamentsRemoteDataSource {
  Future<Paginated<TournamentModel>> getTournaments({TournamentQuery query = const TournamentQuery(), int page = 1});
  Future<TournamentModel> getTournament(int id);
  Future<CategoryDetail> getCategoryDetail(int tournamentId, int categoryId);
  Future<List<Match>> getMatches(int tournamentId, {MatchQuery query = const MatchQuery()});
  Future<List<Match>> getResults(int tournamentId);
  Future<List<MatchModel>> getLiveMatches(int tournamentId);
  Future<MatchModel> getMatch(int tournamentId, int matchId);
  Future<List<Match>> getAllLiveMatches();
  Future<Match> getMatchById(int matchId);
  Future<LivePayload> getMatchLive(int matchId, {int? sinceVersion});
  Future<List<PointEvent>> getMatchPoints(int matchId, {bool includeVoided = false});
  Future<Eligibility> getEligibility(int tournamentId, int categoryId, {String? partnerPlayerId});
  Future<Registration> register(int tournamentId, int categoryId, {String? partnerPlayerId, String? notes, String? teamName});
  Future<Registration?> renameTeam(int registrationId, String teamName);
  Future<Paginated<Registration>> getMyRegistrations({String? status, int page = 1});
  Future<Registration?> cancelRegistration(int registrationId);
  Future<Registration?> changePartner(int registrationId, String partnerPlayerId);
  Future<Registration?> respondAsPartner(int registrationId, {required bool accept});
  Future<Payment> payRegistration(int registrationId);
}

class TournamentsRemoteDataSourceImpl implements TournamentsRemoteDataSource {
  final Dio dio;

  TournamentsRemoteDataSourceImpl(this.dio);

  @override
  Future<Paginated<TournamentModel>> getTournaments({
    TournamentQuery query = const TournamentQuery(),
    int page = 1,
  }) async {
    final response = await dio.get(ApiEndpoints.tournaments, queryParameters: {...query.toQuery(), 'page': page});
    return ApiEnvelope.paginated(response, TournamentModel.fromJson);
  }

  @override
  Future<TournamentModel> getTournament(int id) async {
    final response = await dio.get(ApiEndpoints.tournament(id));
    return TournamentModel.fromJson(ApiEnvelope.map(response));
  }

  @override
  Future<CategoryDetail> getCategoryDetail(int tournamentId, int categoryId) async {
    final response = await dio.get(ApiEndpoints.tournamentCategory(tournamentId, categoryId));
    return CategoryDetailModel.fromJson(ApiEnvelope.map(response)).toEntity();
  }

  @override
  Future<List<Match>> getMatches(int tournamentId, {MatchQuery query = const MatchQuery()}) async {
    final response = await dio.get(ApiEndpoints.tournamentMatches(tournamentId), queryParameters: query.toQuery());
    return ApiEnvelope.listOf(response, matchFromJson);
  }

  @override
  Future<List<Match>> getResults(int tournamentId) async {
    final response = await dio.get(ApiEndpoints.tournamentResults(tournamentId));
    return ApiEnvelope.listOf(response, matchFromJson);
  }

  @override
  Future<List<MatchModel>> getLiveMatches(int tournamentId) async {
    final response = await dio.get(ApiEndpoints.tournamentLive(tournamentId));
    return ApiEnvelope.listOf(response, MatchModel.fromJson);
  }

  @override
  Future<MatchModel> getMatch(int tournamentId, int matchId) async {
    final response = await dio.get(ApiEndpoints.tournamentMatch(tournamentId, matchId));
    return MatchModel.fromJson(ApiEnvelope.map(response));
  }

  @override
  Future<List<Match>> getAllLiveMatches() async {
    final response = await dio.get(ApiEndpoints.liveMatches);
    return ApiEnvelope.listOf(response, matchFromJson);
  }

  @override
  Future<Match> getMatchById(int matchId) async {
    final response = await dio.get(ApiEndpoints.match(matchId));
    return matchFromJson(ApiEnvelope.map(response));
  }

  @override
  Future<LivePayload> getMatchLive(int matchId, {int? sinceVersion}) async {
    final response = await dio.get(
      ApiEndpoints.matchLive(matchId),
      queryParameters: {'since_version': ?sinceVersion},
    );
    final interval = (ApiEnvelope.meta(response)?['poll_interval_seconds'] as num?)?.toInt();
    return LivePayloadModel.fromJson(ApiEnvelope.map(response)).toEntity(pollIntervalSeconds: interval);
  }

  @override
  Future<List<PointEvent>> getMatchPoints(int matchId, {bool includeVoided = false}) async {
    final response = await dio.get(
      ApiEndpoints.matchPoints(matchId),
      queryParameters: {'include_voided': includeVoided ? 1 : 0},
    );
    return ApiEnvelope.listOf(response, (j) => PointEventModel.fromJson(j).toEntity());
  }

  @override
  Future<Eligibility> getEligibility(int tournamentId, int categoryId, {String? partnerPlayerId}) async {
    final response = await dio.get(
      ApiEndpoints.categoryEligibility(tournamentId, categoryId),
      queryParameters: {'partner_player_id': ?partnerPlayerId},
    );
    return EligibilityModel.fromJson(ApiEnvelope.map(response)).toEntity();
  }

  @override
  Future<Registration> register(int tournamentId, int categoryId, {String? partnerPlayerId, String? notes, String? teamName}) async {
    final response = await dio.post(ApiEndpoints.categoryRegistrations(tournamentId, categoryId), data: {
      'partner_player_id': ?partnerPlayerId,
      'team_name': ?teamName,
      if (notes != null && notes.isNotEmpty) 'notes': notes,
    });
    return registrationFromJson(ApiEnvelope.map(response));
  }

  @override
  Future<Paginated<Registration>> getMyRegistrations({String? status, int page = 1}) async {
    final response = await dio.get(ApiEndpoints.myRegistrations, queryParameters: {'status': ?status, 'page': page});
    return ApiEnvelope.paginated(response, registrationFromJson);
  }

  Registration? _optionalRegistration(Response response) {
    final data = ApiEnvelope.data(response);
    return data is Map ? registrationFromJson(data.cast<String, dynamic>()) : null;
  }

  @override
  Future<Registration?> cancelRegistration(int registrationId) async {
    final response = await dio.post(ApiEndpoints.registrationCancel(registrationId));
    return _optionalRegistration(response);
  }

  @override
  Future<Registration?> changePartner(int registrationId, String partnerPlayerId) async {
    final response = await dio.put(
      ApiEndpoints.registrationPartner(registrationId),
      data: {'partner_player_id': partnerPlayerId},
    );
    return _optionalRegistration(response);
  }

  @override
  Future<Registration?> renameTeam(int registrationId, String teamName) async {
    final response = await dio.put(ApiEndpoints.registrationUpdate(registrationId), data: {'team_name': teamName});
    return _optionalRegistration(response);
  }

  @override
  Future<Registration?> respondAsPartner(int registrationId, {required bool accept}) async {
    final response = await dio.post(
      ApiEndpoints.registrationPartnerResponse(registrationId),
      data: {'accept': accept},
    );
    return _optionalRegistration(response);
  }

  @override
  Future<Payment> payRegistration(int registrationId) async {
    final response = await dio.post(ApiEndpoints.registrationPay(registrationId));
    return paymentFromJson(ApiEnvelope.map(response));
  }
}
