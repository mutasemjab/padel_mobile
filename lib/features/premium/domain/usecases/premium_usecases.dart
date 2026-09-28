import '../../../../core/network/api_result.dart';
import '../../../../core/network/pagination_meta.dart';
import '../entities/ai_insight.dart';
import '../entities/premium.dart';
import '../repositories/premium_repository.dart';

class GetPremiumPlansUseCase {
  final PremiumRepository repository;
  GetPremiumPlansUseCase(this.repository);
  ApiResult<PremiumCatalog> call() => repository.getPlans();
}

class GetPremiumStatusUseCase {
  final PremiumRepository repository;
  GetPremiumStatusUseCase(this.repository);
  ApiResult<PremiumStatus> call() => repository.getStatus();
}

class StartCheckoutUseCase {
  final PremiumRepository repository;
  StartCheckoutUseCase(this.repository);
  ApiResult<Payment> call(String planKey) => repository.checkout(planKey);
}

class GetMyPaymentsUseCase {
  final PremiumRepository repository;
  GetMyPaymentsUseCase(this.repository);
  ApiResult<Paginated<Payment>> call({int page = 1}) => repository.getMyPayments(page: page);
}

class GetPaymentUseCase {
  final PremiumRepository repository;
  GetPaymentUseCase(this.repository);
  ApiResult<Payment> call(String reference) => repository.getPayment(reference);
}

class GetAiInsightsUseCase {
  final PremiumRepository repository;
  GetAiInsightsUseCase(this.repository);
  ApiResult<AiInsightsOverview> call() => repository.getInsights();
}

class GenerateAiInsightUseCase {
  final PremiumRepository repository;
  GenerateAiInsightUseCase(this.repository);
  ApiResult<AiInsight> call(AiInsightType type, {bool refresh = false}) =>
      repository.generateInsight(type, refresh: refresh);
}

class GetAiInsightUseCase {
  final PremiumRepository repository;
  GetAiInsightUseCase(this.repository);
  ApiResult<AiInsight> call(int id) => repository.getInsight(id);
}

class GetMy3dProfileUseCase {
  final PremiumRepository repository;
  GetMy3dProfileUseCase(this.repository);
  ApiResult<ThreeDProfileState> call() => repository.getMy3dProfile();
}

class Request3dProfileUseCase {
  final PremiumRepository repository;
  Request3dProfileUseCase(this.repository);
  ApiResult<ThreeDAsset> call() => repository.request3dProfile();
}

class GetPlayer3dProfileUseCase {
  final PremiumRepository repository;
  GetPlayer3dProfileUseCase(this.repository);
  ApiResult<ThreeDAsset?> call(String playerId) => repository.getPlayer3dProfile(playerId);
}
