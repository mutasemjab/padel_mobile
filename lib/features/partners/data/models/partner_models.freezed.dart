// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'partner_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PartnerRecordModel {

 PlayerSummaryModel get partner;@JsonKey(name: 'matches_played') int get matchesPlayed;@JsonKey(name: 'matches_won') int get matchesWon;@JsonKey(name: 'win_rate') num? get winRate;
/// Create a copy of PartnerRecordModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartnerRecordModelCopyWith<PartnerRecordModel> get copyWith => _$PartnerRecordModelCopyWithImpl<PartnerRecordModel>(this as PartnerRecordModel, _$identity);

  /// Serializes this PartnerRecordModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartnerRecordModel&&(identical(other.partner, partner) || other.partner == partner)&&(identical(other.matchesPlayed, matchesPlayed) || other.matchesPlayed == matchesPlayed)&&(identical(other.matchesWon, matchesWon) || other.matchesWon == matchesWon)&&(identical(other.winRate, winRate) || other.winRate == winRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,partner,matchesPlayed,matchesWon,winRate);

@override
String toString() {
  return 'PartnerRecordModel(partner: $partner, matchesPlayed: $matchesPlayed, matchesWon: $matchesWon, winRate: $winRate)';
}


}

/// @nodoc
abstract mixin class $PartnerRecordModelCopyWith<$Res>  {
  factory $PartnerRecordModelCopyWith(PartnerRecordModel value, $Res Function(PartnerRecordModel) _then) = _$PartnerRecordModelCopyWithImpl;
@useResult
$Res call({
 PlayerSummaryModel partner,@JsonKey(name: 'matches_played') int matchesPlayed,@JsonKey(name: 'matches_won') int matchesWon,@JsonKey(name: 'win_rate') num? winRate
});


$PlayerSummaryModelCopyWith<$Res> get partner;

}
/// @nodoc
class _$PartnerRecordModelCopyWithImpl<$Res>
    implements $PartnerRecordModelCopyWith<$Res> {
  _$PartnerRecordModelCopyWithImpl(this._self, this._then);

  final PartnerRecordModel _self;
  final $Res Function(PartnerRecordModel) _then;

/// Create a copy of PartnerRecordModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? partner = null,Object? matchesPlayed = null,Object? matchesWon = null,Object? winRate = freezed,}) {
  return _then(_self.copyWith(
partner: null == partner ? _self.partner : partner // ignore: cast_nullable_to_non_nullable
as PlayerSummaryModel,matchesPlayed: null == matchesPlayed ? _self.matchesPlayed : matchesPlayed // ignore: cast_nullable_to_non_nullable
as int,matchesWon: null == matchesWon ? _self.matchesWon : matchesWon // ignore: cast_nullable_to_non_nullable
as int,winRate: freezed == winRate ? _self.winRate : winRate // ignore: cast_nullable_to_non_nullable
as num?,
  ));
}
/// Create a copy of PartnerRecordModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerSummaryModelCopyWith<$Res> get partner {
  
  return $PlayerSummaryModelCopyWith<$Res>(_self.partner, (value) {
    return _then(_self.copyWith(partner: value));
  });
}
}


