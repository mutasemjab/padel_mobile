// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'category_detail_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$StandingRowModel {

 int get position; MatchTeamModel get team; int get played; int get wins; int get losses; int get points;@JsonKey(name: 'sets_won') int get setsWon;@JsonKey(name: 'sets_lost') int get setsLost;@JsonKey(name: 'set_difference') int get setDifference;@JsonKey(name: 'games_won') int get gamesWon;@JsonKey(name: 'games_lost') int get gamesLost;@JsonKey(name: 'game_difference') int get gameDifference;
/// Create a copy of StandingRowModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$StandingRowModelCopyWith<StandingRowModel> get copyWith => _$StandingRowModelCopyWithImpl<StandingRowModel>(this as StandingRowModel, _$identity);

  /// Serializes this StandingRowModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is StandingRowModel&&(identical(other.position, position) || other.position == position)&&(identical(other.team, team) || other.team == team)&&(identical(other.played, played) || other.played == played)&&(identical(other.wins, wins) || other.wins == wins)&&(identical(other.losses, losses) || other.losses == losses)&&(identical(other.points, points) || other.points == points)&&(identical(other.setsWon, setsWon) || other.setsWon == setsWon)&&(identical(other.setsLost, setsLost) || other.setsLost == setsLost)&&(identical(other.setDifference, setDifference) || other.setDifference == setDifference)&&(identical(other.gamesWon, gamesWon) || other.gamesWon == gamesWon)&&(identical(other.gamesLost, gamesLost) || other.gamesLost == gamesLost)&&(identical(other.gameDifference, gameDifference) || other.gameDifference == gameDifference));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,position,team,played,wins,losses,points,setsWon,setsLost,setDifference,gamesWon,gamesLost,gameDifference);

@override
String toString() {
  return 'StandingRowModel(position: $position, team: $team, played: $played, wins: $wins, losses: $losses, points: $points, setsWon: $setsWon, setsLost: $setsLost, setDifference: $setDifference, gamesWon: $gamesWon, gamesLost: $gamesLost, gameDifference: $gameDifference)';
}


}

/// @nodoc
abstract mixin class $StandingRowModelCopyWith<$Res>  {
  factory $StandingRowModelCopyWith(StandingRowModel value, $Res Function(StandingRowModel) _then) = _$StandingRowModelCopyWithImpl;
@useResult
$Res call({
 int position, MatchTeamModel team, int played, int wins, int losses, int points,@JsonKey(name: 'sets_won') int setsWon,@JsonKey(name: 'sets_lost') int setsLost,@JsonKey(name: 'set_difference') int setDifference,@JsonKey(name: 'games_won') int gamesWon,@JsonKey(name: 'games_lost') int gamesLost,@JsonKey(name: 'game_difference') int gameDifference
});


$MatchTeamModelCopyWith<$Res> get team;

}
/// @nodoc
class _$StandingRowModelCopyWithImpl<$Res>
    implements $StandingRowModelCopyWith<$Res> {
  _$StandingRowModelCopyWithImpl(this._self, this._then);

  final StandingRowModel _self;
  final $Res Function(StandingRowModel) _then;

/// Create a copy of StandingRowModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? position = null,Object? team = null,Object? played = null,Object? wins = null,Object? losses = null,Object? points = null,Object? setsWon = null,Object? setsLost = null,Object? setDifference = null,Object? gamesWon = null,Object? gamesLost = null,Object? gameDifference = null,}) {
  return _then(_self.copyWith(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,team: null == team ? _self.team : team // ignore: cast_nullable_to_non_nullable
as MatchTeamModel,played: null == played ? _self.played : played // ignore: cast_nullable_to_non_nullable
as int,wins: null == wins ? _self.wins : wins // ignore: cast_nullable_to_non_nullable
as int,losses: null == losses ? _self.losses : losses // ignore: cast_nullable_to_non_nullable
as int,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,setsWon: null == setsWon ? _self.setsWon : setsWon // ignore: cast_nullable_to_non_nullable
as int,setsLost: null == setsLost ? _self.setsLost : setsLost // ignore: cast_nullable_to_non_nullable
as int,setDifference: null == setDifference ? _self.setDifference : setDifference // ignore: cast_nullable_to_non_nullable
as int,gamesWon: null == gamesWon ? _self.gamesWon : gamesWon // ignore: cast_nullable_to_non_nullable
as int,gamesLost: null == gamesLost ? _self.gamesLost : gamesLost // ignore: cast_nullable_to_non_nullable
as int,gameDifference: null == gameDifference ? _self.gameDifference : gameDifference // ignore: cast_nullable_to_non_nullable
as int,
  ));
}
/// Create a copy of StandingRowModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchTeamModelCopyWith<$Res> get team {
  
  return $MatchTeamModelCopyWith<$Res>(_self.team, (value) {
    return _then(_self.copyWith(team: value));
  });
}
}


