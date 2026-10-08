/// Centralized REST paths for the Padel Platform backend (relative to [ApiEndpoints.baseUrl]).
class ApiEndpoints {
  const ApiEndpoints._();

  /// Override at build time with --dart-define=API_BASE_URL=... for staging/prod.
  static const String baseUrl = String.fromEnvironment(
    'API_BASE_URL',
    defaultValue: 'https://playmakerpadel.com/api/v1/',
  );

  /// `POST {base}/broadcasting/auth` — private-channel authorization.
  static String get broadcastingAuth => '${baseUrl}broadcasting/auth';

  // Bootstrap & meta
  static const String metaEnums = 'meta/enums';
  static const String realtimeConfig = 'realtime/config';

  // Auth & own profile
  static const String logout = 'auth/logout';
  static const String me = 'auth/me';
  static const String mePhoto = 'auth/me/photo';
  static const String password = 'auth/password';

  // Phone + OTP sign-in
  static const String otpSend = 'auth/otp/send';
  static const String otpResend = 'auth/otp/resend';
  static const String otpVerify = 'auth/otp/verify';

  // Google / Apple sign-in
  static String socialSignIn(String provider) => 'auth/social/$provider';

  // Home
  static const String home = 'me/home';

  // Players & social
  static const String players = 'players';
  static String player(String playerId) => 'players/$playerId';
  static String playerStats(String playerId) => 'players/$playerId/stats';
  static String playerRatingHistory(String playerId) => 'players/$playerId/rating-history';
  static String playerSeasonHistory(String playerId) => 'players/$playerId/season-history';
  static String playerTournaments(String playerId) => 'players/$playerId/tournaments';
  static String playerMatches(String playerId) => 'players/$playerId/matches';
  static String playerAchievements(String playerId) => 'players/$playerId/achievements';
  static String playerFollowers(String playerId) => 'players/$playerId/followers';
  static String playerFollowing(String playerId) => 'players/$playerId/following';
  static String playerFollow(String playerId) => 'players/$playerId/follow';
  static String playerRespect(String playerId) => 'players/$playerId/respect';
  static String playerChallenge(String playerId) => 'players/$playerId/challenge';
  static String playerPartners(String playerId) => 'players/$playerId/partners';
  static String player3dProfile(String playerId) => 'players/$playerId/3d-profile';
  static const String achievements = 'achievements';
  static const String myChallenges = 'me/challenges';
  static String challengeRespond(int challengeId) => 'challenges/$challengeId/respond';

  // Partners
  static const String recommendedPartners = 'me/partners/recommended';
  static const String myPartnerRequests = 'me/partner-requests';
  static const String partnerRequests = 'partner-requests';
  static String partnerRequestRespond(int id) => 'partner-requests/$id/respond';
  static String partnerRequestCancel(int id) => 'partner-requests/$id/cancel';
  static const String myMainPartner = 'me/main-partner';
  static const String duo3d = 'me/main-partner/duo-3d';

  // Tournaments, registration & matches
  static const String tournaments = 'tournaments';
  static String tournament(int id) => 'tournaments/$id';
  static String tournamentCategory(int id, int categoryId) => 'tournaments/$id/categories/$categoryId';
  static String tournamentMatches(int id) => 'tournaments/$id/matches';
  static String tournamentResults(int id) => 'tournaments/$id/results';
  static String tournamentLive(int id) => 'tournaments/$id/live';
  static String tournamentMatch(int tournamentId, int matchId) => 'tournaments/$tournamentId/matches/$matchId';
  static String categoryEligibility(int id, int categoryId) => 'tournaments/$id/categories/$categoryId/eligibility';
  static String categoryRegistrations(int id, int categoryId) => 'tournaments/$id/categories/$categoryId/registrations';
  static const String myRegistrations = 'me/registrations';
  static String registrationCancel(int id) => 'registrations/$id/cancel';
  static String registrationUpdate(int id) => 'registrations/$id';
  static String registrationPartner(int id) => 'registrations/$id/partner';
  static String registrationPartnerResponse(int id) => 'registrations/$id/partner-response';
  static String registrationPay(int id) => 'registrations/$id/pay';
  static const String liveMatches = 'matches/live';
  static String match(int id) => 'matches/$id';
  static String matchLive(int id) => 'matches/$id/live';
  static String matchPoints(int id) => 'matches/$id/points';

