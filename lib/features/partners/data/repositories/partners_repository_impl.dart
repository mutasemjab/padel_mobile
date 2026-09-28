import '../../../../core/network/api_result.dart';
import '../../../../core/network/guard.dart';
import '../../../../core/network/pagination_meta.dart';
import '../../domain/entities/duo_media.dart';
import '../../domain/entities/partner.dart';
import '../../domain/repositories/partners_repository.dart';
import '../datasources/partners_remote_data_source.dart';

class PartnersRepositoryImpl implements PartnersRepository {
  final PartnersRemoteDataSource remote;

  PartnersRepositoryImpl(this.remote);

  @override
  ApiResult<PartnersOverview> getPartners(String playerId) => guard(() => remote.getPartners(playerId));

  @override
  ApiResult<PartnerRecommendations> getRecommended({int limit = 10}) =>
      guard(() => remote.getRecommended(limit: limit));

  @override
  ApiResult<Paginated<PartnerRequest>> getRequests({required bool incoming, String? status, int page = 1}) =>
      guard(() => remote.getRequests(direction: incoming ? 'incoming' : 'outgoing', status: status, page: page));

  @override
  ApiResult<PartnerRequest> sendRequest(String playerId, {String? message}) =>
      guard(() => remote.sendRequest(playerId, message: message));

  @override
  ApiResult<void> respond(int requestId, {required bool accept}) =>
      guard(() => remote.respond(requestId, accept: accept));

  @override
  ApiResult<void> cancel(int requestId) => guard(() => remote.cancel(requestId));

  @override
  ApiResult<void> removeMainPartner() => guard(remote.removeMainPartner);

  @override
  ApiResult<DuoMediaState> getDuo3d() => guard(remote.getDuo3d);

  @override
  ApiResult<DuoMedia> requestDuo3d() => guard(remote.requestDuo3d);
}