/// Adds pattern-matching-related methods to [StandingRowModel].
extension StandingRowModelPatterns on StandingRowModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _StandingRowModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _StandingRowModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _StandingRowModel value)  $default,){
final _that = this;
switch (_that) {
case _StandingRowModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _StandingRowModel value)?  $default,){
final _that = this;
switch (_that) {
case _StandingRowModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int position,  MatchTeamModel team,  int played,  int wins,  int losses,  int points, @JsonKey(name: 'sets_won')  int setsWon, @JsonKey(name: 'sets_lost')  int setsLost, @JsonKey(name: 'set_difference')  int setDifference, @JsonKey(name: 'games_won')  int gamesWon, @JsonKey(name: 'games_lost')  int gamesLost, @JsonKey(name: 'game_difference')  int gameDifference)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _StandingRowModel() when $default != null:
return $default(_that.position,_that.team,_that.played,_that.wins,_that.losses,_that.points,_that.setsWon,_that.setsLost,_that.setDifference,_that.gamesWon,_that.gamesLost,_that.gameDifference);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int position,  MatchTeamModel team,  int played,  int wins,  int losses,  int points, @JsonKey(name: 'sets_won')  int setsWon, @JsonKey(name: 'sets_lost')  int setsLost, @JsonKey(name: 'set_difference')  int setDifference, @JsonKey(name: 'games_won')  int gamesWon, @JsonKey(name: 'games_lost')  int gamesLost, @JsonKey(name: 'game_difference')  int gameDifference)  $default,) {final _that = this;
switch (_that) {
case _StandingRowModel():
return $default(_that.position,_that.team,_that.played,_that.wins,_that.losses,_that.points,_that.setsWon,_that.setsLost,_that.setDifference,_that.gamesWon,_that.gamesLost,_that.gameDifference);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int position,  MatchTeamModel team,  int played,  int wins,  int losses,  int points, @JsonKey(name: 'sets_won')  int setsWon, @JsonKey(name: 'sets_lost')  int setsLost, @JsonKey(name: 'set_difference')  int setDifference, @JsonKey(name: 'games_won')  int gamesWon, @JsonKey(name: 'games_lost')  int gamesLost, @JsonKey(name: 'game_difference')  int gameDifference)?  $default,) {final _that = this;
switch (_that) {
case _StandingRowModel() when $default != null:
return $default(_that.position,_that.team,_that.played,_that.wins,_that.losses,_that.points,_that.setsWon,_that.setsLost,_that.setDifference,_that.gamesWon,_that.gamesLost,_that.gameDifference);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _StandingRowModel implements StandingRowModel {
  const _StandingRowModel({this.position = 0, required this.team, this.played = 0, this.wins = 0, this.losses = 0, this.points = 0, @JsonKey(name: 'sets_won') this.setsWon = 0, @JsonKey(name: 'sets_lost') this.setsLost = 0, @JsonKey(name: 'set_difference') this.setDifference = 0, @JsonKey(name: 'games_won') this.gamesWon = 0, @JsonKey(name: 'games_lost') this.gamesLost = 0, @JsonKey(name: 'game_difference') this.gameDifference = 0});
  factory _StandingRowModel.fromJson(Map<String, dynamic> json) => _$StandingRowModelFromJson(json);

@override@JsonKey() final  int position;
@override final  MatchTeamModel team;
@override@JsonKey() final  int played;
@override@JsonKey() final  int wins;
@override@JsonKey() final  int losses;
@override@JsonKey() final  int points;
@override@JsonKey(name: 'sets_won') final  int setsWon;
@override@JsonKey(name: 'sets_lost') final  int setsLost;
@override@JsonKey(name: 'set_difference') final  int setDifference;
@override@JsonKey(name: 'games_won') final  int gamesWon;
@override@JsonKey(name: 'games_lost') final  int gamesLost;
@override@JsonKey(name: 'game_difference') final  int gameDifference;

/// Create a copy of StandingRowModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$StandingRowModelCopyWith<_StandingRowModel> get copyWith => __$StandingRowModelCopyWithImpl<_StandingRowModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$StandingRowModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _StandingRowModel&&(identical(other.position, position) || other.position == position)&&(identical(other.team, team) || other.team == team)&&(identical(other.played, played) || other.played == played)&&(identical(other.wins, wins) || other.wins == wins)&&(identical(other.losses, losses) || other.losses == losses)&&(identical(other.points, points) || other.points == points)&&(identical(other.setsWon, setsWon) || other.setsWon == setsWon)&&(identical(other.setsLost, setsLost) || other.setsLost == setsLost)&&(identical(other.setDifference, setDifference) || other.setDifference == setDifference)&&(identical(other.gamesWon, gamesWon) || other.gamesWon == gamesWon)&&(identical(other.gamesLost, gamesLost) || other.gamesLost == gamesLost)&&(identical(other.gameDifference, gameDifference) || other.gameDifference == gameDifference));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,position,team,played,wins,losses,points,setsWon,setsLost,setDifference,gamesWon,gamesLost,gameDifference);

@override
String toString() {
  return 'StandingRowModel(position: $position, team: $team, played: $played, wins: $wins, losses: $losses, points: $points, setsWon: $setsWon, setsLost: $setsLost, setDifference: $setDifference, gamesWon: $gamesWon, gamesLost: $gamesLost, gameDifference: $gameDifference)';
}


}

/// @nodoc
abstract mixin class _$StandingRowModelCopyWith<$Res> implements $StandingRowModelCopyWith<$Res> {
  factory _$StandingRowModelCopyWith(_StandingRowModel value, $Res Function(_StandingRowModel) _then) = __$StandingRowModelCopyWithImpl;
@override @useResult
$Res call({
 int position, MatchTeamModel team, int played, int wins, int losses, int points,@JsonKey(name: 'sets_won') int setsWon,@JsonKey(name: 'sets_lost') int setsLost,@JsonKey(name: 'set_difference') int setDifference,@JsonKey(name: 'games_won') int gamesWon,@JsonKey(name: 'games_lost') int gamesLost,@JsonKey(name: 'game_difference') int gameDifference
});


@override $MatchTeamModelCopyWith<$Res> get team;

}
/// @nodoc
class __$StandingRowModelCopyWithImpl<$Res>
    implements _$StandingRowModelCopyWith<$Res> {
  __$StandingRowModelCopyWithImpl(this._self, this._then);

  final _StandingRowModel _self;
  final $Res Function(_StandingRowModel) _then;

/// Create a copy of StandingRowModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? position = null,Object? team = null,Object? played = null,Object? wins = null,Object? losses = null,Object? points = null,Object? setsWon = null,Object? setsLost = null,Object? setDifference = null,Object? gamesWon = null,Object? gamesLost = null,Object? gameDifference = null,}) {
  return _then(_StandingRowModel(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as int,team: null == team ? _self.team : team // ignore: cast_nullable_to_non_nullable
as MatchTeamModel,played: null == played ? _self.played : played // ignore: cast_nullable_to_non_nullable
as int,wins: null == wins ? _self.wins : wins // ignore: cast_nullable_to_non_nullable
as int,losses: null == losses ? _self.losses : losses // ignore: cast_nullable_to_non_nullable
as int,points: null == points ? _self.points : points // ignore: cast_nullable_to_non_nullable
as int,setsWon: null == setsWon ? _self.setsWon : setsWon // ignore: cast_nullable_to_non_nullable
as int,setsLost: null == setsLost ? _self.setsLost : setsLost // ignore: cast_nullable_to_non_nullable
as int,setDifference: null == setDifference ? _self.setDifference : setDifference // ignore: cast_nullable_to_non_nullable
as int,gamesWon: null == gamesWon ? _self.gamesWon : gamesWon // ignore: cast_nullable_to_non_nullable
as int,gamesLost: null == gamesLost ? _self.gamesLost : gamesLost // ignore: cast_nullable_to_non_nullable
as int,gameDifference: null == gameDifference ? _self.gameDifference : gameDifference // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

/// Create a copy of StandingRowModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchTeamModelCopyWith<$Res> get team {
  
  return $MatchTeamModelCopyWith<$Res>(_self.team, (value) {
    return _then(_self.copyWith(team: value));
  });
}
}


/// @nodoc
mixin _$CategoryGroupModel {

 int get id; String get name; bool get finished; List<StandingRowModel> get standings; List<MatchModel> get matches;
/// Create a copy of CategoryGroupModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryGroupModelCopyWith<CategoryGroupModel> get copyWith => _$CategoryGroupModelCopyWithImpl<CategoryGroupModel>(this as CategoryGroupModel, _$identity);

  /// Serializes this CategoryGroupModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryGroupModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.finished, finished) || other.finished == finished)&&const DeepCollectionEquality().equals(other.standings, standings)&&const DeepCollectionEquality().equals(other.matches, matches));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,finished,const DeepCollectionEquality().hash(standings),const DeepCollectionEquality().hash(matches));

@override
String toString() {
  return 'CategoryGroupModel(id: $id, name: $name, finished: $finished, standings: $standings, matches: $matches)';
}


}

/// @nodoc
abstract mixin class $CategoryGroupModelCopyWith<$Res>  {
  factory $CategoryGroupModelCopyWith(CategoryGroupModel value, $Res Function(CategoryGroupModel) _then) = _$CategoryGroupModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, bool finished, List<StandingRowModel> standings, List<MatchModel> matches
});




}
/// @nodoc
class _$CategoryGroupModelCopyWithImpl<$Res>
    implements $CategoryGroupModelCopyWith<$Res> {
  _$CategoryGroupModelCopyWithImpl(this._self, this._then);

  final CategoryGroupModel _self;
  final $Res Function(CategoryGroupModel) _then;

/// Create a copy of CategoryGroupModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? finished = null,Object? standings = null,Object? matches = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,finished: null == finished ? _self.finished : finished // ignore: cast_nullable_to_non_nullable
as bool,standings: null == standings ? _self.standings : standings // ignore: cast_nullable_to_non_nullable
as List<StandingRowModel>,matches: null == matches ? _self.matches : matches // ignore: cast_nullable_to_non_nullable
as List<MatchModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [CategoryGroupModel].
extension CategoryGroupModelPatterns on CategoryGroupModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryGroupModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryGroupModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryGroupModel value)  $default,){
final _that = this;
switch (_that) {
case _CategoryGroupModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryGroupModel value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryGroupModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  bool finished,  List<StandingRowModel> standings,  List<MatchModel> matches)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryGroupModel() when $default != null:
return $default(_that.id,_that.name,_that.finished,_that.standings,_that.matches);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  bool finished,  List<StandingRowModel> standings,  List<MatchModel> matches)  $default,) {final _that = this;
switch (_that) {
case _CategoryGroupModel():
return $default(_that.id,_that.name,_that.finished,_that.standings,_that.matches);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  bool finished,  List<StandingRowModel> standings,  List<MatchModel> matches)?  $default,) {final _that = this;
switch (_that) {
case _CategoryGroupModel() when $default != null:
return $default(_that.id,_that.name,_that.finished,_that.standings,_that.matches);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryGroupModel implements CategoryGroupModel {
  const _CategoryGroupModel({required this.id, required this.name, this.finished = false, final  List<StandingRowModel> standings = const [], final  List<MatchModel> matches = const []}): _standings = standings,_matches = matches;
  factory _CategoryGroupModel.fromJson(Map<String, dynamic> json) => _$CategoryGroupModelFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey() final  bool finished;
 final  List<StandingRowModel> _standings;
@override@JsonKey() List<StandingRowModel> get standings {
  if (_standings is EqualUnmodifiableListView) return _standings;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_standings);
}

 final  List<MatchModel> _matches;
@override@JsonKey() List<MatchModel> get matches {
  if (_matches is EqualUnmodifiableListView) return _matches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_matches);
}


/// Create a copy of CategoryGroupModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryGroupModelCopyWith<_CategoryGroupModel> get copyWith => __$CategoryGroupModelCopyWithImpl<_CategoryGroupModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryGroupModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryGroupModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.finished, finished) || other.finished == finished)&&const DeepCollectionEquality().equals(other._standings, _standings)&&const DeepCollectionEquality().equals(other._matches, _matches));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,finished,const DeepCollectionEquality().hash(_standings),const DeepCollectionEquality().hash(_matches));

@override
String toString() {
  return 'CategoryGroupModel(id: $id, name: $name, finished: $finished, standings: $standings, matches: $matches)';
}


}

