import 'package:flutter_test/flutter_test.dart';
import 'package:padel/features/tournaments/data/models/category_detail_model.dart';
import 'package:padel/features/tournaments/data/models/live_payload_model.dart';
import 'package:padel/features/tournaments/data/models/match_model.dart';
import 'package:padel/features/tournaments/data/models/registration_model.dart';
import 'package:padel/features/tournaments/data/models/tournament_model.dart';
import 'package:padel/features/tournaments/domain/entities/live_payload.dart';
import 'package:padel/features/tournaments/domain/entities/match.dart';
import 'package:padel/features/tournaments/domain/entities/registration.dart';
import 'package:padel/features/tournaments/domain/entities/tournament.dart';

Map<String, dynamic> _player(String id, String name) => {
      'player_id': id,
      'name': name,
      'photo_url': null,
      'level': 'C+',
      'skill_rating': 1016,
      'side': 'left',
      'country': 'JO',
      'is_premium': true,
    };

Map<String, dynamic> _team(int id, String label) => {
      'id': id,
      'label': label,
      'seed': 1,
      'status': 'active',
      'withdrawal_reason': null,
      'group_id': null,
      'players': [_player('PDL-000012', 'Omar Haddad'), _player('PDL-000013', 'Ali Nasser')],
    };

Map<String, dynamic> matchJson({Map<String, dynamic>? teamOne, Map<String, dynamic>? teamTwo}) => {
      'id': 2,
      'tournament_id': 1,
      'category_id': 1,
      'category': {'id': 1, 'name': 'Men B'},
      'group': null,
      'round': 'final',
      'round_label': 'Final',
      'round_position': 0,
      'status': 'in_progress',
      'is_live': true,
      'scheduled_at': null,
      'started_at': '2026-09-20T10:00:00+03:00',
      'completed_at': null,
      'court': 'Court 1',
      'court_id': 4,
      'team_one': teamOne,
      'team_two': teamTwo,
      'sets_won_team_one': 0,
      'sets_won_team_two': 0,
      'live_score': {
        'sets': [
          {'team_one': 6, 'team_two': 4},
        ],
        'current_set_games': {'team_one': 0, 'team_two': 0},
        'current_game': {'team_one': 1, 'team_two': 0},
        'is_tiebreak': false,
      },
      'current_game_display': {'team_one': '15', 'team_two': '0'},
      'version': 1,
      'winner_team_id': null,
      'next_match_id': null,
      'is_bye': false,
      'result': {
        'id': 1,
        'result_type': 'played',
        'verification_status': 'pending',
        'verified_at': null,
      },
    };

