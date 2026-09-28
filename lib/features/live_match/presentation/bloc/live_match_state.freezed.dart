// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_match_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LiveMatchState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiveMatchState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LiveMatchState()';
}


}

/// @nodoc
class $LiveMatchStateCopyWith<$Res>  {
$LiveMatchStateCopyWith(LiveMatchState _, $Res Function(LiveMatchState) __);
}


/// Adds pattern-matching-related methods to [LiveMatchState].
extension LiveMatchStatePatterns on LiveMatchState {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( LiveMatchInitial value)?  initial,TResult Function( LiveMatchLoading value)?  loading,TResult Function( LiveMatchLoaded value)?  loaded,TResult Function( LiveMatchError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case LiveMatchInitial() when initial != null:
return initial(_that);case LiveMatchLoading() when loading != null:
return loading(_that);case LiveMatchLoaded() when loaded != null:
return loaded(_that);case LiveMatchError() when error != null:
return error(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( LiveMatchInitial value)  initial,required TResult Function( LiveMatchLoading value)  loading,required TResult Function( LiveMatchLoaded value)  loaded,required TResult Function( LiveMatchError value)  error,}){
final _that = this;
switch (_that) {
case LiveMatchInitial():
return initial(_that);case LiveMatchLoading():
return loading(_that);case LiveMatchLoaded():
return loaded(_that);case LiveMatchError():
return error(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( LiveMatchInitial value)?  initial,TResult? Function( LiveMatchLoading value)?  loading,TResult? Function( LiveMatchLoaded value)?  loaded,TResult? Function( LiveMatchError value)?  error,}){
final _that = this;
switch (_that) {
case LiveMatchInitial() when initial != null:
return initial(_that);case LiveMatchLoading() when loading != null:
return loading(_that);case LiveMatchLoaded() when loaded != null:
return loaded(_that);case LiveMatchError() when error != null:
return error(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Match match,  List<PointEvent> points,  LiveEventType? lastEvent,  int eventSeq,  RealtimeTransport transport,  int pollSeconds)?  loaded,TResult Function( Failure failure)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case LiveMatchInitial() when initial != null:
return initial();case LiveMatchLoading() when loading != null:
return loading();case LiveMatchLoaded() when loaded != null:
return loaded(_that.match,_that.points,_that.lastEvent,_that.eventSeq,_that.transport,_that.pollSeconds);case LiveMatchError() when error != null:
return error(_that.failure);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Match match,  List<PointEvent> points,  LiveEventType? lastEvent,  int eventSeq,  RealtimeTransport transport,  int pollSeconds)  loaded,required TResult Function( Failure failure)  error,}) {final _that = this;
switch (_that) {
case LiveMatchInitial():
return initial();case LiveMatchLoading():
return loading();case LiveMatchLoaded():
return loaded(_that.match,_that.points,_that.lastEvent,_that.eventSeq,_that.transport,_that.pollSeconds);case LiveMatchError():
return error(_that.failure);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Match match,  List<PointEvent> points,  LiveEventType? lastEvent,  int eventSeq,  RealtimeTransport transport,  int pollSeconds)?  loaded,TResult? Function( Failure failure)?  error,}) {final _that = this;
switch (_that) {
case LiveMatchInitial() when initial != null:
return initial();case LiveMatchLoading() when loading != null:
return loading();case LiveMatchLoaded() when loaded != null:
return loaded(_that.match,_that.points,_that.lastEvent,_that.eventSeq,_that.transport,_that.pollSeconds);case LiveMatchError() when error != null:
return error(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class LiveMatchInitial implements LiveMatchState {
  const LiveMatchInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiveMatchInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LiveMatchState.initial()';
}


}




/// @nodoc


class LiveMatchLoading implements LiveMatchState {
  const LiveMatchLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiveMatchLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'LiveMatchState.loading()';
}


}




/// @nodoc


class LiveMatchLoaded implements LiveMatchState {
  const LiveMatchLoaded({required this.match, final  List<PointEvent> points = const [], this.lastEvent, this.eventSeq = 0, this.transport = RealtimeTransport.idle, this.pollSeconds = 5}): _points = points;
  

 final  Match match;
 final  List<PointEvent> _points;
@JsonKey() List<PointEvent> get points {
  if (_points is EqualUnmodifiableListView) return _points;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_points);
}

/// What the latest applied payload was (drives the animation).
 final  LiveEventType? lastEvent;
/// Bumps on every applied payload so identical events still animate.
@JsonKey() final  int eventSeq;
@JsonKey() final  RealtimeTransport transport;
@JsonKey() final  int pollSeconds;

/// Create a copy of LiveMatchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LiveMatchLoadedCopyWith<LiveMatchLoaded> get copyWith => _$LiveMatchLoadedCopyWithImpl<LiveMatchLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiveMatchLoaded&&(identical(other.match, match) || other.match == match)&&const DeepCollectionEquality().equals(other._points, _points)&&(identical(other.lastEvent, lastEvent) || other.lastEvent == lastEvent)&&(identical(other.eventSeq, eventSeq) || other.eventSeq == eventSeq)&&(identical(other.transport, transport) || other.transport == transport)&&(identical(other.pollSeconds, pollSeconds) || other.pollSeconds == pollSeconds));
}