/// Adds pattern-matching-related methods to [PartnerRecordModel].
extension PartnerRecordModelPatterns on PartnerRecordModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartnerRecordModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartnerRecordModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartnerRecordModel value)  $default,){
final _that = this;
switch (_that) {
case _PartnerRecordModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartnerRecordModel value)?  $default,){
final _that = this;
switch (_that) {
case _PartnerRecordModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PlayerSummaryModel partner, @JsonKey(name: 'matches_played')  int matchesPlayed, @JsonKey(name: 'matches_won')  int matchesWon, @JsonKey(name: 'win_rate')  num? winRate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartnerRecordModel() when $default != null:
return $default(_that.partner,_that.matchesPlayed,_that.matchesWon,_that.winRate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PlayerSummaryModel partner, @JsonKey(name: 'matches_played')  int matchesPlayed, @JsonKey(name: 'matches_won')  int matchesWon, @JsonKey(name: 'win_rate')  num? winRate)  $default,) {final _that = this;
switch (_that) {
case _PartnerRecordModel():
return $default(_that.partner,_that.matchesPlayed,_that.matchesWon,_that.winRate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PlayerSummaryModel partner, @JsonKey(name: 'matches_played')  int matchesPlayed, @JsonKey(name: 'matches_won')  int matchesWon, @JsonKey(name: 'win_rate')  num? winRate)?  $default,) {final _that = this;
switch (_that) {
case _PartnerRecordModel() when $default != null:
return $default(_that.partner,_that.matchesPlayed,_that.matchesWon,_that.winRate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PartnerRecordModel implements PartnerRecordModel {
  const _PartnerRecordModel({required this.partner, @JsonKey(name: 'matches_played') this.matchesPlayed = 0, @JsonKey(name: 'matches_won') this.matchesWon = 0, @JsonKey(name: 'win_rate') this.winRate});
  factory _PartnerRecordModel.fromJson(Map<String, dynamic> json) => _$PartnerRecordModelFromJson(json);

@override final  PlayerSummaryModel partner;
@override@JsonKey(name: 'matches_played') final  int matchesPlayed;
@override@JsonKey(name: 'matches_won') final  int matchesWon;
@override@JsonKey(name: 'win_rate') final  num? winRate;

/// Create a copy of PartnerRecordModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartnerRecordModelCopyWith<_PartnerRecordModel> get copyWith => __$PartnerRecordModelCopyWithImpl<_PartnerRecordModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartnerRecordModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartnerRecordModel&&(identical(other.partner, partner) || other.partner == partner)&&(identical(other.matchesPlayed, matchesPlayed) || other.matchesPlayed == matchesPlayed)&&(identical(other.matchesWon, matchesWon) || other.matchesWon == matchesWon)&&(identical(other.winRate, winRate) || other.winRate == winRate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,partner,matchesPlayed,matchesWon,winRate);

@override
String toString() {
  return 'PartnerRecordModel(partner: $partner, matchesPlayed: $matchesPlayed, matchesWon: $matchesWon, winRate: $winRate)';
}


}

/// @nodoc
abstract mixin class _$PartnerRecordModelCopyWith<$Res> implements $PartnerRecordModelCopyWith<$Res> {
  factory _$PartnerRecordModelCopyWith(_PartnerRecordModel value, $Res Function(_PartnerRecordModel) _then) = __$PartnerRecordModelCopyWithImpl;
@override @useResult
$Res call({
 PlayerSummaryModel partner,@JsonKey(name: 'matches_played') int matchesPlayed,@JsonKey(name: 'matches_won') int matchesWon,@JsonKey(name: 'win_rate') num? winRate
});


@override $PlayerSummaryModelCopyWith<$Res> get partner;

}
/// @nodoc
class __$PartnerRecordModelCopyWithImpl<$Res>
    implements _$PartnerRecordModelCopyWith<$Res> {
  __$PartnerRecordModelCopyWithImpl(this._self, this._then);

  final _PartnerRecordModel _self;
  final $Res Function(_PartnerRecordModel) _then;

/// Create a copy of PartnerRecordModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? partner = null,Object? matchesPlayed = null,Object? matchesWon = null,Object? winRate = freezed,}) {
  return _then(_PartnerRecordModel(
partner: null == partner ? _self.partner : partner // ignore: cast_nullable_to_non_nullable
as PlayerSummaryModel,matchesPlayed: null == matchesPlayed ? _self.matchesPlayed : matchesPlayed // ignore: cast_nullable_to_non_nullable
as int,matchesWon: null == matchesWon ? _self.matchesWon : matchesWon // ignore: cast_nullable_to_non_nullable
as int,winRate: freezed == winRate ? _self.winRate : winRate // ignore: cast_nullable_to_non_nullable
as num?,
  ));
}

/// Create a copy of PartnerRecordModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerSummaryModelCopyWith<$Res> get partner {
  
  return $PlayerSummaryModelCopyWith<$Res>(_self.partner, (value) {
    return _then(_self.copyWith(partner: value));
  });
}
}


/// @nodoc
mixin _$CandidateFactsModel {

@JsonKey(name: 'rating_difference') int? get ratingDifference;@JsonKey(name: 'candidate_side') String? get candidateSide;@JsonKey(name: 'candidate_verified_matches') int? get candidateVerifiedMatches;@JsonKey(name: 'candidate_win_rate') num? get candidateWinRate;@JsonKey(name: 'matches_together') int? get matchesTogether;@JsonKey(name: 'wins_together') int? get winsTogether;@JsonKey(name: 'candidate_last_played_at') DateTime? get candidateLastPlayedAt;
/// Create a copy of CandidateFactsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CandidateFactsModelCopyWith<CandidateFactsModel> get copyWith => _$CandidateFactsModelCopyWithImpl<CandidateFactsModel>(this as CandidateFactsModel, _$identity);

  /// Serializes this CandidateFactsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CandidateFactsModel&&(identical(other.ratingDifference, ratingDifference) || other.ratingDifference == ratingDifference)&&(identical(other.candidateSide, candidateSide) || other.candidateSide == candidateSide)&&(identical(other.candidateVerifiedMatches, candidateVerifiedMatches) || other.candidateVerifiedMatches == candidateVerifiedMatches)&&(identical(other.candidateWinRate, candidateWinRate) || other.candidateWinRate == candidateWinRate)&&(identical(other.matchesTogether, matchesTogether) || other.matchesTogether == matchesTogether)&&(identical(other.winsTogether, winsTogether) || other.winsTogether == winsTogether)&&(identical(other.candidateLastPlayedAt, candidateLastPlayedAt) || other.candidateLastPlayedAt == candidateLastPlayedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ratingDifference,candidateSide,candidateVerifiedMatches,candidateWinRate,matchesTogether,winsTogether,candidateLastPlayedAt);

@override
String toString() {
  return 'CandidateFactsModel(ratingDifference: $ratingDifference, candidateSide: $candidateSide, candidateVerifiedMatches: $candidateVerifiedMatches, candidateWinRate: $candidateWinRate, matchesTogether: $matchesTogether, winsTogether: $winsTogether, candidateLastPlayedAt: $candidateLastPlayedAt)';
}


}

/// @nodoc
abstract mixin class $CandidateFactsModelCopyWith<$Res>  {
  factory $CandidateFactsModelCopyWith(CandidateFactsModel value, $Res Function(CandidateFactsModel) _then) = _$CandidateFactsModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'rating_difference') int? ratingDifference,@JsonKey(name: 'candidate_side') String? candidateSide,@JsonKey(name: 'candidate_verified_matches') int? candidateVerifiedMatches,@JsonKey(name: 'candidate_win_rate') num? candidateWinRate,@JsonKey(name: 'matches_together') int? matchesTogether,@JsonKey(name: 'wins_together') int? winsTogether,@JsonKey(name: 'candidate_last_played_at') DateTime? candidateLastPlayedAt
});




}
/// @nodoc
class _$CandidateFactsModelCopyWithImpl<$Res>
    implements $CandidateFactsModelCopyWith<$Res> {
  _$CandidateFactsModelCopyWithImpl(this._self, this._then);

  final CandidateFactsModel _self;
  final $Res Function(CandidateFactsModel) _then;

/// Create a copy of CandidateFactsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ratingDifference = freezed,Object? candidateSide = freezed,Object? candidateVerifiedMatches = freezed,Object? candidateWinRate = freezed,Object? matchesTogether = freezed,Object? winsTogether = freezed,Object? candidateLastPlayedAt = freezed,}) {
  return _then(_self.copyWith(
ratingDifference: freezed == ratingDifference ? _self.ratingDifference : ratingDifference // ignore: cast_nullable_to_non_nullable
as int?,candidateSide: freezed == candidateSide ? _self.candidateSide : candidateSide // ignore: cast_nullable_to_non_nullable
as String?,candidateVerifiedMatches: freezed == candidateVerifiedMatches ? _self.candidateVerifiedMatches : candidateVerifiedMatches // ignore: cast_nullable_to_non_nullable
as int?,candidateWinRate: freezed == candidateWinRate ? _self.candidateWinRate : candidateWinRate // ignore: cast_nullable_to_non_nullable
as num?,matchesTogether: freezed == matchesTogether ? _self.matchesTogether : matchesTogether // ignore: cast_nullable_to_non_nullable
as int?,winsTogether: freezed == winsTogether ? _self.winsTogether : winsTogether // ignore: cast_nullable_to_non_nullable
as int?,candidateLastPlayedAt: freezed == candidateLastPlayedAt ? _self.candidateLastPlayedAt : candidateLastPlayedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CandidateFactsModel].
extension CandidateFactsModelPatterns on CandidateFactsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CandidateFactsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CandidateFactsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CandidateFactsModel value)  $default,){
final _that = this;
switch (_that) {
case _CandidateFactsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CandidateFactsModel value)?  $default,){
final _that = this;
switch (_that) {
case _CandidateFactsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'rating_difference')  int? ratingDifference, @JsonKey(name: 'candidate_side')  String? candidateSide, @JsonKey(name: 'candidate_verified_matches')  int? candidateVerifiedMatches, @JsonKey(name: 'candidate_win_rate')  num? candidateWinRate, @JsonKey(name: 'matches_together')  int? matchesTogether, @JsonKey(name: 'wins_together')  int? winsTogether, @JsonKey(name: 'candidate_last_played_at')  DateTime? candidateLastPlayedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CandidateFactsModel() when $default != null:
return $default(_that.ratingDifference,_that.candidateSide,_that.candidateVerifiedMatches,_that.candidateWinRate,_that.matchesTogether,_that.winsTogether,_that.candidateLastPlayedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'rating_difference')  int? ratingDifference, @JsonKey(name: 'candidate_side')  String? candidateSide, @JsonKey(name: 'candidate_verified_matches')  int? candidateVerifiedMatches, @JsonKey(name: 'candidate_win_rate')  num? candidateWinRate, @JsonKey(name: 'matches_together')  int? matchesTogether, @JsonKey(name: 'wins_together')  int? winsTogether, @JsonKey(name: 'candidate_last_played_at')  DateTime? candidateLastPlayedAt)  $default,) {final _that = this;
switch (_that) {
case _CandidateFactsModel():
return $default(_that.ratingDifference,_that.candidateSide,_that.candidateVerifiedMatches,_that.candidateWinRate,_that.matchesTogether,_that.winsTogether,_that.candidateLastPlayedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'rating_difference')  int? ratingDifference, @JsonKey(name: 'candidate_side')  String? candidateSide, @JsonKey(name: 'candidate_verified_matches')  int? candidateVerifiedMatches, @JsonKey(name: 'candidate_win_rate')  num? candidateWinRate, @JsonKey(name: 'matches_together')  int? matchesTogether, @JsonKey(name: 'wins_together')  int? winsTogether, @JsonKey(name: 'candidate_last_played_at')  DateTime? candidateLastPlayedAt)?  $default,) {final _that = this;
switch (_that) {
case _CandidateFactsModel() when $default != null:
return $default(_that.ratingDifference,_that.candidateSide,_that.candidateVerifiedMatches,_that.candidateWinRate,_that.matchesTogether,_that.winsTogether,_that.candidateLastPlayedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CandidateFactsModel implements CandidateFactsModel {
  const _CandidateFactsModel({@JsonKey(name: 'rating_difference') this.ratingDifference, @JsonKey(name: 'candidate_side') this.candidateSide, @JsonKey(name: 'candidate_verified_matches') this.candidateVerifiedMatches, @JsonKey(name: 'candidate_win_rate') this.candidateWinRate, @JsonKey(name: 'matches_together') this.matchesTogether, @JsonKey(name: 'wins_together') this.winsTogether, @JsonKey(name: 'candidate_last_played_at') this.candidateLastPlayedAt});
  factory _CandidateFactsModel.fromJson(Map<String, dynamic> json) => _$CandidateFactsModelFromJson(json);

@override@JsonKey(name: 'rating_difference') final  int? ratingDifference;
@override@JsonKey(name: 'candidate_side') final  String? candidateSide;
@override@JsonKey(name: 'candidate_verified_matches') final  int? candidateVerifiedMatches;
@override@JsonKey(name: 'candidate_win_rate') final  num? candidateWinRate;
@override@JsonKey(name: 'matches_together') final  int? matchesTogether;
@override@JsonKey(name: 'wins_together') final  int? winsTogether;
@override@JsonKey(name: 'candidate_last_played_at') final  DateTime? candidateLastPlayedAt;

/// Create a copy of CandidateFactsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CandidateFactsModelCopyWith<_CandidateFactsModel> get copyWith => __$CandidateFactsModelCopyWithImpl<_CandidateFactsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CandidateFactsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CandidateFactsModel&&(identical(other.ratingDifference, ratingDifference) || other.ratingDifference == ratingDifference)&&(identical(other.candidateSide, candidateSide) || other.candidateSide == candidateSide)&&(identical(other.candidateVerifiedMatches, candidateVerifiedMatches) || other.candidateVerifiedMatches == candidateVerifiedMatches)&&(identical(other.candidateWinRate, candidateWinRate) || other.candidateWinRate == candidateWinRate)&&(identical(other.matchesTogether, matchesTogether) || other.matchesTogether == matchesTogether)&&(identical(other.winsTogether, winsTogether) || other.winsTogether == winsTogether)&&(identical(other.candidateLastPlayedAt, candidateLastPlayedAt) || other.candidateLastPlayedAt == candidateLastPlayedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ratingDifference,candidateSide,candidateVerifiedMatches,candidateWinRate,matchesTogether,winsTogether,candidateLastPlayedAt);

@override
String toString() {
  return 'CandidateFactsModel(ratingDifference: $ratingDifference, candidateSide: $candidateSide, candidateVerifiedMatches: $candidateVerifiedMatches, candidateWinRate: $candidateWinRate, matchesTogether: $matchesTogether, winsTogether: $winsTogether, candidateLastPlayedAt: $candidateLastPlayedAt)';
}


}

/// @nodoc
abstract mixin class _$CandidateFactsModelCopyWith<$Res> implements $CandidateFactsModelCopyWith<$Res> {
  factory _$CandidateFactsModelCopyWith(_CandidateFactsModel value, $Res Function(_CandidateFactsModel) _then) = __$CandidateFactsModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'rating_difference') int? ratingDifference,@JsonKey(name: 'candidate_side') String? candidateSide,@JsonKey(name: 'candidate_verified_matches') int? candidateVerifiedMatches,@JsonKey(name: 'candidate_win_rate') num? candidateWinRate,@JsonKey(name: 'matches_together') int? matchesTogether,@JsonKey(name: 'wins_together') int? winsTogether,@JsonKey(name: 'candidate_last_played_at') DateTime? candidateLastPlayedAt
});




}
/// @nodoc
class __$CandidateFactsModelCopyWithImpl<$Res>
    implements _$CandidateFactsModelCopyWith<$Res> {
  __$CandidateFactsModelCopyWithImpl(this._self, this._then);

  final _CandidateFactsModel _self;
  final $Res Function(_CandidateFactsModel) _then;

/// Create a copy of CandidateFactsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ratingDifference = freezed,Object? candidateSide = freezed,Object? candidateVerifiedMatches = freezed,Object? candidateWinRate = freezed,Object? matchesTogether = freezed,Object? winsTogether = freezed,Object? candidateLastPlayedAt = freezed,}) {
  return _then(_CandidateFactsModel(
ratingDifference: freezed == ratingDifference ? _self.ratingDifference : ratingDifference // ignore: cast_nullable_to_non_nullable
as int?,candidateSide: freezed == candidateSide ? _self.candidateSide : candidateSide // ignore: cast_nullable_to_non_nullable
as String?,candidateVerifiedMatches: freezed == candidateVerifiedMatches ? _self.candidateVerifiedMatches : candidateVerifiedMatches // ignore: cast_nullable_to_non_nullable
as int?,candidateWinRate: freezed == candidateWinRate ? _self.candidateWinRate : candidateWinRate // ignore: cast_nullable_to_non_nullable
as num?,matchesTogether: freezed == matchesTogether ? _self.matchesTogether : matchesTogether // ignore: cast_nullable_to_non_nullable
as int?,winsTogether: freezed == winsTogether ? _self.winsTogether : winsTogether // ignore: cast_nullable_to_non_nullable
as int?,candidateLastPlayedAt: freezed == candidateLastPlayedAt ? _self.candidateLastPlayedAt : candidateLastPlayedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$PartnerCandidateModel {

 PlayerSummaryModel get player; List<String> get reasons; CandidateFactsModel? get facts;
/// Create a copy of PartnerCandidateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartnerCandidateModelCopyWith<PartnerCandidateModel> get copyWith => _$PartnerCandidateModelCopyWithImpl<PartnerCandidateModel>(this as PartnerCandidateModel, _$identity);

  /// Serializes this PartnerCandidateModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartnerCandidateModel&&(identical(other.player, player) || other.player == player)&&const DeepCollectionEquality().equals(other.reasons, reasons)&&(identical(other.facts, facts) || other.facts == facts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,player,const DeepCollectionEquality().hash(reasons),facts);

@override
String toString() {
  return 'PartnerCandidateModel(player: $player, reasons: $reasons, facts: $facts)';
}


}

/// @nodoc
abstract mixin class $PartnerCandidateModelCopyWith<$Res>  {
  factory $PartnerCandidateModelCopyWith(PartnerCandidateModel value, $Res Function(PartnerCandidateModel) _then) = _$PartnerCandidateModelCopyWithImpl;
@useResult
$Res call({
 PlayerSummaryModel player, List<String> reasons, CandidateFactsModel? facts
});


$PlayerSummaryModelCopyWith<$Res> get player;$CandidateFactsModelCopyWith<$Res>? get facts;

}
/// @nodoc
class _$PartnerCandidateModelCopyWithImpl<$Res>
    implements $PartnerCandidateModelCopyWith<$Res> {
  _$PartnerCandidateModelCopyWithImpl(this._self, this._then);

  final PartnerCandidateModel _self;
  final $Res Function(PartnerCandidateModel) _then;

/// Create a copy of PartnerCandidateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? player = null,Object? reasons = null,Object? facts = freezed,}) {
  return _then(_self.copyWith(
player: null == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as PlayerSummaryModel,reasons: null == reasons ? _self.reasons : reasons // ignore: cast_nullable_to_non_nullable
as List<String>,facts: freezed == facts ? _self.facts : facts // ignore: cast_nullable_to_non_nullable
as CandidateFactsModel?,
  ));
}
/// Create a copy of PartnerCandidateModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerSummaryModelCopyWith<$Res> get player {
  
  return $PlayerSummaryModelCopyWith<$Res>(_self.player, (value) {
    return _then(_self.copyWith(player: value));
  });
}/// Create a copy of PartnerCandidateModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CandidateFactsModelCopyWith<$Res>? get facts {
    if (_self.facts == null) {
    return null;
  }

  return $CandidateFactsModelCopyWith<$Res>(_self.facts!, (value) {
    return _then(_self.copyWith(facts: value));
  });
}
}


