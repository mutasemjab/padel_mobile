// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'live_payload_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PointEventModel {

 int get id; int get sequence;@JsonKey(name: 'winning_team_id') int? get winningTeamId;@JsonKey(name: 'ending_type') String? get endingType;@JsonKey(name: 'primary_player_id') String? get primaryPlayerId;@JsonKey(name: 'shot_type') String? get shotType;@JsonKey(name: 'error_type') String? get errorType;@JsonKey(name: 'serve_outcome') String? get serveOutcome; String? get coverage;@JsonKey(name: 'score_before') Map<String, dynamic>? get scoreBefore;@JsonKey(name: 'score_after') Map<String, dynamic>? get scoreAfter;@JsonKey(name: 'is_voided') bool get isVoided;@JsonKey(name: 'corrected_from_id') int? get correctedFromId;@JsonKey(name: 'recorded_at') DateTime? get recordedAt;
/// Create a copy of PointEventModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PointEventModelCopyWith<PointEventModel> get copyWith => _$PointEventModelCopyWithImpl<PointEventModel>(this as PointEventModel, _$identity);

  /// Serializes this PointEventModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PointEventModel&&(identical(other.id, id) || other.id == id)&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.winningTeamId, winningTeamId) || other.winningTeamId == winningTeamId)&&(identical(other.endingType, endingType) || other.endingType == endingType)&&(identical(other.primaryPlayerId, primaryPlayerId) || other.primaryPlayerId == primaryPlayerId)&&(identical(other.shotType, shotType) || other.shotType == shotType)&&(identical(other.errorType, errorType) || other.errorType == errorType)&&(identical(other.serveOutcome, serveOutcome) || other.serveOutcome == serveOutcome)&&(identical(other.coverage, coverage) || other.coverage == coverage)&&const DeepCollectionEquality().equals(other.scoreBefore, scoreBefore)&&const DeepCollectionEquality().equals(other.scoreAfter, scoreAfter)&&(identical(other.isVoided, isVoided) || other.isVoided == isVoided)&&(identical(other.correctedFromId, correctedFromId) || other.correctedFromId == correctedFromId)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sequence,winningTeamId,endingType,primaryPlayerId,shotType,errorType,serveOutcome,coverage,const DeepCollectionEquality().hash(scoreBefore),const DeepCollectionEquality().hash(scoreAfter),isVoided,correctedFromId,recordedAt);

@override
String toString() {
  return 'PointEventModel(id: $id, sequence: $sequence, winningTeamId: $winningTeamId, endingType: $endingType, primaryPlayerId: $primaryPlayerId, shotType: $shotType, errorType: $errorType, serveOutcome: $serveOutcome, coverage: $coverage, scoreBefore: $scoreBefore, scoreAfter: $scoreAfter, isVoided: $isVoided, correctedFromId: $correctedFromId, recordedAt: $recordedAt)';
}


}

