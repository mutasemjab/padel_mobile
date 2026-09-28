import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/auth/domain/entities/auth_session.dart';
import '../../features/auth/presentation/bloc/auth_bloc.dart';
import '../../features/auth/presentation/bloc/auth_state.dart';
import '../../features/auth/presentation/pages/edit_profile_page.dart';
import '../../features/auth/presentation/pages/login_page.dart';
import '../../features/casual_matches/presentation/pages/casual_match_detail_page.dart';
import '../../features/casual_matches/presentation/pages/casual_matches_page.dart';
import '../../features/coach_portal/presentation/pages/coach_portal_page.dart';
import '../../features/coach_portal/presentation/pages/coach_profile_edit_page.dart';
import '../../features/coaches/presentation/pages/coach_detail_page.dart';
import '../../features/coaches/presentation/pages/coaches_page.dart';
import '../../features/coaches/presentation/pages/my_training_pages.dart';
import '../../features/home/presentation/pages/home_page.dart';
import '../../features/home/presentation/pages/main_shell.dart';
import '../../features/live_match/presentation/pages/live_match_page.dart';
import '../../features/notifications/presentation/pages/notifications_page.dart';
import '../../features/partners/presentation/pages/partner_requests_page.dart';
import '../../features/players/presentation/pages/achievements_page.dart';
import '../../features/players/presentation/pages/player_list_pages.dart';
import '../../features/players/presentation/pages/player_profile_page.dart';
import '../../features/players/presentation/pages/rating_history_page.dart';
import '../../features/premium/presentation/pages/premium_pages.dart';
import '../../features/rankings/presentation/pages/rankings_page.dart';
import '../../features/scorekeeper/presentation/scorekeeper_pages.dart';
import '../../features/settings/presentation/pages/settings_page.dart';
import '../../features/tournaments/presentation/pages/category_detail_page.dart';
import '../../features/tournaments/presentation/pages/my_registrations_page.dart';
import '../../features/tournaments/presentation/pages/tournament_detail_page.dart';
import '../../features/tournaments/presentation/pages/tournaments_page.dart';
import '../../features/venues/presentation/venues_pages.dart';
import 'app_routes.dart';
import 'go_router_refresh_stream.dart';

int _id(GoRouterState s, String key) => int.parse(s.pathParameters[key]!);

