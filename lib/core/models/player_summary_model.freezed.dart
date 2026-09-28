// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_summary_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlayerSummaryModel {

@JsonKey(name: 'player_id') String get playerId; String get name;@JsonKey(name: 'photo_url') String? get photoUrl; String? get level;@JsonKey(name: 'skill_rating') int? get skillRating; String? get side; String? get country;@JsonKey(name: 'is_premium') bool get isPremium;
/// Create a copy of PlayerSummaryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerSummaryModelCopyWith<PlayerSummaryModel> get copyWith => _$PlayerSummaryModelCopyWithImpl<PlayerSummaryModel>(this as PlayerSummaryModel, _$identity);

  /// Serializes this PlayerSummaryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerSummaryModel&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.name, name) || other.name == name)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.level, level) || other.level == level)&&(identical(other.skillRating, skillRating) || other.skillRating == skillRating)&&(identical(other.side, side) || other.side == side)&&(identical(other.country, country) || other.country == country)&&(identical(other.isPremium, isPremium) || other.isPremium == isPremium));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playerId,name,photoUrl,level,skillRating,side,country,isPremium);

@override
String toString() {
  return 'PlayerSummaryModel(playerId: $playerId, name: $name, photoUrl: $photoUrl, level: $level, skillRating: $skillRating, side: $side, country: $country, isPremium: $isPremium)';
}


}

