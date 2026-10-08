import 'package:equatable/equatable.dart';

import '../../../../core/models/player_summary.dart';

enum RegistrationStatus {
  pending,
  approved,
  rejected,
  changesRequested,
  waitlisted,
  cancelled,

  /// The named partner has not confirmed yet (the organizer can't review it before).
  awaitingPartner,

  /// The named partner declined; the player picks another one or cancels.
  partnerDeclined;

  /// Value used by the API and `meta/enums.registration_statuses`.
  String get apiValue => switch (this) {
        RegistrationStatus.changesRequested => 'changes_requested',
        RegistrationStatus.awaitingPartner => 'awaiting_partner',
        RegistrationStatus.partnerDeclined => 'partner_declined',
        _ => name,
      };

  static RegistrationStatus fromApi(String? raw) => RegistrationStatus.values.firstWhere(
        (s) => s.apiValue == raw,
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

  /// Organizer's message (why changes are needed, or why it was rejected).
  final String? reviewNote;

  /// The pair may still change the partner / notes (pending, waitlisted, changes requested).
  final bool canEdit;

  /// The pair's team name (required when registering from the app).
  final String? teamName;

  /// The player who registered may still rename the team (until the tournament starts).
  final bool canRenameTeam;

  /// The viewer is the invited partner and must accept or decline.
  final bool needsMyConfirmation;

  /// The partner accepted (or the organizer entered the pair).
  final bool partnerConfirmed;

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
    this.reviewNote,
    this.canEdit = false,
    this.canCancel = false,
    this.needsMyConfirmation = false,
    this.partnerConfirmed = true,
    this.teamName,
    this.canRenameTeam = false,
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
        canEdit,
        reviewNote,
        needsMyConfirmation,
        partnerConfirmed,
        teamName,
        canRenameTeam,
      ];
}