/// Central route table. Auth redirect logic lives here, driven by the
/// singleton [AuthBloc] so any 401-triggered force-logout is reflected
/// immediately. Coach-only accounts are kept inside the Coach Portal.
GoRouter buildAppRouter(AuthBloc authBloc, {GlobalKey<NavigatorState>? navigatorKey}) {
  bool isPublic(String location) => location == AppRoutes.login || location.startsWith('/scorekeeper');

  bool coachAllowed(String location) =>
      location.startsWith(AppRoutes.coachPortal) ||
      location == AppRoutes.settings ||
      location == AppRoutes.notifications ||
      location.startsWith('/scorekeeper');

  return GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: AppRoutes.home,
    refreshListenable: GoRouterRefreshStream(authBloc.stream),
    redirect: (context, state) {
      final authState = authBloc.state;
      final location = state.matchedLocation;
      if (authState is AuthUnknown) return null;

      final authenticated = authState is AuthAuthenticated;
      if (!authenticated) return isPublic(location) ? null : AppRoutes.login;
      if (location == AppRoutes.login) {
        return authState.accountType == AccountType.coach ? AppRoutes.coachPortal : AppRoutes.home;
      }
      if (authState.accountType == AccountType.coach && !coachAllowed(location)) return AppRoutes.coachPortal;
      return null;
    },
    routes: [
      GoRoute(path: AppRoutes.login, builder: (_, _) => const LoginPage()),
      GoRoute(path: AppRoutes.scorekeeperLogin, builder: (_, _) => const ScorekeeperLoginPage()),
      GoRoute(path: AppRoutes.scorekeeper, builder: (_, _) => const ScorekeeperMatchesPage()),
      StatefulShellRoute.indexedStack(
        builder: (context, state, shell) => MainShell(navigationShell: shell),
        branches: [
          StatefulShellBranch(
            routes: [GoRoute(path: AppRoutes.home, builder: (_, _) => const HomePage())],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.compete,
                builder: (_, _) => const CompetePage(),
                routes: [
                  GoRoute(
                    path: 'tournaments/:id',
                    builder: (_, s) => TournamentDetailPage(tournamentId: _id(s, 'id')),
                    routes: [
                      GoRoute(
                        path: 'categories/:categoryId',
                        builder: (_, s) =>
                            CategoryDetailPage(tournamentId: _id(s, 'id'), categoryId: _id(s, 'categoryId')),
                      ),
                      GoRoute(
                        path: 'matches/:matchId',
                        builder: (_, s) => LiveMatchPage(tournamentId: _id(s, 'id'), matchId: _id(s, 'matchId')),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [GoRoute(path: AppRoutes.rankings, builder: (_, _) => const RankingsPage())],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.play,
                builder: (_, _) => const PlayPage(),
                routes: [
                  GoRoute(
                    path: 'casual/:id',
                    builder: (_, s) => CasualMatchDetailPage(id: _id(s, 'id')),
                  ),
                  GoRoute(
                    path: 'coaches',
                    builder: (_, _) => const CoachesPage(),
                    routes: [
                      GoRoute(
                        path: ':id',
                        builder: (_, s) => CoachDetailPage(coachId: _id(s, 'id')),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                path: AppRoutes.profile,
                builder: (context, state) {
                  final id = authBloc.state.currentPlayer?.playerId ?? '';
                  return PlayerProfilePage(key: ValueKey(id), playerId: id);
                },
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        path: '/matches/:matchId',
        builder: (_, s) => LiveMatchPage(matchId: _id(s, 'matchId')),
      ),
      GoRoute(path: AppRoutes.playerSearch, builder: (_, _) => const PlayerSearchPage()),
      GoRoute(
        path: '/players/:playerId',
        builder: (_, s) => PlayerProfilePage(playerId: s.pathParameters['playerId']!),
        routes: [
          GoRoute(
            path: 'achievements',
            builder: (_, s) => AchievementsPage(playerId: s.pathParameters['playerId']!),
          ),
          GoRoute(
            path: 'followers',
            builder: (_, s) => FollowListPage(playerId: s.pathParameters['playerId']!, following: false),
          ),
          GoRoute(
            path: 'following',
            builder: (_, s) => FollowListPage(playerId: s.pathParameters['playerId']!, following: true),
          ),
          GoRoute(
            path: 'rating-history',
            builder: (_, s) => RatingHistoryPage(playerId: s.pathParameters['playerId']!),
          ),
        ],
      ),
      GoRoute(path: AppRoutes.editProfile, builder: (_, _) => const EditProfilePage()),
      GoRoute(path: AppRoutes.partnerRequests, builder: (_, _) => const PartnerRequestsPage()),
      GoRoute(path: AppRoutes.challenges, builder: (_, _) => const ChallengesPage()),
      GoRoute(path: AppRoutes.myRegistrations, builder: (_, _) => const MyRegistrationsPage()),
      GoRoute(path: AppRoutes.myCasualMatches, builder: (_, _) => const MyCasualMatchesPage()),
      GoRoute(path: AppRoutes.myBookings, builder: (_, _) => const MyBookingsPage()),
      GoRoute(
        path: '/me/bookings/:id',
        builder: (_, s) => BookingDetailPage(id: _id(s, 'id')),
      ),
      GoRoute(path: AppRoutes.trainingProgress, builder: (_, _) => const TrainingProgressPage()),
      GoRoute(path: AppRoutes.payments, builder: (_, _) => const PaymentsPage()),
      GoRoute(
        path: '/me/payments/:reference',
        builder: (_, s) => PaymentStatusPage(reference: s.pathParameters['reference']!),
      ),
      GoRoute(path: AppRoutes.venues, builder: (_, _) => const VenuesPage()),
      GoRoute(
        path: '/venues/:id',
        builder: (_, s) => VenueDetailPage(id: _id(s, 'id')),
      ),
      GoRoute(path: AppRoutes.notifications, builder: (_, _) => const NotificationsPage()),
      GoRoute(path: AppRoutes.settings, builder: (_, _) => const SettingsPage()),
      GoRoute(path: AppRoutes.premium, builder: (_, _) => const PremiumPage()),
      GoRoute(path: AppRoutes.aiInsights, builder: (_, _) => const AiInsightsPage()),
      GoRoute(path: AppRoutes.threeD, builder: (_, _) => const ThreeDPage()),
      GoRoute(
        path: AppRoutes.coachPortal,
        builder: (_, _) => const CoachPortalPage(),
        routes: [
          GoRoute(path: 'profile', builder: (_, _) => const CoachProfileEditPage()),
          GoRoute(
            path: 'players/:playerId/progress',
            builder: (_, s) => CoachPlayerProgressPage(playerId: s.pathParameters['playerId']!),
          ),
        ],
      ),
    ],
  );
}
