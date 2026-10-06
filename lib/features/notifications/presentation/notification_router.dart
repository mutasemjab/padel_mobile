import '../../../core/routing/app_routes.dart';
import '../domain/entities/notification_item.dart';

/// Maps a notification (list item or push payload) to the screen it's about,
/// using `data.screen` and the IDs the backend sends (push values arrive as
/// strings, API values may be numbers — [NotificationItem] reads both).
class NotificationRouter {
  const NotificationRouter._();

  static String? routeFor(NotificationItem n, {bool coachAccount = false, String? myPlayerId}) {
    final tournamentId = n.intId('tournament_id');
    final matchId = n.intId('match_id');
    final playerId = n.stringId('player_id');
    final bookingId = n.intId('booking_id');
    final reference = n.stringId('payment_reference');

    switch (n.screen) {
      case NotificationScreen.tournament:
        final categoryId = n.intId('tournament_category_id');
        if (tournamentId == null) return AppRoutes.myRegistrations;
        return categoryId != null && n.type == NotificationType.tournamentReminder
            ? AppRoutes.tournamentCategory(tournamentId, categoryId)
            : AppRoutes.tournament(tournamentId);
      case NotificationScreen.match:
        if (matchId == null) return tournamentId == null ? null : AppRoutes.tournament(tournamentId);
        return tournamentId == null ? AppRoutes.liveMatch(matchId) : AppRoutes.match(tournamentId, matchId);
      case NotificationScreen.ranking:
        return AppRoutes.rankings;
      case NotificationScreen.achievements:
        return myPlayerId == null ? AppRoutes.profile : AppRoutes.playerAchievements(myPlayerId);
      case NotificationScreen.partnerRequests:
        return AppRoutes.partnerRequests;
      case NotificationScreen.profile:
        if (n.type == NotificationType.threeDProfileReady || n.type == NotificationType.threeDProfileFailed) {
          return AppRoutes.threeD;
        }
        if (n.type == NotificationType.challengeReceived) return AppRoutes.challenges;
        if (n.type == NotificationType.duo3dReady) return AppRoutes.profile;
        return playerId == null ? AppRoutes.profile : AppRoutes.player(playerId);
      case NotificationScreen.booking:
        // Coaches receive "requested"/"cancelled" for their own inbox.
        if (coachAccount && n.type == NotificationType.coachBookingRequested) return AppRoutes.coachPortal;
        return bookingId == null ? AppRoutes.myBookings : AppRoutes.booking(bookingId);
      case NotificationScreen.payments:
        return reference == null ? AppRoutes.payments : AppRoutes.payment(reference);
      case NotificationScreen.notifications:
        return AppRoutes.notifications;
      case NotificationScreen.casualMatch:
        final casualId = n.intId('casual_match_id');
        return casualId == null ? AppRoutes.myCasualMatches : AppRoutes.casualMatchStandalone(casualId);
      case NotificationScreen.announcement:
        // The full text lives in the notification list (tap to read it all).
        return AppRoutes.notifications;
      case NotificationScreen.unknown:
        return null;
    }
  }

  /// Builds a [NotificationItem] from an FCM `data` map (all strings).
  static NotificationItem fromPush(Map<String, dynamic> data) => NotificationItem(
        id: data['notification_id']?.toString() ?? data['id']?.toString() ?? '',
        type: NotificationTypeX.fromApi(data['type']?.toString()),
        data: data,
        createdAt: DateTime.now(),
      );
}
