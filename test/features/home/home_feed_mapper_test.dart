import 'package:flutter_test/flutter_test.dart';
import 'package:padel/core/models/section_state.dart';
import 'package:padel/features/home/data/models/home_feed_mapper.dart';
import 'package:padel/features/home/domain/entities/home_feed.dart';

void main() {
  final feed = HomeFeedMapper.fromJson({
    'player': {'player_id': 'PDL-1', 'name': 'Omar'},
    'priority': ['pending_partner_requests', 'ranking', 'live_now', 'ai_daily_brief', 'stats', 'mystery'],
    'sections': {
      'live_now': {
        'state': 'empty',
        'data': {'mine': [], 'following': []},
      },
      'ranking': {
        'state': 'ok',
        'data': {
          'season': {'season': '2026', 'points': 70, 'position': 12, 'movement': -1},
          'skill': {'rating': 1016, 'level': 'C+', 'movement': null},
          'xp': 340,
        },
      },
      'pending_partner_requests': {
        'state': 'ok',
        'data': {'count': 2},
      },
      'ai_daily_brief': {'state': 'premium_required', 'data': null},
      'stats': {'state': 'insufficient_data', 'data': null},
      'mystery': {'state': 'ok', 'data': {'x': 1}},
    },
    'unread_notifications': 3,
  });

  test('keeps priority order and skips empty and unknown sections', () {
    expect(feed.ordered.map((s) => s.key), [
      'pending_partner_requests',
      'ranking',
      'ai_daily_brief',
      'stats',
    ]);
    expect(feed.unreadNotifications, 3);
  });

  test('parses typed section data', () {
    final ranking = feed.sections['ranking']!.data as RankingSnapshotSection;
    expect(ranking.seasonPoints, 70);
    expect(ranking.seasonMovement, -1);
    expect(ranking.skillMovement, isNull);
    expect(ranking.xp, 340);
    expect((feed.sections['pending_partner_requests']!.data as PendingPartnerRequestsSection).count, 2);
  });

  test('premium and insufficient states carry no data', () {
    expect(feed.sections['ai_daily_brief']!.state, SectionState.premiumRequired);
    expect(feed.sections['ai_daily_brief']!.data, isNull);
    expect(feed.sections['stats']!.state, SectionState.insufficientData);
  });

  test('unknown sections become UnknownSection instead of failing', () {
    expect(feed.sections['mystery']!.data, isA<UnknownSection>());
  });
}
