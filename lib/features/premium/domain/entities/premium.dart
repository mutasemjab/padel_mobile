import 'package:equatable/equatable.dart';

class PremiumPlan extends Equatable {
  final String key;
  final num price;
  final int months;
  final String currency;

  const PremiumPlan({required this.key, required this.price, required this.months, required this.currency});

  @override
  List<Object?> get props => [key, price, months, currency];
}

/// `GET premium/plans`. [plans] is empty until prices are configured.
class PremiumCatalog extends Equatable {
  final List<PremiumPlan> plans;
  final bool checkoutAvailable;
  final List<String> features;

  /// Things Premium never touches — rendered verbatim on every paywall.
  final List<String> neverAffects;

  const PremiumCatalog({
    required this.plans,
    required this.checkoutAvailable,
    required this.features,
    required this.neverAffects,
  });

  @override
  List<Object?> get props => [plans, checkoutAvailable, features, neverAffects];
}

class Subscription extends Equatable {
  final int id;
  final String status;
  final DateTime? startedAt;
  final DateTime? endsAt;
  final String? provider;
  final String? plan;
  final num? amount;
  final String? currency;
  final int? daysLeft;

  const Subscription({
    required this.id,
    required this.status,
    this.startedAt,
    this.endsAt,
    this.provider,
    this.plan,
    this.amount,
    this.currency,
    this.daysLeft,
  });

  @override
  List<Object?> get props => [id, status, startedAt, endsAt, provider, plan, amount, currency, daysLeft];
}

class PremiumStatus extends Equatable {
  final bool isPremium;
  final String? tier;
  final Subscription? subscription;
  final List<String> features;
  final List<String> neverAffects;

  const PremiumStatus({
    required this.isPremium,
    this.tier,
    this.subscription,
    this.features = const [],
    this.neverAffects = const [],
  });

  @override
  List<Object?> get props => [isPremium, tier, subscription, features, neverAffects];
}

enum PaymentTransactionStatus {
  pending,
  requiresAction,
  succeeded,
  failed,
  cancelled,
  refunded;

  static PaymentTransactionStatus fromApi(String? raw) => switch (raw) {
        'requires_action' => requiresAction,
        'succeeded' => succeeded,
        'failed' => failed,
        'cancelled' => cancelled,
        'refunded' => refunded,
        _ => pending,
      };

  bool get isTerminal => this != pending && this != requiresAction;
}

/// Only the backend decides whether a payment succeeded — the app never
/// treats one as paid on its own.
class Payment extends Equatable {
  final String reference;
  final String? type;
  final num amount;
  final String? currency;
  final String? provider;
  final PaymentTransactionStatus status;
  final String? checkoutUrl;
  final Map<String, dynamic>? clientData;
  final String? failureReason;
  final DateTime? paidAt;
  final DateTime? createdAt;

  const Payment({
    required this.reference,
    this.type,
    required this.amount,
    this.currency,
    this.provider,
    required this.status,
    this.checkoutUrl,
    this.clientData,
    this.failureReason,
    this.paidAt,
    this.createdAt,
  });

  @override
  List<Object?> get props => [
        reference,
        type,
        amount,
        currency,
        provider,
        status,
        checkoutUrl,
        clientData,
        failureReason,
        paidAt,
        createdAt,
      ];
}
