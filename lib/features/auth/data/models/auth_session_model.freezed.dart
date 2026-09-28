// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'auth_session_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AuthSessionModel {

 String get token;@JsonKey(name: 'account_type') String get accountType; PlayerModel? get player; CoachModel? get coach;/// Only sent by `auth/otp/verify`.
@JsonKey(name: 'is_new_user') bool get isNewUser;@JsonKey(name: 'profile_completed') bool get profileCompleted;
/// Create a copy of AuthSessionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AuthSessionModelCopyWith<AuthSessionModel> get copyWith => _$AuthSessionModelCopyWithImpl<AuthSessionModel>(this as AuthSessionModel, _$identity);

  /// Serializes this AuthSessionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AuthSessionModel&&(identical(other.token, token) || other.token == token)&&(identical(other.accountType, accountType) || other.accountType == accountType)&&(identical(other.player, player) || other.player == player)&&(identical(other.coach, coach) || other.coach == coach)&&(identical(other.isNewUser, isNewUser) || other.isNewUser == isNewUser)&&(identical(other.profileCompleted, profileCompleted) || other.profileCompleted == profileCompleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,accountType,player,coach,isNewUser,profileCompleted);

@override
String toString() {
  return 'AuthSessionModel(token: $token, accountType: $accountType, player: $player, coach: $coach, isNewUser: $isNewUser, profileCompleted: $profileCompleted)';
}


}