/// @nodoc
abstract mixin class _$CategoryGroupModelCopyWith<$Res> implements $CategoryGroupModelCopyWith<$Res> {
  factory _$CategoryGroupModelCopyWith(_CategoryGroupModel value, $Res Function(_CategoryGroupModel) _then) = __$CategoryGroupModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, bool finished, List<StandingRowModel> standings, List<MatchModel> matches
});




}
/// @nodoc
class __$CategoryGroupModelCopyWithImpl<$Res>
    implements _$CategoryGroupModelCopyWith<$Res> {
  __$CategoryGroupModelCopyWithImpl(this._self, this._then);

  final _CategoryGroupModel _self;
  final $Res Function(_CategoryGroupModel) _then;

/// Create a copy of CategoryGroupModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? finished = null,Object? standings = null,Object? matches = null,}) {
  return _then(_CategoryGroupModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,finished: null == finished ? _self.finished : finished // ignore: cast_nullable_to_non_nullable
as bool,standings: null == standings ? _self._standings : standings // ignore: cast_nullable_to_non_nullable
as List<StandingRowModel>,matches: null == matches ? _self._matches : matches // ignore: cast_nullable_to_non_nullable
as List<MatchModel>,
  ));
}


}


/// @nodoc
mixin _$BracketRoundModel {

 String get round;@JsonKey(name: 'round_label') String? get roundLabel; List<MatchModel> get matches;
/// Create a copy of BracketRoundModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BracketRoundModelCopyWith<BracketRoundModel> get copyWith => _$BracketRoundModelCopyWithImpl<BracketRoundModel>(this as BracketRoundModel, _$identity);

  /// Serializes this BracketRoundModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BracketRoundModel&&(identical(other.round, round) || other.round == round)&&(identical(other.roundLabel, roundLabel) || other.roundLabel == roundLabel)&&const DeepCollectionEquality().equals(other.matches, matches));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,round,roundLabel,const DeepCollectionEquality().hash(matches));

@override
String toString() {
  return 'BracketRoundModel(round: $round, roundLabel: $roundLabel, matches: $matches)';
}


}

