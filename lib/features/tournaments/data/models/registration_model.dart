import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/player_summary_model.dart';
import '../../domain/entities/registration.dart';

part 'registration_model.freezed.dart';
part 'registration_model.g.dart';

@freezed
abstract class RegistrationTournamentModel with _$RegistrationTournamentModel {
  const factory RegistrationTournamentModel({
    required int id,
    required String name,
    @JsonKey(name: 'start_date') DateTime? startDate,
  }) = _RegistrationTournamentModel;

  factory RegistrationTournamentModel.fromJson(Map<String, dynamic> json) =>
      _$RegistrationTournamentModelFromJson(json);
}

@freezed
abstract class RegistrationCategoryModel with _$RegistrationCategoryModel {
  const factory RegistrationCategoryModel({
    required int id,
    required String name,
    @JsonKey(name: 'registration_fee') @Default(0) num registrationFee,
    required RegistrationTournamentModel tournament,
  }) = _RegistrationCategoryModel;

  factory RegistrationCategoryModel.fromJson(Map<String, dynamic> json) =>
      _$RegistrationCategoryModelFromJson(json);
}

@freezed
abstract class RegistrationModel with _$RegistrationModel {
  const factory RegistrationModel({
    required int id,
    @Default('pending') String status,
    @JsonKey(name: 'payment_status') @Default('not_required') String paymentStatus,
    @JsonKey(name: 'registered_at') DateTime? registeredAt,
    @JsonKey(name: 'promoted_at') DateTime? promotedAt,
    String? notes,
    PlayerSummaryModel? player,
    PlayerSummaryModel? partner,
    required RegistrationCategoryModel category,
    @JsonKey(name: 'can_cancel') @Default(false) bool canCancel,
    @JsonKey(name: 'can_edit') @Default(false) bool canEdit,
    @JsonKey(name: 'review_note') String? reviewNote,
  }) = _RegistrationModel;

  factory RegistrationModel.fromJson(Map<String, dynamic> json) =>
      _$RegistrationModelFromJson(json);
}

extension RegistrationModelX on RegistrationModel {
  Registration toEntity() => Registration(
        id: id,
        status: RegistrationStatus.fromApi(status),
        paymentStatus: PaymentStatus.fromApi(paymentStatus),
        registeredAt: registeredAt,
        promotedAt: promotedAt,
        notes: notes,
        player: player?.toEntity(),
        partner: partner?.toEntity(),
        category: RegistrationCategory(
          id: category.id,
          name: category.name,
          registrationFee: category.registrationFee,
          tournamentId: category.tournament.id,
          tournamentName: category.tournament.name,
          tournamentStartDate: category.tournament.startDate,
        ),
        canCancel: canCancel,
        canEdit: canEdit,
        reviewNote: reviewNote,
      );
}

Registration registrationFromJson(Map<String, dynamic> json) =>
    RegistrationModel.fromJson(json).toEntity();
