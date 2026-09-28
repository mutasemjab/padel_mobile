import 'package:equatable/equatable.dart';

/// All 23 backend notification types. Anything else maps to [unknown] and
/// renders generically — never a crash.
enum NotificationType {
  registrationApproved('registration_approved'),
  registrationRejected('registration_rejected'),
  registrationWaitlisted('registration_waitlisted'),
  registrationPromoted('registration_promoted'),
  tournamentReminder('tournament_reminder'),
  matchReminder('match_reminder'),
  matchLive('match_live'),
  resultVerified('result_verified'),
  rankingChanged('ranking_changed'),
  achievementUnlocked('achievement_unlocked'),
  partnerRequest('partner_request'),
  partnerRequestAccepted('partner_request_accepted'),
  challengeReceived('challenge_received'),
  coachBookingRequested('coach_booking_requested'),
  coachBookingConfirmed('coach_booking_confirmed'),
  coachBookingRejected('coach_booking_rejected'),
  coachBookingCancelled('coach_booking_cancelled'),
  coachBookingCompleted('coach_booking_completed'),
  paymentSucceeded('payment_succeeded'),
  paymentFailed('payment_failed'),
  threeDProfileReady('three_d_profile_ready'),
  threeDProfileFailed('three_d_profile_failed'),
  systemAnnouncement('system_announcement'),
  unknown('unknown');

  final String apiValue;

  const NotificationType(this.apiValue);
}

extension NotificationTypeX on NotificationType {
  static NotificationType fromApi(String? raw) =>
      NotificationType.values.firstWhere((t) => t.apiValue == raw, orElse: () => NotificationType.unknown);
}

/// Where a notification (or a push tap) should take the user.
enum NotificationScreen {
  tournament,
  match,
  ranking,
  achievements,
  partnerRequests,
  profile,
  booking,
  payments,
  notifications,
  unknown;

  static NotificationScreen fromApi(String? raw) => switch (raw) {
        'tournament' => tournament,
        'match' => match,
        'ranking' => ranking,
        'achievements' => achievements,
        'partner_requests' => partnerRequests,
        'profile' => profile,
        'booking' => booking,
        'payments' => payments,
        'notifications' => notifications,
        _ => unknown,
      };
}

class NotificationItem extends Equatable {
  final String id;
  final NotificationType type;

  /// Raw `data` payload (ids, extra fields). Push payload values are strings,
  /// API values may be numbers — read ids through [intId]/[stringId].
  final Map<String, dynamic> data;
  final DateTime? readAt;
  final DateTime createdAt;

  const NotificationItem({
    required this.id,
    required this.type,
    required this.data,
    this.readAt,
    required this.createdAt,
  });

  bool get isRead => readAt != null;

  NotificationScreen get screen => NotificationScreen.fromApi(data['screen']?.toString());

  int? intId(String key) {
    final v = data[key];
    if (v is num) return v.toInt();
    return int.tryParse(v?.toString() ?? '');
  }

  String? stringId(String key) {
    final v = data[key]?.toString();
    return v == null || v.isEmpty ? null : v;
  }

  String? _translated(String key, String languageCode) {
    final translations = data['${key}_translations'];
    if (translations is Map) {
      final value = translations[languageCode]?.toString();
      if (value != null && value.isNotEmpty) return value;
    }
    final value = data[key]?.toString();
    return value == null || value.isEmpty ? null : value;
  }

  /// Already-localized title for the app language (backend stores EN + AR).
  String? title(String languageCode) => _translated('title', languageCode);

  String? message(String languageCode) => _translated('message', languageCode);

  NotificationItem copyWith({DateTime? readAt}) => NotificationItem(
        id: id,
        type: type,
        data: data,
        readAt: readAt ?? this.readAt,
        createdAt: createdAt,
      );

  @override
  List<Object?> get props => [id, type, data, readAt, createdAt];
}