  // Rankings
  static const String rankings = 'rankings';
  static const String rankingSeasons = 'rankings/seasons';
  static const String myRanking = 'me/ranking';

  // Casual play & venues
  static const String casualMatches = 'casual-matches';
  static String casualMatch(int id) => 'casual-matches/$id';
  static String casualMatchJoin(int id) => 'casual-matches/$id/join';
  static String casualMatchLeave(int id) => 'casual-matches/$id/leave';
  static String casualMatchCancel(int id) => 'casual-matches/$id/cancel';
  static String casualMatchInvite(int id) => 'casual-matches/$id/invite';
  static String casualInvitationRespond(int id) => 'casual-matches/$id/invitation/respond';
  static const String notificationSettings = 'me/notification-settings';
  static String casualParticipantRespond(int id, int participantId) =>
      'casual-matches/$id/participants/$participantId/respond';
  static const String myCasualMatches = 'me/casual-matches';
  static const String venues = 'venues';
  static String venue(int id) => 'venues/$id';

  // Coaches (player side)
  static const String coaches = 'coaches';
  static String coach(int id) => 'coaches/$id';
  static String coachAvailability(int id) => 'coaches/$id/availability';
  static String coachReviews(int id) => 'coaches/$id/reviews';
  static String coachBookings(int id) => 'coaches/$id/bookings';
  static const String myBookings = 'me/bookings';
  static String myBooking(int id) => 'me/bookings/$id';
  static String myBookingCancel(int id) => 'me/bookings/$id/cancel';
  static String myBookingReview(int id) => 'me/bookings/$id/review';
  static const String myTrainingProgress = 'me/training-progress';

  // Coach portal
  static const String coachProfile = 'coach/profile';
  static const String coachPortalAvailability = 'coach/availability';
  static String coachPortalAvailabilitySlot(int id) => 'coach/availability/$id';
  static const String coachPortalBookings = 'coach/bookings';
  static String coachPortalBookingAction(int id, String action) => 'coach/bookings/$id/$action';
  static String coachPortalPlayerProgress(String playerId) => 'coach/players/$playerId/progress';

  // Notifications & devices
  static const String notifications = 'notifications';
  static const String notificationsUnreadCount = 'notifications/unread-count';
  static const String notificationsReadAll = 'notifications/read-all';
  // Laravel notification ids are UUIDs, not ints.
  static String notificationRead(String id) => 'notifications/$id/read';
  static const String deviceTokens = 'device-tokens';

  // Premium, AI, 3D, payments
  static const String premiumPlans = 'premium/plans';
  static const String premiumStatus = 'premium/status';
  static const String premiumCheckout = 'premium/checkout';
  static const String myPayments = 'me/payments';
  static String payment(String reference) => 'payments/$reference';
  static const String aiInsights = 'ai/insights';
  static String aiInsightGenerate(String type) => 'ai/insights/$type';
  static String aiInsight(int id) => 'ai/insights/$id';
  static const String my3dProfile = 'me/3d-profile';

  // Scorekeeper (staff)
  static const String scorekeeperLogin = 'scorekeeper/auth/login';
  static const String scorekeeperMatches = 'scorekeeper/matches';
  static String scorekeeperPoints(int matchId) => 'scorekeeper/matches/$matchId/points';
  static String scorekeeperUndo(int matchId) => 'scorekeeper/matches/$matchId/undo';
  static String scorekeeperEnd(int matchId) => 'scorekeeper/matches/$matchId/end';
  static String scorekeeperPoint(int matchId, int pointId) => 'scorekeeper/matches/$matchId/points/$pointId';
  static String scorekeeperPointDetails(int matchId, int pointId) =>
      'scorekeeper/matches/$matchId/points/$pointId/details';
}
