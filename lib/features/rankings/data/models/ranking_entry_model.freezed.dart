// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ranking_entry_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrendPointModel {

 DateTime get date; num get value; int? get position;
/// Create a copy of TrendPointModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrendPointModelCopyWith<TrendPointModel> get copyWith => _$TrendPointModelCopyWithImpl<TrendPointModel>(this as TrendPointModel, _$identity);

  /// Serializes this TrendPointModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrendPointModel&&(identical(other.date, date) || other.date == date)&&(identical(other.value, value) || other.value == value)&&(identical(other.position, position) || other.position == position));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,value,position);

@override
String toString() {
  return 'TrendPointModel(date: $date, value: $value, position: $position)';
}


}

/// @nodoc
abstract mixin class $TrendPointModelCopyWith<$Res>  {
  factory $TrendPointModelCopyWith(TrendPointModel value, $Res Function(TrendPointModel) _then) = _$TrendPointModelCopyWithImpl;
@useResult
$Res call({
 DateTime date, num value, int? position
});




}
/// @nodoc
class _$TrendPointModelCopyWithImpl<$Res>
    implements $TrendPointModelCopyWith<$Res> {
  _$TrendPointModelCopyWithImpl(this._self, this._then);

  final TrendPointModel _self;
  final $Res Function(TrendPointModel) _then;

/// Create a copy of TrendPointModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? value = null,Object? position = freezed,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as num,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [TrendPointModel].
extension TrendPointModelPatterns on TrendPointModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrendPointModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrendPointModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrendPointModel value)  $default,){
final _that = this;
switch (_that) {
case _TrendPointModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrendPointModel value)?  $default,){
final _that = this;
switch (_that) {
case _TrendPointModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  num value,  int? position)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrendPointModel() when $default != null:
return $default(_that.date,_that.value,_that.position);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  num value,  int? position)  $default,) {final _that = this;
switch (_that) {
case _TrendPointModel():
return $default(_that.date,_that.value,_that.position);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  num value,  int? position)?  $default,) {final _that = this;
switch (_that) {
case _TrendPointModel() when $default != null:
return $default(_that.date,_that.value,_that.position);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrendPointModel implements TrendPointModel {
  const _TrendPointModel({required this.date, this.value = 0, this.position});
  factory _TrendPointModel.fromJson(Map<String, dynamic> json) => _$TrendPointModelFromJson(json);

@override final  DateTime date;
@override@JsonKey() final  num value;
@override final  int? position;

/// Create a copy of TrendPointModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrendPointModelCopyWith<_TrendPointModel> get copyWith => __$TrendPointModelCopyWithImpl<_TrendPointModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrendPointModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrendPointModel&&(identical(other.date, date) || other.date == date)&&(identical(other.value, value) || other.value == value)&&(identical(other.position, position) || other.position == position));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,value,position);

@override
String toString() {
  return 'TrendPointModel(date: $date, value: $value, position: $position)';
}


}

/// @nodoc
abstract mixin class _$TrendPointModelCopyWith<$Res> implements $TrendPointModelCopyWith<$Res> {
  factory _$TrendPointModelCopyWith(_TrendPointModel value, $Res Function(_TrendPointModel) _then) = __$TrendPointModelCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, num value, int? position
});




}
/// @nodoc
class __$TrendPointModelCopyWithImpl<$Res>
    implements _$TrendPointModelCopyWith<$Res> {
  __$TrendPointModelCopyWithImpl(this._self, this._then);

  final _TrendPointModel _self;
  final $Res Function(_TrendPointModel) _then;

/// Create a copy of TrendPointModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? value = null,Object? position = freezed,}) {
  return _then(_TrendPointModel(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,value: null == value ? _self.value : value // ignore: cast_nullable_to_non_nullable
as num,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$RankingEntryModel {

@JsonKey(name: 'player_id') String get playerId; String get name;@JsonKey(name: 'photo_url') String? get photoUrl; String get level;@JsonKey(name: 'skill_rating') int get skillRating;@JsonKey(name: 'season_ranking_points') int get seasonRankingPoints;@JsonKey(name: 'season_points') int? get seasonPoints; int get xp; String? get country; String? get side;@JsonKey(name: 'is_premium') bool get isPremium; int? get position;@JsonKey(name: 'previous_position') int? get previousPosition; int? get movement; List<TrendPointModel> get trend;
/// Create a copy of RankingEntryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RankingEntryModelCopyWith<RankingEntryModel> get copyWith => _$RankingEntryModelCopyWithImpl<RankingEntryModel>(this as RankingEntryModel, _$identity);

  /// Serializes this RankingEntryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RankingEntryModel&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.name, name) || other.name == name)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.level, level) || other.level == level)&&(identical(other.skillRating, skillRating) || other.skillRating == skillRating)&&(identical(other.seasonRankingPoints, seasonRankingPoints) || other.seasonRankingPoints == seasonRankingPoints)&&(identical(other.seasonPoints, seasonPoints) || other.seasonPoints == seasonPoints)&&(identical(other.xp, xp) || other.xp == xp)&&(identical(other.country, country) || other.country == country)&&(identical(other.side, side) || other.side == side)&&(identical(other.isPremium, isPremium) || other.isPremium == isPremium)&&(identical(other.position, position) || other.position == position)&&(identical(other.previousPosition, previousPosition) || other.previousPosition == previousPosition)&&(identical(other.movement, movement) || other.movement == movement)&&const DeepCollectionEquality().equals(other.trend, trend));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playerId,name,photoUrl,level,skillRating,seasonRankingPoints,seasonPoints,xp,country,side,isPremium,position,previousPosition,movement,const DeepCollectionEquality().hash(trend));

@override
String toString() {
  return 'RankingEntryModel(playerId: $playerId, name: $name, photoUrl: $photoUrl, level: $level, skillRating: $skillRating, seasonRankingPoints: $seasonRankingPoints, seasonPoints: $seasonPoints, xp: $xp, country: $country, side: $side, isPremium: $isPremium, position: $position, previousPosition: $previousPosition, movement: $movement, trend: $trend)';
}


}

/// @nodoc
abstract mixin class $RankingEntryModelCopyWith<$Res>  {
  factory $RankingEntryModelCopyWith(RankingEntryModel value, $Res Function(RankingEntryModel) _then) = _$RankingEntryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'player_id') String playerId, String name,@JsonKey(name: 'photo_url') String? photoUrl, String level,@JsonKey(name: 'skill_rating') int skillRating,@JsonKey(name: 'season_ranking_points') int seasonRankingPoints,@JsonKey(name: 'season_points') int? seasonPoints, int xp, String? country, String? side,@JsonKey(name: 'is_premium') bool isPremium, int? position,@JsonKey(name: 'previous_position') int? previousPosition, int? movement, List<TrendPointModel> trend
});




}
/// @nodoc
class _$RankingEntryModelCopyWithImpl<$Res>
    implements $RankingEntryModelCopyWith<$Res> {
  _$RankingEntryModelCopyWithImpl(this._self, this._then);

  final RankingEntryModel _self;
  final $Res Function(RankingEntryModel) _then;

/// Create a copy of RankingEntryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? playerId = null,Object? name = null,Object? photoUrl = freezed,Object? level = null,Object? skillRating = null,Object? seasonRankingPoints = null,Object? seasonPoints = freezed,Object? xp = null,Object? country = freezed,Object? side = freezed,Object? isPremium = null,Object? position = freezed,Object? previousPosition = freezed,Object? movement = freezed,Object? trend = null,}) {
  return _then(_self.copyWith(
playerId: null == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,skillRating: null == skillRating ? _self.skillRating : skillRating // ignore: cast_nullable_to_non_nullable
as int,seasonRankingPoints: null == seasonRankingPoints ? _self.seasonRankingPoints : seasonRankingPoints // ignore: cast_nullable_to_non_nullable
as int,seasonPoints: freezed == seasonPoints ? _self.seasonPoints : seasonPoints // ignore: cast_nullable_to_non_nullable
as int?,xp: null == xp ? _self.xp : xp // ignore: cast_nullable_to_non_nullable
as int,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,side: freezed == side ? _self.side : side // ignore: cast_nullable_to_non_nullable
as String?,isPremium: null == isPremium ? _self.isPremium : isPremium // ignore: cast_nullable_to_non_nullable
as bool,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int?,previousPosition: freezed == previousPosition ? _self.previousPosition : previousPosition // ignore: cast_nullable_to_non_nullable
as int?,movement: freezed == movement ? _self.movement : movement // ignore: cast_nullable_to_non_nullable
as int?,trend: null == trend ? _self.trend : trend // ignore: cast_nullable_to_non_nullable
as List<TrendPointModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [RankingEntryModel].
extension RankingEntryModelPatterns on RankingEntryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RankingEntryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RankingEntryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RankingEntryModel value)  $default,){
final _that = this;
switch (_that) {
case _RankingEntryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RankingEntryModel value)?  $default,){
final _that = this;
switch (_that) {
case _RankingEntryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'player_id')  String playerId,  String name, @JsonKey(name: 'photo_url')  String? photoUrl,  String level, @JsonKey(name: 'skill_rating')  int skillRating, @JsonKey(name: 'season_ranking_points')  int seasonRankingPoints, @JsonKey(name: 'season_points')  int? seasonPoints,  int xp,  String? country,  String? side, @JsonKey(name: 'is_premium')  bool isPremium,  int? position, @JsonKey(name: 'previous_position')  int? previousPosition,  int? movement,  List<TrendPointModel> trend)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RankingEntryModel() when $default != null:
return $default(_that.playerId,_that.name,_that.photoUrl,_that.level,_that.skillRating,_that.seasonRankingPoints,_that.seasonPoints,_that.xp,_that.country,_that.side,_that.isPremium,_that.position,_that.previousPosition,_that.movement,_that.trend);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'player_id')  String playerId,  String name, @JsonKey(name: 'photo_url')  String? photoUrl,  String level, @JsonKey(name: 'skill_rating')  int skillRating, @JsonKey(name: 'season_ranking_points')  int seasonRankingPoints, @JsonKey(name: 'season_points')  int? seasonPoints,  int xp,  String? country,  String? side, @JsonKey(name: 'is_premium')  bool isPremium,  int? position, @JsonKey(name: 'previous_position')  int? previousPosition,  int? movement,  List<TrendPointModel> trend)  $default,) {final _that = this;
switch (_that) {
case _RankingEntryModel():
return $default(_that.playerId,_that.name,_that.photoUrl,_that.level,_that.skillRating,_that.seasonRankingPoints,_that.seasonPoints,_that.xp,_that.country,_that.side,_that.isPremium,_that.position,_that.previousPosition,_that.movement,_that.trend);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'player_id')  String playerId,  String name, @JsonKey(name: 'photo_url')  String? photoUrl,  String level, @JsonKey(name: 'skill_rating')  int skillRating, @JsonKey(name: 'season_ranking_points')  int seasonRankingPoints, @JsonKey(name: 'season_points')  int? seasonPoints,  int xp,  String? country,  String? side, @JsonKey(name: 'is_premium')  bool isPremium,  int? position, @JsonKey(name: 'previous_position')  int? previousPosition,  int? movement,  List<TrendPointModel> trend)?  $default,) {final _that = this;
switch (_that) {
case _RankingEntryModel() when $default != null:
return $default(_that.playerId,_that.name,_that.photoUrl,_that.level,_that.skillRating,_that.seasonRankingPoints,_that.seasonPoints,_that.xp,_that.country,_that.side,_that.isPremium,_that.position,_that.previousPosition,_that.movement,_that.trend);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RankingEntryModel implements RankingEntryModel {
  const _RankingEntryModel({@JsonKey(name: 'player_id') required this.playerId, required this.name, @JsonKey(name: 'photo_url') this.photoUrl, this.level = '', @JsonKey(name: 'skill_rating') this.skillRating = 0, @JsonKey(name: 'season_ranking_points') this.seasonRankingPoints = 0, @JsonKey(name: 'season_points') this.seasonPoints, this.xp = 0, this.country, this.side, @JsonKey(name: 'is_premium') this.isPremium = false, this.position, @JsonKey(name: 'previous_position') this.previousPosition, this.movement, final  List<TrendPointModel> trend = const []}): _trend = trend;
  factory _RankingEntryModel.fromJson(Map<String, dynamic> json) => _$RankingEntryModelFromJson(json);

@override@JsonKey(name: 'player_id') final  String playerId;
@override final  String name;
@override@JsonKey(name: 'photo_url') final  String? photoUrl;
@override@JsonKey() final  String level;
@override@JsonKey(name: 'skill_rating') final  int skillRating;
@override@JsonKey(name: 'season_ranking_points') final  int seasonRankingPoints;
@override@JsonKey(name: 'season_points') final  int? seasonPoints;
@override@JsonKey() final  int xp;
@override final  String? country;
@override final  String? side;
@override@JsonKey(name: 'is_premium') final  bool isPremium;
@override final  int? position;
@override@JsonKey(name: 'previous_position') final  int? previousPosition;
@override final  int? movement;
 final  List<TrendPointModel> _trend;
@override@JsonKey() List<TrendPointModel> get trend {
  if (_trend is EqualUnmodifiableListView) return _trend;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_trend);
}


/// Create a copy of RankingEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RankingEntryModelCopyWith<_RankingEntryModel> get copyWith => __$RankingEntryModelCopyWithImpl<_RankingEntryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RankingEntryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RankingEntryModel&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.name, name) || other.name == name)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.level, level) || other.level == level)&&(identical(other.skillRating, skillRating) || other.skillRating == skillRating)&&(identical(other.seasonRankingPoints, seasonRankingPoints) || other.seasonRankingPoints == seasonRankingPoints)&&(identical(other.seasonPoints, seasonPoints) || other.seasonPoints == seasonPoints)&&(identical(other.xp, xp) || other.xp == xp)&&(identical(other.country, country) || other.country == country)&&(identical(other.side, side) || other.side == side)&&(identical(other.isPremium, isPremium) || other.isPremium == isPremium)&&(identical(other.position, position) || other.position == position)&&(identical(other.previousPosition, previousPosition) || other.previousPosition == previousPosition)&&(identical(other.movement, movement) || other.movement == movement)&&const DeepCollectionEquality().equals(other._trend, _trend));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playerId,name,photoUrl,level,skillRating,seasonRankingPoints,seasonPoints,xp,country,side,isPremium,position,previousPosition,movement,const DeepCollectionEquality().hash(_trend));

@override
String toString() {
  return 'RankingEntryModel(playerId: $playerId, name: $name, photoUrl: $photoUrl, level: $level, skillRating: $skillRating, seasonRankingPoints: $seasonRankingPoints, seasonPoints: $seasonPoints, xp: $xp, country: $country, side: $side, isPremium: $isPremium, position: $position, previousPosition: $previousPosition, movement: $movement, trend: $trend)';
}


}

/// @nodoc
abstract mixin class _$RankingEntryModelCopyWith<$Res> implements $RankingEntryModelCopyWith<$Res> {
  factory _$RankingEntryModelCopyWith(_RankingEntryModel value, $Res Function(_RankingEntryModel) _then) = __$RankingEntryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'player_id') String playerId, String name,@JsonKey(name: 'photo_url') String? photoUrl, String level,@JsonKey(name: 'skill_rating') int skillRating,@JsonKey(name: 'season_ranking_points') int seasonRankingPoints,@JsonKey(name: 'season_points') int? seasonPoints, int xp, String? country, String? side,@JsonKey(name: 'is_premium') bool isPremium, int? position,@JsonKey(name: 'previous_position') int? previousPosition, int? movement, List<TrendPointModel> trend
});




}
/// @nodoc
class __$RankingEntryModelCopyWithImpl<$Res>
    implements _$RankingEntryModelCopyWith<$Res> {
  __$RankingEntryModelCopyWithImpl(this._self, this._then);

  final _RankingEntryModel _self;
  final $Res Function(_RankingEntryModel) _then;

/// Create a copy of RankingEntryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? playerId = null,Object? name = null,Object? photoUrl = freezed,Object? level = null,Object? skillRating = null,Object? seasonRankingPoints = null,Object? seasonPoints = freezed,Object? xp = null,Object? country = freezed,Object? side = freezed,Object? isPremium = null,Object? position = freezed,Object? previousPosition = freezed,Object? movement = freezed,Object? trend = null,}) {
  return _then(_RankingEntryModel(
playerId: null == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,level: null == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String,skillRating: null == skillRating ? _self.skillRating : skillRating // ignore: cast_nullable_to_non_nullable
as int,seasonRankingPoints: null == seasonRankingPoints ? _self.seasonRankingPoints : seasonRankingPoints // ignore: cast_nullable_to_non_nullable
as int,seasonPoints: freezed == seasonPoints ? _self.seasonPoints : seasonPoints // ignore: cast_nullable_to_non_nullable
as int?,xp: null == xp ? _self.xp : xp // ignore: cast_nullable_to_non_nullable
as int,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,side: freezed == side ? _self.side : side // ignore: cast_nullable_to_non_nullable
as String?,isPremium: null == isPremium ? _self.isPremium : isPremium // ignore: cast_nullable_to_non_nullable
as bool,position: freezed == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int?,previousPosition: freezed == previousPosition ? _self.previousPosition : previousPosition // ignore: cast_nullable_to_non_nullable
as int?,movement: freezed == movement ? _self.movement : movement // ignore: cast_nullable_to_non_nullable
as int?,trend: null == trend ? _self._trend : trend // ignore: cast_nullable_to_non_nullable
as List<TrendPointModel>,
  ));
}


}


