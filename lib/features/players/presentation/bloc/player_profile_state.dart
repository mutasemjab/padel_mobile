import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/player_profile.dart';

part 'player_profile_state.freezed.dart';

@freezed
sealed class PlayerProfileState with _$PlayerProfileState {
  const factory PlayerProfileState.initial() = PlayerProfileInitial;

  const factory PlayerProfileState.loading() = PlayerProfileLoading;

  /// Social state (`is_following`, `has_respected`, counts) comes from the
  /// backend and is updated optimistically by follow / respect.
  const factory PlayerProfileState.loaded({required PlayerProfile profile}) = PlayerProfileLoaded;

  const factory PlayerProfileState.error(Failure failure) = PlayerProfileError;
}