/// Adds pattern-matching-related methods to [PartnerCandidateModel].
extension PartnerCandidateModelPatterns on PartnerCandidateModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartnerCandidateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartnerCandidateModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartnerCandidateModel value)  $default,){
final _that = this;
switch (_that) {
case _PartnerCandidateModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartnerCandidateModel value)?  $default,){
final _that = this;
switch (_that) {
case _PartnerCandidateModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PlayerSummaryModel player,  List<String> reasons,  CandidateFactsModel? facts)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartnerCandidateModel() when $default != null:
return $default(_that.player,_that.reasons,_that.facts);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PlayerSummaryModel player,  List<String> reasons,  CandidateFactsModel? facts)  $default,) {final _that = this;
switch (_that) {
case _PartnerCandidateModel():
return $default(_that.player,_that.reasons,_that.facts);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PlayerSummaryModel player,  List<String> reasons,  CandidateFactsModel? facts)?  $default,) {final _that = this;
switch (_that) {
case _PartnerCandidateModel() when $default != null:
return $default(_that.player,_that.reasons,_that.facts);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PartnerCandidateModel implements PartnerCandidateModel {
  const _PartnerCandidateModel({required this.player, final  List<String> reasons = const [], this.facts}): _reasons = reasons;
  factory _PartnerCandidateModel.fromJson(Map<String, dynamic> json) => _$PartnerCandidateModelFromJson(json);

@override final  PlayerSummaryModel player;
 final  List<String> _reasons;
@override@JsonKey() List<String> get reasons {
  if (_reasons is EqualUnmodifiableListView) return _reasons;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_reasons);
}

@override final  CandidateFactsModel? facts;

/// Create a copy of PartnerCandidateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartnerCandidateModelCopyWith<_PartnerCandidateModel> get copyWith => __$PartnerCandidateModelCopyWithImpl<_PartnerCandidateModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartnerCandidateModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartnerCandidateModel&&(identical(other.player, player) || other.player == player)&&const DeepCollectionEquality().equals(other._reasons, _reasons)&&(identical(other.facts, facts) || other.facts == facts));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,player,const DeepCollectionEquality().hash(_reasons),facts);

@override
String toString() {
  return 'PartnerCandidateModel(player: $player, reasons: $reasons, facts: $facts)';
}


}

/// @nodoc
abstract mixin class _$PartnerCandidateModelCopyWith<$Res> implements $PartnerCandidateModelCopyWith<$Res> {
  factory _$PartnerCandidateModelCopyWith(_PartnerCandidateModel value, $Res Function(_PartnerCandidateModel) _then) = __$PartnerCandidateModelCopyWithImpl;
@override @useResult
$Res call({
 PlayerSummaryModel player, List<String> reasons, CandidateFactsModel? facts
});


@override $PlayerSummaryModelCopyWith<$Res> get player;@override $CandidateFactsModelCopyWith<$Res>? get facts;

}
/// @nodoc
class __$PartnerCandidateModelCopyWithImpl<$Res>
    implements _$PartnerCandidateModelCopyWith<$Res> {
  __$PartnerCandidateModelCopyWithImpl(this._self, this._then);

  final _PartnerCandidateModel _self;
  final $Res Function(_PartnerCandidateModel) _then;

/// Create a copy of PartnerCandidateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? player = null,Object? reasons = null,Object? facts = freezed,}) {
  return _then(_PartnerCandidateModel(
player: null == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as PlayerSummaryModel,reasons: null == reasons ? _self._reasons : reasons // ignore: cast_nullable_to_non_nullable
as List<String>,facts: freezed == facts ? _self.facts : facts // ignore: cast_nullable_to_non_nullable
as CandidateFactsModel?,
  ));
}

/// Create a copy of PartnerCandidateModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerSummaryModelCopyWith<$Res> get player {
  
  return $PlayerSummaryModelCopyWith<$Res>(_self.player, (value) {
    return _then(_self.copyWith(player: value));
  });
}/// Create a copy of PartnerCandidateModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CandidateFactsModelCopyWith<$Res>? get facts {
    if (_self.facts == null) {
    return null;
  }

  return $CandidateFactsModelCopyWith<$Res>(_self.facts!, (value) {
    return _then(_self.copyWith(facts: value));
  });
}
}


