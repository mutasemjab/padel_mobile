import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../players/domain/entities/player.dart';
import '../../domain/entities/auth_session.dart';

part 'auth_event.freezed.dart';

@freezed
sealed class AuthEvent with _$AuthEvent {
  /// Fired once on app boot to check for a stored token and, if present,
  /// rebuild the session for its account type.
  const factory AuthEvent.appStarted() = AuthAppStarted;

  /// A session obtained outside the bloc (phone + OTP sign-in) that is
  /// already persisted — just switch the app to it.
  const factory AuthEvent.sessionEstablished(AuthSession session) = AuthSessionEstablished;

  const factory AuthEvent.logoutRequested() = AuthLogoutRequested;

  /// Raised internally when [ForceLogoutNotifier] fires (any 401 anywhere).
  const factory AuthEvent.forceLogoutTriggered() = AuthForceLogoutTriggered;

  /// The own profile changed (edit / photo upload) — refresh session state.
  const factory AuthEvent.playerUpdated(Player player) = AuthPlayerUpdated;

  /// Re-fetch `auth/me` (e.g. after Premium status might have changed).
  const factory AuthEvent.refreshRequested() = AuthRefreshRequested;
}
