import 'package:equatable/equatable.dart';

import '../../../../core/models/player_summary.dart';

enum PlayerGender { male, female }

enum PlayerSide { left, right, both }

extension PlayerSideX on PlayerSide {
  static PlayerSide? fromApi(String? raw) => switch (raw) {
        'left' => PlayerSide.left,
        'right' => PlayerSide.right,
        'both' => PlayerSide.both,
        _ => null,
      };
}

/// C < C+ < B < B+ < A < A+ < Elite, in the exact order the backend uses.
enum PlayerLevel { c, cPlus, b, bPlus, a, aPlus, elite }

extension PlayerLevelX on PlayerLevel {
  static PlayerLevel? fromApi(String? raw) {
    switch (raw) {
      case 'C':
        return PlayerLevel.c;
      case 'C+':
        return PlayerLevel.cPlus;
      case 'B':
        return PlayerLevel.b;
      case 'B+':
        return PlayerLevel.bPlus;
      case 'A':
        return PlayerLevel.a;
      case 'A+':
        return PlayerLevel.aPlus;
      case 'Elite':
        return PlayerLevel.elite;
      default:
        return null;
    }
  }

  String get label => switch (this) {
        PlayerLevel.c => 'C',
        PlayerLevel.cPlus => 'C+',
        PlayerLevel.b => 'B',
        PlayerLevel.bPlus => 'B+',
        PlayerLevel.a => 'A',
        PlayerLevel.aPlus => 'A+',
        PlayerLevel.elite => 'Elite',
      };
}

/// Lightweight reference to another player (e.g. `main_partner`).
class PlayerRef extends Equatable {
  final String playerId;
  final String name;
  final String? photoUrl;
  final String? level;

  const PlayerRef({required this.playerId, required this.name, this.photoUrl, this.level});

  PlayerSummary toSummary() =>
      PlayerSummary(playerId: playerId, name: name, photoUrl: photoUrl, level: level);

  @override
  List<Object?> get props => [playerId, name, photoUrl, level];
}

class Player extends Equatable {
  final String playerId;
  final String name;

  /// Empty for everyone except the profile owner (`is_owner`).
  final String email;

  /// Owner-only; null otherwise.
  final String? phone;
  final DateTime? dateOfBirth;
  final String? photoUrl;
  final String? country;
  final PlayerGender? gender;
  final PlayerSide? side;
  final String? bio;
  final PlayerLevel? level;
  final int skillRating;
  final int seasonRankingPoints;
  final int xp;
  final String? profileTier;
  final bool isPremium;
  final bool isActive;
  final bool isOwner;
  final DateTime? memberSince;
  final PlayerRef? mainPartner;

  const Player({
    required this.playerId,
    required this.name,
    required this.email,
    this.phone,
    this.dateOfBirth,
    this.photoUrl,
    this.country,
    this.gender,
    this.side,
    this.bio,
    this.level,
    this.skillRating = 0,
    this.seasonRankingPoints = 0,
    this.xp = 0,
    this.profileTier,
    this.isPremium = false,
    this.isActive = true,
    this.isOwner = false,
    this.memberSince,
    this.mainPartner,
  });

  PlayerSummary toSummary() => PlayerSummary(
        playerId: playerId,
        name: name,
        photoUrl: photoUrl,
        level: level?.label,
        skillRating: skillRating,
        side: side?.name,
        country: country,
        isPremium: isPremium,
      );

  @override
  List<Object?> get props => [
        playerId,
        name,
        email,
        phone,
        dateOfBirth,
        photoUrl,
        country,
        gender,
        side,
        bio,
        level,
        skillRating,
        seasonRankingPoints,
        xp,
        profileTier,
        isPremium,
        isActive,
        isOwner,
        memberSince,
        mainPartner,
      ];
}
