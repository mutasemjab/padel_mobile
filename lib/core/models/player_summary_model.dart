import 'package:freezed_annotation/freezed_annotation.dart';

import 'player_summary.dart';

part 'player_summary_model.freezed.dart';
part 'player_summary_model.g.dart';

@freezed
abstract class PlayerSummaryModel with _$PlayerSummaryModel {
  const factory PlayerSummaryModel({
    @JsonKey(name: 'player_id') required String playerId,
    required String name,
    @JsonKey(name: 'photo_url') String? photoUrl,
    String? level,
    @JsonKey(name: 'skill_rating') int? skillRating,
    String? side,
    String? country,
    @JsonKey(name: 'is_premium') @Default(false) bool isPremium,
  }) = _PlayerSummaryModel;

  factory PlayerSummaryModel.fromJson(Map<String, dynamic> json) => _$PlayerSummaryModelFromJson(json);
}

extension PlayerSummaryModelX on PlayerSummaryModel {
  PlayerSummary toEntity() => PlayerSummary(
    playerId: playerId,
    name: name,
    photoUrl: photoUrl,
    level: level,
    skillRating: skillRating,
    side: side,
    country: country,
    isPremium: isPremium,
  );
}

/// Parses an embedded PlayerSummary that may be absent.
PlayerSummary? playerSummaryOrNull(dynamic json) =>
    json is Map ? PlayerSummaryModel.fromJson(json.cast<String, dynamic>()).toEntity() : null;
