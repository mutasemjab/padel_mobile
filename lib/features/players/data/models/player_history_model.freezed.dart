// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ResultRowModel {

@JsonKey(name: 'official_result_id') int get officialResultId;@JsonKey(name: 'match_id') int get matchId;@JsonKey(name: 'tournament_id') int get tournamentId;@JsonKey(name: 'tournament_name') String get tournamentName;@JsonKey(name: 'tournament_ranked') bool get tournamentRanked;@JsonKey(name: 'category_name') String? get categoryName; String? get round;@JsonKey(name: 'result_type') String get resultType; bool get won; String? get score;@JsonKey(name: 'sets_won') int get setsWon;@JsonKey(name: 'sets_lost') int get setsLost;@JsonKey(name: 'rating_delta') int? get ratingDelta; DateTime? get date; PlayerSummaryModel? get partner;
/// Create a copy of ResultRowModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ResultRowModelCopyWith<ResultRowModel> get copyWith => _$ResultRowModelCopyWithImpl<ResultRowModel>(this as ResultRowModel, _$identity);

  /// Serializes this ResultRowModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ResultRowModel&&(identical(other.officialResultId, officialResultId) || other.officialResultId == officialResultId)&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.tournamentId, tournamentId) || other.tournamentId == tournamentId)&&(identical(other.tournamentName, tournamentName) || other.tournamentName == tournamentName)&&(identical(other.tournamentRanked, tournamentRanked) || other.tournamentRanked == tournamentRanked)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.round, round) || other.round == round)&&(identical(other.resultType, resultType) || other.resultType == resultType)&&(identical(other.won, won) || other.won == won)&&(identical(other.score, score) || other.score == score)&&(identical(other.setsWon, setsWon) || other.setsWon == setsWon)&&(identical(other.setsLost, setsLost) || other.setsLost == setsLost)&&(identical(other.ratingDelta, ratingDelta) || other.ratingDelta == ratingDelta)&&(identical(other.date, date) || other.date == date)&&(identical(other.partner, partner) || other.partner == partner));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,officialResultId,matchId,tournamentId,tournamentName,tournamentRanked,categoryName,round,resultType,won,score,setsWon,setsLost,ratingDelta,date,partner);

@override
String toString() {
  return 'ResultRowModel(officialResultId: $officialResultId, matchId: $matchId, tournamentId: $tournamentId, tournamentName: $tournamentName, tournamentRanked: $tournamentRanked, categoryName: $categoryName, round: $round, resultType: $resultType, won: $won, score: $score, setsWon: $setsWon, setsLost: $setsLost, ratingDelta: $ratingDelta, date: $date, partner: $partner)';
}


}

/// @nodoc
abstract mixin class $ResultRowModelCopyWith<$Res>  {
  factory $ResultRowModelCopyWith(ResultRowModel value, $Res Function(ResultRowModel) _then) = _$ResultRowModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'official_result_id') int officialResultId,@JsonKey(name: 'match_id') int matchId,@JsonKey(name: 'tournament_id') int tournamentId,@JsonKey(name: 'tournament_name') String tournamentName,@JsonKey(name: 'tournament_ranked') bool tournamentRanked,@JsonKey(name: 'category_name') String? categoryName, String? round,@JsonKey(name: 'result_type') String resultType, bool won, String? score,@JsonKey(name: 'sets_won') int setsWon,@JsonKey(name: 'sets_lost') int setsLost,@JsonKey(name: 'rating_delta') int? ratingDelta, DateTime? date, PlayerSummaryModel? partner
});