/// @nodoc
mixin _$PartnerRecommendationsModel {

 String get state; Map<String, dynamic>? get basis; List<PartnerCandidateModel> get candidates;
/// Create a copy of PartnerRecommendationsModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartnerRecommendationsModelCopyWith<PartnerRecommendationsModel> get copyWith => _$PartnerRecommendationsModelCopyWithImpl<PartnerRecommendationsModel>(this as PartnerRecommendationsModel, _$identity);

  /// Serializes this PartnerRecommendationsModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartnerRecommendationsModel&&(identical(other.state, state) || other.state == state)&&const DeepCollectionEquality().equals(other.basis, basis)&&const DeepCollectionEquality().equals(other.candidates, candidates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,state,const DeepCollectionEquality().hash(basis),const DeepCollectionEquality().hash(candidates));

@override
String toString() {
  return 'PartnerRecommendationsModel(state: $state, basis: $basis, candidates: $candidates)';
}


}

/// @nodoc
abstract mixin class $PartnerRecommendationsModelCopyWith<$Res>  {
  factory $PartnerRecommendationsModelCopyWith(PartnerRecommendationsModel value, $Res Function(PartnerRecommendationsModel) _then) = _$PartnerRecommendationsModelCopyWithImpl;
@useResult
$Res call({
 String state, Map<String, dynamic>? basis, List<PartnerCandidateModel> candidates
});




}
/// @nodoc
class _$PartnerRecommendationsModelCopyWithImpl<$Res>
    implements $PartnerRecommendationsModelCopyWith<$Res> {
  _$PartnerRecommendationsModelCopyWithImpl(this._self, this._then);

  final PartnerRecommendationsModel _self;
  final $Res Function(PartnerRecommendationsModel) _then;

/// Create a copy of PartnerRecommendationsModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? state = null,Object? basis = freezed,Object? candidates = null,}) {
  return _then(_self.copyWith(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,basis: freezed == basis ? _self.basis : basis // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,candidates: null == candidates ? _self.candidates : candidates // ignore: cast_nullable_to_non_nullable
as List<PartnerCandidateModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [PartnerRecommendationsModel].
extension PartnerRecommendationsModelPatterns on PartnerRecommendationsModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartnerRecommendationsModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartnerRecommendationsModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartnerRecommendationsModel value)  $default,){
final _that = this;
switch (_that) {
case _PartnerRecommendationsModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartnerRecommendationsModel value)?  $default,){
final _that = this;
switch (_that) {
case _PartnerRecommendationsModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String state,  Map<String, dynamic>? basis,  List<PartnerCandidateModel> candidates)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartnerRecommendationsModel() when $default != null:
return $default(_that.state,_that.basis,_that.candidates);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String state,  Map<String, dynamic>? basis,  List<PartnerCandidateModel> candidates)  $default,) {final _that = this;
switch (_that) {
case _PartnerRecommendationsModel():
return $default(_that.state,_that.basis,_that.candidates);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String state,  Map<String, dynamic>? basis,  List<PartnerCandidateModel> candidates)?  $default,) {final _that = this;
switch (_that) {
case _PartnerRecommendationsModel() when $default != null:
return $default(_that.state,_that.basis,_that.candidates);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PartnerRecommendationsModel implements PartnerRecommendationsModel {
  const _PartnerRecommendationsModel({this.state = 'ok', final  Map<String, dynamic>? basis, final  List<PartnerCandidateModel> candidates = const []}): _basis = basis,_candidates = candidates;
  factory _PartnerRecommendationsModel.fromJson(Map<String, dynamic> json) => _$PartnerRecommendationsModelFromJson(json);

@override@JsonKey() final  String state;
 final  Map<String, dynamic>? _basis;
@override Map<String, dynamic>? get basis {
  final value = _basis;
  if (value == null) return null;
  if (_basis is EqualUnmodifiableMapView) return _basis;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  List<PartnerCandidateModel> _candidates;
@override@JsonKey() List<PartnerCandidateModel> get candidates {
  if (_candidates is EqualUnmodifiableListView) return _candidates;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_candidates);
}


/// Create a copy of PartnerRecommendationsModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartnerRecommendationsModelCopyWith<_PartnerRecommendationsModel> get copyWith => __$PartnerRecommendationsModelCopyWithImpl<_PartnerRecommendationsModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartnerRecommendationsModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartnerRecommendationsModel&&(identical(other.state, state) || other.state == state)&&const DeepCollectionEquality().equals(other._basis, _basis)&&const DeepCollectionEquality().equals(other._candidates, _candidates));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,state,const DeepCollectionEquality().hash(_basis),const DeepCollectionEquality().hash(_candidates));

@override
String toString() {
  return 'PartnerRecommendationsModel(state: $state, basis: $basis, candidates: $candidates)';
}


}

/// @nodoc
abstract mixin class _$PartnerRecommendationsModelCopyWith<$Res> implements $PartnerRecommendationsModelCopyWith<$Res> {
  factory _$PartnerRecommendationsModelCopyWith(_PartnerRecommendationsModel value, $Res Function(_PartnerRecommendationsModel) _then) = __$PartnerRecommendationsModelCopyWithImpl;
@override @useResult
$Res call({
 String state, Map<String, dynamic>? basis, List<PartnerCandidateModel> candidates
});




}
/// @nodoc
class __$PartnerRecommendationsModelCopyWithImpl<$Res>
    implements _$PartnerRecommendationsModelCopyWith<$Res> {
  __$PartnerRecommendationsModelCopyWithImpl(this._self, this._then);

  final _PartnerRecommendationsModel _self;
  final $Res Function(_PartnerRecommendationsModel) _then;

/// Create a copy of PartnerRecommendationsModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? state = null,Object? basis = freezed,Object? candidates = null,}) {
  return _then(_PartnerRecommendationsModel(
state: null == state ? _self.state : state // ignore: cast_nullable_to_non_nullable
as String,basis: freezed == basis ? _self._basis : basis // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,candidates: null == candidates ? _self._candidates : candidates // ignore: cast_nullable_to_non_nullable
as List<PartnerCandidateModel>,
  ));
}


}


/// @nodoc
mixin _$PartnerRequestModel {

 int get id; String get status; String? get message; PlayerSummaryModel get requester; PlayerSummaryModel get target;@JsonKey(name: 'created_at') DateTime? get createdAt;@JsonKey(name: 'responded_at') DateTime? get respondedAt;
/// Create a copy of PartnerRequestModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PartnerRequestModelCopyWith<PartnerRequestModel> get copyWith => _$PartnerRequestModelCopyWithImpl<PartnerRequestModel>(this as PartnerRequestModel, _$identity);

  /// Serializes this PartnerRequestModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PartnerRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.requester, requester) || other.requester == requester)&&(identical(other.target, target) || other.target == target)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.respondedAt, respondedAt) || other.respondedAt == respondedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,message,requester,target,createdAt,respondedAt);

@override
String toString() {
  return 'PartnerRequestModel(id: $id, status: $status, message: $message, requester: $requester, target: $target, createdAt: $createdAt, respondedAt: $respondedAt)';
}


}

/// @nodoc
abstract mixin class $PartnerRequestModelCopyWith<$Res>  {
  factory $PartnerRequestModelCopyWith(PartnerRequestModel value, $Res Function(PartnerRequestModel) _then) = _$PartnerRequestModelCopyWithImpl;
@useResult
$Res call({
 int id, String status, String? message, PlayerSummaryModel requester, PlayerSummaryModel target,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'responded_at') DateTime? respondedAt
});


$PlayerSummaryModelCopyWith<$Res> get requester;$PlayerSummaryModelCopyWith<$Res> get target;

}
/// @nodoc
class _$PartnerRequestModelCopyWithImpl<$Res>
    implements $PartnerRequestModelCopyWith<$Res> {
  _$PartnerRequestModelCopyWithImpl(this._self, this._then);

  final PartnerRequestModel _self;
  final $Res Function(PartnerRequestModel) _then;

/// Create a copy of PartnerRequestModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? message = freezed,Object? requester = null,Object? target = null,Object? createdAt = freezed,Object? respondedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,requester: null == requester ? _self.requester : requester // ignore: cast_nullable_to_non_nullable
as PlayerSummaryModel,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as PlayerSummaryModel,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,respondedAt: freezed == respondedAt ? _self.respondedAt : respondedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of PartnerRequestModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerSummaryModelCopyWith<$Res> get requester {
  
  return $PlayerSummaryModelCopyWith<$Res>(_self.requester, (value) {
    return _then(_self.copyWith(requester: value));
  });
}/// Create a copy of PartnerRequestModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerSummaryModelCopyWith<$Res> get target {
  
  return $PlayerSummaryModelCopyWith<$Res>(_self.target, (value) {
    return _then(_self.copyWith(target: value));
  });
}
}


