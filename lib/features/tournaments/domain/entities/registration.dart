import 'package:equatable/equatable.dart';

import '../../../../core/models/player_summary.dart';

enum RegistrationStatus {
  pending,
  approved,
  rejected,
  waitlisted,
  cancelled;

  static RegistrationStatus fromApi(String? raw) => RegistrationStatus.values.firstWhere(
        (s) => s.name == raw,
        orElse: () => RegistrationStatus.pending,
      );
}

enum PaymentStatus {
  notRequired,
  pending,
  paid,
  refunded;

  static PaymentStatus fromApi(String? raw) => switch (raw) {
        'pending' => PaymentStatus.pending,
        'paid' => PaymentStatus.paid,
        'refunded' => PaymentStatus.refunded,
        _ => PaymentStatus.notRequired,
      };

  String get apiValue => switch (this) {
        PaymentStatus.notRequired => 'not_required',
        PaymentStatus.pending => 'pending',
        PaymentStatus.paid => 'paid',
        PaymentStatus.refunded => 'refunded',
      };
}

class RegistrationCategory extends Equatable {
  final int id;
  final String name;
  final num registrationFee;
  final int tournamentId;
  final String tournamentName;
  final DateTime? tournamentStartDate;

  const RegistrationCategory({
    required this.id,
    required this.name,
    required this.registrationFee,
    required this.tournamentId,
    required this.tournamentName,
    this.tournamentStartDate,
  });

  @override
  List<Object?> get props =>
      [id, name, registrationFee, tournamentId, tournamentName, tournamentStartDate];
}

class Registration extends Equatable {
  final int id;
  final RegistrationStatus status;
  final PaymentStatus paymentStatus;
  final DateTime? registeredAt;
  final DateTime? promotedAt;
  final String? notes;
  final PlayerSummary? player;
  final PlayerSummary? partner;
  final RegistrationCategory category;
  final bool canCancel;

  const Registration({
    required this.id,
    required this.status,
    required this.paymentStatus,
    this.registeredAt,
    this.promotedAt,
    this.notes,
    this.player,
    this.partner,
    required this.category,
    this.canCancel = false,
  });

  bool get needsPayment => paymentStatus == PaymentStatus.pending;

  @override
  List<Object?> get props => [
        id,
        status,
        paymentStatus,
        registeredAt,
        promotedAt,
        notes,
        player,
        partner,
        category,
        canCancel,
      ];
}