$PlayerSummaryModelCopyWith<$Res>? get partner;

}
/// @nodoc
class _$ResultRowModelCopyWithImpl<$Res>
    implements $ResultRowModelCopyWith<$Res> {
  _$ResultRowModelCopyWithImpl(this._self, this._then);

  final ResultRowModel _self;
  final $Res Function(ResultRowModel) _then;

/// Create a copy of ResultRowModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? officialResultId = null,Object? matchId = null,Object? tournamentId = null,Object? tournamentName = null,Object? tournamentRanked = null,Object? categoryName = freezed,Object? round = freezed,Object? resultType = null,Object? won = null,Object? score = freezed,Object? setsWon = null,Object? setsLost = null,Object? ratingDelta = freezed,Object? date = freezed,Object? partner = freezed,}) {
  return _then(_self.copyWith(
officialResultId: null == officialResultId ? _self.officialResultId : officialResultId // ignore: cast_nullable_to_non_nullable
as int,matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as int,tournamentId: null == tournamentId ? _self.tournamentId : tournamentId // ignore: cast_nullable_to_non_nullable
as int,tournamentName: null == tournamentName ? _self.tournamentName : tournamentName // ignore: cast_nullable_to_non_nullable
as String,tournamentRanked: null == tournamentRanked ? _self.tournamentRanked : tournamentRanked // ignore: cast_nullable_to_non_nullable
as bool,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,round: freezed == round ? _self.round : round // ignore: cast_nullable_to_non_nullable
as String?,resultType: null == resultType ? _self.resultType : resultType // ignore: cast_nullable_to_non_nullable
as String,won: null == won ? _self.won : won // ignore: cast_nullable_to_non_nullable
as bool,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as String?,setsWon: null == setsWon ? _self.setsWon : setsWon // ignore: cast_nullable_to_non_nullable
as int,setsLost: null == setsLost ? _self.setsLost : setsLost // ignore: cast_nullable_to_non_nullable
as int,ratingDelta: freezed == ratingDelta ? _self.ratingDelta : ratingDelta // ignore: cast_nullable_to_non_nullable
as int?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,partner: freezed == partner ? _self.partner : partner // ignore: cast_nullable_to_non_nullable
as PlayerSummaryModel?,
  ));
}
/// Create a copy of ResultRowModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerSummaryModelCopyWith<$Res>? get partner {
    if (_self.partner == null) {
    return null;
  }

  return $PlayerSummaryModelCopyWith<$Res>(_self.partner!, (value) {
    return _then(_self.copyWith(partner: value));
  });
}
}


