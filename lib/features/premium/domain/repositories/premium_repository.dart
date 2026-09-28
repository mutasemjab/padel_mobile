import '../../../../core/network/api_result.dart';
import '../../../../core/network/pagination_meta.dart';
import '../entities/ai_insight.dart';
import '../entities/premium.dart';

abstract class PremiumRepository {
  ApiResult<PremiumCatalog> getPlans();
  ApiResult<PremiumStatus> getStatus();

  /// Payment to complete in the browser, or
  /// `ProviderUnavailableFailure(PAYMENT_PROVIDER_NOT_CONFIGURED)`.
  ApiResult<Payment> checkout(String planKey);
  ApiResult<Paginated<Payment>> getMyPayments({int page = 1});
  ApiResult<Payment> getPayment(String reference);
  ApiResult<AiInsightsOverview> getInsights();
  ApiResult<AiInsight> generateInsight(AiInsightType type, {bool refresh = false});
  ApiResult<AiInsight> getInsight(int id);
  ApiResult<ThreeDProfileState> getMy3dProfile();

  /// 202 asset, or `ProviderUnavailableFailure(THREE_D_PROVIDER_NOT_CONFIGURED)`,
  /// or a 400 "upload a photo first".
  ApiResult<ThreeDAsset> request3dProfile();
  ApiResult<ThreeDAsset?> getPlayer3dProfile(String playerId);
}
