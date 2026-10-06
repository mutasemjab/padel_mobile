import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/json_utils.dart';
import '../../domain/entities/ai_insight.dart';
import '../../domain/entities/premium.dart';

part 'premium_models.freezed.dart';
part 'premium_models.g.dart';

@freezed
abstract class PremiumPlanModel with _$PremiumPlanModel {
  const factory PremiumPlanModel({
    required String key,
    @Default(0) num price,
    @Default(1) int months,
    @Default('') String currency,
  }) = _PremiumPlanModel;

  factory PremiumPlanModel.fromJson(Map<String, dynamic> json) => _$PremiumPlanModelFromJson(json);
}

@freezed
abstract class PremiumCatalogModel with _$PremiumCatalogModel {
  const factory PremiumCatalogModel({
    @Default([]) List<PremiumPlanModel> plans,
    @JsonKey(name: 'checkout_available') @Default(false) bool checkoutAvailable,
    @Default([]) List<String> features,
    @JsonKey(name: 'never_affects') @Default([]) List<String> neverAffects,
  }) = _PremiumCatalogModel;

  factory PremiumCatalogModel.fromJson(Map<String, dynamic> json) =>
      _$PremiumCatalogModelFromJson(json);
}

extension PremiumCatalogModelX on PremiumCatalogModel {
  PremiumCatalog toEntity() => PremiumCatalog(
        plans: plans
            .map((p) => PremiumPlan(key: p.key, price: p.price, months: p.months, currency: p.currency))
            .toList(),
        checkoutAvailable: checkoutAvailable,
        features: features,
        neverAffects: neverAffects,
      );
}

@freezed
abstract class SubscriptionModel with _$SubscriptionModel {
  const factory SubscriptionModel({
    required int id,
    @Default('') String status,
    @JsonKey(name: 'started_at') DateTime? startedAt,
    @JsonKey(name: 'ends_at') DateTime? endsAt,
    String? provider,
    String? plan,
    num? amount,
    String? currency,
    @JsonKey(name: 'days_left') int? daysLeft,
  }) = _SubscriptionModel;

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) => _$SubscriptionModelFromJson(json);
}

@freezed
abstract class PremiumStatusModel with _$PremiumStatusModel {
  const factory PremiumStatusModel({
    @JsonKey(name: 'is_premium') @Default(false) bool isPremium,
    String? tier,
    SubscriptionModel? subscription,
    @Default([]) List<String> features,
    @JsonKey(name: 'never_affects') @Default([]) List<String> neverAffects,
  }) = _PremiumStatusModel;

  factory PremiumStatusModel.fromJson(Map<String, dynamic> json) => _$PremiumStatusModelFromJson(json);
}

extension PremiumStatusModelX on PremiumStatusModel {
  PremiumStatus toEntity() => PremiumStatus(
        isPremium: isPremium,
        tier: tier,
        subscription: subscription == null
            ? null
            : Subscription(
                id: subscription!.id,
                status: subscription!.status,
                startedAt: subscription!.startedAt,
                endsAt: subscription!.endsAt,
                provider: subscription!.provider,
                plan: subscription!.plan,
                amount: subscription!.amount,
                currency: subscription!.currency,
                daysLeft: subscription!.daysLeft,
              ),
        features: features,
        neverAffects: neverAffects,
      );
}

@freezed
abstract class PaymentModel with _$PaymentModel {
  const factory PaymentModel({
    required String reference,
    String? type,
    @Default(0) num amount,
    String? currency,
    String? provider,
    @Default('pending') String status,
    @JsonKey(name: 'checkout_url') String? checkoutUrl,
    @JsonKey(name: 'client_data') Map<String, dynamic>? clientData,
    @JsonKey(name: 'failure_reason') String? failureReason,
    @JsonKey(name: 'paid_at') DateTime? paidAt,
    @JsonKey(name: 'created_at') DateTime? createdAt,
  }) = _PaymentModel;

  factory PaymentModel.fromJson(Map<String, dynamic> json) => _$PaymentModelFromJson(json);
}