/// Adds pattern-matching-related methods to [ResultRowModel].
extension ResultRowModelPatterns on ResultRowModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ResultRowModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ResultRowModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ResultRowModel value)  $default,){
final _that = this;
switch (_that) {
case _ResultRowModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ResultRowModel value)?  $default,){
final _that = this;
switch (_that) {
case _ResultRowModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'official_result_id')  int officialResultId, @JsonKey(name: 'match_id')  int matchId, @JsonKey(name: 'tournament_id')  int tournamentId, @JsonKey(name: 'tournament_name')  String tournamentName, @JsonKey(name: 'tournament_ranked')  bool tournamentRanked, @JsonKey(name: 'category_name')  String? categoryName,  String? round, @JsonKey(name: 'result_type')  String resultType,  bool won,  String? score, @JsonKey(name: 'sets_won')  int setsWon, @JsonKey(name: 'sets_lost')  int setsLost, @JsonKey(name: 'rating_delta')  int? ratingDelta,  DateTime? date,  PlayerSummaryModel? partner)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ResultRowModel() when $default != null:
return $default(_that.officialResultId,_that.matchId,_that.tournamentId,_that.tournamentName,_that.tournamentRanked,_that.categoryName,_that.round,_that.resultType,_that.won,_that.score,_that.setsWon,_that.setsLost,_that.ratingDelta,_that.date,_that.partner);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'official_result_id')  int officialResultId, @JsonKey(name: 'match_id')  int matchId, @JsonKey(name: 'tournament_id')  int tournamentId, @JsonKey(name: 'tournament_name')  String tournamentName, @JsonKey(name: 'tournament_ranked')  bool tournamentRanked, @JsonKey(name: 'category_name')  String? categoryName,  String? round, @JsonKey(name: 'result_type')  String resultType,  bool won,  String? score, @JsonKey(name: 'sets_won')  int setsWon, @JsonKey(name: 'sets_lost')  int setsLost, @JsonKey(name: 'rating_delta')  int? ratingDelta,  DateTime? date,  PlayerSummaryModel? partner)  $default,) {final _that = this;
switch (_that) {
case _ResultRowModel():
return $default(_that.officialResultId,_that.matchId,_that.tournamentId,_that.tournamentName,_that.tournamentRanked,_that.categoryName,_that.round,_that.resultType,_that.won,_that.score,_that.setsWon,_that.setsLost,_that.ratingDelta,_that.date,_that.partner);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'official_result_id')  int officialResultId, @JsonKey(name: 'match_id')  int matchId, @JsonKey(name: 'tournament_id')  int tournamentId, @JsonKey(name: 'tournament_name')  String tournamentName, @JsonKey(name: 'tournament_ranked')  bool tournamentRanked, @JsonKey(name: 'category_name')  String? categoryName,  String? round, @JsonKey(name: 'result_type')  String resultType,  bool won,  String? score, @JsonKey(name: 'sets_won')  int setsWon, @JsonKey(name: 'sets_lost')  int setsLost, @JsonKey(name: 'rating_delta')  int? ratingDelta,  DateTime? date,  PlayerSummaryModel? partner)?  $default,) {final _that = this;
switch (_that) {
case _ResultRowModel() when $default != null:
return $default(_that.officialResultId,_that.matchId,_that.tournamentId,_that.tournamentName,_that.tournamentRanked,_that.categoryName,_that.round,_that.resultType,_that.won,_that.score,_that.setsWon,_that.setsLost,_that.ratingDelta,_that.date,_that.partner);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ResultRowModel implements ResultRowModel {
  const _ResultRowModel({@JsonKey(name: 'official_result_id') this.officialResultId = 0, @JsonKey(name: 'match_id') this.matchId = 0, @JsonKey(name: 'tournament_id') this.tournamentId = 0, @JsonKey(name: 'tournament_name') this.tournamentName = '', @JsonKey(name: 'tournament_ranked') this.tournamentRanked = false, @JsonKey(name: 'category_name') this.categoryName, this.round, @JsonKey(name: 'result_type') this.resultType = 'played', this.won = false, this.score, @JsonKey(name: 'sets_won') this.setsWon = 0, @JsonKey(name: 'sets_lost') this.setsLost = 0, @JsonKey(name: 'rating_delta') this.ratingDelta, this.date, this.partner});
  factory _ResultRowModel.fromJson(Map<String, dynamic> json) => _$ResultRowModelFromJson(json);

@override@JsonKey(name: 'official_result_id') final  int officialResultId;
@override@JsonKey(name: 'match_id') final  int matchId;
@override@JsonKey(name: 'tournament_id') final  int tournamentId;
@override@JsonKey(name: 'tournament_name') final  String tournamentName;
@override@JsonKey(name: 'tournament_ranked') final  bool tournamentRanked;
@override@JsonKey(name: 'category_name') final  String? categoryName;
@override final  String? round;
@override@JsonKey(name: 'result_type') final  String resultType;
@override@JsonKey() final  bool won;
@override final  String? score;
@override@JsonKey(name: 'sets_won') final  int setsWon;
@override@JsonKey(name: 'sets_lost') final  int setsLost;
@override@JsonKey(name: 'rating_delta') final  int? ratingDelta;
@override final  DateTime? date;
@override final  PlayerSummaryModel? partner;

/// Create a copy of ResultRowModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ResultRowModelCopyWith<_ResultRowModel> get copyWith => __$ResultRowModelCopyWithImpl<_ResultRowModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ResultRowModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ResultRowModel&&(identical(other.officialResultId, officialResultId) || other.officialResultId == officialResultId)&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.tournamentId, tournamentId) || other.tournamentId == tournamentId)&&(identical(other.tournamentName, tournamentName) || other.tournamentName == tournamentName)&&(identical(other.tournamentRanked, tournamentRanked) || other.tournamentRanked == tournamentRanked)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.round, round) || other.round == round)&&(identical(other.resultType, resultType) || other.resultType == resultType)&&(identical(other.won, won) || other.won == won)&&(identical(other.score, score) || other.score == score)&&(identical(other.setsWon, setsWon) || other.setsWon == setsWon)&&(identical(other.setsLost, setsLost) || other.setsLost == setsLost)&&(identical(other.ratingDelta, ratingDelta) || other.ratingDelta == ratingDelta)&&(identical(other.date, date) || other.date == date)&&(identical(other.partner, partner) || other.partner == partner));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,officialResultId,matchId,tournamentId,tournamentName,tournamentRanked,categoryName,round,resultType,won,score,setsWon,setsLost,ratingDelta,date,partner);

@override
String toString() {
  return 'ResultRowModel(officialResultId: $officialResultId, matchId: $matchId, tournamentId: $tournamentId, tournamentName: $tournamentName, tournamentRanked: $tournamentRanked, categoryName: $categoryName, round: $round, resultType: $resultType, won: $won, score: $score, setsWon: $setsWon, setsLost: $setsLost, ratingDelta: $ratingDelta, date: $date, partner: $partner)';
}


}

/// @nodoc
abstract mixin class _$ResultRowModelCopyWith<$Res> implements $ResultRowModelCopyWith<$Res> {
  factory _$ResultRowModelCopyWith(_ResultRowModel value, $Res Function(_ResultRowModel) _then) = __$ResultRowModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'official_result_id') int officialResultId,@JsonKey(name: 'match_id') int matchId,@JsonKey(name: 'tournament_id') int tournamentId,@JsonKey(name: 'tournament_name') String tournamentName,@JsonKey(name: 'tournament_ranked') bool tournamentRanked,@JsonKey(name: 'category_name') String? categoryName, String? round,@JsonKey(name: 'result_type') String resultType, bool won, String? score,@JsonKey(name: 'sets_won') int setsWon,@JsonKey(name: 'sets_lost') int setsLost,@JsonKey(name: 'rating_delta') int? ratingDelta, DateTime? date, PlayerSummaryModel? partner
});