/// @nodoc
abstract mixin class $PointEventModelCopyWith<$Res>  {
  factory $PointEventModelCopyWith(PointEventModel value, $Res Function(PointEventModel) _then) = _$PointEventModelCopyWithImpl;
@useResult
$Res call({
 int id, int sequence,@JsonKey(name: 'winning_team_id') int? winningTeamId,@JsonKey(name: 'ending_type') String? endingType,@JsonKey(name: 'primary_player_id') String? primaryPlayerId,@JsonKey(name: 'shot_type') String? shotType,@JsonKey(name: 'error_type') String? errorType,@JsonKey(name: 'serve_outcome') String? serveOutcome, String? coverage,@JsonKey(name: 'score_before') Map<String, dynamic>? scoreBefore,@JsonKey(name: 'score_after') Map<String, dynamic>? scoreAfter,@JsonKey(name: 'is_voided') bool isVoided,@JsonKey(name: 'corrected_from_id') int? correctedFromId,@JsonKey(name: 'recorded_at') DateTime? recordedAt
});




}
/// @nodoc
class _$PointEventModelCopyWithImpl<$Res>
    implements $PointEventModelCopyWith<$Res> {
  _$PointEventModelCopyWithImpl(this._self, this._then);

  final PointEventModel _self;
  final $Res Function(PointEventModel) _then;

/// Create a copy of PointEventModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? sequence = null,Object? winningTeamId = freezed,Object? endingType = freezed,Object? primaryPlayerId = freezed,Object? shotType = freezed,Object? errorType = freezed,Object? serveOutcome = freezed,Object? coverage = freezed,Object? scoreBefore = freezed,Object? scoreAfter = freezed,Object? isVoided = null,Object? correctedFromId = freezed,Object? recordedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,sequence: null == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int,winningTeamId: freezed == winningTeamId ? _self.winningTeamId : winningTeamId // ignore: cast_nullable_to_non_nullable
as int?,endingType: freezed == endingType ? _self.endingType : endingType // ignore: cast_nullable_to_non_nullable
as String?,primaryPlayerId: freezed == primaryPlayerId ? _self.primaryPlayerId : primaryPlayerId // ignore: cast_nullable_to_non_nullable
as String?,shotType: freezed == shotType ? _self.shotType : shotType // ignore: cast_nullable_to_non_nullable
as String?,errorType: freezed == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as String?,serveOutcome: freezed == serveOutcome ? _self.serveOutcome : serveOutcome // ignore: cast_nullable_to_non_nullable
as String?,coverage: freezed == coverage ? _self.coverage : coverage // ignore: cast_nullable_to_non_nullable
as String?,scoreBefore: freezed == scoreBefore ? _self.scoreBefore : scoreBefore // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,scoreAfter: freezed == scoreAfter ? _self.scoreAfter : scoreAfter // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,isVoided: null == isVoided ? _self.isVoided : isVoided // ignore: cast_nullable_to_non_nullable
as bool,correctedFromId: freezed == correctedFromId ? _self.correctedFromId : correctedFromId // ignore: cast_nullable_to_non_nullable
as int?,recordedAt: freezed == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PointEventModel].
extension PointEventModelPatterns on PointEventModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PointEventModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PointEventModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PointEventModel value)  $default,){
final _that = this;
switch (_that) {
case _PointEventModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PointEventModel value)?  $default,){
final _that = this;
switch (_that) {
case _PointEventModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int sequence, @JsonKey(name: 'winning_team_id')  int? winningTeamId, @JsonKey(name: 'ending_type')  String? endingType, @JsonKey(name: 'primary_player_id')  String? primaryPlayerId, @JsonKey(name: 'shot_type')  String? shotType, @JsonKey(name: 'error_type')  String? errorType, @JsonKey(name: 'serve_outcome')  String? serveOutcome,  String? coverage, @JsonKey(name: 'score_before')  Map<String, dynamic>? scoreBefore, @JsonKey(name: 'score_after')  Map<String, dynamic>? scoreAfter, @JsonKey(name: 'is_voided')  bool isVoided, @JsonKey(name: 'corrected_from_id')  int? correctedFromId, @JsonKey(name: 'recorded_at')  DateTime? recordedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PointEventModel() when $default != null:
return $default(_that.id,_that.sequence,_that.winningTeamId,_that.endingType,_that.primaryPlayerId,_that.shotType,_that.errorType,_that.serveOutcome,_that.coverage,_that.scoreBefore,_that.scoreAfter,_that.isVoided,_that.correctedFromId,_that.recordedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int sequence, @JsonKey(name: 'winning_team_id')  int? winningTeamId, @JsonKey(name: 'ending_type')  String? endingType, @JsonKey(name: 'primary_player_id')  String? primaryPlayerId, @JsonKey(name: 'shot_type')  String? shotType, @JsonKey(name: 'error_type')  String? errorType, @JsonKey(name: 'serve_outcome')  String? serveOutcome,  String? coverage, @JsonKey(name: 'score_before')  Map<String, dynamic>? scoreBefore, @JsonKey(name: 'score_after')  Map<String, dynamic>? scoreAfter, @JsonKey(name: 'is_voided')  bool isVoided, @JsonKey(name: 'corrected_from_id')  int? correctedFromId, @JsonKey(name: 'recorded_at')  DateTime? recordedAt)  $default,) {final _that = this;
switch (_that) {
case _PointEventModel():
return $default(_that.id,_that.sequence,_that.winningTeamId,_that.endingType,_that.primaryPlayerId,_that.shotType,_that.errorType,_that.serveOutcome,_that.coverage,_that.scoreBefore,_that.scoreAfter,_that.isVoided,_that.correctedFromId,_that.recordedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int sequence, @JsonKey(name: 'winning_team_id')  int? winningTeamId, @JsonKey(name: 'ending_type')  String? endingType, @JsonKey(name: 'primary_player_id')  String? primaryPlayerId, @JsonKey(name: 'shot_type')  String? shotType, @JsonKey(name: 'error_type')  String? errorType, @JsonKey(name: 'serve_outcome')  String? serveOutcome,  String? coverage, @JsonKey(name: 'score_before')  Map<String, dynamic>? scoreBefore, @JsonKey(name: 'score_after')  Map<String, dynamic>? scoreAfter, @JsonKey(name: 'is_voided')  bool isVoided, @JsonKey(name: 'corrected_from_id')  int? correctedFromId, @JsonKey(name: 'recorded_at')  DateTime? recordedAt)?  $default,) {final _that = this;
switch (_that) {
case _PointEventModel() when $default != null:
return $default(_that.id,_that.sequence,_that.winningTeamId,_that.endingType,_that.primaryPlayerId,_that.shotType,_that.errorType,_that.serveOutcome,_that.coverage,_that.scoreBefore,_that.scoreAfter,_that.isVoided,_that.correctedFromId,_that.recordedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PointEventModel implements PointEventModel {
  const _PointEventModel({required this.id, this.sequence = 0, @JsonKey(name: 'winning_team_id') this.winningTeamId, @JsonKey(name: 'ending_type') this.endingType, @JsonKey(name: 'primary_player_id') this.primaryPlayerId, @JsonKey(name: 'shot_type') this.shotType, @JsonKey(name: 'error_type') this.errorType, @JsonKey(name: 'serve_outcome') this.serveOutcome, this.coverage, @JsonKey(name: 'score_before') final  Map<String, dynamic>? scoreBefore, @JsonKey(name: 'score_after') final  Map<String, dynamic>? scoreAfter, @JsonKey(name: 'is_voided') this.isVoided = false, @JsonKey(name: 'corrected_from_id') this.correctedFromId, @JsonKey(name: 'recorded_at') this.recordedAt}): _scoreBefore = scoreBefore,_scoreAfter = scoreAfter;
  factory _PointEventModel.fromJson(Map<String, dynamic> json) => _$PointEventModelFromJson(json);

@override final  int id;
@override@JsonKey() final  int sequence;
@override@JsonKey(name: 'winning_team_id') final  int? winningTeamId;
@override@JsonKey(name: 'ending_type') final  String? endingType;
@override@JsonKey(name: 'primary_player_id') final  String? primaryPlayerId;
@override@JsonKey(name: 'shot_type') final  String? shotType;
@override@JsonKey(name: 'error_type') final  String? errorType;
@override@JsonKey(name: 'serve_outcome') final  String? serveOutcome;
@override final  String? coverage;
 final  Map<String, dynamic>? _scoreBefore;
@override@JsonKey(name: 'score_before') Map<String, dynamic>? get scoreBefore {
  final value = _scoreBefore;
  if (value == null) return null;
  if (_scoreBefore is EqualUnmodifiableMapView) return _scoreBefore;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  Map<String, dynamic>? _scoreAfter;
@override@JsonKey(name: 'score_after') Map<String, dynamic>? get scoreAfter {
  final value = _scoreAfter;
  if (value == null) return null;
  if (_scoreAfter is EqualUnmodifiableMapView) return _scoreAfter;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey(name: 'is_voided') final  bool isVoided;
@override@JsonKey(name: 'corrected_from_id') final  int? correctedFromId;
@override@JsonKey(name: 'recorded_at') final  DateTime? recordedAt;

/// Create a copy of PointEventModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PointEventModelCopyWith<_PointEventModel> get copyWith => __$PointEventModelCopyWithImpl<_PointEventModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PointEventModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PointEventModel&&(identical(other.id, id) || other.id == id)&&(identical(other.sequence, sequence) || other.sequence == sequence)&&(identical(other.winningTeamId, winningTeamId) || other.winningTeamId == winningTeamId)&&(identical(other.endingType, endingType) || other.endingType == endingType)&&(identical(other.primaryPlayerId, primaryPlayerId) || other.primaryPlayerId == primaryPlayerId)&&(identical(other.shotType, shotType) || other.shotType == shotType)&&(identical(other.errorType, errorType) || other.errorType == errorType)&&(identical(other.serveOutcome, serveOutcome) || other.serveOutcome == serveOutcome)&&(identical(other.coverage, coverage) || other.coverage == coverage)&&const DeepCollectionEquality().equals(other._scoreBefore, _scoreBefore)&&const DeepCollectionEquality().equals(other._scoreAfter, _scoreAfter)&&(identical(other.isVoided, isVoided) || other.isVoided == isVoided)&&(identical(other.correctedFromId, correctedFromId) || other.correctedFromId == correctedFromId)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,sequence,winningTeamId,endingType,primaryPlayerId,shotType,errorType,serveOutcome,coverage,const DeepCollectionEquality().hash(_scoreBefore),const DeepCollectionEquality().hash(_scoreAfter),isVoided,correctedFromId,recordedAt);

@override
String toString() {
  return 'PointEventModel(id: $id, sequence: $sequence, winningTeamId: $winningTeamId, endingType: $endingType, primaryPlayerId: $primaryPlayerId, shotType: $shotType, errorType: $errorType, serveOutcome: $serveOutcome, coverage: $coverage, scoreBefore: $scoreBefore, scoreAfter: $scoreAfter, isVoided: $isVoided, correctedFromId: $correctedFromId, recordedAt: $recordedAt)';
}


}

/// @nodoc
abstract mixin class _$PointEventModelCopyWith<$Res> implements $PointEventModelCopyWith<$Res> {
  factory _$PointEventModelCopyWith(_PointEventModel value, $Res Function(_PointEventModel) _then) = __$PointEventModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int sequence,@JsonKey(name: 'winning_team_id') int? winningTeamId,@JsonKey(name: 'ending_type') String? endingType,@JsonKey(name: 'primary_player_id') String? primaryPlayerId,@JsonKey(name: 'shot_type') String? shotType,@JsonKey(name: 'error_type') String? errorType,@JsonKey(name: 'serve_outcome') String? serveOutcome, String? coverage,@JsonKey(name: 'score_before') Map<String, dynamic>? scoreBefore,@JsonKey(name: 'score_after') Map<String, dynamic>? scoreAfter,@JsonKey(name: 'is_voided') bool isVoided,@JsonKey(name: 'corrected_from_id') int? correctedFromId,@JsonKey(name: 'recorded_at') DateTime? recordedAt
});




}
/// @nodoc
class __$PointEventModelCopyWithImpl<$Res>
    implements _$PointEventModelCopyWith<$Res> {
  __$PointEventModelCopyWithImpl(this._self, this._then);

  final _PointEventModel _self;
  final $Res Function(_PointEventModel) _then;

/// Create a copy of PointEventModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? sequence = null,Object? winningTeamId = freezed,Object? endingType = freezed,Object? primaryPlayerId = freezed,Object? shotType = freezed,Object? errorType = freezed,Object? serveOutcome = freezed,Object? coverage = freezed,Object? scoreBefore = freezed,Object? scoreAfter = freezed,Object? isVoided = null,Object? correctedFromId = freezed,Object? recordedAt = freezed,}) {
  return _then(_PointEventModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,sequence: null == sequence ? _self.sequence : sequence // ignore: cast_nullable_to_non_nullable
as int,winningTeamId: freezed == winningTeamId ? _self.winningTeamId : winningTeamId // ignore: cast_nullable_to_non_nullable
as int?,endingType: freezed == endingType ? _self.endingType : endingType // ignore: cast_nullable_to_non_nullable
as String?,primaryPlayerId: freezed == primaryPlayerId ? _self.primaryPlayerId : primaryPlayerId // ignore: cast_nullable_to_non_nullable
as String?,shotType: freezed == shotType ? _self.shotType : shotType // ignore: cast_nullable_to_non_nullable
as String?,errorType: freezed == errorType ? _self.errorType : errorType // ignore: cast_nullable_to_non_nullable
as String?,serveOutcome: freezed == serveOutcome ? _self.serveOutcome : serveOutcome // ignore: cast_nullable_to_non_nullable
as String?,coverage: freezed == coverage ? _self.coverage : coverage // ignore: cast_nullable_to_non_nullable
as String?,scoreBefore: freezed == scoreBefore ? _self._scoreBefore : scoreBefore // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,scoreAfter: freezed == scoreAfter ? _self._scoreAfter : scoreAfter // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,isVoided: null == isVoided ? _self.isVoided : isVoided // ignore: cast_nullable_to_non_nullable
as bool,correctedFromId: freezed == correctedFromId ? _self.correctedFromId : correctedFromId // ignore: cast_nullable_to_non_nullable
as int?,recordedAt: freezed == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$LivePayloadModel {

 String? get event;@JsonKey(name: 'match_id') int get matchId;@JsonKey(name: 'tournament_id') int? get tournamentId;@JsonKey(name: 'category_id') int? get categoryId; String get status; int get version;@JsonKey(name: 'team_one_id') int? get teamOneId;@JsonKey(name: 'team_two_id') int? get teamTwoId;@JsonKey(name: 'sets_won_team_one') int get setsWonTeamOne;@JsonKey(name: 'sets_won_team_two') int get setsWonTeamTwo;@JsonKey(name: 'live_score') LiveScoreModel? get liveScore;@JsonKey(name: 'current_game_display') PointDisplayModel? get currentGameDisplay;@JsonKey(name: 'winner_team_id') int? get winnerTeamId;@JsonKey(name: 'last_point') PointEventModel? get lastPoint;@JsonKey(name: 'deuce_enabled') bool get deuceEnabled;@JsonKey(name: 'ended_early') bool get endedEarly;@JsonKey(name: 'server_time') DateTime? get serverTime; bool get changed;
/// Create a copy of LivePayloadModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LivePayloadModelCopyWith<LivePayloadModel> get copyWith => _$LivePayloadModelCopyWithImpl<LivePayloadModel>(this as LivePayloadModel, _$identity);

  /// Serializes this LivePayloadModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LivePayloadModel&&(identical(other.event, event) || other.event == event)&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.tournamentId, tournamentId) || other.tournamentId == tournamentId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.status, status) || other.status == status)&&(identical(other.version, version) || other.version == version)&&(identical(other.teamOneId, teamOneId) || other.teamOneId == teamOneId)&&(identical(other.teamTwoId, teamTwoId) || other.teamTwoId == teamTwoId)&&(identical(other.setsWonTeamOne, setsWonTeamOne) || other.setsWonTeamOne == setsWonTeamOne)&&(identical(other.setsWonTeamTwo, setsWonTeamTwo) || other.setsWonTeamTwo == setsWonTeamTwo)&&(identical(other.liveScore, liveScore) || other.liveScore == liveScore)&&(identical(other.currentGameDisplay, currentGameDisplay) || other.currentGameDisplay == currentGameDisplay)&&(identical(other.winnerTeamId, winnerTeamId) || other.winnerTeamId == winnerTeamId)&&(identical(other.lastPoint, lastPoint) || other.lastPoint == lastPoint)&&(identical(other.deuceEnabled, deuceEnabled) || other.deuceEnabled == deuceEnabled)&&(identical(other.endedEarly, endedEarly) || other.endedEarly == endedEarly)&&(identical(other.serverTime, serverTime) || other.serverTime == serverTime)&&(identical(other.changed, changed) || other.changed == changed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,event,matchId,tournamentId,categoryId,status,version,teamOneId,teamTwoId,setsWonTeamOne,setsWonTeamTwo,liveScore,currentGameDisplay,winnerTeamId,lastPoint,deuceEnabled,endedEarly,serverTime,changed);

@override
String toString() {
  return 'LivePayloadModel(event: $event, matchId: $matchId, tournamentId: $tournamentId, categoryId: $categoryId, status: $status, version: $version, teamOneId: $teamOneId, teamTwoId: $teamTwoId, setsWonTeamOne: $setsWonTeamOne, setsWonTeamTwo: $setsWonTeamTwo, liveScore: $liveScore, currentGameDisplay: $currentGameDisplay, winnerTeamId: $winnerTeamId, lastPoint: $lastPoint, deuceEnabled: $deuceEnabled, endedEarly: $endedEarly, serverTime: $serverTime, changed: $changed)';
}


}

/// @nodoc
abstract mixin class $LivePayloadModelCopyWith<$Res>  {
  factory $LivePayloadModelCopyWith(LivePayloadModel value, $Res Function(LivePayloadModel) _then) = _$LivePayloadModelCopyWithImpl;
@useResult
$Res call({
 String? event,@JsonKey(name: 'match_id') int matchId,@JsonKey(name: 'tournament_id') int? tournamentId,@JsonKey(name: 'category_id') int? categoryId, String status, int version,@JsonKey(name: 'team_one_id') int? teamOneId,@JsonKey(name: 'team_two_id') int? teamTwoId,@JsonKey(name: 'sets_won_team_one') int setsWonTeamOne,@JsonKey(name: 'sets_won_team_two') int setsWonTeamTwo,@JsonKey(name: 'live_score') LiveScoreModel? liveScore,@JsonKey(name: 'current_game_display') PointDisplayModel? currentGameDisplay,@JsonKey(name: 'winner_team_id') int? winnerTeamId,@JsonKey(name: 'last_point') PointEventModel? lastPoint,@JsonKey(name: 'deuce_enabled') bool deuceEnabled,@JsonKey(name: 'ended_early') bool endedEarly,@JsonKey(name: 'server_time') DateTime? serverTime, bool changed
});


$LiveScoreModelCopyWith<$Res>? get liveScore;$PointDisplayModelCopyWith<$Res>? get currentGameDisplay;$PointEventModelCopyWith<$Res>? get lastPoint;

}
/// @nodoc
class _$LivePayloadModelCopyWithImpl<$Res>
    implements $LivePayloadModelCopyWith<$Res> {
  _$LivePayloadModelCopyWithImpl(this._self, this._then);

  final LivePayloadModel _self;
  final $Res Function(LivePayloadModel) _then;

/// Create a copy of LivePayloadModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? event = freezed,Object? matchId = null,Object? tournamentId = freezed,Object? categoryId = freezed,Object? status = null,Object? version = null,Object? teamOneId = freezed,Object? teamTwoId = freezed,Object? setsWonTeamOne = null,Object? setsWonTeamTwo = null,Object? liveScore = freezed,Object? currentGameDisplay = freezed,Object? winnerTeamId = freezed,Object? lastPoint = freezed,Object? deuceEnabled = null,Object? endedEarly = null,Object? serverTime = freezed,Object? changed = null,}) {
  return _then(_self.copyWith(
event: freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as String?,matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as int,tournamentId: freezed == tournamentId ? _self.tournamentId : tournamentId // ignore: cast_nullable_to_non_nullable
as int?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,teamOneId: freezed == teamOneId ? _self.teamOneId : teamOneId // ignore: cast_nullable_to_non_nullable
as int?,teamTwoId: freezed == teamTwoId ? _self.teamTwoId : teamTwoId // ignore: cast_nullable_to_non_nullable
as int?,setsWonTeamOne: null == setsWonTeamOne ? _self.setsWonTeamOne : setsWonTeamOne // ignore: cast_nullable_to_non_nullable
as int,setsWonTeamTwo: null == setsWonTeamTwo ? _self.setsWonTeamTwo : setsWonTeamTwo // ignore: cast_nullable_to_non_nullable
as int,liveScore: freezed == liveScore ? _self.liveScore : liveScore // ignore: cast_nullable_to_non_nullable
as LiveScoreModel?,currentGameDisplay: freezed == currentGameDisplay ? _self.currentGameDisplay : currentGameDisplay // ignore: cast_nullable_to_non_nullable
as PointDisplayModel?,winnerTeamId: freezed == winnerTeamId ? _self.winnerTeamId : winnerTeamId // ignore: cast_nullable_to_non_nullable
as int?,lastPoint: freezed == lastPoint ? _self.lastPoint : lastPoint // ignore: cast_nullable_to_non_nullable
as PointEventModel?,deuceEnabled: null == deuceEnabled ? _self.deuceEnabled : deuceEnabled // ignore: cast_nullable_to_non_nullable
as bool,endedEarly: null == endedEarly ? _self.endedEarly : endedEarly // ignore: cast_nullable_to_non_nullable
as bool,serverTime: freezed == serverTime ? _self.serverTime : serverTime // ignore: cast_nullable_to_non_nullable
as DateTime?,changed: null == changed ? _self.changed : changed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of LivePayloadModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LiveScoreModelCopyWith<$Res>? get liveScore {
    if (_self.liveScore == null) {
    return null;
  }

  return $LiveScoreModelCopyWith<$Res>(_self.liveScore!, (value) {
    return _then(_self.copyWith(liveScore: value));
  });
}/// Create a copy of LivePayloadModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PointDisplayModelCopyWith<$Res>? get currentGameDisplay {
    if (_self.currentGameDisplay == null) {
    return null;
  }

  return $PointDisplayModelCopyWith<$Res>(_self.currentGameDisplay!, (value) {
    return _then(_self.copyWith(currentGameDisplay: value));
  });
}/// Create a copy of LivePayloadModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PointEventModelCopyWith<$Res>? get lastPoint {
    if (_self.lastPoint == null) {
    return null;
  }

  return $PointEventModelCopyWith<$Res>(_self.lastPoint!, (value) {
    return _then(_self.copyWith(lastPoint: value));
  });
}
}


/// Adds pattern-matching-related methods to [LivePayloadModel].
extension LivePayloadModelPatterns on LivePayloadModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LivePayloadModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LivePayloadModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LivePayloadModel value)  $default,){
final _that = this;
switch (_that) {
case _LivePayloadModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LivePayloadModel value)?  $default,){
final _that = this;
switch (_that) {
case _LivePayloadModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? event, @JsonKey(name: 'match_id')  int matchId, @JsonKey(name: 'tournament_id')  int? tournamentId, @JsonKey(name: 'category_id')  int? categoryId,  String status,  int version, @JsonKey(name: 'team_one_id')  int? teamOneId, @JsonKey(name: 'team_two_id')  int? teamTwoId, @JsonKey(name: 'sets_won_team_one')  int setsWonTeamOne, @JsonKey(name: 'sets_won_team_two')  int setsWonTeamTwo, @JsonKey(name: 'live_score')  LiveScoreModel? liveScore, @JsonKey(name: 'current_game_display')  PointDisplayModel? currentGameDisplay, @JsonKey(name: 'winner_team_id')  int? winnerTeamId, @JsonKey(name: 'last_point')  PointEventModel? lastPoint, @JsonKey(name: 'deuce_enabled')  bool deuceEnabled, @JsonKey(name: 'ended_early')  bool endedEarly, @JsonKey(name: 'server_time')  DateTime? serverTime,  bool changed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LivePayloadModel() when $default != null:
return $default(_that.event,_that.matchId,_that.tournamentId,_that.categoryId,_that.status,_that.version,_that.teamOneId,_that.teamTwoId,_that.setsWonTeamOne,_that.setsWonTeamTwo,_that.liveScore,_that.currentGameDisplay,_that.winnerTeamId,_that.lastPoint,_that.deuceEnabled,_that.endedEarly,_that.serverTime,_that.changed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? event, @JsonKey(name: 'match_id')  int matchId, @JsonKey(name: 'tournament_id')  int? tournamentId, @JsonKey(name: 'category_id')  int? categoryId,  String status,  int version, @JsonKey(name: 'team_one_id')  int? teamOneId, @JsonKey(name: 'team_two_id')  int? teamTwoId, @JsonKey(name: 'sets_won_team_one')  int setsWonTeamOne, @JsonKey(name: 'sets_won_team_two')  int setsWonTeamTwo, @JsonKey(name: 'live_score')  LiveScoreModel? liveScore, @JsonKey(name: 'current_game_display')  PointDisplayModel? currentGameDisplay, @JsonKey(name: 'winner_team_id')  int? winnerTeamId, @JsonKey(name: 'last_point')  PointEventModel? lastPoint, @JsonKey(name: 'deuce_enabled')  bool deuceEnabled, @JsonKey(name: 'ended_early')  bool endedEarly, @JsonKey(name: 'server_time')  DateTime? serverTime,  bool changed)  $default,) {final _that = this;
switch (_that) {
case _LivePayloadModel():
return $default(_that.event,_that.matchId,_that.tournamentId,_that.categoryId,_that.status,_that.version,_that.teamOneId,_that.teamTwoId,_that.setsWonTeamOne,_that.setsWonTeamTwo,_that.liveScore,_that.currentGameDisplay,_that.winnerTeamId,_that.lastPoint,_that.deuceEnabled,_that.endedEarly,_that.serverTime,_that.changed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? event, @JsonKey(name: 'match_id')  int matchId, @JsonKey(name: 'tournament_id')  int? tournamentId, @JsonKey(name: 'category_id')  int? categoryId,  String status,  int version, @JsonKey(name: 'team_one_id')  int? teamOneId, @JsonKey(name: 'team_two_id')  int? teamTwoId, @JsonKey(name: 'sets_won_team_one')  int setsWonTeamOne, @JsonKey(name: 'sets_won_team_two')  int setsWonTeamTwo, @JsonKey(name: 'live_score')  LiveScoreModel? liveScore, @JsonKey(name: 'current_game_display')  PointDisplayModel? currentGameDisplay, @JsonKey(name: 'winner_team_id')  int? winnerTeamId, @JsonKey(name: 'last_point')  PointEventModel? lastPoint, @JsonKey(name: 'deuce_enabled')  bool deuceEnabled, @JsonKey(name: 'ended_early')  bool endedEarly, @JsonKey(name: 'server_time')  DateTime? serverTime,  bool changed)?  $default,) {final _that = this;
switch (_that) {
case _LivePayloadModel() when $default != null:
return $default(_that.event,_that.matchId,_that.tournamentId,_that.categoryId,_that.status,_that.version,_that.teamOneId,_that.teamTwoId,_that.setsWonTeamOne,_that.setsWonTeamTwo,_that.liveScore,_that.currentGameDisplay,_that.winnerTeamId,_that.lastPoint,_that.deuceEnabled,_that.endedEarly,_that.serverTime,_that.changed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LivePayloadModel implements LivePayloadModel {
  const _LivePayloadModel({this.event, @JsonKey(name: 'match_id') required this.matchId, @JsonKey(name: 'tournament_id') this.tournamentId, @JsonKey(name: 'category_id') this.categoryId, this.status = 'scheduled', this.version = 0, @JsonKey(name: 'team_one_id') this.teamOneId, @JsonKey(name: 'team_two_id') this.teamTwoId, @JsonKey(name: 'sets_won_team_one') this.setsWonTeamOne = 0, @JsonKey(name: 'sets_won_team_two') this.setsWonTeamTwo = 0, @JsonKey(name: 'live_score') this.liveScore, @JsonKey(name: 'current_game_display') this.currentGameDisplay, @JsonKey(name: 'winner_team_id') this.winnerTeamId, @JsonKey(name: 'last_point') this.lastPoint, @JsonKey(name: 'deuce_enabled') this.deuceEnabled = true, @JsonKey(name: 'ended_early') this.endedEarly = false, @JsonKey(name: 'server_time') this.serverTime, this.changed = true});
  factory _LivePayloadModel.fromJson(Map<String, dynamic> json) => _$LivePayloadModelFromJson(json);

@override final  String? event;
@override@JsonKey(name: 'match_id') final  int matchId;
@override@JsonKey(name: 'tournament_id') final  int? tournamentId;
@override@JsonKey(name: 'category_id') final  int? categoryId;
@override@JsonKey() final  String status;
@override@JsonKey() final  int version;
@override@JsonKey(name: 'team_one_id') final  int? teamOneId;
@override@JsonKey(name: 'team_two_id') final  int? teamTwoId;
@override@JsonKey(name: 'sets_won_team_one') final  int setsWonTeamOne;
@override@JsonKey(name: 'sets_won_team_two') final  int setsWonTeamTwo;
@override@JsonKey(name: 'live_score') final  LiveScoreModel? liveScore;
@override@JsonKey(name: 'current_game_display') final  PointDisplayModel? currentGameDisplay;
@override@JsonKey(name: 'winner_team_id') final  int? winnerTeamId;
@override@JsonKey(name: 'last_point') final  PointEventModel? lastPoint;
@override@JsonKey(name: 'deuce_enabled') final  bool deuceEnabled;
@override@JsonKey(name: 'ended_early') final  bool endedEarly;
@override@JsonKey(name: 'server_time') final  DateTime? serverTime;
@override@JsonKey() final  bool changed;

/// Create a copy of LivePayloadModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LivePayloadModelCopyWith<_LivePayloadModel> get copyWith => __$LivePayloadModelCopyWithImpl<_LivePayloadModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LivePayloadModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LivePayloadModel&&(identical(other.event, event) || other.event == event)&&(identical(other.matchId, matchId) || other.matchId == matchId)&&(identical(other.tournamentId, tournamentId) || other.tournamentId == tournamentId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.status, status) || other.status == status)&&(identical(other.version, version) || other.version == version)&&(identical(other.teamOneId, teamOneId) || other.teamOneId == teamOneId)&&(identical(other.teamTwoId, teamTwoId) || other.teamTwoId == teamTwoId)&&(identical(other.setsWonTeamOne, setsWonTeamOne) || other.setsWonTeamOne == setsWonTeamOne)&&(identical(other.setsWonTeamTwo, setsWonTeamTwo) || other.setsWonTeamTwo == setsWonTeamTwo)&&(identical(other.liveScore, liveScore) || other.liveScore == liveScore)&&(identical(other.currentGameDisplay, currentGameDisplay) || other.currentGameDisplay == currentGameDisplay)&&(identical(other.winnerTeamId, winnerTeamId) || other.winnerTeamId == winnerTeamId)&&(identical(other.lastPoint, lastPoint) || other.lastPoint == lastPoint)&&(identical(other.deuceEnabled, deuceEnabled) || other.deuceEnabled == deuceEnabled)&&(identical(other.endedEarly, endedEarly) || other.endedEarly == endedEarly)&&(identical(other.serverTime, serverTime) || other.serverTime == serverTime)&&(identical(other.changed, changed) || other.changed == changed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,event,matchId,tournamentId,categoryId,status,version,teamOneId,teamTwoId,setsWonTeamOne,setsWonTeamTwo,liveScore,currentGameDisplay,winnerTeamId,lastPoint,deuceEnabled,endedEarly,serverTime,changed);

@override
String toString() {
  return 'LivePayloadModel(event: $event, matchId: $matchId, tournamentId: $tournamentId, categoryId: $categoryId, status: $status, version: $version, teamOneId: $teamOneId, teamTwoId: $teamTwoId, setsWonTeamOne: $setsWonTeamOne, setsWonTeamTwo: $setsWonTeamTwo, liveScore: $liveScore, currentGameDisplay: $currentGameDisplay, winnerTeamId: $winnerTeamId, lastPoint: $lastPoint, deuceEnabled: $deuceEnabled, endedEarly: $endedEarly, serverTime: $serverTime, changed: $changed)';
}


}

/// @nodoc
abstract mixin class _$LivePayloadModelCopyWith<$Res> implements $LivePayloadModelCopyWith<$Res> {
  factory _$LivePayloadModelCopyWith(_LivePayloadModel value, $Res Function(_LivePayloadModel) _then) = __$LivePayloadModelCopyWithImpl;
@override @useResult
$Res call({
 String? event,@JsonKey(name: 'match_id') int matchId,@JsonKey(name: 'tournament_id') int? tournamentId,@JsonKey(name: 'category_id') int? categoryId, String status, int version,@JsonKey(name: 'team_one_id') int? teamOneId,@JsonKey(name: 'team_two_id') int? teamTwoId,@JsonKey(name: 'sets_won_team_one') int setsWonTeamOne,@JsonKey(name: 'sets_won_team_two') int setsWonTeamTwo,@JsonKey(name: 'live_score') LiveScoreModel? liveScore,@JsonKey(name: 'current_game_display') PointDisplayModel? currentGameDisplay,@JsonKey(name: 'winner_team_id') int? winnerTeamId,@JsonKey(name: 'last_point') PointEventModel? lastPoint,@JsonKey(name: 'deuce_enabled') bool deuceEnabled,@JsonKey(name: 'ended_early') bool endedEarly,@JsonKey(name: 'server_time') DateTime? serverTime, bool changed
});


@override $LiveScoreModelCopyWith<$Res>? get liveScore;@override $PointDisplayModelCopyWith<$Res>? get currentGameDisplay;@override $PointEventModelCopyWith<$Res>? get lastPoint;

}
/// @nodoc
class __$LivePayloadModelCopyWithImpl<$Res>
    implements _$LivePayloadModelCopyWith<$Res> {
  __$LivePayloadModelCopyWithImpl(this._self, this._then);

  final _LivePayloadModel _self;
  final $Res Function(_LivePayloadModel) _then;

/// Create a copy of LivePayloadModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? event = freezed,Object? matchId = null,Object? tournamentId = freezed,Object? categoryId = freezed,Object? status = null,Object? version = null,Object? teamOneId = freezed,Object? teamTwoId = freezed,Object? setsWonTeamOne = null,Object? setsWonTeamTwo = null,Object? liveScore = freezed,Object? currentGameDisplay = freezed,Object? winnerTeamId = freezed,Object? lastPoint = freezed,Object? deuceEnabled = null,Object? endedEarly = null,Object? serverTime = freezed,Object? changed = null,}) {
  return _then(_LivePayloadModel(
event: freezed == event ? _self.event : event // ignore: cast_nullable_to_non_nullable
as String?,matchId: null == matchId ? _self.matchId : matchId // ignore: cast_nullable_to_non_nullable
as int,tournamentId: freezed == tournamentId ? _self.tournamentId : tournamentId // ignore: cast_nullable_to_non_nullable
as int?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,teamOneId: freezed == teamOneId ? _self.teamOneId : teamOneId // ignore: cast_nullable_to_non_nullable
as int?,teamTwoId: freezed == teamTwoId ? _self.teamTwoId : teamTwoId // ignore: cast_nullable_to_non_nullable
as int?,setsWonTeamOne: null == setsWonTeamOne ? _self.setsWonTeamOne : setsWonTeamOne // ignore: cast_nullable_to_non_nullable
as int,setsWonTeamTwo: null == setsWonTeamTwo ? _self.setsWonTeamTwo : setsWonTeamTwo // ignore: cast_nullable_to_non_nullable
as int,liveScore: freezed == liveScore ? _self.liveScore : liveScore // ignore: cast_nullable_to_non_nullable
as LiveScoreModel?,currentGameDisplay: freezed == currentGameDisplay ? _self.currentGameDisplay : currentGameDisplay // ignore: cast_nullable_to_non_nullable
as PointDisplayModel?,winnerTeamId: freezed == winnerTeamId ? _self.winnerTeamId : winnerTeamId // ignore: cast_nullable_to_non_nullable
as int?,lastPoint: freezed == lastPoint ? _self.lastPoint : lastPoint // ignore: cast_nullable_to_non_nullable
as PointEventModel?,deuceEnabled: null == deuceEnabled ? _self.deuceEnabled : deuceEnabled // ignore: cast_nullable_to_non_nullable
as bool,endedEarly: null == endedEarly ? _self.endedEarly : endedEarly // ignore: cast_nullable_to_non_nullable
as bool,serverTime: freezed == serverTime ? _self.serverTime : serverTime // ignore: cast_nullable_to_non_nullable
as DateTime?,changed: null == changed ? _self.changed : changed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of LivePayloadModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LiveScoreModelCopyWith<$Res>? get liveScore {
    if (_self.liveScore == null) {
    return null;
  }

  return $LiveScoreModelCopyWith<$Res>(_self.liveScore!, (value) {
    return _then(_self.copyWith(liveScore: value));
  });
}/// Create a copy of LivePayloadModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PointDisplayModelCopyWith<$Res>? get currentGameDisplay {
    if (_self.currentGameDisplay == null) {
    return null;
  }

  return $PointDisplayModelCopyWith<$Res>(_self.currentGameDisplay!, (value) {
    return _then(_self.copyWith(currentGameDisplay: value));
  });
}/// Create a copy of LivePayloadModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PointEventModelCopyWith<$Res>? get lastPoint {
    if (_self.lastPoint == null) {
    return null;
  }

  return $PointEventModelCopyWith<$Res>(_self.lastPoint!, (value) {
    return _then(_self.copyWith(lastPoint: value));
  });
}
}

// dart format on