void main() {
  group('Match', () {
    test('parses the extended match with teams, live score and display', () {
      final match = matchFromJson(matchJson(teamOne: _team(1, 'Omar Haddad / Ali Nasser'), teamTwo: _team(3, 'B / C')));

      expect(match.status, MatchStatus.inProgress);
      expect(match.isLive, isTrue);
      expect(match.roundLabel, 'Final');
      expect(match.category?.name, 'Men B');
      expect(match.teamOne?.players, hasLength(2));
      expect(match.teamOne?.players.first.side, 'left');
      expect(match.teamOne?.players.first.country, 'JO');
      expect(match.teamOne?.seed, 1);
      expect(match.liveScore?.sets.single.teamOne, 6);
      expect(match.currentGameDisplay?.teamOne, '15');
      expect(match.result?.verificationStatus, VerificationStatus.pending);
      expect(match.version, 1);
    });

    test('bracket placeholders have nullable teams', () {
      final match = matchFromJson(matchJson());
      expect(match.teamOne, isNull);
      expect(match.teamTwo, isNull);
    });

    test('walkover status is recognised', () {
      final json = matchJson()..['status'] = 'walkover';
      expect(matchFromJson(json).status, MatchStatus.walkover);
    });
  });

  group('LivePayload', () {
    final payloadJson = {
      'event': 'point',
      'match_id': 2,
      'tournament_id': 1,
      'category_id': 1,
      'status': 'in_progress',
      'version': 7,
      'team_one_id': 1,
      'team_two_id': 3,
      'sets_won_team_one': 0,
      'sets_won_team_two': 0,
      'live_score': {
        'sets': [],
        'current_set_games': {'team_one': 2, 'team_two': 1},
        'current_game': {'team_one': 3, 'team_two': 2},
        'is_tiebreak': false,
      },
      'current_game_display': {'team_one': '40', 'team_two': '30'},
      'winner_team_id': null,
      'last_point': null,
      'server_time': '2026-09-20T10:05:00+03:00',
    };

    test('parses and applies in place', () {
      final payload = LivePayloadModel.fromJson(payloadJson).toEntity();
      expect(payload.event, LiveEventType.point);
      expect(payload.version, 7);

      final match = matchFromJson(matchJson(teamOne: _team(1, 'A'), teamTwo: _team(3, 'B')));
      final updated = payload.applyTo(match);
      expect(updated.currentGameDisplay?.teamOne, '40');
      expect(updated.liveScore?.currentSetGames.teamOne, 2);
      expect(updated.version, 7);
      // Untouched identity fields survive.
      expect(updated.teamOne?.label, 'A');
      expect(updated.court, 'Court 1');
    });

    test('undo and correction may rewind the version', () {
      expect(LiveEventType.fromApi('undo').mayRewind, isTrue);
      expect(LiveEventType.fromApi('correction').mayRewind, isTrue);
      expect(LiveEventType.fromApi('point').mayRewind, isFalse);
      expect(LiveEventType.fromApi('something_new'), LiveEventType.unknown);
    });
  });

  group('Tournament', () {
    test('parses competition type, nullable venue and numeric money', () {
      final t = TournamentModel.fromJson({
        'id': 1,
        'name': 'Amman Open',
        'start_date': '2026-10-01',
        'end_date': '2026-10-03',
        'status': 'registration_open',
        'competition_type': 'ranked',
        'venue': null,
        'live_matches_count': 2,
        'categories': [
          {
            'id': 1,
            'name': 'Men B',
            'registration_fee': 20.5,
            'ranking_weight': 1,
            'waitlist_count': 3,
            'champion': null,
          },
        ],
      }).toEntity();
      expect(t.competitionType, CompetitionType.ranked);
      expect(t.isRanked, isTrue);
      expect(t.venue, isNull);
      expect(t.liveMatchesCount, 2);
      expect(t.categories.single.registrationFee, 20.5);
      expect(t.categories.single.rankingWeight, 1);
    });

    test('category detail parses standings and bracket', () {
      final detail = CategoryDetailModel.fromJson({
        'category': {'id': 1, 'name': 'Men B'},
        'teams': [_team(1, 'A')],
        'groups': [
          {
            'id': 3,
            'name': 'Group A',
            'finished': false,
            'standings': [
              {
                'position': 1,
                'team': _team(1, 'A'),
                'played': 2,
                'wins': 2,
                'losses': 0,
                'points': 6,
                'sets_won': 4,
                'sets_lost': 1,
                'set_difference': 3,
                'games_won': 24,
                'games_lost': 15,
                'game_difference': 9,
              },
            ],
            'matches': [],
          },
        ],
        'bracket': [
          {'round': 'semi_final', 'round_label': 'Semi-final', 'matches': [matchJson()]},
          {'round': 'final', 'round_label': 'Final', 'matches': [matchJson()]},
        ],
      }).toEntity();
      expect(detail.groups.single.standings.single.gameDifference, 9);
      expect(detail.bracket.map((r) => r.round), ['semi_final', 'final']);
      expect(detail.bracket.first.matches.single.teamOne, isNull);
    });
  });

  test('registration parses waitlist and payment state', () {
    final r = registrationFromJson({
      'id': 9,
      'status': 'waitlisted',
      'payment_status': 'pending',
      'registered_at': '2026-09-01T10:00:00+03:00',
      'promoted_at': null,
      'notes': null,
      'player': _player('PDL-1', 'Me'),
      'partner': _player('PDL-2', 'Partner'),
      'category': {
        'id': 1,
        'name': 'Men B',
        'registration_fee': 20,
        'tournament': {'id': 1, 'name': 'Amman Open', 'start_date': '2026-10-01'},
      },
      'can_cancel': true,
    });
    expect(r.status, RegistrationStatus.waitlisted);
    expect(r.needsPayment, isTrue);
    expect(r.category.tournamentName, 'Amman Open');
    expect(r.partner?.name, 'Partner');
  });
}