/// @nodoc
abstract mixin class $BracketRoundModelCopyWith<$Res>  {
  factory $BracketRoundModelCopyWith(BracketRoundModel value, $Res Function(BracketRoundModel) _then) = _$BracketRoundModelCopyWithImpl;
@useResult
$Res call({
 String round,@JsonKey(name: 'round_label') String? roundLabel, List<MatchModel> matches
});




}
/// @nodoc
class _$BracketRoundModelCopyWithImpl<$Res>
    implements $BracketRoundModelCopyWith<$Res> {
  _$BracketRoundModelCopyWithImpl(this._self, this._then);

  final BracketRoundModel _self;
  final $Res Function(BracketRoundModel) _then;

/// Create a copy of BracketRoundModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? round = null,Object? roundLabel = freezed,Object? matches = null,}) {
  return _then(_self.copyWith(
round: null == round ? _self.round : round // ignore: cast_nullable_to_non_nullable
as String,roundLabel: freezed == roundLabel ? _self.roundLabel : roundLabel // ignore: cast_nullable_to_non_nullable
as String?,matches: null == matches ? _self.matches : matches // ignore: cast_nullable_to_non_nullable
as List<MatchModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [BracketRoundModel].
extension BracketRoundModelPatterns on BracketRoundModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BracketRoundModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BracketRoundModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BracketRoundModel value)  $default,){
final _that = this;
switch (_that) {
case _BracketRoundModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BracketRoundModel value)?  $default,){
final _that = this;
switch (_that) {
case _BracketRoundModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String round, @JsonKey(name: 'round_label')  String? roundLabel,  List<MatchModel> matches)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BracketRoundModel() when $default != null:
return $default(_that.round,_that.roundLabel,_that.matches);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String round, @JsonKey(name: 'round_label')  String? roundLabel,  List<MatchModel> matches)  $default,) {final _that = this;
switch (_that) {
case _BracketRoundModel():
return $default(_that.round,_that.roundLabel,_that.matches);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String round, @JsonKey(name: 'round_label')  String? roundLabel,  List<MatchModel> matches)?  $default,) {final _that = this;
switch (_that) {
case _BracketRoundModel() when $default != null:
return $default(_that.round,_that.roundLabel,_that.matches);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BracketRoundModel implements BracketRoundModel {
  const _BracketRoundModel({required this.round, @JsonKey(name: 'round_label') this.roundLabel, final  List<MatchModel> matches = const []}): _matches = matches;
  factory _BracketRoundModel.fromJson(Map<String, dynamic> json) => _$BracketRoundModelFromJson(json);

@override final  String round;
@override@JsonKey(name: 'round_label') final  String? roundLabel;
 final  List<MatchModel> _matches;
@override@JsonKey() List<MatchModel> get matches {
  if (_matches is EqualUnmodifiableListView) return _matches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_matches);
}


/// Create a copy of BracketRoundModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BracketRoundModelCopyWith<_BracketRoundModel> get copyWith => __$BracketRoundModelCopyWithImpl<_BracketRoundModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BracketRoundModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BracketRoundModel&&(identical(other.round, round) || other.round == round)&&(identical(other.roundLabel, roundLabel) || other.roundLabel == roundLabel)&&const DeepCollectionEquality().equals(other._matches, _matches));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,round,roundLabel,const DeepCollectionEquality().hash(_matches));

@override
String toString() {
  return 'BracketRoundModel(round: $round, roundLabel: $roundLabel, matches: $matches)';
}


}

/// @nodoc
abstract mixin class _$BracketRoundModelCopyWith<$Res> implements $BracketRoundModelCopyWith<$Res> {
  factory _$BracketRoundModelCopyWith(_BracketRoundModel value, $Res Function(_BracketRoundModel) _then) = __$BracketRoundModelCopyWithImpl;
@override @useResult
$Res call({
 String round,@JsonKey(name: 'round_label') String? roundLabel, List<MatchModel> matches
});




}
/// @nodoc
class __$BracketRoundModelCopyWithImpl<$Res>
    implements _$BracketRoundModelCopyWith<$Res> {
  __$BracketRoundModelCopyWithImpl(this._self, this._then);

  final _BracketRoundModel _self;
  final $Res Function(_BracketRoundModel) _then;

/// Create a copy of BracketRoundModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? round = null,Object? roundLabel = freezed,Object? matches = null,}) {
  return _then(_BracketRoundModel(
round: null == round ? _self.round : round // ignore: cast_nullable_to_non_nullable
as String,roundLabel: freezed == roundLabel ? _self.roundLabel : roundLabel // ignore: cast_nullable_to_non_nullable
as String?,matches: null == matches ? _self._matches : matches // ignore: cast_nullable_to_non_nullable
as List<MatchModel>,
  ));
}


}


