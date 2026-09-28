import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/models/player_summary_model.dart';
import '../../../tournaments/data/models/venue_model.dart';
import '../../domain/entities/casual_match.dart';

part 'casual_match_model.freezed.dart';
part 'casual_match_model.g.dart';

@freezed
abstract class CasualParticipantModel with _$CasualParticipantModel {
  const factory CasualParticipantModel({
    required int id,
    @Default('requested') String status,
    PlayerSummaryModel? player,
  }) = _CasualParticipantModel;

  factory CasualParticipantModel.fromJson(Map<String, dynamic> json) =>
      _$CasualParticipantModelFromJson(json);
}

extension CasualParticipantModelX on CasualParticipantModel {
  CasualParticipant toEntity() => CasualParticipant(
        id: id,
        status: ParticipantStatus.fromApi(status),
        player: player?.toEntity(),
      );
}

@freezed
abstract class CasualMatchModel with _$CasualMatchModel {
  const factory CasualMatchModel({
    required int id,
    required PlayerSummaryModel creator,
    VenueModel? venue,
    CourtModel? court,
    @JsonKey(name: 'match_type') required String matchType,
    @JsonKey(name: 'scheduled_at') required DateTime scheduledAt,
    @JsonKey(name: 'required_level') String? requiredLevel,
    @JsonKey(name: 'preferred_side') String? preferredSide,
    @JsonKey(name: 'players_needed') @Default(0) int playersNeeded,
    @JsonKey(name: 'accepted_count') @Default(0) int acceptedCount,
    @JsonKey(name: 'spots_left') int? spotsLeft,
    @Default('open') String status,
    String? notes,
    @JsonKey(name: 'is_creator') @Default(false) bool isCreator,
    @JsonKey(name: 'my_participation') CasualParticipantModel? myParticipation,
    @Default([]) List<CasualParticipantModel> participants,
  }) = _CasualMatchModel;

  factory CasualMatchModel.fromJson(Map<String, dynamic> json) =>
      _$CasualMatchModelFromJson(json);
}

extension CasualMatchModelX on CasualMatchModel {
  CasualMatch toEntity() => CasualMatch(
        id: id,
        creator: creator.toEntity(),
        venue: venue?.toEntity(),
        court: court?.toEntity(),
        matchType: CasualMatchTypeX.fromApi(matchType),
        scheduledAt: scheduledAt,
        requiredLevel: requiredLevel,
        preferredSide: preferredSide,
        playersNeeded: playersNeeded,
        acceptedCount: acceptedCount,
        spotsLeft: spotsLeft,
        status: status,
        notes: notes,
        isCreator: isCreator,
        myParticipation: myParticipation?.toEntity(),
        participants: participants.map((p) => p.toEntity()).toList(),
      );
}

CasualMatch casualMatchFromJson(Map<String, dynamic> json) =>
    CasualMatchModel.fromJson(json).toEntity();
