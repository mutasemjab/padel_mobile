import '../../../../core/network/api_result.dart';
import '../../../../core/network/pagination_meta.dart';
import '../../../../core/state/base_cubits.dart';
import '../../domain/entities/partner.dart';
import '../../domain/usecases/partners_usecases.dart';

class PartnersOverviewCubit extends ViewCubit<PartnersOverview> {
  final GetPartnersUseCase getPartners;
  final String playerId;

  PartnersOverviewCubit(this.getPartners, this.playerId);

  @override
  ApiResult<PartnersOverview> fetch() => getPartners(playerId);

  @override
  bool isEmpty(PartnersOverview data) => false;
}

class RecommendedPartnersCubit extends ViewCubit<PartnerRecommendations> {
  final GetRecommendedPartnersUseCase getRecommended;

  RecommendedPartnersCubit(this.getRecommended);

  @override
  ApiResult<PartnerRecommendations> fetch() => getRecommended();

  @override
  bool isEmpty(PartnerRecommendations data) => false;
}

class PartnerRequestsCubit extends PagedCubit<PartnerRequest> {
  final GetPartnerRequestsUseCase getRequests;
  final bool incoming;

  PartnerRequestsCubit(this.getRequests, {required this.incoming});

  @override
  ApiResult<Paginated<PartnerRequest>> fetchPage(int page) =>
      getRequests(incoming: incoming, status: 'pending', page: page);
}

/// Send / accept / decline / cancel partner requests and drop the main partner.
class PartnerActionCubit extends ActionCubit {
  final SendPartnerRequestUseCase sendRequest;
  final RespondPartnerRequestUseCase respondRequest;
  final CancelPartnerRequestUseCase cancelRequest;
  final RemoveMainPartnerUseCase removeMainPartner;

  PartnerActionCubit({
    required this.sendRequest,
    required this.respondRequest,
    required this.cancelRequest,
    required this.removeMainPartner,
  });

  Future<bool> send(String playerId, {String? message}) => run(() => sendRequest(playerId, message: message));

  Future<bool> respond(int requestId, {required bool accept}) => run(() => respondRequest(requestId, accept: accept));

  Future<bool> cancel(int requestId) => run(() => cancelRequest(requestId));

  Future<bool> removeMain() => run(removeMainPartner.call);
}