/// @nodoc
mixin _$CategoryDetailModel {

 TournamentCategoryModel get category; List<MatchTeamModel> get teams; List<CategoryGroupModel> get groups; List<BracketRoundModel> get bracket;
/// Create a copy of CategoryDetailModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CategoryDetailModelCopyWith<CategoryDetailModel> get copyWith => _$CategoryDetailModelCopyWithImpl<CategoryDetailModel>(this as CategoryDetailModel, _$identity);

  /// Serializes this CategoryDetailModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CategoryDetailModel&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other.teams, teams)&&const DeepCollectionEquality().equals(other.groups, groups)&&const DeepCollectionEquality().equals(other.bracket, bracket));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,const DeepCollectionEquality().hash(teams),const DeepCollectionEquality().hash(groups),const DeepCollectionEquality().hash(bracket));

@override
String toString() {
  return 'CategoryDetailModel(category: $category, teams: $teams, groups: $groups, bracket: $bracket)';
}


}

/// @nodoc
abstract mixin class $CategoryDetailModelCopyWith<$Res>  {
  factory $CategoryDetailModelCopyWith(CategoryDetailModel value, $Res Function(CategoryDetailModel) _then) = _$CategoryDetailModelCopyWithImpl;
@useResult
$Res call({
 TournamentCategoryModel category, List<MatchTeamModel> teams, List<CategoryGroupModel> groups, List<BracketRoundModel> bracket
});


$TournamentCategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class _$CategoryDetailModelCopyWithImpl<$Res>
    implements $CategoryDetailModelCopyWith<$Res> {
  _$CategoryDetailModelCopyWithImpl(this._self, this._then);

  final CategoryDetailModel _self;
  final $Res Function(CategoryDetailModel) _then;

/// Create a copy of CategoryDetailModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? category = null,Object? teams = null,Object? groups = null,Object? bracket = null,}) {
  return _then(_self.copyWith(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as TournamentCategoryModel,teams: null == teams ? _self.teams : teams // ignore: cast_nullable_to_non_nullable
as List<MatchTeamModel>,groups: null == groups ? _self.groups : groups // ignore: cast_nullable_to_non_nullable
as List<CategoryGroupModel>,bracket: null == bracket ? _self.bracket : bracket // ignore: cast_nullable_to_non_nullable
as List<BracketRoundModel>,
  ));
}
/// Create a copy of CategoryDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TournamentCategoryModelCopyWith<$Res> get category {
  
  return $TournamentCategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// Adds pattern-matching-related methods to [CategoryDetailModel].
extension CategoryDetailModelPatterns on CategoryDetailModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CategoryDetailModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CategoryDetailModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CategoryDetailModel value)  $default,){
final _that = this;
switch (_that) {
case _CategoryDetailModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CategoryDetailModel value)?  $default,){
final _that = this;
switch (_that) {
case _CategoryDetailModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( TournamentCategoryModel category,  List<MatchTeamModel> teams,  List<CategoryGroupModel> groups,  List<BracketRoundModel> bracket)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CategoryDetailModel() when $default != null:
return $default(_that.category,_that.teams,_that.groups,_that.bracket);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( TournamentCategoryModel category,  List<MatchTeamModel> teams,  List<CategoryGroupModel> groups,  List<BracketRoundModel> bracket)  $default,) {final _that = this;
switch (_that) {
case _CategoryDetailModel():
return $default(_that.category,_that.teams,_that.groups,_that.bracket);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( TournamentCategoryModel category,  List<MatchTeamModel> teams,  List<CategoryGroupModel> groups,  List<BracketRoundModel> bracket)?  $default,) {final _that = this;
switch (_that) {
case _CategoryDetailModel() when $default != null:
return $default(_that.category,_that.teams,_that.groups,_that.bracket);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CategoryDetailModel implements CategoryDetailModel {
  const _CategoryDetailModel({required this.category, final  List<MatchTeamModel> teams = const [], final  List<CategoryGroupModel> groups = const [], final  List<BracketRoundModel> bracket = const []}): _teams = teams,_groups = groups,_bracket = bracket;
  factory _CategoryDetailModel.fromJson(Map<String, dynamic> json) => _$CategoryDetailModelFromJson(json);

@override final  TournamentCategoryModel category;
 final  List<MatchTeamModel> _teams;
@override@JsonKey() List<MatchTeamModel> get teams {
  if (_teams is EqualUnmodifiableListView) return _teams;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_teams);
}

 final  List<CategoryGroupModel> _groups;
@override@JsonKey() List<CategoryGroupModel> get groups {
  if (_groups is EqualUnmodifiableListView) return _groups;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_groups);
}

 final  List<BracketRoundModel> _bracket;
@override@JsonKey() List<BracketRoundModel> get bracket {
  if (_bracket is EqualUnmodifiableListView) return _bracket;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_bracket);
}


/// Create a copy of CategoryDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CategoryDetailModelCopyWith<_CategoryDetailModel> get copyWith => __$CategoryDetailModelCopyWithImpl<_CategoryDetailModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CategoryDetailModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CategoryDetailModel&&(identical(other.category, category) || other.category == category)&&const DeepCollectionEquality().equals(other._teams, _teams)&&const DeepCollectionEquality().equals(other._groups, _groups)&&const DeepCollectionEquality().equals(other._bracket, _bracket));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,category,const DeepCollectionEquality().hash(_teams),const DeepCollectionEquality().hash(_groups),const DeepCollectionEquality().hash(_bracket));

@override
String toString() {
  return 'CategoryDetailModel(category: $category, teams: $teams, groups: $groups, bracket: $bracket)';
}


}

/// @nodoc
abstract mixin class _$CategoryDetailModelCopyWith<$Res> implements $CategoryDetailModelCopyWith<$Res> {
  factory _$CategoryDetailModelCopyWith(_CategoryDetailModel value, $Res Function(_CategoryDetailModel) _then) = __$CategoryDetailModelCopyWithImpl;
@override @useResult
$Res call({
 TournamentCategoryModel category, List<MatchTeamModel> teams, List<CategoryGroupModel> groups, List<BracketRoundModel> bracket
});


@override $TournamentCategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class __$CategoryDetailModelCopyWithImpl<$Res>
    implements _$CategoryDetailModelCopyWith<$Res> {
  __$CategoryDetailModelCopyWithImpl(this._self, this._then);

  final _CategoryDetailModel _self;
  final $Res Function(_CategoryDetailModel) _then;

/// Create a copy of CategoryDetailModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? category = null,Object? teams = null,Object? groups = null,Object? bracket = null,}) {
  return _then(_CategoryDetailModel(
category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as TournamentCategoryModel,teams: null == teams ? _self._teams : teams // ignore: cast_nullable_to_non_nullable
as List<MatchTeamModel>,groups: null == groups ? _self._groups : groups // ignore: cast_nullable_to_non_nullable
as List<CategoryGroupModel>,bracket: null == bracket ? _self._bracket : bracket // ignore: cast_nullable_to_non_nullable
as List<BracketRoundModel>,
  ));
}

/// Create a copy of CategoryDetailModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TournamentCategoryModelCopyWith<$Res> get category {
  
  return $TournamentCategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// @nodoc
mixin _$EligibilityModel {

@JsonKey(name: 'registration_open') bool get registrationOpen;@JsonKey(name: 'is_full') bool get isFull;@JsonKey(name: 'player_issues') List<String> get playerIssues;@JsonKey(name: 'partner_issues') List<String>? get partnerIssues;@JsonKey(name: 'requires_payment') bool get requiresPayment;@JsonKey(name: 'registration_fee') num get registrationFee;
/// Create a copy of EligibilityModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$EligibilityModelCopyWith<EligibilityModel> get copyWith => _$EligibilityModelCopyWithImpl<EligibilityModel>(this as EligibilityModel, _$identity);

  /// Serializes this EligibilityModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EligibilityModel&&(identical(other.registrationOpen, registrationOpen) || other.registrationOpen == registrationOpen)&&(identical(other.isFull, isFull) || other.isFull == isFull)&&const DeepCollectionEquality().equals(other.playerIssues, playerIssues)&&const DeepCollectionEquality().equals(other.partnerIssues, partnerIssues)&&(identical(other.requiresPayment, requiresPayment) || other.requiresPayment == requiresPayment)&&(identical(other.registrationFee, registrationFee) || other.registrationFee == registrationFee));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,registrationOpen,isFull,const DeepCollectionEquality().hash(playerIssues),const DeepCollectionEquality().hash(partnerIssues),requiresPayment,registrationFee);

@override
String toString() {
  return 'EligibilityModel(registrationOpen: $registrationOpen, isFull: $isFull, playerIssues: $playerIssues, partnerIssues: $partnerIssues, requiresPayment: $requiresPayment, registrationFee: $registrationFee)';
}


}

/// @nodoc
abstract mixin class $EligibilityModelCopyWith<$Res>  {
  factory $EligibilityModelCopyWith(EligibilityModel value, $Res Function(EligibilityModel) _then) = _$EligibilityModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'registration_open') bool registrationOpen,@JsonKey(name: 'is_full') bool isFull,@JsonKey(name: 'player_issues') List<String> playerIssues,@JsonKey(name: 'partner_issues') List<String>? partnerIssues,@JsonKey(name: 'requires_payment') bool requiresPayment,@JsonKey(name: 'registration_fee') num registrationFee
});




}
/// @nodoc
class _$EligibilityModelCopyWithImpl<$Res>
    implements $EligibilityModelCopyWith<$Res> {
  _$EligibilityModelCopyWithImpl(this._self, this._then);

  final EligibilityModel _self;
  final $Res Function(EligibilityModel) _then;

/// Create a copy of EligibilityModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? registrationOpen = null,Object? isFull = null,Object? playerIssues = null,Object? partnerIssues = freezed,Object? requiresPayment = null,Object? registrationFee = null,}) {
  return _then(_self.copyWith(
registrationOpen: null == registrationOpen ? _self.registrationOpen : registrationOpen // ignore: cast_nullable_to_non_nullable
as bool,isFull: null == isFull ? _self.isFull : isFull // ignore: cast_nullable_to_non_nullable
as bool,playerIssues: null == playerIssues ? _self.playerIssues : playerIssues // ignore: cast_nullable_to_non_nullable
as List<String>,partnerIssues: freezed == partnerIssues ? _self.partnerIssues : partnerIssues // ignore: cast_nullable_to_non_nullable
as List<String>?,requiresPayment: null == requiresPayment ? _self.requiresPayment : requiresPayment // ignore: cast_nullable_to_non_nullable
as bool,registrationFee: null == registrationFee ? _self.registrationFee : registrationFee // ignore: cast_nullable_to_non_nullable
as num,
  ));
}

}


