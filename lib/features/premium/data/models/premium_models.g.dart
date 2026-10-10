// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'premium_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PremiumPlanModel _$PremiumPlanModelFromJson(Map<String, dynamic> json) =>
    _PremiumPlanModel(
      key: json['key'] as String,
      price: json['price'] as num? ?? 0,
      months: (json['months'] as num?)?.toInt() ?? 1,
      currency: json['currency'] as String? ?? '',
    );

Map<String, dynamic> _$PremiumPlanModelToJson(_PremiumPlanModel instance) =>
    <String, dynamic>{
      'key': instance.key,
      'price': instance.price,
      'months': instance.months,
      'currency': instance.currency,
    };

_PremiumCatalogModel _$PremiumCatalogModelFromJson(Map<String, dynamic> json) =>
    _PremiumCatalogModel(
      plans:
          (json['plans'] as List<dynamic>?)
              ?.map((e) => PremiumPlanModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
      checkoutAvailable: json['checkout_available'] as bool? ?? false,
      features:
          (json['features'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      neverAffects:
          (json['never_affects'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PremiumCatalogModelToJson(
  _PremiumCatalogModel instance,
) => <String, dynamic>{
  'plans': instance.plans.map((e) => e.toJson()).toList(),
  'checkout_available': instance.checkoutAvailable,
  'features': instance.features,
  'never_affects': instance.neverAffects,
};

_SubscriptionModel _$SubscriptionModelFromJson(Map<String, dynamic> json) =>
    _SubscriptionModel(
      id: (json['id'] as num).toInt(),
      status: json['status'] as String? ?? '',
      startedAt: json['started_at'] == null
          ? null
          : DateTime.parse(json['started_at'] as String),
      endsAt: json['ends_at'] == null
          ? null
          : DateTime.parse(json['ends_at'] as String),
      provider: json['provider'] as String?,
      plan: json['plan'] as String?,
      amount: json['amount'] as num?,
      currency: json['currency'] as String?,
      daysLeft: (json['days_left'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SubscriptionModelToJson(_SubscriptionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'started_at': instance.startedAt?.toIso8601String(),
      'ends_at': instance.endsAt?.toIso8601String(),
      'provider': instance.provider,
      'plan': instance.plan,
      'amount': instance.amount,
      'currency': instance.currency,
      'days_left': instance.daysLeft,
    };

_PremiumStatusModel _$PremiumStatusModelFromJson(Map<String, dynamic> json) =>
    _PremiumStatusModel(
      isPremium: json['is_premium'] as bool? ?? false,
      tier: json['tier'] as String?,
      subscription: json['subscription'] == null
          ? null
          : SubscriptionModel.fromJson(
              json['subscription'] as Map<String, dynamic>,
            ),
      features:
          (json['features'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
      neverAffects:
          (json['never_affects'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$PremiumStatusModelToJson(_PremiumStatusModel instance) =>
    <String, dynamic>{
      'is_premium': instance.isPremium,
      'tier': instance.tier,
      'subscription': instance.subscription?.toJson(),
      'features': instance.features,
      'never_affects': instance.neverAffects,
    };

_PaymentModel _$PaymentModelFromJson(Map<String, dynamic> json) =>
    _PaymentModel(
      reference: json['reference'] as String,
      type: json['type'] as String?,
      amount: json['amount'] as num? ?? 0,
      currency: json['currency'] as String?,
      provider: json['provider'] as String?,
      status: json['status'] as String? ?? 'pending',
      checkoutUrl: json['checkout_url'] as String?,
      clientData: json['client_data'],
      failureReason: json['failure_reason'] as String?,
      paidAt: json['paid_at'] == null
          ? null
          : DateTime.parse(json['paid_at'] as String),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
    );

Map<String, dynamic> _$PaymentModelToJson(_PaymentModel instance) =>
    <String, dynamic>{
      'reference': instance.reference,
      'type': instance.type,
      'amount': instance.amount,
      'currency': instance.currency,
      'provider': instance.provider,
      'status': instance.status,
      'checkout_url': instance.checkoutUrl,
      'client_data': instance.clientData,
      'failure_reason': instance.failureReason,
      'paid_at': instance.paidAt?.toIso8601String(),
      'created_at': instance.createdAt?.toIso8601String(),
    };

_ThreeDAssetModel _$ThreeDAssetModelFromJson(Map<String, dynamic> json) =>
    _ThreeDAssetModel(
      id: (json['id'] as num).toInt(),
      status: json['status'] as String? ?? 'pending',
      provider: json['provider'] as String?,
      providerJobId: json['provider_job_id'] as String?,
      assetUrl: json['asset_url'] as String?,
      error: json['error'] as String?,
      requestedAt: json['requested_at'] == null
          ? null
          : DateTime.parse(json['requested_at'] as String),
      completedAt: json['completed_at'] == null
          ? null
          : DateTime.parse(json['completed_at'] as String),
    );

Map<String, dynamic> _$ThreeDAssetModelToJson(_ThreeDAssetModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'provider': instance.provider,
      'provider_job_id': instance.providerJobId,
      'asset_url': instance.assetUrl,
      'error': instance.error,
      'requested_at': instance.requestedAt?.toIso8601String(),
      'completed_at': instance.completedAt?.toIso8601String(),
    };
