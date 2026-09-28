// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_stats_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlayerStatsModel {

@JsonKey(name: 'matches_played') int get matchesPlayed; int get wins; int get losses;@JsonKey(name: 'win_rate') num? get winRate;@JsonKey(name: 'walkover_wins') int get walkoverWins;@JsonKey(name: 'walkover_losses') int get walkoverLosses;@JsonKey(name: 'sets_won') int get setsWon;@JsonKey(name: 'sets_lost') int get setsLost;@JsonKey(name: 'games_won') int get gamesWon;@JsonKey(name: 'games_lost') int get gamesLost;@JsonKey(name: 'current_streak') Map<String, dynamic>? get currentStreak;@JsonKey(name: 'best_win_streak') int get bestWinStreak;@JsonKey(name: 'tournaments_played') int get tournamentsPlayed; int get titles;@JsonKey(name: 'finals_reached') int get finalsReached;@JsonKey(name: 'last_played_at') DateTime? get lastPlayedAt;
/// Create a copy of PlayerStatsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerStatsModelCopyWith<PlayerStatsModel> get copyWith => _$PlayerStatsModelCopyWithImpl<PlayerStatsModel>(this as PlayerStatsModel, _$identity);

  /// Serializes this PlayerStatsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerStatsModel&&(identical(other.matchesPlayed, matchesPlayed) || other.matchesPlayed == matchesPlayed)&&(identical(other.wins, wins) || other.wins == wins)&&(identical(other.losses, losses) || other.losses == losses)&&(identical(other.winRate, winRate) || other.winRate == winRate)&&(identical(other.walkoverWins, walkoverWins) || other.walkoverWins == walkoverWins)&&(identical(other.walkoverLosses, walkoverLosses) || other.walkoverLosses == walkoverLosses)&&(identical(other.setsWon, setsWon) || other.setsWon == setsWon)&&(identical(other.setsLost, setsLost) || other.setsLost == setsLost)&&(identical(other.gamesWon, gamesWon) || other.gamesWon == gamesWon)&&(identical(other.gamesLost, gamesLost) || other.gamesLost == gamesLost)&&const DeepCollectionEquality().equals(other.currentStreak, currentStreak)&&(identical(other.bestWinStreak, bestWinStreak) || other.bestWinStreak == bestWinStreak)&&(identical(other.tournamentsPlayed, tournamentsPlayed) || other.tournamentsPlayed == tournamentsPlayed)&&(identical(other.titles, titles) || other.titles == titles)&&(identical(other.finalsReached, finalsReached) || other.finalsReached == finalsReached)&&(identical(other.lastPlayedAt, lastPlayedAt) || other.lastPlayedAt == lastPlayedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,matchesPlayed,wins,losses,winRate,walkoverWins,walkoverLosses,setsWon,setsLost,gamesWon,gamesLost,const DeepCollectionEquality().hash(currentStreak),bestWinStreak,tournamentsPlayed,titles,finalsReached,lastPlayedAt);

@override
String toString() {
  return 'PlayerStatsModel(matchesPlayed: $matchesPlayed, wins: $wins, losses: $losses, winRate: $winRate, walkoverWins: $walkoverWins, walkoverLosses: $walkoverLosses, setsWon: $setsWon, setsLost: $setsLost, gamesWon: $gamesWon, gamesLost: $gamesLost, currentStreak: $currentStreak, bestWinStreak: $bestWinStreak, tournamentsPlayed: $tournamentsPlayed, titles: $titles, finalsReached: $finalsReached, lastPlayedAt: $lastPlayedAt)';
}


}

