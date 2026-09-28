import '../../../../core/network/api_result.dart';
import '../../../../core/network/pagination_meta.dart';
import '../entities/duo_media.dart';
import '../entities/partner.dart';
import '../repositories/partners_repository.dart';

class GetPartnersUseCase {
  final PartnersRepository repository;
  GetPartnersUseCase(this.repository);
  ApiResult<PartnersOverview> call(String playerId) => repository.getPartners(playerId);
}

class GetRecommendedPartnersUseCase {
  final PartnersRepository repository;
  GetRecommendedPartnersUseCase(this.repository);
  ApiResult<PartnerRecommendations> call({int limit = 10}) => repository.getRecommended(limit: limit);
}

class GetPartnerRequestsUseCase {
  final PartnersRepository repository;
  GetPartnerRequestsUseCase(this.repository);
  ApiResult<Paginated<PartnerRequest>> call({required bool incoming, String? status, int page = 1}) =>
      repository.getRequests(incoming: incoming, status: status, page: page);
}

class SendPartnerRequestUseCase {
  final PartnersRepository repository;
  SendPartnerRequestUseCase(this.repository);
  ApiResult<PartnerRequest> call(String playerId, {String? message}) =>
      repository.sendRequest(playerId, message: message);
}

class RespondPartnerRequestUseCase {
  final PartnersRepository repository;
  RespondPartnerRequestUseCase(this.repository);
  ApiResult<void> call(int requestId, {required bool accept}) => repository.respond(requestId, accept: accept);
}

class CancelPartnerRequestUseCase {
  final PartnersRepository repository;
  CancelPartnerRequestUseCase(this.repository);
  ApiResult<void> call(int requestId) => repository.cancel(requestId);
}

class RemoveMainPartnerUseCase {
  final PartnersRepository repository;
  RemoveMainPartnerUseCase(this.repository);
  ApiResult<void> call() => repository.removeMainPartner();
}

class GetDuo3dUseCase {
  final PartnersRepository repository;
  GetDuo3dUseCase(this.repository);
  ApiResult<DuoMediaState> call() => repository.getDuo3d();
}

class RequestDuo3dUseCase {
  final PartnersRepository repository;
  RequestDuo3dUseCase(this.repository);
  ApiResult<DuoMedia> call() => repository.requestDuo3d();
}
