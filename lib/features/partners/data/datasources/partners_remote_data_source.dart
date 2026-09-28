import 'package:dio/dio.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/api_envelope.dart';
import '../../../../core/network/pagination_meta.dart';
import '../../domain/entities/duo_media.dart';
import '../../domain/entities/partner.dart';
import '../models/duo_media_model.dart';
import '../models/partner_models.dart';

abstract class PartnersRemoteDataSource {
  Future<PartnersOverview> getPartners(String playerId);
  Future<PartnerRecommendations> getRecommended({int limit = 10});
  Future<Paginated<PartnerRequest>> getRequests({required String direction, String? status, int page = 1});
  Future<PartnerRequest> sendRequest(String playerId, {String? message});
  Future<void> respond(int requestId, {required bool accept});
  Future<void> cancel(int requestId);
  Future<void> removeMainPartner();
  Future<DuoMediaState> getDuo3d();
  Future<DuoMedia> requestDuo3d();
}

class PartnersRemoteDataSourceImpl implements PartnersRemoteDataSource {
  final Dio dio;

  PartnersRemoteDataSourceImpl(this.dio);

  @override
  Future<PartnersOverview> getPartners(String playerId) async {
    final response = await dio.get(ApiEndpoints.playerPartners(playerId));
    return partnersOverviewFromJson(ApiEnvelope.map(response));
  }

  @override
  Future<PartnerRecommendations> getRecommended({int limit = 10}) async {
    final response = await dio.get(ApiEndpoints.recommendedPartners, queryParameters: {'limit': limit});
    return PartnerRecommendationsModel.fromJson(ApiEnvelope.map(response)).toEntity();
  }

  @override
  Future<Paginated<PartnerRequest>> getRequests({required String direction, String? status, int page = 1}) async {
    final response = await dio.get(
      ApiEndpoints.myPartnerRequests,
      queryParameters: {'direction': direction, 'status': ?status, 'page': page},
    );
    return ApiEnvelope.paginated(response, (j) => PartnerRequestModel.fromJson(j).toEntity());
  }

  @override
  Future<PartnerRequest> sendRequest(String playerId, {String? message}) async {
    final response = await dio.post(
      ApiEndpoints.partnerRequests,
      data: {'player_id': playerId, if (message != null && message.isNotEmpty) 'message': message},
    );
    return PartnerRequestModel.fromJson(ApiEnvelope.map(response)).toEntity();
  }

  @override
  Future<void> respond(int requestId, {required bool accept}) async {
    await dio.post(ApiEndpoints.partnerRequestRespond(requestId), data: {'accept': accept});
  }

  @override
  Future<void> cancel(int requestId) async {
    await dio.post(ApiEndpoints.partnerRequestCancel(requestId));
  }

  @override
  Future<void> removeMainPartner() async {
    await dio.delete(ApiEndpoints.myMainPartner);
  }

  @override
  Future<DuoMediaState> getDuo3d() async {
    final response = await dio.get(ApiEndpoints.duo3d);
    return DuoMediaStateModel.fromJson(ApiEnvelope.map(response)).toEntity();
  }

  @override
  Future<DuoMedia> requestDuo3d() async {
    final response = await dio.post(ApiEndpoints.duo3d);
    return DuoMediaModel.fromJson(ApiEnvelope.map(response)).toEntity();
  }
}
