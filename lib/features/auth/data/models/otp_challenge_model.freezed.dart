// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_challenge_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OtpChallengeModel {

@JsonKey(name: 'session_id') String get sessionId;@JsonKey(name: 'masked_phone') String? get maskedPhone;@JsonKey(name: 'expires_in') int get expiresIn;@JsonKey(name: 'resend_available_in') int get resendAvailableIn;@JsonKey(name: 'code_length') int get codeLength;
/// Create a copy of OtpChallengeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$OtpChallengeModelCopyWith<OtpChallengeModel> get copyWith => _$OtpChallengeModelCopyWithImpl<OtpChallengeModel>(this as OtpChallengeModel, _$identity);

  /// Serializes this OtpChallengeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is OtpChallengeModel&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.maskedPhone, maskedPhone) || other.maskedPhone == maskedPhone)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.resendAvailableIn, resendAvailableIn) || other.resendAvailableIn == resendAvailableIn)&&(identical(other.codeLength, codeLength) || other.codeLength == codeLength));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,maskedPhone,expiresIn,resendAvailableIn,codeLength);

@override
String toString() {
  return 'OtpChallengeModel(sessionId: $sessionId, maskedPhone: $maskedPhone, expiresIn: $expiresIn, resendAvailableIn: $resendAvailableIn, codeLength: $codeLength)';
}


}

