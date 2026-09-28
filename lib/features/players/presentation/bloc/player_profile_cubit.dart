import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/error/failure.dart';
import '../../domain/usecases/player_insight_usecases.dart';
import '../../domain/usecases/social_actions_usecases.dart';
import 'player_profile_state.dart';

/// Loads the athlete card (`GET players/{id}`) and owns the optimistic
/// follow / respect actions for that screen.
class PlayerProfileCubit extends Cubit<PlayerProfileState> {
  final GetPlayerProfileUseCase getProfile;
  final FollowPlayerUseCase followPlayer;
  final UnfollowPlayerUseCase unfollowPlayer;
  final RespectPlayerUseCase respectPlayer;

  PlayerProfileCubit({
    required this.getProfile,
    required this.followPlayer,
    required this.unfollowPlayer,
    required this.respectPlayer,
  }) : super(const PlayerProfileState.initial());

  Future<void> load(String playerId, {bool silent = false}) async {
    if (!silent || state is! PlayerProfileLoaded) emit(const PlayerProfileState.loading());
    final result = await getProfile(playerId);
    if (isClosed) return;
    result.match(
      (failure) {
        if (!silent || state is! PlayerProfileLoaded) emit(PlayerProfileState.error(failure));
      },
      (profile) => emit(PlayerProfileState.loaded(profile: profile)),
    );
  }

  /// Optimistic flip; reverts and returns the failure if the call fails.
  Future<Failure?> toggleFollow() async {
    final current = state;
    if (current is! PlayerProfileLoaded) return null;
    final social = current.profile.social;
    final following = social.isFollowing;
    emit(PlayerProfileState.loaded(
      profile: current.profile.copyWith(
        social: social.copyWith(isFollowing: !following, followers: social.followers + (following ? -1 : 1)),
      ),
    ));
    final id = current.profile.player.playerId;
    final result = following ? await unfollowPlayer(id) : await followPlayer(id);
    return result.match(
      (failure) {
        if (!isClosed) emit(current);
        return failure;
      },
      (_) => null,
    );
  }

  Future<Failure?> sendRespect() async {
    final current = state;
    if (current is! PlayerProfileLoaded || current.profile.social.hasRespected) return null;
    final social = current.profile.social;
    emit(PlayerProfileState.loaded(
      profile: current.profile.copyWith(social: social.copyWith(hasRespected: true, respects: social.respects + 1)),
    ));
    final result = await respectPlayer(current.profile.player.playerId);
    return result.match(
      (failure) {
        if (!isClosed) emit(current);
        return failure;
      },
      (_) => null,
    );
  }
}
