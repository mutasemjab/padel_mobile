import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/realtime/realtime_client.dart';
import '../../../tournaments/domain/entities/live_payload.dart';
import '../../../tournaments/domain/entities/match.dart';

part 'live_match_state.freezed.dart';

@freezed
sealed class LiveMatchState with _$LiveMatchState {
  const factory LiveMatchState.initial() = LiveMatchInitial;

  const factory LiveMatchState.loading() = LiveMatchLoading;

  const factory LiveMatchState.loaded({
    required Match match,
    @Default([]) List<PointEvent> points,

    /// What the latest applied payload was (drives the animation).
    LiveEventType? lastEvent,

    /// Bumps on every applied payload so identical events still animate.
    @Default(0) int eventSeq,
    @Default(RealtimeTransport.idle) RealtimeTransport transport,
    @Default(5) int pollSeconds,
  }) = LiveMatchLoaded;

  const factory LiveMatchState.error(Failure failure) = LiveMatchError;
}