/// @nodoc
abstract mixin class $OtpChallengeModelCopyWith<$Res>  {
  factory $OtpChallengeModelCopyWith(OtpChallengeModel value, $Res Function(OtpChallengeModel) _then) = _$OtpChallengeModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'session_id') String sessionId,@JsonKey(name: 'masked_phone') String? maskedPhone,@JsonKey(name: 'expires_in') int expiresIn,@JsonKey(name: 'resend_available_in') int resendAvailableIn,@JsonKey(name: 'code_length') int codeLength
});




}
/// @nodoc
class _$OtpChallengeModelCopyWithImpl<$Res>
    implements $OtpChallengeModelCopyWith<$Res> {
  _$OtpChallengeModelCopyWithImpl(this._self, this._then);

  final OtpChallengeModel _self;
  final $Res Function(OtpChallengeModel) _then;

/// Create a copy of OtpChallengeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sessionId = null,Object? maskedPhone = freezed,Object? expiresIn = null,Object? resendAvailableIn = null,Object? codeLength = null,}) {
  return _then(_self.copyWith(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,maskedPhone: freezed == maskedPhone ? _self.maskedPhone : maskedPhone // ignore: cast_nullable_to_non_nullable
as String?,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,resendAvailableIn: null == resendAvailableIn ? _self.resendAvailableIn : resendAvailableIn // ignore: cast_nullable_to_non_nullable
as int,codeLength: null == codeLength ? _self.codeLength : codeLength // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [OtpChallengeModel].
extension OtpChallengeModelPatterns on OtpChallengeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _OtpChallengeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _OtpChallengeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _OtpChallengeModel value)  $default,){
final _that = this;
switch (_that) {
case _OtpChallengeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _OtpChallengeModel value)?  $default,){
final _that = this;
switch (_that) {
case _OtpChallengeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'session_id')  String sessionId, @JsonKey(name: 'masked_phone')  String? maskedPhone, @JsonKey(name: 'expires_in')  int expiresIn, @JsonKey(name: 'resend_available_in')  int resendAvailableIn, @JsonKey(name: 'code_length')  int codeLength)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _OtpChallengeModel() when $default != null:
return $default(_that.sessionId,_that.maskedPhone,_that.expiresIn,_that.resendAvailableIn,_that.codeLength);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'session_id')  String sessionId, @JsonKey(name: 'masked_phone')  String? maskedPhone, @JsonKey(name: 'expires_in')  int expiresIn, @JsonKey(name: 'resend_available_in')  int resendAvailableIn, @JsonKey(name: 'code_length')  int codeLength)  $default,) {final _that = this;
switch (_that) {
case _OtpChallengeModel():
return $default(_that.sessionId,_that.maskedPhone,_that.expiresIn,_that.resendAvailableIn,_that.codeLength);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'session_id')  String sessionId, @JsonKey(name: 'masked_phone')  String? maskedPhone, @JsonKey(name: 'expires_in')  int expiresIn, @JsonKey(name: 'resend_available_in')  int resendAvailableIn, @JsonKey(name: 'code_length')  int codeLength)?  $default,) {final _that = this;
switch (_that) {
case _OtpChallengeModel() when $default != null:
return $default(_that.sessionId,_that.maskedPhone,_that.expiresIn,_that.resendAvailableIn,_that.codeLength);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _OtpChallengeModel implements OtpChallengeModel {
  const _OtpChallengeModel({@JsonKey(name: 'session_id') required this.sessionId, @JsonKey(name: 'masked_phone') this.maskedPhone, @JsonKey(name: 'expires_in') this.expiresIn = 300, @JsonKey(name: 'resend_available_in') this.resendAvailableIn = 30, @JsonKey(name: 'code_length') this.codeLength = 6});
  factory _OtpChallengeModel.fromJson(Map<String, dynamic> json) => _$OtpChallengeModelFromJson(json);

@override@JsonKey(name: 'session_id') final  String sessionId;
@override@JsonKey(name: 'masked_phone') final  String? maskedPhone;
@override@JsonKey(name: 'expires_in') final  int expiresIn;
@override@JsonKey(name: 'resend_available_in') final  int resendAvailableIn;
@override@JsonKey(name: 'code_length') final  int codeLength;

/// Create a copy of OtpChallengeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$OtpChallengeModelCopyWith<_OtpChallengeModel> get copyWith => __$OtpChallengeModelCopyWithImpl<_OtpChallengeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$OtpChallengeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _OtpChallengeModel&&(identical(other.sessionId, sessionId) || other.sessionId == sessionId)&&(identical(other.maskedPhone, maskedPhone) || other.maskedPhone == maskedPhone)&&(identical(other.expiresIn, expiresIn) || other.expiresIn == expiresIn)&&(identical(other.resendAvailableIn, resendAvailableIn) || other.resendAvailableIn == resendAvailableIn)&&(identical(other.codeLength, codeLength) || other.codeLength == codeLength));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,sessionId,maskedPhone,expiresIn,resendAvailableIn,codeLength);

@override
String toString() {
  return 'OtpChallengeModel(sessionId: $sessionId, maskedPhone: $maskedPhone, expiresIn: $expiresIn, resendAvailableIn: $resendAvailableIn, codeLength: $codeLength)';
}


}

/// @nodoc
abstract mixin class _$OtpChallengeModelCopyWith<$Res> implements $OtpChallengeModelCopyWith<$Res> {
  factory _$OtpChallengeModelCopyWith(_OtpChallengeModel value, $Res Function(_OtpChallengeModel) _then) = __$OtpChallengeModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'session_id') String sessionId,@JsonKey(name: 'masked_phone') String? maskedPhone,@JsonKey(name: 'expires_in') int expiresIn,@JsonKey(name: 'resend_available_in') int resendAvailableIn,@JsonKey(name: 'code_length') int codeLength
});




}
/// @nodoc
class __$OtpChallengeModelCopyWithImpl<$Res>
    implements _$OtpChallengeModelCopyWith<$Res> {
  __$OtpChallengeModelCopyWithImpl(this._self, this._then);

  final _OtpChallengeModel _self;
  final $Res Function(_OtpChallengeModel) _then;

/// Create a copy of OtpChallengeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sessionId = null,Object? maskedPhone = freezed,Object? expiresIn = null,Object? resendAvailableIn = null,Object? codeLength = null,}) {
  return _then(_OtpChallengeModel(
sessionId: null == sessionId ? _self.sessionId : sessionId // ignore: cast_nullable_to_non_nullable
as String,maskedPhone: freezed == maskedPhone ? _self.maskedPhone : maskedPhone // ignore: cast_nullable_to_non_nullable
as String?,expiresIn: null == expiresIn ? _self.expiresIn : expiresIn // ignore: cast_nullable_to_non_nullable
as int,resendAvailableIn: null == resendAvailableIn ? _self.resendAvailableIn : resendAvailableIn // ignore: cast_nullable_to_non_nullable
as int,codeLength: null == codeLength ? _self.codeLength : codeLength // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