/// Adds pattern-matching-related methods to [EligibilityModel].
extension EligibilityModelPatterns on EligibilityModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _EligibilityModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _EligibilityModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _EligibilityModel value)  $default,){
final _that = this;
switch (_that) {
case _EligibilityModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _EligibilityModel value)?  $default,){
final _that = this;
switch (_that) {
case _EligibilityModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'registration_open')  bool registrationOpen, @JsonKey(name: 'is_full')  bool isFull, @JsonKey(name: 'player_issues')  List<String> playerIssues, @JsonKey(name: 'partner_issues')  List<String>? partnerIssues, @JsonKey(name: 'requires_payment')  bool requiresPayment, @JsonKey(name: 'registration_fee')  num registrationFee)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _EligibilityModel() when $default != null:
return $default(_that.registrationOpen,_that.isFull,_that.playerIssues,_that.partnerIssues,_that.requiresPayment,_that.registrationFee);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'registration_open')  bool registrationOpen, @JsonKey(name: 'is_full')  bool isFull, @JsonKey(name: 'player_issues')  List<String> playerIssues, @JsonKey(name: 'partner_issues')  List<String>? partnerIssues, @JsonKey(name: 'requires_payment')  bool requiresPayment, @JsonKey(name: 'registration_fee')  num registrationFee)  $default,) {final _that = this;
switch (_that) {
case _EligibilityModel():
return $default(_that.registrationOpen,_that.isFull,_that.playerIssues,_that.partnerIssues,_that.requiresPayment,_that.registrationFee);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'registration_open')  bool registrationOpen, @JsonKey(name: 'is_full')  bool isFull, @JsonKey(name: 'player_issues')  List<String> playerIssues, @JsonKey(name: 'partner_issues')  List<String>? partnerIssues, @JsonKey(name: 'requires_payment')  bool requiresPayment, @JsonKey(name: 'registration_fee')  num registrationFee)?  $default,) {final _that = this;
switch (_that) {
case _EligibilityModel() when $default != null:
return $default(_that.registrationOpen,_that.isFull,_that.playerIssues,_that.partnerIssues,_that.requiresPayment,_that.registrationFee);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _EligibilityModel implements EligibilityModel {
  const _EligibilityModel({@JsonKey(name: 'registration_open') this.registrationOpen = false, @JsonKey(name: 'is_full') this.isFull = false, @JsonKey(name: 'player_issues') final  List<String> playerIssues = const [], @JsonKey(name: 'partner_issues') final  List<String>? partnerIssues, @JsonKey(name: 'requires_payment') this.requiresPayment = false, @JsonKey(name: 'registration_fee') this.registrationFee = 0}): _playerIssues = playerIssues,_partnerIssues = partnerIssues;
  factory _EligibilityModel.fromJson(Map<String, dynamic> json) => _$EligibilityModelFromJson(json);

@override@JsonKey(name: 'registration_open') final  bool registrationOpen;
@override@JsonKey(name: 'is_full') final  bool isFull;
 final  List<String> _playerIssues;
@override@JsonKey(name: 'player_issues') List<String> get playerIssues {
  if (_playerIssues is EqualUnmodifiableListView) return _playerIssues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_playerIssues);
}

 final  List<String>? _partnerIssues;
@override@JsonKey(name: 'partner_issues') List<String>? get partnerIssues {
  final value = _partnerIssues;
  if (value == null) return null;
  if (_partnerIssues is EqualUnmodifiableListView) return _partnerIssues;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(name: 'requires_payment') final  bool requiresPayment;
@override@JsonKey(name: 'registration_fee') final  num registrationFee;

/// Create a copy of EligibilityModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$EligibilityModelCopyWith<_EligibilityModel> get copyWith => __$EligibilityModelCopyWithImpl<_EligibilityModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$EligibilityModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _EligibilityModel&&(identical(other.registrationOpen, registrationOpen) || other.registrationOpen == registrationOpen)&&(identical(other.isFull, isFull) || other.isFull == isFull)&&const DeepCollectionEquality().equals(other._playerIssues, _playerIssues)&&const DeepCollectionEquality().equals(other._partnerIssues, _partnerIssues)&&(identical(other.requiresPayment, requiresPayment) || other.requiresPayment == requiresPayment)&&(identical(other.registrationFee, registrationFee) || other.registrationFee == registrationFee));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,registrationOpen,isFull,const DeepCollectionEquality().hash(_playerIssues),const DeepCollectionEquality().hash(_partnerIssues),requiresPayment,registrationFee);

@override
String toString() {
  return 'EligibilityModel(registrationOpen: $registrationOpen, isFull: $isFull, playerIssues: $playerIssues, partnerIssues: $partnerIssues, requiresPayment: $requiresPayment, registrationFee: $registrationFee)';
}


}

/// @nodoc
abstract mixin class _$EligibilityModelCopyWith<$Res> implements $EligibilityModelCopyWith<$Res> {
  factory _$EligibilityModelCopyWith(_EligibilityModel value, $Res Function(_EligibilityModel) _then) = __$EligibilityModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'registration_open') bool registrationOpen,@JsonKey(name: 'is_full') bool isFull,@JsonKey(name: 'player_issues') List<String> playerIssues,@JsonKey(name: 'partner_issues') List<String>? partnerIssues,@JsonKey(name: 'requires_payment') bool requiresPayment,@JsonKey(name: 'registration_fee') num registrationFee
});




}
/// @nodoc
class __$EligibilityModelCopyWithImpl<$Res>
    implements _$EligibilityModelCopyWith<$Res> {
  __$EligibilityModelCopyWithImpl(this._self, this._then);

  final _EligibilityModel _self;
  final $Res Function(_EligibilityModel) _then;

/// Create a copy of EligibilityModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? registrationOpen = null,Object? isFull = null,Object? playerIssues = null,Object? partnerIssues = freezed,Object? requiresPayment = null,Object? registrationFee = null,}) {
  return _then(_EligibilityModel(
registrationOpen: null == registrationOpen ? _self.registrationOpen : registrationOpen // ignore: cast_nullable_to_non_nullable
as bool,isFull: null == isFull ? _self.isFull : isFull // ignore: cast_nullable_to_non_nullable
as bool,playerIssues: null == playerIssues ? _self._playerIssues : playerIssues // ignore: cast_nullable_to_non_nullable
as List<String>,partnerIssues: freezed == partnerIssues ? _self._partnerIssues : partnerIssues // ignore: cast_nullable_to_non_nullable
as List<String>?,requiresPayment: null == requiresPayment ? _self.requiresPayment : requiresPayment // ignore: cast_nullable_to_non_nullable
as bool,registrationFee: null == registrationFee ? _self.registrationFee : registrationFee // ignore: cast_nullable_to_non_nullable
as num,
  ));
}


}

// dart format on