@override $PlayerSummaryModelCopyWith<$Res>? get partner;

}
/// @nodoc
class __$ResultRowModelCopyWithImpl<$Res>
    implements _$ResultRowModelCopyWith<$Res> {
  __$ResultRowModelCopyWithImpl(this._self, this._then);

  final _ResultRowModel _self;
  final $Res Function(_ResultRowModel) _then;

/// Create a copy of ResultRowModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? officialResultId = null,Object? matchId = null,Object? tournamentId = null,Object? tournamentName = null,Object? tournamentRanked = null,Object? categoryName = freezed,Object? round = freezed,Object? resultType = null,Object? won = null,Object? score = freezed,Object? setsWon = null,Object? setsLost = null,Object? ratingDelta = freezed,Object? date = freezed,Object? partner = freezed,}) {
  return _then(_ResultRowModel(
officialResultId: null == officialResultId ? _self.officialResultId : officialResultId // ignore: cast_nullable_to_non_nullable
as int,matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as int,tournamentId: null == tournamentId ? _self.tournamentId : tournamentId // ignore: cast_nullable_to_non_nullable
as int,tournamentName: null == tournamentName ? _self.tournamentName : tournamentName // ignore: cast_nullable_to_non_nullable
as String,tournamentRanked: null == tournamentRanked ? _self.tournamentRanked : tournamentRanked // ignore: cast_nullable_to_non_nullable
as bool,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,round: freezed == round ? _self.round : round // ignore: cast_nullable_to_non_nullable
as String?,resultType: null == resultType ? _self.resultType : resultType // ignore: cast_nullable_to_non_nullable
as String,won: null == won ? _self.won : won // ignore: cast_nullable_to_non_nullable
as bool,score: freezed == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as String?,setsWon: null == setsWon ? _self.setsWon : setsWon // ignore: cast_nullable_to_non_nullable
as int,setsLost: null == setsLost ? _self.setsLost : setsLost // ignore: cast_nullable_to_non_nullable
as int,ratingDelta: freezed == ratingDelta ? _self.ratingDelta : ratingDelta // ignore: cast_nullable_to_non_nullable
as int?,date: freezed == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime?,partner: freezed == partner ? _self.partner : partner // ignore: cast_nullable_to_non_nullable
as PlayerSummaryModel?,
  ));
}

/// Create a copy of ResultRowModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerSummaryModelCopyWith<$Res>? get partner {
    if (_self.partner == null) {
    return null;
  }

  return $PlayerSummaryModelCopyWith<$Res>(_self.partner!, (value) {
    return _then(_self.copyWith(partner: value));
  });
}
}


