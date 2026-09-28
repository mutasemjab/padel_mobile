import '../../../../core/network/api_result.dart';
import '../../../../core/network/pagination_meta.dart';
import '../entities/duo_media.dart';
import '../entities/partner.dart';

abstract class PartnersRepository {
  ApiResult<PartnersOverview> getPartners(String playerId);
  ApiResult<PartnerRecommendations> getRecommended({int limit = 10});
  ApiResult<Paginated<PartnerRequest>> getRequests({required bool incoming, String? status, int page = 1});
  ApiResult<PartnerRequest> sendRequest(String playerId, {String? message});
  ApiResult<void> respond(int requestId, {required bool accept});
  ApiResult<void> cancel(int requestId);
  ApiResult<void> removeMainPartner();

  /// Duo 3D scene of the player and their main partner (Higgsfield).
  ApiResult<DuoMediaState> getDuo3d();
  ApiResult<DuoMedia> requestDuo3d();
}
