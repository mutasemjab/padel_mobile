import 'package:flutter_test/flutter_test.dart';
import 'package:padel/core/routing/app_routes.dart';
import 'package:padel/features/notifications/data/models/notification_item_model.dart';
import 'package:padel/features/notifications/domain/entities/notification_item.dart';
import 'package:padel/features/notifications/presentation/notification_router.dart';

NotificationItem _push(Map<String, dynamic> data) => NotificationRouter.fromPush(data);

void main() {
  test('all 42 types parse; unknown types never crash', () {
    expect(NotificationType.values.where((t) => t != NotificationType.unknown), hasLength(42));
    expect(NotificationTypeX.fromApi('brand_new_type'), NotificationType.unknown);
  });

  test('API items read the localized title for the app language', () {
    final item = notificationFromJson({
      'id': 'uuid-1',
      'type': 'App\\Notifications\\X',
      'data': {
        'type': 'result_verified',
        'title': 'Result verified',
        'message': 'Your final was verified',
        'title_translations': {'en': 'Result verified', 'ar': 'تم توثيق النتيجة'},
        'message_translations': {'en': 'Your final was verified', 'ar': 'تم توثيق نهائيك'},
        'screen': 'match',
        'tournament_id': 1,
        'match_id': 2,
      },
      'read_at': null,
      'created_at': '2026-09-20T10:00:00+03:00',
    });
    expect(item.type, NotificationType.resultVerified);
    expect(item.title('ar'), 'تم توثيق النتيجة');
    expect(item.isRead, isFalse);
    expect(NotificationRouter.routeFor(item), AppRoutes.match(1, 2));
  });

  test('push data values arrive as strings', () {
    final item = _push({'type': 'match_live', 'screen': 'match', 'tournament_id': '4', 'match_id': '9'});
    expect(NotificationRouter.routeFor(item), AppRoutes.match(4, 9));
  });

  test('routes every screen', () {
    expect(NotificationRouter.routeFor(_push({'type': 'registration_waitlisted', 'screen': 'tournament', 'tournament_id': '3'})),
        AppRoutes.tournament(3));
    expect(NotificationRouter.routeFor(_push({'type': 'ranking_changed', 'screen': 'ranking'})), AppRoutes.rankings);
    expect(
      NotificationRouter.routeFor(_push({'type': 'achievement_unlocked', 'screen': 'achievements'}), myPlayerId: 'PDL-1'),
      AppRoutes.playerAchievements('PDL-1'),
    );
    expect(NotificationRouter.routeFor(_push({'type': 'partner_request', 'screen': 'partner_requests'})),
        AppRoutes.partnerRequests);
    expect(NotificationRouter.routeFor(_push({'type': 'partner_request_accepted', 'screen': 'profile', 'player_id': 'PDL-7'})),
        AppRoutes.player('PDL-7'));
    expect(NotificationRouter.routeFor(_push({'type': 'coach_booking_confirmed', 'screen': 'booking', 'booking_id': '5'})),
        AppRoutes.booking(5));
    expect(
      NotificationRouter.routeFor(_push({'type': 'coach_booking_requested', 'screen': 'booking', 'booking_id': '5'}),
          coachAccount: true),
      AppRoutes.coachPortal,
    );
    expect(NotificationRouter.routeFor(_push({'type': 'payment_failed', 'screen': 'payments', 'payment_reference': 'PAY-1'})),
        AppRoutes.payment('PAY-1'));
    expect(NotificationRouter.routeFor(_push({'type': 'three_d_profile_ready', 'screen': 'profile'})), AppRoutes.threeD);
    expect(NotificationRouter.routeFor(_push({'type': 'system_announcement', 'screen': 'notifications'})),
        AppRoutes.notifications);
    expect(NotificationRouter.routeFor(_push({'type': 'whatever'})), isNull);
  });
}
