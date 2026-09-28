import 'package:equatable/equatable.dart';

import '../../../coaches/domain/entities/coach.dart';
import '../../../players/domain/entities/player.dart';

/// `player` (player profile only), `coach` (coach portal only) or
/// `player_coach` (both).
enum AccountType {
  player,
  coach,
  playerCoach;

  static AccountType fromApi(String? raw) => switch (raw) {
    'coach' => AccountType.coach,
    'player_coach' => AccountType.playerCoach,
    _ => AccountType.player,
  };

  String get apiValue => switch (this) {
    AccountType.player => 'player',
    AccountType.coach => 'coach',
    AccountType.playerCoach => 'player_coach',
  };

  bool get hasPlayerProfile => this != AccountType.coach;

  bool get isCoach => this != AccountType.player;
}

class AuthSession extends Equatable {
  final String token;
  final AccountType accountType;

  /// Null for coach-only accounts.
  final Player? player;
  final Coach? coach;

  /// Phone sign-in only: the account was created by this verification.
  final bool isNewUser;

  /// Phone sign-in only: false until the required profile fields (at least
  /// the name) are filled in via `PUT auth/me`.
  final bool profileCompleted;

  const AuthSession({
    required this.token,
    required this.accountType,
    this.player,
    this.coach,
    this.isNewUser = false,
    this.profileCompleted = true,
  });

  @override
  List<Object?> get props => [token, accountType, player, coach, isNewUser, profileCompleted];
}
