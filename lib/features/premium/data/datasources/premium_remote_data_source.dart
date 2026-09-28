import 'package:dio/dio.dart';

import '../../../../core/constants/api_endpoints.dart';
import '../../../../core/network/api_envelope.dart';
import '../../../../core/network/pagination_meta.dart';
import '../../domain/entities/ai_insight.dart';
import '../../domain/entities/premium.dart';
import '../models/premium_models.dart';

abstract class PremiumRemoteDataSource {
  Future<PremiumCatalog> getPlans();
  Future<PremiumStatus> getStatus();
  Future<Payment> checkout(String planKey);
  Future<Paginated<Payment>> getMyPayments({int page = 1});
  Future<Payment> getPayment(String reference);
  Future<AiInsightsOverview> getInsights();
  Future<AiInsight> generateInsight(AiInsightType type, {bool refresh = false});
  Future<AiInsight> getInsight(int id);
  Future<ThreeDProfileState> getMy3dProfile();
  Future<ThreeDAsset> request3dProfile();
  Future<ThreeDAsset?> getPlayer3dProfile(String playerId);
}

class PremiumRemoteDataSourceImpl implements PremiumRemoteDataSource {
  final Dio dio;

  PremiumRemoteDataSourceImpl(this.dio);

  @override
  Future<PremiumCatalog> getPlans() async {
    final response = await dio.get(ApiEndpoints.premiumPlans);
    return PremiumCatalogModel.fromJson(ApiEnvelope.map(response)).toEntity();
  }

  @override
  Future<PremiumStatus> getStatus() async {
    final response = await dio.get(ApiEndpoints.premiumStatus);
    return PremiumStatusModel.fromJson(ApiEnvelope.map(response)).toEntity();
  }

  @override
  Future<Payment> checkout(String planKey) async {
    final response = await dio.post(ApiEndpoints.premiumCheckout, data: {'plan': planKey});
    return paymentFromJson(ApiEnvelope.map(response));
  }

  @override
  Future<Paginated<Payment>> getMyPayments({int page = 1}) async {
    final response = await dio.get(ApiEndpoints.myPayments, queryParameters: {'page': page});
    return ApiEnvelope.paginated(response, paymentFromJson);
  }

  @override
  Future<Payment> getPayment(String reference) async {
    final response = await dio.get(ApiEndpoints.payment(reference));
    return paymentFromJson(ApiEnvelope.map(response));
  }

  @override
  Future<AiInsightsOverview> getInsights() async {
    final response = await dio.get(ApiEndpoints.aiInsights);
    return aiInsightsOverviewFromJson(ApiEnvelope.map(response));
  }

  /// 202 (pending/processing) or 200 with the insight; `code:
  /// INSUFFICIENT_DATA` arrives as a normal 200 and is reflected in the
  /// insight's own status.
  @override
  Future<AiInsight> generateInsight(AiInsightType type, {bool refresh = false}) async {
    final response = await dio.post(
      ApiEndpoints.aiInsightGenerate(type.apiValue),
      data: {if (refresh) 'refresh': true},
    );
    return aiInsightFromJson(ApiEnvelope.map(response));
  }

  @override
  Future<AiInsight> getInsight(int id) async {
    final response = await dio.get(ApiEndpoints.aiInsight(id));
    return aiInsightFromJson(ApiEnvelope.map(response));
  }

  @override
  Future<ThreeDProfileState> getMy3dProfile() async {
    final response = await dio.get(ApiEndpoints.my3dProfile);
    return threeDProfileStateFromJson(ApiEnvelope.map(response));
  }

  @override
  Future<ThreeDAsset> request3dProfile() async {
    final response = await dio.post(ApiEndpoints.my3dProfile);
    return threeDAssetFromJson(ApiEnvelope.map(response));
  }

  @override
  Future<ThreeDAsset?> getPlayer3dProfile(String playerId) async {
    final response = await dio.get(ApiEndpoints.player3dProfile(playerId));
    final data = ApiEnvelope.data(response);
    return data is Map && data['id'] != null ? threeDAssetFromJson(data.cast<String, dynamic>()) : null;
  }
}