/// @nodoc
abstract mixin class $PlayerSummaryModelCopyWith<$Res>  {
  factory $PlayerSummaryModelCopyWith(PlayerSummaryModel value, $Res Function(PlayerSummaryModel) _then) = _$PlayerSummaryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'player_id') String playerId, String name,@JsonKey(name: 'photo_url') String? photoUrl, String? level,@JsonKey(name: 'skill_rating') int? skillRating, String? side, String? country,@JsonKey(name: 'is_premium') bool isPremium
});




}
/// @nodoc
class _$PlayerSummaryModelCopyWithImpl<$Res>
    implements $PlayerSummaryModelCopyWith<$Res> {
  _$PlayerSummaryModelCopyWithImpl(this._self, this._then);

  final PlayerSummaryModel _self;
  final $Res Function(PlayerSummaryModel) _then;

/// Create a copy of PlayerSummaryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? playerId = null,Object? name = null,Object? photoUrl = freezed,Object? level = freezed,Object? skillRating = freezed,Object? side = freezed,Object? country = freezed,Object? isPremium = null,}) {
  return _then(_self.copyWith(
playerId: null == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String?,skillRating: freezed == skillRating ? _self.skillRating : skillRating // ignore: cast_nullable_to_non_nullable
as int?,side: freezed == side ? _self.side : side // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,isPremium: null == isPremium ? _self.isPremium : isPremium // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [PlayerSummaryModel].
extension PlayerSummaryModelPatterns on PlayerSummaryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlayerSummaryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayerSummaryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlayerSummaryModel value)  $default,){
final _that = this;
switch (_that) {
case _PlayerSummaryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlayerSummaryModel value)?  $default,){
final _that = this;
switch (_that) {
case _PlayerSummaryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'player_id')  String playerId,  String name, @JsonKey(name: 'photo_url')  String? photoUrl,  String? level, @JsonKey(name: 'skill_rating')  int? skillRating,  String? side,  String? country, @JsonKey(name: 'is_premium')  bool isPremium)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayerSummaryModel() when $default != null:
return $default(_that.playerId,_that.name,_that.photoUrl,_that.level,_that.skillRating,_that.side,_that.country,_that.isPremium);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'player_id')  String playerId,  String name, @JsonKey(name: 'photo_url')  String? photoUrl,  String? level, @JsonKey(name: 'skill_rating')  int? skillRating,  String? side,  String? country, @JsonKey(name: 'is_premium')  bool isPremium)  $default,) {final _that = this;
switch (_that) {
case _PlayerSummaryModel():
return $default(_that.playerId,_that.name,_that.photoUrl,_that.level,_that.skillRating,_that.side,_that.country,_that.isPremium);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'player_id')  String playerId,  String name, @JsonKey(name: 'photo_url')  String? photoUrl,  String? level, @JsonKey(name: 'skill_rating')  int? skillRating,  String? side,  String? country, @JsonKey(name: 'is_premium')  bool isPremium)?  $default,) {final _that = this;
switch (_that) {
case _PlayerSummaryModel() when $default != null:
return $default(_that.playerId,_that.name,_that.photoUrl,_that.level,_that.skillRating,_that.side,_that.country,_that.isPremium);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlayerSummaryModel implements PlayerSummaryModel {
  const _PlayerSummaryModel({@JsonKey(name: 'player_id') required this.playerId, required this.name, @JsonKey(name: 'photo_url') this.photoUrl, this.level, @JsonKey(name: 'skill_rating') this.skillRating, this.side, this.country, @JsonKey(name: 'is_premium') this.isPremium = false});
  factory _PlayerSummaryModel.fromJson(Map<String, dynamic> json) => _$PlayerSummaryModelFromJson(json);

@override@JsonKey(name: 'player_id') final  String playerId;
@override final  String name;
@override@JsonKey(name: 'photo_url') final  String? photoUrl;
@override final  String? level;
@override@JsonKey(name: 'skill_rating') final  int? skillRating;
@override final  String? side;
@override final  String? country;
@override@JsonKey(name: 'is_premium') final  bool isPremium;

/// Create a copy of PlayerSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerSummaryModelCopyWith<_PlayerSummaryModel> get copyWith => __$PlayerSummaryModelCopyWithImpl<_PlayerSummaryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlayerSummaryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayerSummaryModel&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.name, name) || other.name == name)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.level, level) || other.level == level)&&(identical(other.skillRating, skillRating) || other.skillRating == skillRating)&&(identical(other.side, side) || other.side == side)&&(identical(other.country, country) || other.country == country)&&(identical(other.isPremium, isPremium) || other.isPremium == isPremium));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playerId,name,photoUrl,level,skillRating,side,country,isPremium);

@override
String toString() {
  return 'PlayerSummaryModel(playerId: $playerId, name: $name, photoUrl: $photoUrl, level: $level, skillRating: $skillRating, side: $side, country: $country, isPremium: $isPremium)';
}


}

/// @nodoc
abstract mixin class _$PlayerSummaryModelCopyWith<$Res> implements $PlayerSummaryModelCopyWith<$Res> {
  factory _$PlayerSummaryModelCopyWith(_PlayerSummaryModel value, $Res Function(_PlayerSummaryModel) _then) = __$PlayerSummaryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'player_id') String playerId, String name,@JsonKey(name: 'photo_url') String? photoUrl, String? level,@JsonKey(name: 'skill_rating') int? skillRating, String? side, String? country,@JsonKey(name: 'is_premium') bool isPremium
});




}
/// @nodoc
class __$PlayerSummaryModelCopyWithImpl<$Res>
    implements _$PlayerSummaryModelCopyWith<$Res> {
  __$PlayerSummaryModelCopyWithImpl(this._self, this._then);

  final _PlayerSummaryModel _self;
  final $Res Function(_PlayerSummaryModel) _then;

/// Create a copy of PlayerSummaryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? playerId = null,Object? name = null,Object? photoUrl = freezed,Object? level = freezed,Object? skillRating = freezed,Object? side = freezed,Object? country = freezed,Object? isPremium = null,}) {
  return _then(_PlayerSummaryModel(
playerId: null == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String?,skillRating: freezed == skillRating ? _self.skillRating : skillRating // ignore: cast_nullable_to_non_nullable
as int?,side: freezed == side ? _self.side : side // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,isPremium: null == isPremium ? _self.isPremium : isPremium // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