@override
int get hashCode => Object.hash(runtimeType,match,const DeepCollectionEquality().hash(_points),lastEvent,eventSeq,transport,pollSeconds);

@override
String toString() {
  return 'LiveMatchState.loaded(match: $match, points: $points, lastEvent: $lastEvent, eventSeq: $eventSeq, transport: $transport, pollSeconds: $pollSeconds)';
}


}

/// @nodoc
abstract mixin class $LiveMatchLoadedCopyWith<$Res> implements $LiveMatchStateCopyWith<$Res> {
  factory $LiveMatchLoadedCopyWith(LiveMatchLoaded value, $Res Function(LiveMatchLoaded) _then) = _$LiveMatchLoadedCopyWithImpl;
@useResult
$Res call({
 Match match, List<PointEvent> points, LiveEventType? lastEvent, int eventSeq, RealtimeTransport transport, int pollSeconds
});




}
/// @nodoc
class _$LiveMatchLoadedCopyWithImpl<$Res>
    implements $LiveMatchLoadedCopyWith<$Res> {
  _$LiveMatchLoadedCopyWithImpl(this._self, this._then);

  final LiveMatchLoaded _self;
  final $Res Function(LiveMatchLoaded) _then;

/// Create a copy of LiveMatchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? match = null,Object? points = null,Object? lastEvent = freezed,Object? eventSeq = null,Object? transport = null,Object? pollSeconds = null,}) {
  return _then(LiveMatchLoaded(
match: null == match ? _self.match : match // ignore: cast_nullable_to_non_nullable
as Match,points: null == points ? _self._points : points // ignore: cast_nullable_to_non_nullable
as List<PointEvent>,lastEvent: freezed == lastEvent ? _self.lastEvent : lastEvent // ignore: cast_nullable_to_non_nullable
as LiveEventType?,eventSeq: null == eventSeq ? _self.eventSeq : eventSeq // ignore: cast_nullable_to_non_nullable
as int,transport: null == transport ? _self.transport : transport // ignore: cast_nullable_to_non_nullable
as RealtimeTransport,pollSeconds: null == pollSeconds ? _self.pollSeconds : pollSeconds // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

/// @nodoc


class LiveMatchError implements LiveMatchState {
  const LiveMatchError(this.failure);
  

 final  Failure failure;

/// Create a copy of LiveMatchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LiveMatchErrorCopyWith<LiveMatchError> get copyWith => _$LiveMatchErrorCopyWithImpl<LiveMatchError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiveMatchError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'LiveMatchState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $LiveMatchErrorCopyWith<$Res> implements $LiveMatchStateCopyWith<$Res> {
  factory $LiveMatchErrorCopyWith(LiveMatchError value, $Res Function(LiveMatchError) _then) = _$LiveMatchErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$LiveMatchErrorCopyWithImpl<$Res>
    implements $LiveMatchErrorCopyWith<$Res> {
  _$LiveMatchErrorCopyWithImpl(this._self, this._then);

  final LiveMatchError _self;
  final $Res Function(LiveMatchError) _then;

/// Create a copy of LiveMatchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(LiveMatchError(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
