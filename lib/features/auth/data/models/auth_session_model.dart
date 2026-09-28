import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../coaches/data/models/coach_model.dart';
import '../../../players/data/models/player_model.dart';
import '../../domain/entities/auth_session.dart';

part 'auth_session_model.freezed.dart';
part 'auth_session_model.g.dart';

@freezed
abstract class AuthSessionModel with _$AuthSessionModel {
  const factory AuthSessionModel({
    required String token,
    @JsonKey(name: 'account_type') @Default('player') String accountType,
    PlayerModel? player,
    CoachModel? coach,

    /// Only sent by `auth/otp/verify`.
    @JsonKey(name: 'is_new_user') @Default(false) bool isNewUser,
    @JsonKey(name: 'profile_completed') @Default(true) bool profileCompleted,
  }) = _AuthSessionModel;

  factory AuthSessionModel.fromJson(Map<String, dynamic> json) => _$AuthSessionModelFromJson(json);
}

extension AuthSessionModelX on AuthSessionModel {
  AuthSession toEntity() => AuthSession(
    token: token,
    accountType: AccountType.fromApi(accountType),
    player: player?.toEntity(),
    coach: coach?.toEntity(),
    isNewUser: isNewUser,
    profileCompleted: profileCompleted,
  );
}