extension PaymentModelX on PaymentModel {
  Payment toEntity() => Payment(
        reference: reference,
        type: type,
        amount: amount,
        currency: currency,
        provider: provider,
        status: PaymentTransactionStatus.fromApi(status),
        checkoutUrl: checkoutUrl,
        clientData: clientData,
        failureReason: failureReason,
        paidAt: paidAt,
        createdAt: createdAt,
      );
}

Payment paymentFromJson(Map<String, dynamic> json) => PaymentModel.fromJson(json).toEntity();

/// AI insight payloads carry open-shaped `facts`/`details`, so they are
/// parsed by hand.
AiInsight aiInsightFromJson(Map<String, dynamic> json) {
  final narrative = Json.map(json['narrative']);
  final insufficient = Json.map(json['insufficient_data']);
  final rawType = Json.string(json['type']) ?? '';
  return AiInsight(
    id: Json.integer(json['id']) ?? 0,
    type: AiInsightType.fromApi(rawType),
    rawType: rawType,
    status: AiInsightStatus.fromApi(Json.string(json['status'])),
    provider: Json.string(json['provider']),
    model: Json.string(json['model']),
    language: Json.string(json['language']),
    narrative: narrative == null
        ? null
        : AiNarrative(
            headline: Json.string(narrative['headline']),
            summary: Json.string(narrative['summary']),
            highlights: Json.strings(narrative['highlights']),
            recommendations: Json.strings(narrative['recommendations']),
          ),
    facts: Json.map(json['facts']) ?? const {},
    insufficientData: insufficient == null
        ? null
        : InsufficientData(reason: Json.string(insufficient['reason']), details: Json.map(insufficient['details'])),
    dataCoverage: DataCoverage.fromApi(Json.string(json['data_coverage'])),
    matchesUsed: Json.integer(json['matches_used']),
    generatedAt: Json.date(json['generated_at']),
    expiresAt: Json.date(json['expires_at']),
    error: Json.string(json['error']),
    disclaimer: Json.string(json['disclaimer']),
  );
}

AiInsightsOverview aiInsightsOverviewFromJson(Map<String, dynamic> json) {
  final types = Json.strings(json['types']).map(AiInsightType.fromApi).whereType<AiInsightType>().toList();
  final raw = Json.map(json['insights']) ?? const {};
  final insights = <AiInsightType, AiInsight?>{
    for (final type in types.isEmpty ? AiInsightType.values : types)
      type: Json.map(raw[type.apiValue]) == null ? null : aiInsightFromJson(Json.map(raw[type.apiValue])!),
  };
  return AiInsightsOverview(types: types.isEmpty ? AiInsightType.values : types, insights: insights);
}

@freezed
abstract class ThreeDAssetModel with _$ThreeDAssetModel {
  const factory ThreeDAssetModel({
    required int id,
    @Default('pending') String status,
    String? provider,
    @JsonKey(name: 'provider_job_id') String? providerJobId,
    @JsonKey(name: 'asset_url') String? assetUrl,
    String? error,
    @JsonKey(name: 'requested_at') DateTime? requestedAt,
    @JsonKey(name: 'completed_at') DateTime? completedAt,
  }) = _ThreeDAssetModel;

  factory ThreeDAssetModel.fromJson(Map<String, dynamic> json) => _$ThreeDAssetModelFromJson(json);
}

extension ThreeDAssetModelX on ThreeDAssetModel {
  ThreeDAsset toEntity() => ThreeDAsset(
        id: id,
        status: ThreeDStatus.fromApi(status),
        provider: provider,
        providerJobId: providerJobId,
        assetUrl: assetUrl,
        error: error,
        requestedAt: requestedAt,
        completedAt: completedAt,
      );
}

ThreeDAsset threeDAssetFromJson(Map<String, dynamic> json) => ThreeDAssetModel.fromJson(json).toEntity();

ThreeDProfileState threeDProfileStateFromJson(Map<String, dynamic> json) => ThreeDProfileState(
      providerConfigured: Json.boolean(json['provider_configured']),
      requiresPhoto: Json.boolean(json['requires_photo']),
      current: Json.map(json['current']) == null ? null : threeDAssetFromJson(Json.map(json['current'])!),
      latestCompleted: Json.map(json['latest_completed']) == null
          ? null
          : threeDAssetFromJson(Json.map(json['latest_completed'])!),
    );