/// @nodoc
abstract mixin class $AuthSessionModelCopyWith<$Res>  {
  factory $AuthSessionModelCopyWith(AuthSessionModel value, $Res Function(AuthSessionModel) _then) = _$AuthSessionModelCopyWithImpl;
@useResult
$Res call({
 String token,@JsonKey(name: 'account_type') String accountType, PlayerModel? player, CoachModel? coach,@JsonKey(name: 'is_new_user') bool isNewUser,@JsonKey(name: 'profile_completed') bool profileCompleted
});


$PlayerModelCopyWith<$Res>? get player;$CoachModelCopyWith<$Res>? get coach;

}
/// @nodoc
class _$AuthSessionModelCopyWithImpl<$Res>
    implements $AuthSessionModelCopyWith<$Res> {
  _$AuthSessionModelCopyWithImpl(this._self, this._then);

  final AuthSessionModel _self;
  final $Res Function(AuthSessionModel) _then;

/// Create a copy of AuthSessionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? token = null,Object? accountType = null,Object? player = freezed,Object? coach = freezed,Object? isNewUser = null,Object? profileCompleted = null,}) {
  return _then(_self.copyWith(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,accountType: null == accountType ? _self.accountType : accountType // ignore: cast_nullable_to_non_nullable
as String,player: freezed == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as PlayerModel?,coach: freezed == coach ? _self.coach : coach // ignore: cast_nullable_to_non_nullable
as CoachModel?,isNewUser: null == isNewUser ? _self.isNewUser : isNewUser // ignore: cast_nullable_to_non_nullable
as bool,profileCompleted: null == profileCompleted ? _self.profileCompleted : profileCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of AuthSessionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerModelCopyWith<$Res>? get player {
    if (_self.player == null) {
    return null;
  }

  return $PlayerModelCopyWith<$Res>(_self.player!, (value) {
    return _then(_self.copyWith(player: value));
  });
}/// Create a copy of AuthSessionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoachModelCopyWith<$Res>? get coach {
    if (_self.coach == null) {
    return null;
  }

  return $CoachModelCopyWith<$Res>(_self.coach!, (value) {
    return _then(_self.copyWith(coach: value));
  });
}
}


/// Adds pattern-matching-related methods to [AuthSessionModel].
extension AuthSessionModelPatterns on AuthSessionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AuthSessionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AuthSessionModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AuthSessionModel value)  $default,){
final _that = this;
switch (_that) {
case _AuthSessionModel():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AuthSessionModel value)?  $default,){
final _that = this;
switch (_that) {
case _AuthSessionModel() when $default != null:
return $default(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String token, @JsonKey(name: 'account_type')  String accountType,  PlayerModel? player,  CoachModel? coach, @JsonKey(name: 'is_new_user')  bool isNewUser, @JsonKey(name: 'profile_completed')  bool profileCompleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AuthSessionModel() when $default != null:
return $default(_that.token,_that.accountType,_that.player,_that.coach,_that.isNewUser,_that.profileCompleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String token, @JsonKey(name: 'account_type')  String accountType,  PlayerModel? player,  CoachModel? coach, @JsonKey(name: 'is_new_user')  bool isNewUser, @JsonKey(name: 'profile_completed')  bool profileCompleted)  $default,) {final _that = this;
switch (_that) {
case _AuthSessionModel():
return $default(_that.token,_that.accountType,_that.player,_that.coach,_that.isNewUser,_that.profileCompleted);case _:
  throw StateError('Unexpected subclass');

}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String token, @JsonKey(name: 'account_type')  String accountType,  PlayerModel? player,  CoachModel? coach, @JsonKey(name: 'is_new_user')  bool isNewUser, @JsonKey(name: 'profile_completed')  bool profileCompleted)?  $default,) {final _that = this;
switch (_that) {
case _AuthSessionModel() when $default != null:
return $default(_that.token,_that.accountType,_that.player,_that.coach,_that.isNewUser,_that.profileCompleted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AuthSessionModel implements AuthSessionModel {
  const _AuthSessionModel({required this.token, @JsonKey(name: 'account_type') this.accountType = 'player', this.player, this.coach, @JsonKey(name: 'is_new_user') this.isNewUser = false, @JsonKey(name: 'profile_completed') this.profileCompleted = true});
  factory _AuthSessionModel.fromJson(Map<String, dynamic> json) => _$AuthSessionModelFromJson(json);

@override final  String token;
@override@JsonKey(name: 'account_type') final  String accountType;
@override final  PlayerModel? player;
@override final  CoachModel? coach;
/// Only sent by `auth/otp/verify`.
@override@JsonKey(name: 'is_new_user') final  bool isNewUser;
@override@JsonKey(name: 'profile_completed') final  bool profileCompleted;

/// Create a copy of AuthSessionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AuthSessionModelCopyWith<_AuthSessionModel> get copyWith => __$AuthSessionModelCopyWithImpl<_AuthSessionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AuthSessionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AuthSessionModel&&(identical(other.token, token) || other.token == token)&&(identical(other.accountType, accountType) || other.accountType == accountType)&&(identical(other.player, player) || other.player == player)&&(identical(other.coach, coach) || other.coach == coach)&&(identical(other.isNewUser, isNewUser) || other.isNewUser == isNewUser)&&(identical(other.profileCompleted, profileCompleted) || other.profileCompleted == profileCompleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,token,accountType,player,coach,isNewUser,profileCompleted);

@override
String toString() {
  return 'AuthSessionModel(token: $token, accountType: $accountType, player: $player, coach: $coach, isNewUser: $isNewUser, profileCompleted: $profileCompleted)';
}


}

/// @nodoc
abstract mixin class _$AuthSessionModelCopyWith<$Res> implements $AuthSessionModelCopyWith<$Res> {
  factory _$AuthSessionModelCopyWith(_AuthSessionModel value, $Res Function(_AuthSessionModel) _then) = __$AuthSessionModelCopyWithImpl;
@override @useResult
$Res call({
 String token,@JsonKey(name: 'account_type') String accountType, PlayerModel? player, CoachModel? coach,@JsonKey(name: 'is_new_user') bool isNewUser,@JsonKey(name: 'profile_completed') bool profileCompleted
});


@override $PlayerModelCopyWith<$Res>? get player;@override $CoachModelCopyWith<$Res>? get coach;

}
/// @nodoc
class __$AuthSessionModelCopyWithImpl<$Res>
    implements _$AuthSessionModelCopyWith<$Res> {
  __$AuthSessionModelCopyWithImpl(this._self, this._then);

  final _AuthSessionModel _self;
  final $Res Function(_AuthSessionModel) _then;

/// Create a copy of AuthSessionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? token = null,Object? accountType = null,Object? player = freezed,Object? coach = freezed,Object? isNewUser = null,Object? profileCompleted = null,}) {
  return _then(_AuthSessionModel(
token: null == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String,accountType: null == accountType ? _self.accountType : accountType // ignore: cast_nullable_to_non_nullable
as String,player: freezed == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as PlayerModel?,coach: freezed == coach ? _self.coach : coach // ignore: cast_nullable_to_non_nullable
as CoachModel?,isNewUser: null == isNewUser ? _self.isNewUser : isNewUser // ignore: cast_nullable_to_non_nullable
as bool,profileCompleted: null == profileCompleted ? _self.profileCompleted : profileCompleted // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of AuthSessionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerModelCopyWith<$Res>? get player {
    if (_self.player == null) {
    return null;
  }

  return $PlayerModelCopyWith<$Res>(_self.player!, (value) {
    return _then(_self.copyWith(player: value));
  });
}/// Create a copy of AuthSessionModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoachModelCopyWith<$Res>? get coach {
    if (_self.coach == null) {
    return null;
  }

  return $CoachModelCopyWith<$Res>(_self.coach!, (value) {
    return _then(_self.copyWith(coach: value));
  });
}
}

// dart format on
