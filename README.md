# Padel Platform

Flutter client for the Padel Platform REST API — tournaments with realtime live scoring, rankings (season / skill / XP), partners, casual play, a coaching marketplace with a coach portal, notifications (FCM + in-app), and Premium (AI insights, advanced analytics, 3D identity).

## Architecture

Clean Architecture per feature (`data` → `domain` → `presentation`), `flutter_bloc` cubits with freezed states, `get_it` DI (`core/di` + `features/*/di`), `dio` networking, `freezed`/`json_serializable` models, `go_router` with a `StatefulShellRoute` (Home · Compete · Rankings · Play · Profile).

Key shared pieces in `lib/core`:

| Area | What lives there |
|---|---|
| `theme/` | Design system: `AppColors` (night-court palette), `AppTokens` (dark/light semantic colors via `context.tokens`), `AppTypography` (Barlow Condensed numerals, Inter / IBM Plex Sans Arabic), spacing/radius/sizes, shadows, gradients, full `ThemeData` |
| `widgets/` | Reusable kit: `AppCard`, `SectionHeader`, `PlayerAvatar`, `MetricTile` (Skill / Season / XP look deliberately different), `MovementIndicator`, `TrendSparkline`, `CompetitionBadge`, `LiveIndicator`, `SetChip`, `ProgressRing`, `StatCard`, state views (`ErrorState`, `InsufficientDataState`, `ComingSoonState`, `PremiumRequiredState`), skeletons, `PaginatedListView` |
| `state/` | Generic freezed `ViewState<T>`, `PagedState<T>`, `ActionState` + `ViewCubit` / `PagedCubit` / `ActionCubit` bases |
| `error/` | `Failure` hierarchy with backend `code`s (`PREMIUM_REQUIRED` → paywall, 503 provider codes → "coming soon") |
| `network/` | Envelope helpers, pagination, `guard()` for repositories |
| `meta/` | `EnumsService` — every enum label/picker comes from `GET meta/enums` |
| `realtime/` | `RealtimeClient` interface, Pusher-protocol socket client, `PollingRealtimeClient` fallback, hybrid switcher |
| `push/` | FCM + local notifications, device-token registration |

## Getting started

```
flutter pub get
dart run build_runner build
flutter run --dart-define=API_BASE_URL=https://your-host/api/v1/
```

Push notifications need the Firebase config files for the app's Firebase project (`android/app/google-services.json`, `ios/Runner/GoogleService-Info.plist`). Without them the app runs normally with push disabled.

## Tests

```
flutter test
```

Covers model parsing against the API contract, the error mapper, home-feed parsing, notification routing, the live-match version logic, paged cubits, and an Arabic/English widget smoke test.
