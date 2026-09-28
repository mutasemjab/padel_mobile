import 'package:equatable/equatable.dart';

import '../../../../core/models/player_summary.dart';
import '../../../../core/models/section_state.dart';
import '../../../casual_matches/domain/entities/casual_match.dart';
import '../../../coaches/domain/entities/booking.dart';
import '../../../coaches/domain/entities/coach.dart';
import '../../../partners/domain/entities/partner.dart';
import '../../../players/domain/entities/achievement.dart';
import '../../../players/domain/entities/player_stats.dart';
import '../../../premium/domain/entities/ai_insight.dart';
import '../../../tournaments/domain/entities/match.dart';
import '../../../tournaments/domain/entities/registration.dart';

/// Typed payload of one home section. Unknown keys become [UnknownSection]
/// and are skipped by the UI.
sealed class HomeSectionData extends Equatable {
  const HomeSectionData();

  @override
  List<Object?> get props => [];
}

class LiveNowSection extends HomeSectionData {
  final List<Match> mine;
  final List<Match> following;

  const LiveNowSection({this.mine = const [], this.following = const []});

  @override
  List<Object?> get props => [mine, following];
}

class NextMatchSection extends HomeSectionData {
  final Match match;

  const NextMatchSection(this.match);

  @override
  List<Object?> get props => [match];
}

class MyTournamentsSection extends HomeSectionData {
  final List<Registration> registrations;

  const MyTournamentsSection(this.registrations);

  @override
  List<Object?> get props => [registrations];
}

class RankingSnapshotSection extends HomeSectionData {
  final String? season;
  final int seasonPoints;
  final int? seasonPosition;
  final int? seasonMovement;
  final int skillRating;
  final String? level;
  final int? skillMovement;
  final int xp;

  const RankingSnapshotSection({
    this.season,
    this.seasonPoints = 0,
    this.seasonPosition,
    this.seasonMovement,
    this.skillRating = 0,
    this.level,
    this.skillMovement,
    this.xp = 0,
  });

  @override
  List<Object?> get props =>
      [season, seasonPoints, seasonPosition, seasonMovement, skillRating, level, skillMovement, xp];
}

class StatsSection extends HomeSectionData {
  final PlayerStats stats;

  const StatsSection(this.stats);

  @override
  List<Object?> get props => [stats];
}

class LatestAchievementSection extends HomeSectionData {
  final Achievement achievement;

  const LatestAchievementSection(this.achievement);

  @override
  List<Object?> get props => [achievement];
}

class RecommendedTournament extends Equatable {
  final int tournamentId;
  final String tournamentName;
  final int? categoryId;
  final String? categoryName;
  final DateTime? startDate;
  final String? city;
  final bool ranked;
  final num registrationFee;
  final int? spotsLeft;

  const RecommendedTournament({
    required this.tournamentId,
    required this.tournamentName,
    this.categoryId,
    this.categoryName,
    this.startDate,
    this.city,
    this.ranked = false,
    this.registrationFee = 0,
    this.spotsLeft,
  });

  @override
  List<Object?> get props =>
      [tournamentId, tournamentName, categoryId, categoryName, startDate, city, ranked, registrationFee, spotsLeft];
}

class RecommendedTournamentsSection extends HomeSectionData {
  final List<RecommendedTournament> items;

  const RecommendedTournamentsSection(this.items);

  @override
  List<Object?> get props => [items];
}

class CasualOpportunitiesSection extends HomeSectionData {
  final List<CasualMatch> matches;

  const CasualOpportunitiesSection(this.matches);

  @override
  List<Object?> get props => [matches];
}

class RecommendedPartnerSection extends HomeSectionData {
  final PlayerSummary player;
  final List<RecommendationReason> reasons;

  const RecommendedPartnerSection({required this.player, required this.reasons});

  @override
  List<Object?> get props => [player, reasons];
}

class RecommendedCoachSection extends HomeSectionData {
  final Coach coach;

  const RecommendedCoachSection(this.coach);

  @override
  List<Object?> get props => [coach];
}

class UpcomingTrainingSection extends HomeSectionData {
  final Booking booking;

  const UpcomingTrainingSection(this.booking);

  @override
  List<Object?> get props => [booking];
}

class PendingPartnerRequestsSection extends HomeSectionData {
  final int count;

  const PendingPartnerRequestsSection(this.count);

  @override
  List<Object?> get props => [count];
}

class AiDailyBriefSection extends HomeSectionData {
  final AiInsight insight;

  const AiDailyBriefSection(this.insight);

  @override
  List<Object?> get props => [insight];
}

class UnknownSection extends HomeSectionData {
  const UnknownSection();
}

class HomeSection extends Equatable {
  final String key;
  final SectionState state;

  /// Null unless [state] is ok.
  final HomeSectionData? data;

  const HomeSection({required this.key, required this.state, this.data});

  bool get isRenderable =>
      state != SectionState.empty && !(state.isOk && (data == null || data is UnknownSection));

  @override
  List<Object?> get props => [key, state, data];
}

/// `GET me/home`. Sections are rendered in [priority] order; `empty` ones
/// are skipped.
class HomeFeed extends Equatable {
  final PlayerSummary player;
  final List<String> priority;
  final Map<String, HomeSection> sections;
  final int unreadNotifications;

  const HomeFeed({
    required this.player,
    required this.priority,
    required this.sections,
    this.unreadNotifications = 0,
  });

  List<HomeSection> get ordered => priority
      .map((key) => sections[key])
      .whereType<HomeSection>()
      .where((section) => section.isRenderable)
      .toList();

  @override
  List<Object?> get props => [player, priority, sections, unreadNotifications];
}
