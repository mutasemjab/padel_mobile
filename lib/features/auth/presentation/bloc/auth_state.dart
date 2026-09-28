import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failure.dart';
import '../../../coaches/domain/entities/coach.dart';
import '../../../players/domain/entities/player.dart';
import '../../domain/entities/auth_session.dart';

part 'auth_state.freezed.dart';

@freezed
sealed class AuthState with _$AuthState {
  /// Checking for a stored session on app boot — app root shows a splash.
  const factory AuthState.unknown() = AuthUnknown;

  const factory AuthState.unauthenticated({Failure? lastError}) = AuthUnauthenticated;

  /// [player] is null for coach-only accounts (they live in the Coach Portal).
  const factory AuthState.authenticated({
    Player? player,
    @Default(AccountType.player) AccountType accountType,
    Coach? coach,
  }) = AuthAuthenticated;
}

extension AuthStateX on AuthState {
  Player? get currentPlayer => switch (this) {
    AuthAuthenticated(:final player) => player,
    _ => null,
  };

  bool get isCoachOnly => this is AuthAuthenticated && (this as AuthAuthenticated).accountType == AccountType.coach;
}