/// @nodoc
abstract mixin class $PlayerStatsModelCopyWith<$Res>  {
  factory $PlayerStatsModelCopyWith(PlayerStatsModel value, $Res Function(PlayerStatsModel) _then) = _$PlayerStatsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'matches_played') int matchesPlayed, int wins, int losses,@JsonKey(name: 'win_rate') num? winRate,@JsonKey(name: 'walkover_wins') int walkoverWins,@JsonKey(name: 'walkover_losses') int walkoverLosses,@JsonKey(name: 'sets_won') int setsWon,@JsonKey(name: 'sets_lost') int setsLost,@JsonKey(name: 'games_won') int gamesWon,@JsonKey(name: 'games_lost') int gamesLost,@JsonKey(name: 'current_streak') Map<String, dynamic>? currentStreak,@JsonKey(name: 'best_win_streak') int bestWinStreak,@JsonKey(name: 'tournaments_played') int tournamentsPlayed, int titles,@JsonKey(name: 'finals_reached') int finalsReached,@JsonKey(name: 'last_played_at') DateTime? lastPlayedAt
});




}
/// @nodoc
class _$PlayerStatsModelCopyWithImpl<$Res>
    implements $PlayerStatsModelCopyWith<$Res> {
  _$PlayerStatsModelCopyWithImpl(this._self, this._then);

  final PlayerStatsModel _self;
  final $Res Function(PlayerStatsModel) _then;

/// Create a copy of PlayerStatsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? matchesPlayed = null,Object? wins = null,Object? losses = null,Object? winRate = freezed,Object? walkoverWins = null,Object? walkoverLosses = null,Object? setsWon = null,Object? setsLost = null,Object? gamesWon = null,Object? gamesLost = null,Object? currentStreak = freezed,Object? bestWinStreak = null,Object? tournamentsPlayed = null,Object? titles = null,Object? finalsReached = null,Object? lastPlayedAt = freezed,}) {
  return _then(_self.copyWith(
matchesPlayed: null == matchesPlayed ? _self.matchesPlayed : matchesPlayed // ignore: cast_nullable_to_non_nullable
as int,wins: null == wins ? _self.wins : wins // ignore: cast_nullable_to_non_nullable
as int,losses: null == losses ? _self.losses : losses // ignore: cast_nullable_to_non_nullable
as int,winRate: freezed == winRate ? _self.winRate : winRate // ignore: cast_nullable_to_non_nullable
as num?,walkoverWins: null == walkoverWins ? _self.walkoverWins : walkoverWins // ignore: cast_nullable_to_non_nullable
as int,walkoverLosses: null == walkoverLosses ? _self.walkoverLosses : walkoverLosses // ignore: cast_nullable_to_non_nullable
as int,setsWon: null == setsWon ? _self.setsWon : setsWon // ignore: cast_nullable_to_non_nullable
as int,setsLost: null == setsLost ? _self.setsLost : setsLost // ignore: cast_nullable_to_non_nullable
as int,gamesWon: null == gamesWon ? _self.gamesWon : gamesWon // ignore: cast_nullable_to_non_nullable
as int,gamesLost: null == gamesLost ? _self.gamesLost : gamesLost // ignore: cast_nullable_to_non_nullable
as int,currentStreak: freezed == currentStreak ? _self.currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,bestWinStreak: null == bestWinStreak ? _self.bestWinStreak : bestWinStreak // ignore: cast_nullable_to_non_nullable
as int,tournamentsPlayed: null == tournamentsPlayed ? _self.tournamentsPlayed : tournamentsPlayed // ignore: cast_nullable_to_non_nullable
as int,titles: null == titles ? _self.titles : titles // ignore: cast_nullable_to_non_nullable
as int,finalsReached: null == finalsReached ? _self.finalsReached : finalsReached // ignore: cast_nullable_to_non_nullable
as int,lastPlayedAt: freezed == lastPlayedAt ? _self.lastPlayedAt : lastPlayedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PlayerStatsModel].
extension PlayerStatsModelPatterns on PlayerStatsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlayerStatsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayerStatsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlayerStatsModel value)  $default,){
final _that = this;
switch (_that) {
case _PlayerStatsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlayerStatsModel value)?  $default,){
final _that = this;
switch (_that) {
case _PlayerStatsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'matches_played')  int matchesPlayed,  int wins,  int losses, @JsonKey(name: 'win_rate')  num? winRate, @JsonKey(name: 'walkover_wins')  int walkoverWins, @JsonKey(name: 'walkover_losses')  int walkoverLosses, @JsonKey(name: 'sets_won')  int setsWon, @JsonKey(name: 'sets_lost')  int setsLost, @JsonKey(name: 'games_won')  int gamesWon, @JsonKey(name: 'games_lost')  int gamesLost, @JsonKey(name: 'current_streak')  Map<String, dynamic>? currentStreak, @JsonKey(name: 'best_win_streak')  int bestWinStreak, @JsonKey(name: 'tournaments_played')  int tournamentsPlayed,  int titles, @JsonKey(name: 'finals_reached')  int finalsReached, @JsonKey(name: 'last_played_at')  DateTime? lastPlayedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayerStatsModel() when $default != null:
return $default(_that.matchesPlayed,_that.wins,_that.losses,_that.winRate,_that.walkoverWins,_that.walkoverLosses,_that.setsWon,_that.setsLost,_that.gamesWon,_that.gamesLost,_that.currentStreak,_that.bestWinStreak,_that.tournamentsPlayed,_that.titles,_that.finalsReached,_that.lastPlayedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'matches_played')  int matchesPlayed,  int wins,  int losses, @JsonKey(name: 'win_rate')  num? winRate, @JsonKey(name: 'walkover_wins')  int walkoverWins, @JsonKey(name: 'walkover_losses')  int walkoverLosses, @JsonKey(name: 'sets_won')  int setsWon, @JsonKey(name: 'sets_lost')  int setsLost, @JsonKey(name: 'games_won')  int gamesWon, @JsonKey(name: 'games_lost')  int gamesLost, @JsonKey(name: 'current_streak')  Map<String, dynamic>? currentStreak, @JsonKey(name: 'best_win_streak')  int bestWinStreak, @JsonKey(name: 'tournaments_played')  int tournamentsPlayed,  int titles, @JsonKey(name: 'finals_reached')  int finalsReached, @JsonKey(name: 'last_played_at')  DateTime? lastPlayedAt)  $default,) {final _that = this;
switch (_that) {
case _PlayerStatsModel():
return $default(_that.matchesPlayed,_that.wins,_that.losses,_that.winRate,_that.walkoverWins,_that.walkoverLosses,_that.setsWon,_that.setsLost,_that.gamesWon,_that.gamesLost,_that.currentStreak,_that.bestWinStreak,_that.tournamentsPlayed,_that.titles,_that.finalsReached,_that.lastPlayedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'matches_played')  int matchesPlayed,  int wins,  int losses, @JsonKey(name: 'win_rate')  num? winRate, @JsonKey(name: 'walkover_wins')  int walkoverWins, @JsonKey(name: 'walkover_losses')  int walkoverLosses, @JsonKey(name: 'sets_won')  int setsWon, @JsonKey(name: 'sets_lost')  int setsLost, @JsonKey(name: 'games_won')  int gamesWon, @JsonKey(name: 'games_lost')  int gamesLost, @JsonKey(name: 'current_streak')  Map<String, dynamic>? currentStreak, @JsonKey(name: 'best_win_streak')  int bestWinStreak, @JsonKey(name: 'tournaments_played')  int tournamentsPlayed,  int titles, @JsonKey(name: 'finals_reached')  int finalsReached, @JsonKey(name: 'last_played_at')  DateTime? lastPlayedAt)?  $default,) {final _that = this;
switch (_that) {
case _PlayerStatsModel() when $default != null:
return $default(_that.matchesPlayed,_that.wins,_that.losses,_that.winRate,_that.walkoverWins,_that.walkoverLosses,_that.setsWon,_that.setsLost,_that.gamesWon,_that.gamesLost,_that.currentStreak,_that.bestWinStreak,_that.tournamentsPlayed,_that.titles,_that.finalsReached,_that.lastPlayedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlayerStatsModel implements PlayerStatsModel {
  const _PlayerStatsModel({@JsonKey(name: 'matches_played') this.matchesPlayed = 0, this.wins = 0, this.losses = 0, @JsonKey(name: 'win_rate') this.winRate, @JsonKey(name: 'walkover_wins') this.walkoverWins = 0, @JsonKey(name: 'walkover_losses') this.walkoverLosses = 0, @JsonKey(name: 'sets_won') this.setsWon = 0, @JsonKey(name: 'sets_lost') this.setsLost = 0, @JsonKey(name: 'games_won') this.gamesWon = 0, @JsonKey(name: 'games_lost') this.gamesLost = 0, @JsonKey(name: 'current_streak') final  Map<String, dynamic>? currentStreak, @JsonKey(name: 'best_win_streak') this.bestWinStreak = 0, @JsonKey(name: 'tournaments_played') this.tournamentsPlayed = 0, this.titles = 0, @JsonKey(name: 'finals_reached') this.finalsReached = 0, @JsonKey(name: 'last_played_at') this.lastPlayedAt}): _currentStreak = currentStreak;
  factory _PlayerStatsModel.fromJson(Map<String, dynamic> json) => _$PlayerStatsModelFromJson(json);

@override@JsonKey(name: 'matches_played') final  int matchesPlayed;
@override@JsonKey() final  int wins;
@override@JsonKey() final  int losses;
@override@JsonKey(name: 'win_rate') final  num? winRate;
@override@JsonKey(name: 'walkover_wins') final  int walkoverWins;
@override@JsonKey(name: 'walkover_losses') final  int walkoverLosses;
@override@JsonKey(name: 'sets_won') final  int setsWon;
@override@JsonKey(name: 'sets_lost') final  int setsLost;
@override@JsonKey(name: 'games_won') final  int gamesWon;
@override@JsonKey(name: 'games_lost') final  int gamesLost;
 final  Map<String, dynamic>? _currentStreak;
@override@JsonKey(name: 'current_streak') Map<String, dynamic>? get currentStreak {
  final value = _currentStreak;
  if (value == null) return null;
  if (_currentStreak is EqualUnmodifiableMapView) return _currentStreak;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey(name: 'best_win_streak') final  int bestWinStreak;
@override@JsonKey(name: 'tournaments_played') final  int tournamentsPlayed;
@override@JsonKey() final  int titles;
@override@JsonKey(name: 'finals_reached') final  int finalsReached;
@override@JsonKey(name: 'last_played_at') final  DateTime? lastPlayedAt;

/// Create a copy of PlayerStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerStatsModelCopyWith<_PlayerStatsModel> get copyWith => __$PlayerStatsModelCopyWithImpl<_PlayerStatsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlayerStatsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayerStatsModel&&(identical(other.matchesPlayed, matchesPlayed) || other.matchesPlayed == matchesPlayed)&&(identical(other.wins, wins) || other.wins == wins)&&(identical(other.losses, losses) || other.losses == losses)&&(identical(other.winRate, winRate) || other.winRate == winRate)&&(identical(other.walkoverWins, walkoverWins) || other.walkoverWins == walkoverWins)&&(identical(other.walkoverLosses, walkoverLosses) || other.walkoverLosses == walkoverLosses)&&(identical(other.setsWon, setsWon) || other.setsWon == setsWon)&&(identical(other.setsLost, setsLost) || other.setsLost == setsLost)&&(identical(other.gamesWon, gamesWon) || other.gamesWon == gamesWon)&&(identical(other.gamesLost, gamesLost) || other.gamesLost == gamesLost)&&const DeepCollectionEquality().equals(other._currentStreak, _currentStreak)&&(identical(other.bestWinStreak, bestWinStreak) || other.bestWinStreak == bestWinStreak)&&(identical(other.tournamentsPlayed, tournamentsPlayed) || other.tournamentsPlayed == tournamentsPlayed)&&(identical(other.titles, titles) || other.titles == titles)&&(identical(other.finalsReached, finalsReached) || other.finalsReached == finalsReached)&&(identical(other.lastPlayedAt, lastPlayedAt) || other.lastPlayedAt == lastPlayedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,matchesPlayed,wins,losses,winRate,walkoverWins,walkoverLosses,setsWon,setsLost,gamesWon,gamesLost,const DeepCollectionEquality().hash(_currentStreak),bestWinStreak,tournamentsPlayed,titles,finalsReached,lastPlayedAt);

@override
String toString() {
  return 'PlayerStatsModel(matchesPlayed: $matchesPlayed, wins: $wins, losses: $losses, winRate: $winRate, walkoverWins: $walkoverWins, walkoverLosses: $walkoverLosses, setsWon: $setsWon, setsLost: $setsLost, gamesWon: $gamesWon, gamesLost: $gamesLost, currentStreak: $currentStreak, bestWinStreak: $bestWinStreak, tournamentsPlayed: $tournamentsPlayed, titles: $titles, finalsReached: $finalsReached, lastPlayedAt: $lastPlayedAt)';
}


}

/// @nodoc
abstract mixin class _$PlayerStatsModelCopyWith<$Res> implements $PlayerStatsModelCopyWith<$Res> {
  factory _$PlayerStatsModelCopyWith(_PlayerStatsModel value, $Res Function(_PlayerStatsModel) _then) = __$PlayerStatsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'matches_played') int matchesPlayed, int wins, int losses,@JsonKey(name: 'win_rate') num? winRate,@JsonKey(name: 'walkover_wins') int walkoverWins,@JsonKey(name: 'walkover_losses') int walkoverLosses,@JsonKey(name: 'sets_won') int setsWon,@JsonKey(name: 'sets_lost') int setsLost,@JsonKey(name: 'games_won') int gamesWon,@JsonKey(name: 'games_lost') int gamesLost,@JsonKey(name: 'current_streak') Map<String, dynamic>? currentStreak,@JsonKey(name: 'best_win_streak') int bestWinStreak,@JsonKey(name: 'tournaments_played') int tournamentsPlayed, int titles,@JsonKey(name: 'finals_reached') int finalsReached,@JsonKey(name: 'last_played_at') DateTime? lastPlayedAt
});




}
/// @nodoc
class __$PlayerStatsModelCopyWithImpl<$Res>
    implements _$PlayerStatsModelCopyWith<$Res> {
  __$PlayerStatsModelCopyWithImpl(this._self, this._then);

  final _PlayerStatsModel _self;
  final $Res Function(_PlayerStatsModel) _then;

/// Create a copy of PlayerStatsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? matchesPlayed = null,Object? wins = null,Object? losses = null,Object? winRate = freezed,Object? walkoverWins = null,Object? walkoverLosses = null,Object? setsWon = null,Object? setsLost = null,Object? gamesWon = null,Object? gamesLost = null,Object? currentStreak = freezed,Object? bestWinStreak = null,Object? tournamentsPlayed = null,Object? titles = null,Object? finalsReached = null,Object? lastPlayedAt = freezed,}) {
  return _then(_PlayerStatsModel(
matchesPlayed: null == matchesPlayed ? _self.matchesPlayed : matchesPlayed // ignore: cast_nullable_to_non_nullable
as int,wins: null == wins ? _self.wins : wins // ignore: cast_nullable_to_non_nullable
as int,losses: null == losses ? _self.losses : losses // ignore: cast_nullable_to_non_nullable
as int,winRate: freezed == winRate ? _self.winRate : winRate // ignore: cast_nullable_to_non_nullable
as num?,walkoverWins: null == walkoverWins ? _self.walkoverWins : walkoverWins // ignore: cast_nullable_to_non_nullable
as int,walkoverLosses: null == walkoverLosses ? _self.walkoverLosses : walkoverLosses // ignore: cast_nullable_to_non_nullable
as int,setsWon: null == setsWon ? _self.setsWon : setsWon // ignore: cast_nullable_to_non_nullable
as int,setsLost: null == setsLost ? _self.setsLost : setsLost // ignore: cast_nullable_to_non_nullable
as int,gamesWon: null == gamesWon ? _self.gamesWon : gamesWon // ignore: cast_nullable_to_non_nullable
as int,gamesLost: null == gamesLost ? _self.gamesLost : gamesLost // ignore: cast_nullable_to_non_nullable
as int,currentStreak: freezed == currentStreak ? _self._currentStreak : currentStreak // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,bestWinStreak: null == bestWinStreak ? _self.bestWinStreak : bestWinStreak // ignore: cast_nullable_to_non_nullable
as int,tournamentsPlayed: null == tournamentsPlayed ? _self.tournamentsPlayed : tournamentsPlayed // ignore: cast_nullable_to_non_nullable
as int,titles: null == titles ? _self.titles : titles // ignore: cast_nullable_to_non_nullable
as int,finalsReached: null == finalsReached ? _self.finalsReached : finalsReached // ignore: cast_nullable_to_non_nullable
as int,lastPlayedAt: freezed == lastPlayedAt ? _self.lastPlayedAt : lastPlayedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