/// @nodoc
mixin _$TournamentHistoryModel {

@JsonKey(name: 'tournament_id') int get tournamentId;@JsonKey(name: 'tournament_name') String get tournamentName;@JsonKey(name: 'category_id') int? get categoryId;@JsonKey(name: 'category_name') String? get categoryName; bool get ranked;@JsonKey(name: 'best_round') String? get bestRound; String? get placement; int get matches; int get wins;@JsonKey(name: 'last_played_at') DateTime? get lastPlayedAt;
/// Create a copy of TournamentHistoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TournamentHistoryModelCopyWith<TournamentHistoryModel> get copyWith => _$TournamentHistoryModelCopyWithImpl<TournamentHistoryModel>(this as TournamentHistoryModel, _$identity);

  /// Serializes this TournamentHistoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TournamentHistoryModel&&(identical(other.tournamentId, tournamentId) || other.tournamentId == tournamentId)&&(identical(other.tournamentName, tournamentName) || other.tournamentName == tournamentName)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.ranked, ranked) || other.ranked == ranked)&&(identical(other.bestRound, bestRound) || other.bestRound == bestRound)&&(identical(other.placement, placement) || other.placement == placement)&&(identical(other.matches, matches) || other.matches == matches)&&(identical(other.wins, wins) || other.wins == wins)&&(identical(other.lastPlayedAt, lastPlayedAt) || other.lastPlayedAt == lastPlayedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tournamentId,tournamentName,categoryId,categoryName,ranked,bestRound,placement,matches,wins,lastPlayedAt);

@override
String toString() {
  return 'TournamentHistoryModel(tournamentId: $tournamentId, tournamentName: $tournamentName, categoryId: $categoryId, categoryName: $categoryName, ranked: $ranked, bestRound: $bestRound, placement: $placement, matches: $matches, wins: $wins, lastPlayedAt: $lastPlayedAt)';
}


}