/// @nodoc
mixin _$SeasonModel {

 String get code; String get name;@JsonKey(name: 'starts_on') DateTime? get startsOn;@JsonKey(name: 'ends_on') DateTime? get endsOn;@JsonKey(name: 'is_active') bool get isActive;
/// Create a copy of SeasonModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeasonModelCopyWith<SeasonModel> get copyWith => _$SeasonModelCopyWithImpl<SeasonModel>(this as SeasonModel, _$identity);

  /// Serializes this SeasonModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeasonModel&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.startsOn, startsOn) || other.startsOn == startsOn)&&(identical(other.endsOn, endsOn) || other.endsOn == endsOn)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name,startsOn,endsOn,isActive);

@override
String toString() {
  return 'SeasonModel(code: $code, name: $name, startsOn: $startsOn, endsOn: $endsOn, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $SeasonModelCopyWith<$Res>  {
  factory $SeasonModelCopyWith(SeasonModel value, $Res Function(SeasonModel) _then) = _$SeasonModelCopyWithImpl;
@useResult
$Res call({
 String code, String name,@JsonKey(name: 'starts_on') DateTime? startsOn,@JsonKey(name: 'ends_on') DateTime? endsOn,@JsonKey(name: 'is_active') bool isActive
});




}
/// @nodoc
class _$SeasonModelCopyWithImpl<$Res>
    implements $SeasonModelCopyWith<$Res> {
  _$SeasonModelCopyWithImpl(this._self, this._then);

  final SeasonModel _self;
  final $Res Function(SeasonModel) _then;

/// Create a copy of SeasonModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? name = null,Object? startsOn = freezed,Object? endsOn = freezed,Object? isActive = null,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startsOn: freezed == startsOn ? _self.startsOn : startsOn // ignore: cast_nullable_to_non_nullable
as DateTime?,endsOn: freezed == endsOn ? _self.endsOn : endsOn // ignore: cast_nullable_to_non_nullable
as DateTime?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [SeasonModel].
extension SeasonModelPatterns on SeasonModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeasonModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeasonModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeasonModel value)  $default,){
final _that = this;
switch (_that) {
case _SeasonModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeasonModel value)?  $default,){
final _that = this;
switch (_that) {
case _SeasonModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String name, @JsonKey(name: 'starts_on')  DateTime? startsOn, @JsonKey(name: 'ends_on')  DateTime? endsOn, @JsonKey(name: 'is_active')  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeasonModel() when $default != null:
return $default(_that.code,_that.name,_that.startsOn,_that.endsOn,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String name, @JsonKey(name: 'starts_on')  DateTime? startsOn, @JsonKey(name: 'ends_on')  DateTime? endsOn, @JsonKey(name: 'is_active')  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _SeasonModel():
return $default(_that.code,_that.name,_that.startsOn,_that.endsOn,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String name, @JsonKey(name: 'starts_on')  DateTime? startsOn, @JsonKey(name: 'ends_on')  DateTime? endsOn, @JsonKey(name: 'is_active')  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _SeasonModel() when $default != null:
return $default(_that.code,_that.name,_that.startsOn,_that.endsOn,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeasonModel implements SeasonModel {
  const _SeasonModel({required this.code, required this.name, @JsonKey(name: 'starts_on') this.startsOn, @JsonKey(name: 'ends_on') this.endsOn, @JsonKey(name: 'is_active') this.isActive = false});
  factory _SeasonModel.fromJson(Map<String, dynamic> json) => _$SeasonModelFromJson(json);

@override final  String code;
@override final  String name;
@override@JsonKey(name: 'starts_on') final  DateTime? startsOn;
@override@JsonKey(name: 'ends_on') final  DateTime? endsOn;
@override@JsonKey(name: 'is_active') final  bool isActive;

/// Create a copy of SeasonModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeasonModelCopyWith<_SeasonModel> get copyWith => __$SeasonModelCopyWithImpl<_SeasonModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeasonModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeasonModel&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.startsOn, startsOn) || other.startsOn == startsOn)&&(identical(other.endsOn, endsOn) || other.endsOn == endsOn)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name,startsOn,endsOn,isActive);

@override
String toString() {
  return 'SeasonModel(code: $code, name: $name, startsOn: $startsOn, endsOn: $endsOn, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$SeasonModelCopyWith<$Res> implements $SeasonModelCopyWith<$Res> {
  factory _$SeasonModelCopyWith(_SeasonModel value, $Res Function(_SeasonModel) _then) = __$SeasonModelCopyWithImpl;
@override @useResult
$Res call({
 String code, String name,@JsonKey(name: 'starts_on') DateTime? startsOn,@JsonKey(name: 'ends_on') DateTime? endsOn,@JsonKey(name: 'is_active') bool isActive
});




}
/// @nodoc
class __$SeasonModelCopyWithImpl<$Res>
    implements _$SeasonModelCopyWith<$Res> {
  __$SeasonModelCopyWithImpl(this._self, this._then);

  final _SeasonModel _self;
  final $Res Function(_SeasonModel) _then;

/// Create a copy of SeasonModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? name = null,Object? startsOn = freezed,Object? endsOn = freezed,Object? isActive = null,}) {
  return _then(_SeasonModel(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startsOn: freezed == startsOn ? _self.startsOn : startsOn // ignore: cast_nullable_to_non_nullable
as DateTime?,endsOn: freezed == endsOn ? _self.endsOn : endsOn // ignore: cast_nullable_to_non_nullable
as DateTime?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