/// Adds pattern-matching-related methods to [PartnerRequestModel].
extension PartnerRequestModelPatterns on PartnerRequestModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PartnerRequestModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PartnerRequestModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PartnerRequestModel value)  $default,){
final _that = this;
switch (_that) {
case _PartnerRequestModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PartnerRequestModel value)?  $default,){
final _that = this;
switch (_that) {
case _PartnerRequestModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String status,  String? message,  PlayerSummaryModel requester,  PlayerSummaryModel target, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'responded_at')  DateTime? respondedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PartnerRequestModel() when $default != null:
return $default(_that.id,_that.status,_that.message,_that.requester,_that.target,_that.createdAt,_that.respondedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String status,  String? message,  PlayerSummaryModel requester,  PlayerSummaryModel target, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'responded_at')  DateTime? respondedAt)  $default,) {final _that = this;
switch (_that) {
case _PartnerRequestModel():
return $default(_that.id,_that.status,_that.message,_that.requester,_that.target,_that.createdAt,_that.respondedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String status,  String? message,  PlayerSummaryModel requester,  PlayerSummaryModel target, @JsonKey(name: 'created_at')  DateTime? createdAt, @JsonKey(name: 'responded_at')  DateTime? respondedAt)?  $default,) {final _that = this;
switch (_that) {
case _PartnerRequestModel() when $default != null:
return $default(_that.id,_that.status,_that.message,_that.requester,_that.target,_that.createdAt,_that.respondedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PartnerRequestModel implements PartnerRequestModel {
  const _PartnerRequestModel({required this.id, this.status = 'pending', this.message, required this.requester, required this.target, @JsonKey(name: 'created_at') this.createdAt, @JsonKey(name: 'responded_at') this.respondedAt});
  factory _PartnerRequestModel.fromJson(Map<String, dynamic> json) => _$PartnerRequestModelFromJson(json);

@override final  int id;
@override@JsonKey() final  String status;
@override final  String? message;
@override final  PlayerSummaryModel requester;
@override final  PlayerSummaryModel target;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;
@override@JsonKey(name: 'responded_at') final  DateTime? respondedAt;

/// Create a copy of PartnerRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PartnerRequestModelCopyWith<_PartnerRequestModel> get copyWith => __$PartnerRequestModelCopyWithImpl<_PartnerRequestModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PartnerRequestModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PartnerRequestModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.message, message) || other.message == message)&&(identical(other.requester, requester) || other.requester == requester)&&(identical(other.target, target) || other.target == target)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.respondedAt, respondedAt) || other.respondedAt == respondedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,message,requester,target,createdAt,respondedAt);

@override
String toString() {
  return 'PartnerRequestModel(id: $id, status: $status, message: $message, requester: $requester, target: $target, createdAt: $createdAt, respondedAt: $respondedAt)';
}


}

/// @nodoc
abstract mixin class _$PartnerRequestModelCopyWith<$Res> implements $PartnerRequestModelCopyWith<$Res> {
  factory _$PartnerRequestModelCopyWith(_PartnerRequestModel value, $Res Function(_PartnerRequestModel) _then) = __$PartnerRequestModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String status, String? message, PlayerSummaryModel requester, PlayerSummaryModel target,@JsonKey(name: 'created_at') DateTime? createdAt,@JsonKey(name: 'responded_at') DateTime? respondedAt
});


@override $PlayerSummaryModelCopyWith<$Res> get requester;@override $PlayerSummaryModelCopyWith<$Res> get target;

}
/// @nodoc
class __$PartnerRequestModelCopyWithImpl<$Res>
    implements _$PartnerRequestModelCopyWith<$Res> {
  __$PartnerRequestModelCopyWithImpl(this._self, this._then);

  final _PartnerRequestModel _self;
  final $Res Function(_PartnerRequestModel) _then;

/// Create a copy of PartnerRequestModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? message = freezed,Object? requester = null,Object? target = null,Object? createdAt = freezed,Object? respondedAt = freezed,}) {
  return _then(_PartnerRequestModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,message: freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as String?,requester: null == requester ? _self.requester : requester // ignore: cast_nullable_to_non_nullable
as PlayerSummaryModel,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as PlayerSummaryModel,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,respondedAt: freezed == respondedAt ? _self.respondedAt : respondedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of PartnerRequestModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerSummaryModelCopyWith<$Res> get requester {
  
  return $PlayerSummaryModelCopyWith<$Res>(_self.requester, (value) {
    return _then(_self.copyWith(requester: value));
  });
}/// Create a copy of PartnerRequestModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerSummaryModelCopyWith<$Res> get target {
  
  return $PlayerSummaryModelCopyWith<$Res>(_self.target, (value) {
    return _then(_self.copyWith(target: value));
  });
}
}

// dart format on
