// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AuthEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent()';
}


}

/// @nodoc
class $AuthEventCopyWith<$Res>  {
$AuthEventCopyWith(AuthEvent _, $Res Function(AuthEvent) __);
}


/// Adds pattern-matching-related methods to [AuthEvent].
extension AuthEventPatterns on AuthEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( AuthAppStarted value)?  appStarted,TResult Function( AuthSessionEstablished value)?  sessionEstablished,TResult Function( AuthLogoutRequested value)?  logoutRequested,TResult Function( AuthForceLogoutTriggered value)?  forceLogoutTriggered,TResult Function( AuthPlayerUpdated value)?  playerUpdated,TResult Function( AuthRefreshRequested value)?  refreshRequested,required TResult orElse(),}){
final _that = this;
switch (_that) {
case AuthAppStarted() when appStarted != null:
return appStarted(_that);case AuthSessionEstablished() when sessionEstablished != null:
return sessionEstablished(_that);case AuthLogoutRequested() when logoutRequested != null:
return logoutRequested(_that);case AuthForceLogoutTriggered() when forceLogoutTriggered != null:
return forceLogoutTriggered(_that);case AuthPlayerUpdated() when playerUpdated != null:
return playerUpdated(_that);case AuthRefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( AuthAppStarted value)  appStarted,required TResult Function( AuthSessionEstablished value)  sessionEstablished,required TResult Function( AuthLogoutRequested value)  logoutRequested,required TResult Function( AuthForceLogoutTriggered value)  forceLogoutTriggered,required TResult Function( AuthPlayerUpdated value)  playerUpdated,required TResult Function( AuthRefreshRequested value)  refreshRequested,}){
final _that = this;
switch (_that) {
case AuthAppStarted():
return appStarted(_that);case AuthSessionEstablished():
return sessionEstablished(_that);case AuthLogoutRequested():
return logoutRequested(_that);case AuthForceLogoutTriggered():
return forceLogoutTriggered(_that);case AuthPlayerUpdated():
return playerUpdated(_that);case AuthRefreshRequested():
return refreshRequested(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( AuthAppStarted value)?  appStarted,TResult? Function( AuthSessionEstablished value)?  sessionEstablished,TResult? Function( AuthLogoutRequested value)?  logoutRequested,TResult? Function( AuthForceLogoutTriggered value)?  forceLogoutTriggered,TResult? Function( AuthPlayerUpdated value)?  playerUpdated,TResult? Function( AuthRefreshRequested value)?  refreshRequested,}){
final _that = this;
switch (_that) {
case AuthAppStarted() when appStarted != null:
return appStarted(_that);case AuthSessionEstablished() when sessionEstablished != null:
return sessionEstablished(_that);case AuthLogoutRequested() when logoutRequested != null:
return logoutRequested(_that);case AuthForceLogoutTriggered() when forceLogoutTriggered != null:
return forceLogoutTriggered(_that);case AuthPlayerUpdated() when playerUpdated != null:
return playerUpdated(_that);case AuthRefreshRequested() when refreshRequested != null:
return refreshRequested(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  appStarted,TResult Function( AuthSession session)?  sessionEstablished,TResult Function()?  logoutRequested,TResult Function()?  forceLogoutTriggered,TResult Function( Player player)?  playerUpdated,TResult Function()?  refreshRequested,required TResult orElse(),}) {final _that = this;
switch (_that) {
case AuthAppStarted() when appStarted != null:
return appStarted();case AuthSessionEstablished() when sessionEstablished != null:
return sessionEstablished(_that.session);case AuthLogoutRequested() when logoutRequested != null:
return logoutRequested();case AuthForceLogoutTriggered() when forceLogoutTriggered != null:
return forceLogoutTriggered();case AuthPlayerUpdated() when playerUpdated != null:
return playerUpdated(_that.player);case AuthRefreshRequested() when refreshRequested != null:
return refreshRequested();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  appStarted,required TResult Function( AuthSession session)  sessionEstablished,required TResult Function()  logoutRequested,required TResult Function()  forceLogoutTriggered,required TResult Function( Player player)  playerUpdated,required TResult Function()  refreshRequested,}) {final _that = this;
switch (_that) {
case AuthAppStarted():
return appStarted();case AuthSessionEstablished():
return sessionEstablished(_that.session);case AuthLogoutRequested():
return logoutRequested();case AuthForceLogoutTriggered():
return forceLogoutTriggered();case AuthPlayerUpdated():
return playerUpdated(_that.player);case AuthRefreshRequested():
return refreshRequested();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  appStarted,TResult? Function( AuthSession session)?  sessionEstablished,TResult? Function()?  logoutRequested,TResult? Function()?  forceLogoutTriggered,TResult? Function( Player player)?  playerUpdated,TResult? Function()?  refreshRequested,}) {final _that = this;
switch (_that) {
case AuthAppStarted() when appStarted != null:
return appStarted();case AuthSessionEstablished() when sessionEstablished != null:
return sessionEstablished(_that.session);case AuthLogoutRequested() when logoutRequested != null:
return logoutRequested();case AuthForceLogoutTriggered() when forceLogoutTriggered != null:
return forceLogoutTriggered();case AuthPlayerUpdated() when playerUpdated != null:
return playerUpdated(_that.player);case AuthRefreshRequested() when refreshRequested != null:
return refreshRequested();case _:
  return null;

}
}

}

/// @nodoc


class AuthAppStarted implements AuthEvent {
  const AuthAppStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthAppStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.appStarted()';
}


}