/// @nodoc
abstract mixin class $TournamentHistoryModelCopyWith<$Res>  {
  factory $TournamentHistoryModelCopyWith(TournamentHistoryModel value, $Res Function(TournamentHistoryModel) _then) = _$TournamentHistoryModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'tournament_id') int tournamentId,@JsonKey(name: 'tournament_name') String tournamentName,@JsonKey(name: 'category_id') int? categoryId,@JsonKey(name: 'category_name') String? categoryName, bool ranked,@JsonKey(name: 'best_round') String? bestRound, String? placement, int matches, int wins,@JsonKey(name: 'last_played_at') DateTime? lastPlayedAt
});




}
/// @nodoc
class _$TournamentHistoryModelCopyWithImpl<$Res>
    implements $TournamentHistoryModelCopyWith<$Res> {
  _$TournamentHistoryModelCopyWithImpl(this._self, this._then);

  final TournamentHistoryModel _self;
  final $Res Function(TournamentHistoryModel) _then;

/// Create a copy of TournamentHistoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tournamentId = null,Object? tournamentName = null,Object? categoryId = freezed,Object? categoryName = freezed,Object? ranked = null,Object? bestRound = freezed,Object? placement = freezed,Object? matches = null,Object? wins = null,Object? lastPlayedAt = freezed,}) {
  return _then(_self.copyWith(
tournamentId: null == tournamentId ? _self.tournamentId : tournamentId // ignore: cast_nullable_to_non_nullable
as int,tournamentName: null == tournamentName ? _self.tournamentName : tournamentName // ignore: cast_nullable_to_non_nullable
as String,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,ranked: null == ranked ? _self.ranked : ranked // ignore: cast_nullable_to_non_nullable
as bool,bestRound: freezed == bestRound ? _self.bestRound : bestRound // ignore: cast_nullable_to_non_nullable
as String?,placement: freezed == placement ? _self.placement : placement // ignore: cast_nullable_to_non_nullable
as String?,matches: null == matches ? _self.matches : matches // ignore: cast_nullable_to_non_nullable
as int,wins: null == wins ? _self.wins : wins // ignore: cast_nullable_to_non_nullable
as int,lastPlayedAt: freezed == lastPlayedAt ? _self.lastPlayedAt : lastPlayedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TournamentHistoryModel].
extension TournamentHistoryModelPatterns on TournamentHistoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TournamentHistoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TournamentHistoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TournamentHistoryModel value)  $default,){
final _that = this;
switch (_that) {
case _TournamentHistoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TournamentHistoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _TournamentHistoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'tournament_id')  int tournamentId, @JsonKey(name: 'tournament_name')  String tournamentName, @JsonKey(name: 'category_id')  int? categoryId, @JsonKey(name: 'category_name')  String? categoryName,  bool ranked, @JsonKey(name: 'best_round')  String? bestRound,  String? placement,  int matches,  int wins, @JsonKey(name: 'last_played_at')  DateTime? lastPlayedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TournamentHistoryModel() when $default != null:
return $default(_that.tournamentId,_that.tournamentName,_that.categoryId,_that.categoryName,_that.ranked,_that.bestRound,_that.placement,_that.matches,_that.wins,_that.lastPlayedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'tournament_id')  int tournamentId, @JsonKey(name: 'tournament_name')  String tournamentName, @JsonKey(name: 'category_id')  int? categoryId, @JsonKey(name: 'category_name')  String? categoryName,  bool ranked, @JsonKey(name: 'best_round')  String? bestRound,  String? placement,  int matches,  int wins, @JsonKey(name: 'last_played_at')  DateTime? lastPlayedAt)  $default,) {final _that = this;
switch (_that) {
case _TournamentHistoryModel():
return $default(_that.tournamentId,_that.tournamentName,_that.categoryId,_that.categoryName,_that.ranked,_that.bestRound,_that.placement,_that.matches,_that.wins,_that.lastPlayedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'tournament_id')  int tournamentId, @JsonKey(name: 'tournament_name')  String tournamentName, @JsonKey(name: 'category_id')  int? categoryId, @JsonKey(name: 'category_name')  String? categoryName,  bool ranked, @JsonKey(name: 'best_round')  String? bestRound,  String? placement,  int matches,  int wins, @JsonKey(name: 'last_played_at')  DateTime? lastPlayedAt)?  $default,) {final _that = this;
switch (_that) {
case _TournamentHistoryModel() when $default != null:
return $default(_that.tournamentId,_that.tournamentName,_that.categoryId,_that.categoryName,_that.ranked,_that.bestRound,_that.placement,_that.matches,_that.wins,_that.lastPlayedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TournamentHistoryModel implements TournamentHistoryModel {
  const _TournamentHistoryModel({@JsonKey(name: 'tournament_id') required this.tournamentId, @JsonKey(name: 'tournament_name') this.tournamentName = '', @JsonKey(name: 'category_id') this.categoryId, @JsonKey(name: 'category_name') this.categoryName, this.ranked = false, @JsonKey(name: 'best_round') this.bestRound, this.placement, this.matches = 0, this.wins = 0, @JsonKey(name: 'last_played_at') this.lastPlayedAt});
  factory _TournamentHistoryModel.fromJson(Map<String, dynamic> json) => _$TournamentHistoryModelFromJson(json);

@override@JsonKey(name: 'tournament_id') final  int tournamentId;
@override@JsonKey(name: 'tournament_name') final  String tournamentName;
@override@JsonKey(name: 'category_id') final  int? categoryId;
@override@JsonKey(name: 'category_name') final  String? categoryName;
@override@JsonKey() final  bool ranked;
@override@JsonKey(name: 'best_round') final  String? bestRound;
@override final  String? placement;
@override@JsonKey() final  int matches;
@override@JsonKey() final  int wins;
@override@JsonKey(name: 'last_played_at') final  DateTime? lastPlayedAt;

/// Create a copy of TournamentHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TournamentHistoryModelCopyWith<_TournamentHistoryModel> get copyWith => __$TournamentHistoryModelCopyWithImpl<_TournamentHistoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TournamentHistoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TournamentHistoryModel&&(identical(other.tournamentId, tournamentId) || other.tournamentId == tournamentId)&&(identical(other.tournamentName, tournamentName) || other.tournamentName == tournamentName)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.categoryName, categoryName) || other.categoryName == categoryName)&&(identical(other.ranked, ranked) || other.ranked == ranked)&&(identical(other.bestRound, bestRound) || other.bestRound == bestRound)&&(identical(other.placement, placement) || other.placement == placement)&&(identical(other.matches, matches) || other.matches == matches)&&(identical(other.wins, wins) || other.wins == wins)&&(identical(other.lastPlayedAt, lastPlayedAt) || other.lastPlayedAt == lastPlayedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tournamentId,tournamentName,categoryId,categoryName,ranked,bestRound,placement,matches,wins,lastPlayedAt);

@override
String toString() {
  return 'TournamentHistoryModel(tournamentId: $tournamentId, tournamentName: $tournamentName, categoryId: $categoryId, categoryName: $categoryName, ranked: $ranked, bestRound: $bestRound, placement: $placement, matches: $matches, wins: $wins, lastPlayedAt: $lastPlayedAt)';
}


}

/// @nodoc
abstract mixin class _$TournamentHistoryModelCopyWith<$Res> implements $TournamentHistoryModelCopyWith<$Res> {
  factory _$TournamentHistoryModelCopyWith(_TournamentHistoryModel value, $Res Function(_TournamentHistoryModel) _then) = __$TournamentHistoryModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'tournament_id') int tournamentId,@JsonKey(name: 'tournament_name') String tournamentName,@JsonKey(name: 'category_id') int? categoryId,@JsonKey(name: 'category_name') String? categoryName, bool ranked,@JsonKey(name: 'best_round') String? bestRound, String? placement, int matches, int wins,@JsonKey(name: 'last_played_at') DateTime? lastPlayedAt
});




}
/// @nodoc
class __$TournamentHistoryModelCopyWithImpl<$Res>
    implements _$TournamentHistoryModelCopyWith<$Res> {
  __$TournamentHistoryModelCopyWithImpl(this._self, this._then);

  final _TournamentHistoryModel _self;
  final $Res Function(_TournamentHistoryModel) _then;

/// Create a copy of TournamentHistoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tournamentId = null,Object? tournamentName = null,Object? categoryId = freezed,Object? categoryName = freezed,Object? ranked = null,Object? bestRound = freezed,Object? placement = freezed,Object? matches = null,Object? wins = null,Object? lastPlayedAt = freezed,}) {
  return _then(_TournamentHistoryModel(
tournamentId: null == tournamentId ? _self.tournamentId : tournamentId // ignore: cast_nullable_to_non_nullable
as int,tournamentName: null == tournamentName ? _self.tournamentName : tournamentName // ignore: cast_nullable_to_non_nullable
as String,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,categoryName: freezed == categoryName ? _self.categoryName : categoryName // ignore: cast_nullable_to_non_nullable
as String?,ranked: null == ranked ? _self.ranked : ranked // ignore: cast_nullable_to_non_nullable
as bool,bestRound: freezed == bestRound ? _self.bestRound : bestRound // ignore: cast_nullable_to_non_nullable
as String?,placement: freezed == placement ? _self.placement : placement // ignore: cast_nullable_to_non_nullable
as String?,matches: null == matches ? _self.matches : matches // ignore: cast_nullable_to_non_nullable
as int,wins: null == wins ? _self.wins : wins // ignore: cast_nullable_to_non_nullable
as int,lastPlayedAt: freezed == lastPlayedAt ? _self.lastPlayedAt : lastPlayedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$ChallengeModel {

 int get id; String get status; String? get message; PlayerSummaryModel get challenger; PlayerSummaryModel get challenged;@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of ChallengeModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChallengeModelCopyWith<ChallengeModel> get copyWith => _$ChallengeModelCopyWithImpl<ChallengeModel>(this as ChallengeModel, _$identity);

  /// Serializes this ChallengeModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ChallengeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.challenger, challenger) || other.challenger == challenger)&&(identical(other.challenged, challenged) || other.challenged == challenged)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,message,challenger,challenged,createdAt);

@override
String toString() {
  return 'ChallengeModel(id: $id, status: $status, message: $message, challenger: $challenger, challenged: $challenged, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $ChallengeModelCopyWith<$Res>  {
  factory $ChallengeModelCopyWith(ChallengeModel value, $Res Function(ChallengeModel) _then) = _$ChallengeModelCopyWithImpl;
@useResult
$Res call({
 int id, String status, String? message, PlayerSummaryModel challenger, PlayerSummaryModel challenged,@JsonKey(name: 'created_at') DateTime? createdAt
});


$PlayerSummaryModelCopyWith<$Res> get challenger;$PlayerSummaryModelCopyWith<$Res> get challenged;

}
/// @nodoc
class _$ChallengeModelCopyWithImpl<$Res>
    implements $ChallengeModelCopyWith<$Res> {
  _$ChallengeModelCopyWithImpl(this._self, this._then);

  final ChallengeModel _self;
  final $Res Function(ChallengeModel) _then;

/// Create a copy of ChallengeModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? message = freezed,Object? challenger = null,Object? challenged = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,challenger: null == challenger ? _self.challenger : challenger // ignore: cast_nullable_to_non_nullable
as PlayerSummaryModel,challenged: null == challenged ? _self.challenged : challenged // ignore: cast_nullable_to_non_nullable
as PlayerSummaryModel,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of ChallengeModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerSummaryModelCopyWith<$Res> get challenger {
  
  return $PlayerSummaryModelCopyWith<$Res>(_self.challenger, (value) {
    return _then(_self.copyWith(challenger: value));
  });
}/// Create a copy of ChallengeModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerSummaryModelCopyWith<$Res> get challenged {
  
  return $PlayerSummaryModelCopyWith<$Res>(_self.challenged, (value) {
    return _then(_self.copyWith(challenged: value));
  });
}
}


/// Adds pattern-matching-related methods to [ChallengeModel].
extension ChallengeModelPatterns on ChallengeModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ChallengeModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ChallengeModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ChallengeModel value)  $default,){
final _that = this;
switch (_that) {
case _ChallengeModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ChallengeModel value)?  $default,){
final _that = this;
switch (_that) {
case _ChallengeModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String status,  String? message,  PlayerSummaryModel challenger,  PlayerSummaryModel challenged, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ChallengeModel() when $default != null:
return $default(_that.id,_that.status,_that.message,_that.challenger,_that.challenged,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String status,  String? message,  PlayerSummaryModel challenger,  PlayerSummaryModel challenged, @JsonKey(name: 'created_at')  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _ChallengeModel():
return $default(_that.id,_that.status,_that.message,_that.challenger,_that.challenged,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String status,  String? message,  PlayerSummaryModel challenger,  PlayerSummaryModel challenged, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _ChallengeModel() when $default != null:
return $default(_that.id,_that.status,_that.message,_that.challenger,_that.challenged,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ChallengeModel implements ChallengeModel {
  const _ChallengeModel({required this.id, this.status = 'pending', this.message, required this.challenger, required this.challenged, @JsonKey(name: 'created_at') this.createdAt});
  factory _ChallengeModel.fromJson(Map<String, dynamic> json) => _$ChallengeModelFromJson(json);

@override final  int id;
@override@JsonKey() final  String status;
@override final  String? message;
@override final  PlayerSummaryModel challenger;
@override final  PlayerSummaryModel challenged;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of ChallengeModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChallengeModelCopyWith<_ChallengeModel> get copyWith => __$ChallengeModelCopyWithImpl<_ChallengeModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChallengeModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ChallengeModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.challenger, challenger) || other.challenger == challenger)&&(identical(other.challenged, challenged) || other.challenged == challenged)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,message,challenger,challenged,createdAt);

@override
String toString() {
  return 'ChallengeModel(id: $id, status: $status, message: $message, challenger: $challenger, challenged: $challenged, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$ChallengeModelCopyWith<$Res> implements $ChallengeModelCopyWith<$Res> {
  factory _$ChallengeModelCopyWith(_ChallengeModel value, $Res Function(_ChallengeModel) _then) = __$ChallengeModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String status, String? message, PlayerSummaryModel challenger, PlayerSummaryModel challenged,@JsonKey(name: 'created_at') DateTime? createdAt
});


@override $PlayerSummaryModelCopyWith<$Res> get challenger;@override $PlayerSummaryModelCopyWith<$Res> get challenged;

}
/// @nodoc
class __$ChallengeModelCopyWithImpl<$Res>
    implements _$ChallengeModelCopyWith<$Res> {
  __$ChallengeModelCopyWithImpl(this._self, this._then);

  final _ChallengeModel _self;
  final $Res Function(_ChallengeModel) _then;

/// Create a copy of ChallengeModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? message = freezed,Object? challenger = null,Object? challenged = null,Object? createdAt = freezed,}) {
  return _then(_ChallengeModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,challenger: null == challenger ? _self.challenger : challenger // ignore: cast_nullable_to_non_nullable
as PlayerSummaryModel,challenged: null == challenged ? _self.challenged : challenged // ignore: cast_nullable_to_non_nullable
as PlayerSummaryModel,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of ChallengeModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerSummaryModelCopyWith<$Res> get challenger {
  
  return $PlayerSummaryModelCopyWith<$Res>(_self.challenger, (value) {
    return _then(_self.copyWith(challenger: value));
  });
}/// Create a copy of ChallengeModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerSummaryModelCopyWith<$Res> get challenged {
  
  return $PlayerSummaryModelCopyWith<$Res>(_self.challenged, (value) {
    return _then(_self.copyWith(challenged: value));
  });
}
}

// dart format on
