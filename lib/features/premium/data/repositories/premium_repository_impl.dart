import '../../../../core/network/api_result.dart';
import '../../../../core/network/guard.dart';
import '../../../../core/network/pagination_meta.dart';
import '../../domain/entities/ai_insight.dart';
import '../../domain/entities/premium.dart';
import '../../domain/repositories/premium_repository.dart';
import '../datasources/premium_remote_data_source.dart';

class PremiumRepositoryImpl implements PremiumRepository {
  final PremiumRemoteDataSource remote;

  PremiumRepositoryImpl(this.remote);

  @override
  ApiResult<PremiumCatalog> getPlans() => guard(remote.getPlans);

  @override
  ApiResult<PremiumStatus> getStatus() => guard(remote.getStatus);

  @override
  ApiResult<Payment> checkout(String planKey) => guard(() => remote.checkout(planKey));

  @override
  ApiResult<Paginated<Payment>> getMyPayments({int page = 1}) => guard(() => remote.getMyPayments(page: page));

  @override
  ApiResult<Payment> getPayment(String reference) => guard(() => remote.getPayment(reference));

  @override
  ApiResult<AiInsightsOverview> getInsights() => guard(remote.getInsights);

  @override
  ApiResult<AiInsight> generateInsight(AiInsightType type, {bool refresh = false}) =>
      guard(() => remote.generateInsight(type, refresh: refresh));

  @override
  ApiResult<AiInsight> getInsight(int id) => guard(() => remote.getInsight(id));

  @override
  ApiResult<ThreeDProfileState> getMy3dProfile() => guard(remote.getMy3dProfile);

  @override
  ApiResult<ThreeDAsset> request3dProfile() => guard(remote.request3dProfile);

  @override
  ApiResult<ThreeDAsset?> getPlayer3dProfile(String playerId) => guard(() => remote.getPlayer3dProfile(playerId));
}
