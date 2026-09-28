import 'package:flutter_test/flutter_test.dart';
import 'package:padel/core/models/player_summary_model.dart';
import 'package:padel/core/models/section_state.dart';
import 'package:padel/features/auth/data/models/auth_session_model.dart';
import 'package:padel/features/auth/domain/entities/auth_session.dart';
import 'package:padel/features/casual_matches/data/models/casual_match_model.dart';
import 'package:padel/features/coaches/data/models/coach_model.dart';
import 'package:padel/features/partners/data/models/partner_models.dart';
import 'package:padel/features/partners/domain/entities/partner.dart';
import 'package:padel/features/players/data/models/achievement_model.dart';
import 'package:padel/features/players/data/models/player_profile_mapper.dart';
import 'package:padel/features/players/domain/entities/achievement.dart';

const _summary = {
  'player_id': 'PDL-000012',
  'name': 'Omar Haddad',
  'photo_url': null,
  'level': 'C+',
  'skill_rating': 1016,
  'side': 'left',
  'country': 'JO',
  'is_premium': true,
};

void main() {
  test('PlayerSummary parses side and country', () {
    final p = PlayerSummaryModel.fromJson(_summary).toEntity();
    expect(p.side, 'left');
    expect(p.country, 'JO');
    expect(p.isPremium, isTrue);
  });

  group('auth session', () {
    test('coach-only login has no player', () {
      final s = AuthSessionModel.fromJson({
        'token': 't',
        'account_type': 'coach',
        'player': null,
        'coach': {'id': 5, 'name': 'Coach Sam', 'price_per_hour': 25},
      }).toEntity();
      expect(s.accountType, AccountType.coach);
      expect(s.player, isNull);
      expect(s.coach?.pricePerHour, 25);
      expect(s.accountType.hasPlayerProfile, isFalse);
    });

    test('player login keeps the owner email', () {
      final s = AuthSessionModel.fromJson({
        'token': 't',
        'account_type': 'player',
        'player': {..._summary, 'email': 'me@x.com', 'is_owner': true},
        'coach': null,
      }).toEntity();
      expect(s.player?.email, 'me@x.com');
      expect(s.player?.isOwner, isTrue);
    });
  });

  group('player profile', () {
    final json = <String, dynamic>{
      ..._summary,
      'email': '',
      'phone': null,
      'date_of_birth': null,
      'is_owner': false,
      'member_since': '2025-01-10',
      'rankings': {
        'skill': {'rating': 1016, 'level': 'C+', 'position': 12, 'movement': 2},
        'season': {'season': '2026', 'points': 70, 'position': null, 'movement': null},
        'xp': 340,
      },
      'stats': {
        'matches_played': 0,
        'wins': 0,
        'losses': 0,
        'win_rate': null,
        'current_streak': {'type': null, 'count': 0},
      },
      'partners': {
        'main_partner': {'state': 'not_set', 'partner': null},
        'best_historical_partner': {
          'state': 'insufficient_data',
          'partner': null,
          'matches_played': 1,
          'matches_won': 1,
          'win_rate': null,
          'min_matches_required': 3,
        },
        'most_played_with': {
          'state': 'ok',
          'partner': _summary,
          'matches_played': 5,
          'matches_won': 3,
          'win_rate': 0.6,
        },
      },
      'social': {'followers': 4, 'following': 2, 'respects': 1, 'is_following': true, 'has_respected': false},
      'achievements': {'unlocked': 1, 'total': 20, 'latest': []},
      'recent_results': [
        {
          'official_result_id': 1,
          'match_id': 2,
          'tournament_id': 1,
          'tournament_name': 'Amman Open',
          'tournament_ranked': true,
          'category_name': 'Men B',
          'round': 'final',
          'result_type': 'played',
          'won': true,
          'score': '6-4 6-2',
          'sets_won': 2,
          'sets_lost': 0,
          'rating_delta': null,
          'date': '2026-09-01',
          'partner': null,
        },
      ],
      'three_d_profile': null,
    };

    test('non-owner has no contact details', () {
      final profile = PlayerProfileMapper.fromJson(json);
      expect(profile.player.email, isEmpty);
      expect(profile.player.phone, isNull);
      expect(profile.player.isOwner, isFalse);
    });

    test('null win rate with zero matches stays null', () {
      final profile = PlayerProfileMapper.fromJson(json);
      expect(profile.stats?.winRate, isNull);
      expect(profile.rankings?.season.position, isNull);
      expect(profile.rankings?.season.movement, isNull);
      expect(profile.rankings?.skill.movement, 2);
    });

    test('partner slots keep their explicit states', () {
      final partners = PlayerProfileMapper.fromJson(json).partners!;
      expect(partners.mainPartner.state, SectionState.notSet);
      expect(partners.bestHistorical.state, SectionState.insufficientData);
      expect(partners.bestHistorical.minMatchesRequired, 3);
      expect(partners.bestHistorical.record, isNull);
      expect(partners.mostPlayedWith.record?.matchesPlayed, 5);
    });

    test('recent results keep a null rating delta', () {
      final r = PlayerProfileMapper.fromJson(json).recentResults.single;
      expect(r.ratingDelta, isNull);
      expect(r.score, '6-4 6-2');
    });
  });

  test('partners endpoint nests the record', () {
    final overview = partnersOverviewFromJson({
      'main_partner': {'state': 'ok', 'partner': _summary},
      'best_historical_partner': {
        'state': 'ok',
        'min_matches_required': 3,
        'record': {'partner': _summary, 'matches_played': 6, 'matches_won': 5, 'win_rate': 0.83},
      },
      'most_played_with': {'state': 'insufficient_data', 'record': null},
      'history': [
        {'partner': _summary, 'matches_played': 6, 'matches_won': 5, 'win_rate': null},
      ],
    });
    expect(overview.bestHistorical.record?.matchesWon, 5);
    expect(overview.mostPlayedWith.record, isNull);
    expect(overview.history.single.winRate, isNull);
  });

  test('recommendations expose reasons, never a score', () {
    final recs = PartnerRecommendationsModel.fromJson({
      'state': 'ok',
      'basis': {'player_rating': 1016, 'rating_window': 100, 'player_verified_matches': 4},
      'candidates': [
        {
          'player': _summary,
          'reasons': ['complementary_side', 'similar_skill_rating', 'brand_new_reason'],
          'facts': {'rating_difference': -12, 'matches_together': 0},
        },
      ],
    }).toEntity();
    expect(recs.candidates.single.reasons, [
      RecommendationReason.complementarySide,
      RecommendationReason.similarSkillRating,
      RecommendationReason.unknown,
    ]);
    expect(recs.candidates.single.facts.ratingDifference, -12);
  });

  test('achievement catalog entry with progress and rarity', () {
    final a = achievementFromJson({
      'code': 'ten_wins',
      'name': '10 wins',
      'description': 'Win 10 verified matches',
      'category': 'premium',
      'rarity': 'legendary',
      'xp_reward': 50,
      'is_premium_badge': true,
      'is_automatic': true,
      'icon_url': null,
      'unlocked_at': null,
      'progress': {'current': 3, 'target': 10},
    });
    expect(a.isUnlocked, isFalse);
    expect(a.rarity, AchievementRarity.legendary);
    expect(a.isPremium, isTrue);
    expect(a.progress?.ratio, closeTo(0.3, 0.001));
  });

  test('coach without reviews shows no rating', () {
    final c = coachFromJson({
      'id': 1,
      'name': 'Coach',
      'price_per_hour': 20,
      'rating': {'average': null, 'count': 0},
      'venue': {'id': 1, 'name': 'Club', 'city': 'Amman'},
    });
    expect(c.rating.hasReviews, isFalse);
    expect(c.location, 'Club, Amman');
  });

  test('casual match creator, venue and court are objects', () {
    final m = casualMatchFromJson({
      'id': 1,
      'is_official': false,
      'creator': _summary,
      'venue': {'id': 1, 'name': 'Club', 'city': 'Amman'},
      'court': {'id': 2, 'name': 'Court 2'},
      'match_type': 'need_1',
      'scheduled_at': '2026-10-01T18:00:00+03:00',
      'players_needed': 1,
      'accepted_count': 2,
      'spots_left': 1,
      'status': 'open',
      'is_creator': false,
      'my_participation': {'id': 7, 'status': 'requested'},
      'participants': [],
    });
    expect(m.creator.name, 'Omar Haddad');
    expect(m.courtName, 'Court 2');
    expect(m.myParticipation?.id, 7);
    expect(m.spotsLeft, 1);
  });
}
