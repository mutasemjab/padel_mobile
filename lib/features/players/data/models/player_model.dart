import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/player.dart';

part 'player_model.freezed.dart';
part 'player_model.g.dart';

@freezed
abstract class PlayerRefModel with _$PlayerRefModel {
  const factory PlayerRefModel({
    @JsonKey(name: 'player_id') required String playerId,
    required String name,
    @JsonKey(name: 'photo_url') String? photoUrl,
    String? level,
  }) = _PlayerRefModel;

  factory PlayerRefModel.fromJson(Map<String, dynamic> json) =>
      _$PlayerRefModelFromJson(json);
}

extension PlayerRefModelX on PlayerRefModel {
  PlayerRef toEntity() => PlayerRef(playerId: playerId, name: name, photoUrl: photoUrl, level: level);
}

@freezed
abstract class PlayerModel with _$PlayerModel {
  const factory PlayerModel({
    @JsonKey(name: 'player_id') required String playerId,
    required String name,
    // "" for everyone except the owner.
    @Default('') String email,
    String? phone,
    @JsonKey(name: 'date_of_birth') String? dateOfBirth,
    @JsonKey(name: 'photo_url') String? photoUrl,
    String? country,
    String? gender,
    String? side,
    String? bio,
    String? level,
    @JsonKey(name: 'skill_rating') @Default(0) int skillRating,
    @JsonKey(name: 'season_ranking_points') @Default(0) int seasonRankingPoints,
    @Default(0) int xp,
    @JsonKey(name: 'profile_tier') String? profileTier,
    @JsonKey(name: 'is_premium') @Default(false) bool isPremium,
    @JsonKey(name: 'is_active') @Default(true) bool isActive,
    @JsonKey(name: 'is_owner') @Default(false) bool isOwner,
    @JsonKey(name: 'member_since') String? memberSince,
    @JsonKey(name: 'main_partner') PlayerRefModel? mainPartner,
  }) = _PlayerModel;

  factory PlayerModel.fromJson(Map<String, dynamic> json) =>
      _$PlayerModelFromJson(json);
}

extension PlayerModelX on PlayerModel {
  Player toEntity() {
    return Player(
      playerId: playerId,
      name: name,
      email: email,
      phone: phone,
      dateOfBirth: dateOfBirth == null ? null : DateTime.tryParse(dateOfBirth!),
      photoUrl: photoUrl,
      country: country,
      gender: gender == 'male'
          ? PlayerGender.male
          : gender == 'female'
              ? PlayerGender.female
              : null,
      side: PlayerSideX.fromApi(side),
      bio: bio,
      level: PlayerLevelX.fromApi(level),
      skillRating: skillRating,
      seasonRankingPoints: seasonRankingPoints,
      xp: xp,
      profileTier: profileTier,
      isPremium: isPremium,
      isActive: isActive,
      isOwner: isOwner,
      memberSince: memberSince == null ? null : DateTime.tryParse(memberSince!),
      mainPartner: mainPartner?.toEntity(),
    );
  }
}
