import 'package:equatable/equatable.dart';

import '../../../partners/domain/entities/partner.dart';
import 'achievement.dart';
import 'player.dart';
import 'player_history.dart';
import 'player_stats.dart';

class SkillRanking extends Equatable {
  final int rating;
  final String? level;
  final int? position;

  /// Positive = moved up since the last daily snapshot; null = no snapshot.
  final int? movement;

  const SkillRanking({required this.rating, this.level, this.position, this.movement});

  @override
  List<Object?> get props => [rating, level, position, movement];
}

class SeasonRanking extends Equatable {
  final String? season;
  final int points;
  final int? position;
  final int? movement;

  const SeasonRanking({this.season, required this.points, this.position, this.movement});

  @override
  List<Object?> get props => [season, points, position, movement];
}

class PlayerRankings extends Equatable {
  final SkillRanking skill;
  final SeasonRanking season;
  final int xp;

  const PlayerRankings({required this.skill, required this.season, required this.xp});

  @override
  List<Object?> get props => [skill, season, xp];
}

class SocialSummary extends Equatable {
  final int followers;
  final int following;
  final int respects;
  final bool isFollowing;
  final bool hasRespected;

  const SocialSummary({
    this.followers = 0,
    this.following = 0,
    this.respects = 0,
    this.isFollowing = false,
    this.hasRespected = false,
  });

  SocialSummary copyWith({int? followers, int? respects, bool? isFollowing, bool? hasRespected}) =>
      SocialSummary(
        followers: followers ?? this.followers,
        following: following,
        respects: respects ?? this.respects,
        isFollowing: isFollowing ?? this.isFollowing,
        hasRespected: hasRespected ?? this.hasRespected,
      );

  @override
  List<Object?> get props => [followers, following, respects, isFollowing, hasRespected];
}

class AchievementsSummary extends Equatable {
  final int unlocked;
  final int total;
  final List<Achievement> latest;

  const AchievementsSummary({this.unlocked = 0, this.total = 0, this.latest = const []});

  @override
  List<Object?> get props => [unlocked, total, latest];
}

class ThreeDProfileRef extends Equatable {
  final String? assetUrl;
  final DateTime? completedAt;

  const ThreeDProfileRef({this.assetUrl, this.completedAt});

  @override
  List<Object?> get props => [assetUrl, completedAt];
}

/// Everything `GET players/{playerId}` returns: the full player plus the
/// athlete-card extras.
class PlayerProfile extends Equatable {
  final Player player;
  final PlayerRankings? rankings;
  final PlayerStats? stats;
  final PartnersOverview? partners;
  final SocialSummary social;
  final AchievementsSummary achievements;
  final List<ResultRow> recentResults;
  final ThreeDProfileRef? threeDProfile;

  const PlayerProfile({
    required this.player,
    this.rankings,
    this.stats,
    this.partners,
    this.social = const SocialSummary(),
    this.achievements = const AchievementsSummary(),
    this.recentResults = const [],
    this.threeDProfile,
  });

  PlayerProfile copyWith({SocialSummary? social}) => PlayerProfile(
        player: player,
        rankings: rankings,
        stats: stats,
        partners: partners,
        social: social ?? this.social,
        achievements: achievements,
        recentResults: recentResults,
        threeDProfile: threeDProfile,
      );

  @override
  List<Object?> get props =>
      [player, rankings, stats, partners, social, achievements, recentResults, threeDProfile];
}