/// @nodoc


class AuthSessionEstablished implements AuthEvent {
  const AuthSessionEstablished(this.session);
  

 final  AuthSession session;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthSessionEstablishedCopyWith<AuthSessionEstablished> get copyWith => _$AuthSessionEstablishedCopyWithImpl<AuthSessionEstablished>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthSessionEstablished&&(identical(other.session, session) || other.session == session));
}


@override
int get hashCode => Object.hash(runtimeType,session);

@override
String toString() {
  return 'AuthEvent.sessionEstablished(session: $session)';
}


}

/// @nodoc
abstract mixin class $AuthSessionEstablishedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthSessionEstablishedCopyWith(AuthSessionEstablished value, $Res Function(AuthSessionEstablished) _then) = _$AuthSessionEstablishedCopyWithImpl;
@useResult
$Res call({
 AuthSession session
});




}
/// @nodoc
class _$AuthSessionEstablishedCopyWithImpl<$Res>
    implements $AuthSessionEstablishedCopyWith<$Res> {
  _$AuthSessionEstablishedCopyWithImpl(this._self, this._then);

  final AuthSessionEstablished _self;
  final $Res Function(AuthSessionEstablished) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? session = null,}) {
  return _then(AuthSessionEstablished(
null == session ? _self.session : session // ignore: cast_nullable_to_non_nullable
as AuthSession,
  ));
}


}

/// @nodoc


class AuthLogoutRequested implements AuthEvent {
  const AuthLogoutRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthLogoutRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.logoutRequested()';
}


}




/// @nodoc


class AuthForceLogoutTriggered implements AuthEvent {
  const AuthForceLogoutTriggered();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthForceLogoutTriggered);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.forceLogoutTriggered()';
}


}




/// @nodoc


class AuthPlayerUpdated implements AuthEvent {
  const AuthPlayerUpdated(this.player);
  

 final  Player player;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthPlayerUpdatedCopyWith<AuthPlayerUpdated> get copyWith => _$AuthPlayerUpdatedCopyWithImpl<AuthPlayerUpdated>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthPlayerUpdated&&(identical(other.player, player) || other.player == player));
}


@override
int get hashCode => Object.hash(runtimeType,player);

@override
String toString() {
  return 'AuthEvent.playerUpdated(player: $player)';
}


}

/// @nodoc
abstract mixin class $AuthPlayerUpdatedCopyWith<$Res> implements $AuthEventCopyWith<$Res> {
  factory $AuthPlayerUpdatedCopyWith(AuthPlayerUpdated value, $Res Function(AuthPlayerUpdated) _then) = _$AuthPlayerUpdatedCopyWithImpl;
@useResult
$Res call({
 Player player
});




}
/// @nodoc
class _$AuthPlayerUpdatedCopyWithImpl<$Res>
    implements $AuthPlayerUpdatedCopyWith<$Res> {
  _$AuthPlayerUpdatedCopyWithImpl(this._self, this._then);

  final AuthPlayerUpdated _self;
  final $Res Function(AuthPlayerUpdated) _then;

/// Create a copy of AuthEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? player = null,}) {
  return _then(AuthPlayerUpdated(
null == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as Player,
  ));
}


}

/// @nodoc


class AuthRefreshRequested implements AuthEvent {
  const AuthRefreshRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthRefreshRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AuthEvent.refreshRequested()';
}


}




// dart format on
