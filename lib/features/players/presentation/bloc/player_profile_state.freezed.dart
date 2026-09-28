// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_profile_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlayerProfileState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerProfileState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayerProfileState()';
}


}

/// @nodoc
class $PlayerProfileStateCopyWith<$Res>  {
$PlayerProfileStateCopyWith(PlayerProfileState _, $Res Function(PlayerProfileState) __);
}


/// Adds pattern-matching-related methods to [PlayerProfileState].
extension PlayerProfileStatePatterns on PlayerProfileState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( PlayerProfileInitial value)?  initial,TResult Function( PlayerProfileLoading value)?  loading,TResult Function( PlayerProfileLoaded value)?  loaded,TResult Function( PlayerProfileError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case PlayerProfileInitial() when initial != null:
return initial(_that);case PlayerProfileLoading() when loading != null:
return loading(_that);case PlayerProfileLoaded() when loaded != null:
return loaded(_that);case PlayerProfileError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( PlayerProfileInitial value)  initial,required TResult Function( PlayerProfileLoading value)  loading,required TResult Function( PlayerProfileLoaded value)  loaded,required TResult Function( PlayerProfileError value)  error,}){
final _that = this;
switch (_that) {
case PlayerProfileInitial():
return initial(_that);case PlayerProfileLoading():
return loading(_that);case PlayerProfileLoaded():
return loaded(_that);case PlayerProfileError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( PlayerProfileInitial value)?  initial,TResult? Function( PlayerProfileLoading value)?  loading,TResult? Function( PlayerProfileLoaded value)?  loaded,TResult? Function( PlayerProfileError value)?  error,}){
final _that = this;
switch (_that) {
case PlayerProfileInitial() when initial != null:
return initial(_that);case PlayerProfileLoading() when loading != null:
return loading(_that);case PlayerProfileLoaded() when loaded != null:
return loaded(_that);case PlayerProfileError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( PlayerProfile profile)?  loaded,TResult Function( Failure failure)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case PlayerProfileInitial() when initial != null:
return initial();case PlayerProfileLoading() when loading != null:
return loading();case PlayerProfileLoaded() when loaded != null:
return loaded(_that.profile);case PlayerProfileError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( PlayerProfile profile)  loaded,required TResult Function( Failure failure)  error,}) {final _that = this;
switch (_that) {
case PlayerProfileInitial():
return initial();case PlayerProfileLoading():
return loading();case PlayerProfileLoaded():
return loaded(_that.profile);case PlayerProfileError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( PlayerProfile profile)?  loaded,TResult? Function( Failure failure)?  error,}) {final _that = this;
switch (_that) {
case PlayerProfileInitial() when initial != null:
return initial();case PlayerProfileLoading() when loading != null:
return loading();case PlayerProfileLoaded() when loaded != null:
return loaded(_that.profile);case PlayerProfileError() when error != null:
return error(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class PlayerProfileInitial implements PlayerProfileState {
  const PlayerProfileInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerProfileInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayerProfileState.initial()';
}


}




/// @nodoc


class PlayerProfileLoading implements PlayerProfileState {
  const PlayerProfileLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerProfileLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'PlayerProfileState.loading()';
}


}




/// @nodoc


class PlayerProfileLoaded implements PlayerProfileState {
  const PlayerProfileLoaded({required this.profile});
  

 final  PlayerProfile profile;

/// Create a copy of PlayerProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerProfileLoadedCopyWith<PlayerProfileLoaded> get copyWith => _$PlayerProfileLoadedCopyWithImpl<PlayerProfileLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerProfileLoaded&&(identical(other.profile, profile) || other.profile == profile));
}


@override
int get hashCode => Object.hash(runtimeType,profile);

@override
String toString() {
  return 'PlayerProfileState.loaded(profile: $profile)';
}


}

/// @nodoc
abstract mixin class $PlayerProfileLoadedCopyWith<$Res> implements $PlayerProfileStateCopyWith<$Res> {
  factory $PlayerProfileLoadedCopyWith(PlayerProfileLoaded value, $Res Function(PlayerProfileLoaded) _then) = _$PlayerProfileLoadedCopyWithImpl;
@useResult
$Res call({
 PlayerProfile profile
});




}
/// @nodoc
class _$PlayerProfileLoadedCopyWithImpl<$Res>
    implements $PlayerProfileLoadedCopyWith<$Res> {
  _$PlayerProfileLoadedCopyWithImpl(this._self, this._then);

  final PlayerProfileLoaded _self;
  final $Res Function(PlayerProfileLoaded) _then;

/// Create a copy of PlayerProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? profile = null,}) {
  return _then(PlayerProfileLoaded(
profile: null == profile ? _self.profile : profile // ignore: cast_nullable_to_non_nullable
as PlayerProfile,
  ));
}


}

/// @nodoc


class PlayerProfileError implements PlayerProfileState {
  const PlayerProfileError(this.failure);
  

 final  Failure failure;

/// Create a copy of PlayerProfileState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerProfileErrorCopyWith<PlayerProfileError> get copyWith => _$PlayerProfileErrorCopyWithImpl<PlayerProfileError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerProfileError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'PlayerProfileState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $PlayerProfileErrorCopyWith<$Res> implements $PlayerProfileStateCopyWith<$Res> {
  factory $PlayerProfileErrorCopyWith(PlayerProfileError value, $Res Function(PlayerProfileError) _then) = _$PlayerProfileErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$PlayerProfileErrorCopyWithImpl<$Res>
    implements $PlayerProfileErrorCopyWith<$Res> {
  _$PlayerProfileErrorCopyWithImpl(this._self, this._then);

  final PlayerProfileError _self;
  final $Res Function(PlayerProfileError) _then;

/// Create a copy of PlayerProfileState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(PlayerProfileError(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
