import '../../../../core/models/player_summary.dart';
import '../../../../core/models/player_summary_model.dart';
import '../../../../core/models/section_state.dart';
import '../../../../core/utils/json_utils.dart';
import '../../../casual_matches/data/models/casual_match_model.dart';
import '../../../coaches/data/models/booking_model.dart';
import '../../../coaches/data/models/coach_model.dart';
import '../../../partners/domain/entities/partner.dart';
import '../../../players/data/models/achievement_model.dart';
import '../../../players/data/models/player_stats_model.dart';
import '../../../premium/data/models/premium_models.dart';
import '../../../tournaments/data/models/match_model.dart';
import '../../../tournaments/data/models/registration_model.dart';
import '../../domain/entities/home_feed.dart';

/// Parses the contextual `me/home` feed. Every section is parsed in
/// isolation: one malformed block downgrades to [UnknownSection] instead of
/// failing the whole feed.
class HomeFeedMapper {
  const HomeFeedMapper._();

  static HomeFeed fromJson(Map<String, dynamic> json) {
    final rawSections = Json.map(json['sections']) ?? const {};
    final sections = <String, HomeSection>{};
    for (final entry in rawSections.entries) {
      final section = Json.map(entry.value);
      if (section == null) continue;
      final state = SectionState.fromApi(Json.string(section['state']));
      HomeSectionData? data;
      if (state.isOk) {
        try {
          data = _parse(entry.key, section['data']);
        } catch (_) {
          data = const UnknownSection();
        }
      }
      sections[entry.key] = HomeSection(key: entry.key, state: state, data: data);
    }

    final priority = Json.strings(json['priority']);
    return HomeFeed(
      player: playerSummaryOrNull(json['player']) ?? const PlayerSummary(playerId: '', name: ''),
      priority: priority.isEmpty ? sections.keys.toList() : priority,
      sections: sections,
      unreadNotifications: Json.integer(json['unread_notifications']) ?? 0,
    );
  }

  static HomeSectionData? _parse(String key, dynamic data) {
    final map = Json.map(data);
    switch (key) {
      case 'live_now':
        return LiveNowSection(
          mine: Json.listOfMaps(map?['mine']).map(matchFromJson).toList(),
          following: Json.listOfMaps(map?['following']).map(matchFromJson).toList(),
        );
      case 'next_match':
        return map == null ? null : NextMatchSection(matchFromJson(map));
      case 'my_tournaments':
        return MyTournamentsSection(Json.listOfMaps(data).map(registrationFromJson).toList());
      case 'ranking':
        final season = Json.map(map?['season']);
        final skill = Json.map(map?['skill']);
        final xp = map?['xp'];
        return RankingSnapshotSection(
          season: Json.string(season?['season']),
          seasonPoints: Json.integer(season?['points']) ?? 0,
          seasonPosition: Json.integer(season?['position']),
          seasonMovement: Json.integer(season?['movement']),
          skillRating: Json.integer(skill?['rating']) ?? 0,
          level: Json.string(skill?['level']),
          skillMovement: Json.integer(skill?['movement']),
          xp: Json.integer(xp) ?? Json.integer(Json.map(xp)?['xp']) ?? 0,
        );
      case 'stats':
        return map == null ? null : StatsSection(playerStatsFromJson(map));
      case 'latest_achievement':
        return map == null ? null : LatestAchievementSection(achievementFromJson(map));
      case 'recommended_tournaments':
        return RecommendedTournamentsSection(Json.listOfMaps(data).map(_recommendedTournament).toList());
      case 'casual_opportunities':
        return CasualOpportunitiesSection(Json.listOfMaps(data).map(casualMatchFromJson).toList());
      case 'recommended_partner':
        final player = playerSummaryOrNull(map?['player']);
        if (player == null) return null;
        return RecommendedPartnerSection(
          player: player,
          reasons: Json.strings(map?['reasons']).map(RecommendationReason.fromApi).toList(),
        );
      case 'recommended_coach':
        return map == null ? null : RecommendedCoachSection(coachFromJson(map));
      case 'upcoming_training':
        return map == null ? null : UpcomingTrainingSection(bookingFromJson(map));
      case 'pending_partner_requests':
        return PendingPartnerRequestsSection(Json.integer(map?['count']) ?? 0);
      case 'ai_daily_brief':
        return map == null ? null : AiDailyBriefSection(aiInsightFromJson(map));
      default:
        return const UnknownSection();
    }
  }

  static RecommendedTournament _recommendedTournament(Map<String, dynamic> json) {
    final tournament = json['tournament'];
    final category = json['category'];
    return RecommendedTournament(
      tournamentId: Json.integer(json['tournament_id']) ?? Json.integer(Json.map(tournament)?['id']) ?? 0,
      tournamentName: tournament is Map ? (Json.string(tournament['name']) ?? '') : (Json.string(tournament) ?? ''),
      categoryId: Json.integer(json['category_id']) ?? Json.integer(Json.map(category)?['id']),
      categoryName: category is Map ? Json.string(category['name']) : Json.string(category),
      startDate: Json.date(json['start_date']),
      city: Json.string(json['city']),
      ranked: Json.boolean(json['ranked']),
      registrationFee: Json.number(json['registration_fee']) ?? 0,
      spotsLeft: Json.integer(json['spots_left']),
    );
  }
}
