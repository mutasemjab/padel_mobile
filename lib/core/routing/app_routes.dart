/// Every route path in one place so widgets navigate without string typos.
class AppRoutes {
  const AppRoutes._();

  static const login = '/login';
  static const scorekeeperLogin = '/scorekeeper/login';
  static const scorekeeper = '/scorekeeper';
  static String scorekeeperMatch(int id) => '/scorekeeper/matches/$id';

  // Shell tabs
  static const home = '/';
  static const compete = '/compete';
  static const rankings = '/rankings';
  static const play = '/play';
  static const profile = '/profile';

  // Compete
  static String tournament(int id) => '/compete/tournaments/$id';
  static String tournamentCategory(int id, int categoryId) => '/compete/tournaments/$id/categories/$categoryId';
  static String match(int tournamentId, int matchId) => '/compete/tournaments/$tournamentId/matches/$matchId';
  static String liveMatch(int matchId) => '/matches/$matchId';
  static const myRegistrations = '/me/registrations';

  // Players
  static String player(String playerId) => '/players/$playerId';
  static String playerAchievements(String playerId) => '/players/$playerId/achievements';
  static String playerPartners(String playerId) => '/players/$playerId/partners';
  static String playerFollowers(String playerId) => '/players/$playerId/followers';
  static String playerFollowing(String playerId) => '/players/$playerId/following';
  static String playerRatingHistory(String playerId) => '/players/$playerId/rating-history';
  static const playerSearch = '/players';
  static const editProfile = '/me/edit';
  static const partnerRequests = '/me/partner-requests';
  static const challenges = '/me/challenges';

  // Play
  static String casualMatch(int id) => '/play/casual/$id';
  static const myCasualMatches = '/me/casual-matches';
  static const coaches = '/play/coaches';
  static String coach(int id) => '/play/coaches/$id';
  static const myBookings = '/me/bookings';
  static String booking(int id) => '/me/bookings/$id';
  static const trainingProgress = '/me/training-progress';
  static const venues = '/venues';
  static String venue(int id) => '/venues/$id';

  // Coach portal
  static const coachPortal = '/coach';
  static const coachProfileEdit = '/coach/profile';
  static String coachPlayerProgress(String playerId) => '/coach/players/$playerId/progress';

  // Other
  static const notifications = '/notifications';
  static const settings = '/settings';
  static const premium = '/premium';
  static const aiInsights = '/premium/ai';
  static const threeD = '/premium/3d';
  static const payments = '/me/payments';
  static String payment(String reference) => '/me/payments/$reference';
}
