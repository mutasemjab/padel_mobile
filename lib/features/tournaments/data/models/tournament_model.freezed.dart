// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tournament_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TournamentCategoryModel {

 int get id;@JsonKey(name: 'tournament_id') int? get tournamentId; String get name; String? get level; List<String> get levels; String? get gender; String? get format;@JsonKey(name: 'max_teams') int get maxTeams;@JsonKey(name: 'active_teams') int get activeTeams;@JsonKey(name: 'registration_fee') num get registrationFee; String? get currency;@JsonKey(name: 'requires_payment') bool get requiresPayment;@JsonKey(name: 'ranking_weight') num? get rankingWeight;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'is_full') bool get isFull;@JsonKey(name: 'waitlist_count') int get waitlistCount;@JsonKey(name: 'completed_at') DateTime? get completedAt; MatchTeamModel? get champion;
/// Create a copy of TournamentCategoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TournamentCategoryModelCopyWith<TournamentCategoryModel> get copyWith => _$TournamentCategoryModelCopyWithImpl<TournamentCategoryModel>(this as TournamentCategoryModel, _$identity);

  /// Serializes this TournamentCategoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TournamentCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.tournamentId, tournamentId) || other.tournamentId == tournamentId)&&(identical(other.name, name) || other.name == name)&&(identical(other.level, level) || other.level == level)&&const DeepCollectionEquality().equals(other.levels, levels)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.format, format) || other.format == format)&&(identical(other.maxTeams, maxTeams) || other.maxTeams == maxTeams)&&(identical(other.activeTeams, activeTeams) || other.activeTeams == activeTeams)&&(identical(other.registrationFee, registrationFee) || other.registrationFee == registrationFee)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.requiresPayment, requiresPayment) || other.requiresPayment == requiresPayment)&&(identical(other.rankingWeight, rankingWeight) || other.rankingWeight == rankingWeight)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isFull, isFull) || other.isFull == isFull)&&(identical(other.waitlistCount, waitlistCount) || other.waitlistCount == waitlistCount)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.champion, champion) || other.champion == champion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tournamentId,name,level,const DeepCollectionEquality().hash(levels),gender,format,maxTeams,activeTeams,registrationFee,currency,requiresPayment,rankingWeight,isActive,isFull,waitlistCount,completedAt,champion);

@override
String toString() {
  return 'TournamentCategoryModel(id: $id, tournamentId: $tournamentId, name: $name, level: $level, levels: $levels, gender: $gender, format: $format, maxTeams: $maxTeams, activeTeams: $activeTeams, registrationFee: $registrationFee, currency: $currency, requiresPayment: $requiresPayment, rankingWeight: $rankingWeight, isActive: $isActive, isFull: $isFull, waitlistCount: $waitlistCount, completedAt: $completedAt, champion: $champion)';
}


}

/// @nodoc
abstract mixin class $TournamentCategoryModelCopyWith<$Res>  {
  factory $TournamentCategoryModelCopyWith(TournamentCategoryModel value, $Res Function(TournamentCategoryModel) _then) = _$TournamentCategoryModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'tournament_id') int? tournamentId, String name, String? level, List<String> levels, String? gender, String? format,@JsonKey(name: 'max_teams') int maxTeams,@JsonKey(name: 'active_teams') int activeTeams,@JsonKey(name: 'registration_fee') num registrationFee, String? currency,@JsonKey(name: 'requires_payment') bool requiresPayment,@JsonKey(name: 'ranking_weight') num? rankingWeight,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'is_full') bool isFull,@JsonKey(name: 'waitlist_count') int waitlistCount,@JsonKey(name: 'completed_at') DateTime? completedAt, MatchTeamModel? champion
});


$MatchTeamModelCopyWith<$Res>? get champion;

}
/// @nodoc
class _$TournamentCategoryModelCopyWithImpl<$Res>
    implements $TournamentCategoryModelCopyWith<$Res> {
  _$TournamentCategoryModelCopyWithImpl(this._self, this._then);

  final TournamentCategoryModel _self;
  final $Res Function(TournamentCategoryModel) _then;

/// Create a copy of TournamentCategoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tournamentId = freezed,Object? name = null,Object? level = freezed,Object? levels = null,Object? gender = freezed,Object? format = freezed,Object? maxTeams = null,Object? activeTeams = null,Object? registrationFee = null,Object? currency = freezed,Object? requiresPayment = null,Object? rankingWeight = freezed,Object? isActive = null,Object? isFull = null,Object? waitlistCount = null,Object? completedAt = freezed,Object? champion = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tournamentId: freezed == tournamentId ? _self.tournamentId : tournamentId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String?,levels: null == levels ? _self.levels : levels // ignore: cast_nullable_to_non_nullable
as List<String>,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String?,maxTeams: null == maxTeams ? _self.maxTeams : maxTeams // ignore: cast_nullable_to_non_nullable
as int,activeTeams: null == activeTeams ? _self.activeTeams : activeTeams // ignore: cast_nullable_to_non_nullable
as int,registrationFee: null == registrationFee ? _self.registrationFee : registrationFee // ignore: cast_nullable_to_non_nullable
as num,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,requiresPayment: null == requiresPayment ? _self.requiresPayment : requiresPayment // ignore: cast_nullable_to_non_nullable
as bool,rankingWeight: freezed == rankingWeight ? _self.rankingWeight : rankingWeight // ignore: cast_nullable_to_non_nullable
as num?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isFull: null == isFull ? _self.isFull : isFull // ignore: cast_nullable_to_non_nullable
as bool,waitlistCount: null == waitlistCount ? _self.waitlistCount : waitlistCount // ignore: cast_nullable_to_non_nullable
as int,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,champion: freezed == champion ? _self.champion : champion // ignore: cast_nullable_to_non_nullable
as MatchTeamModel?,
  ));
}
/// Create a copy of TournamentCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchTeamModelCopyWith<$Res>? get champion {
    if (_self.champion == null) {
    return null;
  }

  return $MatchTeamModelCopyWith<$Res>(_self.champion!, (value) {
    return _then(_self.copyWith(champion: value));
  });
}
}


/// Adds pattern-matching-related methods to [TournamentCategoryModel].
extension TournamentCategoryModelPatterns on TournamentCategoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TournamentCategoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TournamentCategoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TournamentCategoryModel value)  $default,){
final _that = this;
switch (_that) {
case _TournamentCategoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TournamentCategoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _TournamentCategoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'tournament_id')  int? tournamentId,  String name,  String? level,  List<String> levels,  String? gender,  String? format, @JsonKey(name: 'max_teams')  int maxTeams, @JsonKey(name: 'active_teams')  int activeTeams, @JsonKey(name: 'registration_fee')  num registrationFee,  String? currency, @JsonKey(name: 'requires_payment')  bool requiresPayment, @JsonKey(name: 'ranking_weight')  num? rankingWeight, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'is_full')  bool isFull, @JsonKey(name: 'waitlist_count')  int waitlistCount, @JsonKey(name: 'completed_at')  DateTime? completedAt,  MatchTeamModel? champion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TournamentCategoryModel() when $default != null:
return $default(_that.id,_that.tournamentId,_that.name,_that.level,_that.levels,_that.gender,_that.format,_that.maxTeams,_that.activeTeams,_that.registrationFee,_that.currency,_that.requiresPayment,_that.rankingWeight,_that.isActive,_that.isFull,_that.waitlistCount,_that.completedAt,_that.champion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'tournament_id')  int? tournamentId,  String name,  String? level,  List<String> levels,  String? gender,  String? format, @JsonKey(name: 'max_teams')  int maxTeams, @JsonKey(name: 'active_teams')  int activeTeams, @JsonKey(name: 'registration_fee')  num registrationFee,  String? currency, @JsonKey(name: 'requires_payment')  bool requiresPayment, @JsonKey(name: 'ranking_weight')  num? rankingWeight, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'is_full')  bool isFull, @JsonKey(name: 'waitlist_count')  int waitlistCount, @JsonKey(name: 'completed_at')  DateTime? completedAt,  MatchTeamModel? champion)  $default,) {final _that = this;
switch (_that) {
case _TournamentCategoryModel():
return $default(_that.id,_that.tournamentId,_that.name,_that.level,_that.levels,_that.gender,_that.format,_that.maxTeams,_that.activeTeams,_that.registrationFee,_that.currency,_that.requiresPayment,_that.rankingWeight,_that.isActive,_that.isFull,_that.waitlistCount,_that.completedAt,_that.champion);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'tournament_id')  int? tournamentId,  String name,  String? level,  List<String> levels,  String? gender,  String? format, @JsonKey(name: 'max_teams')  int maxTeams, @JsonKey(name: 'active_teams')  int activeTeams, @JsonKey(name: 'registration_fee')  num registrationFee,  String? currency, @JsonKey(name: 'requires_payment')  bool requiresPayment, @JsonKey(name: 'ranking_weight')  num? rankingWeight, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'is_full')  bool isFull, @JsonKey(name: 'waitlist_count')  int waitlistCount, @JsonKey(name: 'completed_at')  DateTime? completedAt,  MatchTeamModel? champion)?  $default,) {final _that = this;
switch (_that) {
case _TournamentCategoryModel() when $default != null:
return $default(_that.id,_that.tournamentId,_that.name,_that.level,_that.levels,_that.gender,_that.format,_that.maxTeams,_that.activeTeams,_that.registrationFee,_that.currency,_that.requiresPayment,_that.rankingWeight,_that.isActive,_that.isFull,_that.waitlistCount,_that.completedAt,_that.champion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TournamentCategoryModel implements TournamentCategoryModel {
  const _TournamentCategoryModel({required this.id, @JsonKey(name: 'tournament_id') this.tournamentId, required this.name, this.level, final  List<String> levels = const <String>[], this.gender, this.format, @JsonKey(name: 'max_teams') this.maxTeams = 0, @JsonKey(name: 'active_teams') this.activeTeams = 0, @JsonKey(name: 'registration_fee') this.registrationFee = 0, this.currency, @JsonKey(name: 'requires_payment') this.requiresPayment = false, @JsonKey(name: 'ranking_weight') this.rankingWeight, @JsonKey(name: 'is_active') this.isActive = true, @JsonKey(name: 'is_full') this.isFull = false, @JsonKey(name: 'waitlist_count') this.waitlistCount = 0, @JsonKey(name: 'completed_at') this.completedAt, this.champion}): _levels = levels;
  factory _TournamentCategoryModel.fromJson(Map<String, dynamic> json) => _$TournamentCategoryModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'tournament_id') final  int? tournamentId;
@override final  String name;
@override final  String? level;
 final  List<String> _levels;
@override@JsonKey() List<String> get levels {
  if (_levels is EqualUnmodifiableListView) return _levels;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_levels);
}

@override final  String? gender;
@override final  String? format;
@override@JsonKey(name: 'max_teams') final  int maxTeams;
@override@JsonKey(name: 'active_teams') final  int activeTeams;
@override@JsonKey(name: 'registration_fee') final  num registrationFee;
@override final  String? currency;
@override@JsonKey(name: 'requires_payment') final  bool requiresPayment;
@override@JsonKey(name: 'ranking_weight') final  num? rankingWeight;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'is_full') final  bool isFull;
@override@JsonKey(name: 'waitlist_count') final  int waitlistCount;
@override@JsonKey(name: 'completed_at') final  DateTime? completedAt;
@override final  MatchTeamModel? champion;

/// Create a copy of TournamentCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TournamentCategoryModelCopyWith<_TournamentCategoryModel> get copyWith => __$TournamentCategoryModelCopyWithImpl<_TournamentCategoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TournamentCategoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TournamentCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.tournamentId, tournamentId) || other.tournamentId == tournamentId)&&(identical(other.name, name) || other.name == name)&&(identical(other.level, level) || other.level == level)&&const DeepCollectionEquality().equals(other._levels, _levels)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.format, format) || other.format == format)&&(identical(other.maxTeams, maxTeams) || other.maxTeams == maxTeams)&&(identical(other.activeTeams, activeTeams) || other.activeTeams == activeTeams)&&(identical(other.registrationFee, registrationFee) || other.registrationFee == registrationFee)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.requiresPayment, requiresPayment) || other.requiresPayment == requiresPayment)&&(identical(other.rankingWeight, rankingWeight) || other.rankingWeight == rankingWeight)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isFull, isFull) || other.isFull == isFull)&&(identical(other.waitlistCount, waitlistCount) || other.waitlistCount == waitlistCount)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.champion, champion) || other.champion == champion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,tournamentId,name,level,const DeepCollectionEquality().hash(_levels),gender,format,maxTeams,activeTeams,registrationFee,currency,requiresPayment,rankingWeight,isActive,isFull,waitlistCount,completedAt,champion);

@override
String toString() {
  return 'TournamentCategoryModel(id: $id, tournamentId: $tournamentId, name: $name, level: $level, levels: $levels, gender: $gender, format: $format, maxTeams: $maxTeams, activeTeams: $activeTeams, registrationFee: $registrationFee, currency: $currency, requiresPayment: $requiresPayment, rankingWeight: $rankingWeight, isActive: $isActive, isFull: $isFull, waitlistCount: $waitlistCount, completedAt: $completedAt, champion: $champion)';
}


}

/// @nodoc
abstract mixin class _$TournamentCategoryModelCopyWith<$Res> implements $TournamentCategoryModelCopyWith<$Res> {
  factory _$TournamentCategoryModelCopyWith(_TournamentCategoryModel value, $Res Function(_TournamentCategoryModel) _then) = __$TournamentCategoryModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'tournament_id') int? tournamentId, String name, String? level, List<String> levels, String? gender, String? format,@JsonKey(name: 'max_teams') int maxTeams,@JsonKey(name: 'active_teams') int activeTeams,@JsonKey(name: 'registration_fee') num registrationFee, String? currency,@JsonKey(name: 'requires_payment') bool requiresPayment,@JsonKey(name: 'ranking_weight') num? rankingWeight,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'is_full') bool isFull,@JsonKey(name: 'waitlist_count') int waitlistCount,@JsonKey(name: 'completed_at') DateTime? completedAt, MatchTeamModel? champion
});


@override $MatchTeamModelCopyWith<$Res>? get champion;

}
/// @nodoc
class __$TournamentCategoryModelCopyWithImpl<$Res>
    implements _$TournamentCategoryModelCopyWith<$Res> {
  __$TournamentCategoryModelCopyWithImpl(this._self, this._then);

  final _TournamentCategoryModel _self;
  final $Res Function(_TournamentCategoryModel) _then;

/// Create a copy of TournamentCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tournamentId = freezed,Object? name = null,Object? level = freezed,Object? levels = null,Object? gender = freezed,Object? format = freezed,Object? maxTeams = null,Object? activeTeams = null,Object? registrationFee = null,Object? currency = freezed,Object? requiresPayment = null,Object? rankingWeight = freezed,Object? isActive = null,Object? isFull = null,Object? waitlistCount = null,Object? completedAt = freezed,Object? champion = freezed,}) {
  return _then(_TournamentCategoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tournamentId: freezed == tournamentId ? _self.tournamentId : tournamentId // ignore: cast_nullable_to_non_nullable
as int?,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String?,levels: null == levels ? _self._levels : levels // ignore: cast_nullable_to_non_nullable
as List<String>,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String?,maxTeams: null == maxTeams ? _self.maxTeams : maxTeams // ignore: cast_nullable_to_non_nullable
as int,activeTeams: null == activeTeams ? _self.activeTeams : activeTeams // ignore: cast_nullable_to_non_nullable
as int,registrationFee: null == registrationFee ? _self.registrationFee : registrationFee // ignore: cast_nullable_to_non_nullable
as num,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,requiresPayment: null == requiresPayment ? _self.requiresPayment : requiresPayment // ignore: cast_nullable_to_non_nullable
as bool,rankingWeight: freezed == rankingWeight ? _self.rankingWeight : rankingWeight // ignore: cast_nullable_to_non_nullable
as num?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isFull: null == isFull ? _self.isFull : isFull // ignore: cast_nullable_to_non_nullable
as bool,waitlistCount: null == waitlistCount ? _self.waitlistCount : waitlistCount // ignore: cast_nullable_to_non_nullable
as int,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,champion: freezed == champion ? _self.champion : champion // ignore: cast_nullable_to_non_nullable
as MatchTeamModel?,
  ));
}

/// Create a copy of TournamentCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchTeamModelCopyWith<$Res>? get champion {
    if (_self.champion == null) {
    return null;
  }

  return $MatchTeamModelCopyWith<$Res>(_self.champion!, (value) {
    return _then(_self.copyWith(champion: value));
  });
}
}


/// @nodoc
mixin _$TournamentModel {

 int get id; String get name; String? get description; String? get rules;@JsonKey(name: 'image_url') String? get imageUrl; VenueModel? get venue;@JsonKey(name: 'start_date') DateTime get startDate;@JsonKey(name: 'end_date') DateTime get endDate;@JsonKey(name: 'registration_opens_at') DateTime? get registrationOpensAt;@JsonKey(name: 'registration_closes_at') DateTime? get registrationClosesAt;@JsonKey(name: 'completed_at') DateTime? get completedAt; String get status;@JsonKey(name: 'competition_type') String? get competitionType; String? get format;@JsonKey(name: 'certification_status') String? get certificationStatus;@JsonKey(name: 'is_ranking_eligible') bool get isRankingEligible;@JsonKey(name: 'registration_open') bool get registrationOpen;@JsonKey(name: 'live_matches_count') int get liveMatchesCount; List<TournamentCategoryModel> get categories;
/// Create a copy of TournamentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TournamentModelCopyWith<TournamentModel> get copyWith => _$TournamentModelCopyWithImpl<TournamentModel>(this as TournamentModel, _$identity);

  /// Serializes this TournamentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TournamentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.rules, rules) || other.rules == rules)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.registrationOpensAt, registrationOpensAt) || other.registrationOpensAt == registrationOpensAt)&&(identical(other.registrationClosesAt, registrationClosesAt) || other.registrationClosesAt == registrationClosesAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.competitionType, competitionType) || other.competitionType == competitionType)&&(identical(other.format, format) || other.format == format)&&(identical(other.certificationStatus, certificationStatus) || other.certificationStatus == certificationStatus)&&(identical(other.isRankingEligible, isRankingEligible) || other.isRankingEligible == isRankingEligible)&&(identical(other.registrationOpen, registrationOpen) || other.registrationOpen == registrationOpen)&&(identical(other.liveMatchesCount, liveMatchesCount) || other.liveMatchesCount == liveMatchesCount)&&const DeepCollectionEquality().equals(other.categories, categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,description,rules,imageUrl,venue,startDate,endDate,registrationOpensAt,registrationClosesAt,completedAt,status,competitionType,format,certificationStatus,isRankingEligible,registrationOpen,liveMatchesCount,const DeepCollectionEquality().hash(categories)]);

@override
String toString() {
  return 'TournamentModel(id: $id, name: $name, description: $description, rules: $rules, imageUrl: $imageUrl, venue: $venue, startDate: $startDate, endDate: $endDate, registrationOpensAt: $registrationOpensAt, registrationClosesAt: $registrationClosesAt, completedAt: $completedAt, status: $status, competitionType: $competitionType, format: $format, certificationStatus: $certificationStatus, isRankingEligible: $isRankingEligible, registrationOpen: $registrationOpen, liveMatchesCount: $liveMatchesCount, categories: $categories)';
}


}

/// @nodoc
abstract mixin class $TournamentModelCopyWith<$Res>  {
  factory $TournamentModelCopyWith(TournamentModel value, $Res Function(TournamentModel) _then) = _$TournamentModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? description, String? rules,@JsonKey(name: 'image_url') String? imageUrl, VenueModel? venue,@JsonKey(name: 'start_date') DateTime startDate,@JsonKey(name: 'end_date') DateTime endDate,@JsonKey(name: 'registration_opens_at') DateTime? registrationOpensAt,@JsonKey(name: 'registration_closes_at') DateTime? registrationClosesAt,@JsonKey(name: 'completed_at') DateTime? completedAt, String status,@JsonKey(name: 'competition_type') String? competitionType, String? format,@JsonKey(name: 'certification_status') String? certificationStatus,@JsonKey(name: 'is_ranking_eligible') bool isRankingEligible,@JsonKey(name: 'registration_open') bool registrationOpen,@JsonKey(name: 'live_matches_count') int liveMatchesCount, List<TournamentCategoryModel> categories
});


$VenueModelCopyWith<$Res>? get venue;

}
/// @nodoc
class _$TournamentModelCopyWithImpl<$Res>
    implements $TournamentModelCopyWith<$Res> {
  _$TournamentModelCopyWithImpl(this._self, this._then);

  final TournamentModel _self;
  final $Res Function(TournamentModel) _then;

/// Create a copy of TournamentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? rules = freezed,Object? imageUrl = freezed,Object? venue = freezed,Object? startDate = null,Object? endDate = null,Object? registrationOpensAt = freezed,Object? registrationClosesAt = freezed,Object? completedAt = freezed,Object? status = null,Object? competitionType = freezed,Object? format = freezed,Object? certificationStatus = freezed,Object? isRankingEligible = null,Object? registrationOpen = null,Object? liveMatchesCount = null,Object? categories = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,rules: freezed == rules ? _self.rules : rules // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,venue: freezed == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as VenueModel?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,registrationOpensAt: freezed == registrationOpensAt ? _self.registrationOpensAt : registrationOpensAt // ignore: cast_nullable_to_non_nullable
as DateTime?,registrationClosesAt: freezed == registrationClosesAt ? _self.registrationClosesAt : registrationClosesAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,competitionType: freezed == competitionType ? _self.competitionType : competitionType // ignore: cast_nullable_to_non_nullable
as String?,format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String?,certificationStatus: freezed == certificationStatus ? _self.certificationStatus : certificationStatus // ignore: cast_nullable_to_non_nullable
as String?,isRankingEligible: null == isRankingEligible ? _self.isRankingEligible : isRankingEligible // ignore: cast_nullable_to_non_nullable
as bool,registrationOpen: null == registrationOpen ? _self.registrationOpen : registrationOpen // ignore: cast_nullable_to_non_nullable
as bool,liveMatchesCount: null == liveMatchesCount ? _self.liveMatchesCount : liveMatchesCount // ignore: cast_nullable_to_non_nullable
as int,categories: null == categories ? _self.categories : categories // ignore: cast_nullable_to_non_nullable
as List<TournamentCategoryModel>,
  ));
}
/// Create a copy of TournamentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VenueModelCopyWith<$Res>? get venue {
    if (_self.venue == null) {
    return null;
  }

  return $VenueModelCopyWith<$Res>(_self.venue!, (value) {
    return _then(_self.copyWith(venue: value));
  });
}
}


/// Adds pattern-matching-related methods to [TournamentModel].
extension TournamentModelPatterns on TournamentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TournamentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TournamentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TournamentModel value)  $default,){
final _that = this;
switch (_that) {
case _TournamentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TournamentModel value)?  $default,){
final _that = this;
switch (_that) {
case _TournamentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? description,  String? rules, @JsonKey(name: 'image_url')  String? imageUrl,  VenueModel? venue, @JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'end_date')  DateTime endDate, @JsonKey(name: 'registration_opens_at')  DateTime? registrationOpensAt, @JsonKey(name: 'registration_closes_at')  DateTime? registrationClosesAt, @JsonKey(name: 'completed_at')  DateTime? completedAt,  String status, @JsonKey(name: 'competition_type')  String? competitionType,  String? format, @JsonKey(name: 'certification_status')  String? certificationStatus, @JsonKey(name: 'is_ranking_eligible')  bool isRankingEligible, @JsonKey(name: 'registration_open')  bool registrationOpen, @JsonKey(name: 'live_matches_count')  int liveMatchesCount,  List<TournamentCategoryModel> categories)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TournamentModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.rules,_that.imageUrl,_that.venue,_that.startDate,_that.endDate,_that.registrationOpensAt,_that.registrationClosesAt,_that.completedAt,_that.status,_that.competitionType,_that.format,_that.certificationStatus,_that.isRankingEligible,_that.registrationOpen,_that.liveMatchesCount,_that.categories);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? description,  String? rules, @JsonKey(name: 'image_url')  String? imageUrl,  VenueModel? venue, @JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'end_date')  DateTime endDate, @JsonKey(name: 'registration_opens_at')  DateTime? registrationOpensAt, @JsonKey(name: 'registration_closes_at')  DateTime? registrationClosesAt, @JsonKey(name: 'completed_at')  DateTime? completedAt,  String status, @JsonKey(name: 'competition_type')  String? competitionType,  String? format, @JsonKey(name: 'certification_status')  String? certificationStatus, @JsonKey(name: 'is_ranking_eligible')  bool isRankingEligible, @JsonKey(name: 'registration_open')  bool registrationOpen, @JsonKey(name: 'live_matches_count')  int liveMatchesCount,  List<TournamentCategoryModel> categories)  $default,) {final _that = this;
switch (_that) {
case _TournamentModel():
return $default(_that.id,_that.name,_that.description,_that.rules,_that.imageUrl,_that.venue,_that.startDate,_that.endDate,_that.registrationOpensAt,_that.registrationClosesAt,_that.completedAt,_that.status,_that.competitionType,_that.format,_that.certificationStatus,_that.isRankingEligible,_that.registrationOpen,_that.liveMatchesCount,_that.categories);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? description,  String? rules, @JsonKey(name: 'image_url')  String? imageUrl,  VenueModel? venue, @JsonKey(name: 'start_date')  DateTime startDate, @JsonKey(name: 'end_date')  DateTime endDate, @JsonKey(name: 'registration_opens_at')  DateTime? registrationOpensAt, @JsonKey(name: 'registration_closes_at')  DateTime? registrationClosesAt, @JsonKey(name: 'completed_at')  DateTime? completedAt,  String status, @JsonKey(name: 'competition_type')  String? competitionType,  String? format, @JsonKey(name: 'certification_status')  String? certificationStatus, @JsonKey(name: 'is_ranking_eligible')  bool isRankingEligible, @JsonKey(name: 'registration_open')  bool registrationOpen, @JsonKey(name: 'live_matches_count')  int liveMatchesCount,  List<TournamentCategoryModel> categories)?  $default,) {final _that = this;
switch (_that) {
case _TournamentModel() when $default != null:
return $default(_that.id,_that.name,_that.description,_that.rules,_that.imageUrl,_that.venue,_that.startDate,_that.endDate,_that.registrationOpensAt,_that.registrationClosesAt,_that.completedAt,_that.status,_that.competitionType,_that.format,_that.certificationStatus,_that.isRankingEligible,_that.registrationOpen,_that.liveMatchesCount,_that.categories);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TournamentModel implements TournamentModel {
  const _TournamentModel({required this.id, required this.name, this.description, this.rules, @JsonKey(name: 'image_url') this.imageUrl, this.venue, @JsonKey(name: 'start_date') required this.startDate, @JsonKey(name: 'end_date') required this.endDate, @JsonKey(name: 'registration_opens_at') this.registrationOpensAt, @JsonKey(name: 'registration_closes_at') this.registrationClosesAt, @JsonKey(name: 'completed_at') this.completedAt, required this.status, @JsonKey(name: 'competition_type') this.competitionType, this.format, @JsonKey(name: 'certification_status') this.certificationStatus, @JsonKey(name: 'is_ranking_eligible') this.isRankingEligible = false, @JsonKey(name: 'registration_open') this.registrationOpen = false, @JsonKey(name: 'live_matches_count') this.liveMatchesCount = 0, final  List<TournamentCategoryModel> categories = const []}): _categories = categories;
  factory _TournamentModel.fromJson(Map<String, dynamic> json) => _$TournamentModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? description;
@override final  String? rules;
@override@JsonKey(name: 'image_url') final  String? imageUrl;
@override final  VenueModel? venue;
@override@JsonKey(name: 'start_date') final  DateTime startDate;
@override@JsonKey(name: 'end_date') final  DateTime endDate;
@override@JsonKey(name: 'registration_opens_at') final  DateTime? registrationOpensAt;
@override@JsonKey(name: 'registration_closes_at') final  DateTime? registrationClosesAt;
@override@JsonKey(name: 'completed_at') final  DateTime? completedAt;
@override final  String status;
@override@JsonKey(name: 'competition_type') final  String? competitionType;
@override final  String? format;
@override@JsonKey(name: 'certification_status') final  String? certificationStatus;
@override@JsonKey(name: 'is_ranking_eligible') final  bool isRankingEligible;
@override@JsonKey(name: 'registration_open') final  bool registrationOpen;
@override@JsonKey(name: 'live_matches_count') final  int liveMatchesCount;
 final  List<TournamentCategoryModel> _categories;
@override@JsonKey() List<TournamentCategoryModel> get categories {
  if (_categories is EqualUnmodifiableListView) return _categories;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_categories);
}


/// Create a copy of TournamentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TournamentModelCopyWith<_TournamentModel> get copyWith => __$TournamentModelCopyWithImpl<_TournamentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TournamentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TournamentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.rules, rules) || other.rules == rules)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.startDate, startDate) || other.startDate == startDate)&&(identical(other.endDate, endDate) || other.endDate == endDate)&&(identical(other.registrationOpensAt, registrationOpensAt) || other.registrationOpensAt == registrationOpensAt)&&(identical(other.registrationClosesAt, registrationClosesAt) || other.registrationClosesAt == registrationClosesAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.status, status) || other.status == status)&&(identical(other.competitionType, competitionType) || other.competitionType == competitionType)&&(identical(other.format, format) || other.format == format)&&(identical(other.certificationStatus, certificationStatus) || other.certificationStatus == certificationStatus)&&(identical(other.isRankingEligible, isRankingEligible) || other.isRankingEligible == isRankingEligible)&&(identical(other.registrationOpen, registrationOpen) || other.registrationOpen == registrationOpen)&&(identical(other.liveMatchesCount, liveMatchesCount) || other.liveMatchesCount == liveMatchesCount)&&const DeepCollectionEquality().equals(other._categories, _categories));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,name,description,rules,imageUrl,venue,startDate,endDate,registrationOpensAt,registrationClosesAt,completedAt,status,competitionType,format,certificationStatus,isRankingEligible,registrationOpen,liveMatchesCount,const DeepCollectionEquality().hash(_categories)]);

@override
String toString() {
  return 'TournamentModel(id: $id, name: $name, description: $description, rules: $rules, imageUrl: $imageUrl, venue: $venue, startDate: $startDate, endDate: $endDate, registrationOpensAt: $registrationOpensAt, registrationClosesAt: $registrationClosesAt, completedAt: $completedAt, status: $status, competitionType: $competitionType, format: $format, certificationStatus: $certificationStatus, isRankingEligible: $isRankingEligible, registrationOpen: $registrationOpen, liveMatchesCount: $liveMatchesCount, categories: $categories)';
}


}

/// @nodoc
abstract mixin class _$TournamentModelCopyWith<$Res> implements $TournamentModelCopyWith<$Res> {
  factory _$TournamentModelCopyWith(_TournamentModel value, $Res Function(_TournamentModel) _then) = __$TournamentModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? description, String? rules,@JsonKey(name: 'image_url') String? imageUrl, VenueModel? venue,@JsonKey(name: 'start_date') DateTime startDate,@JsonKey(name: 'end_date') DateTime endDate,@JsonKey(name: 'registration_opens_at') DateTime? registrationOpensAt,@JsonKey(name: 'registration_closes_at') DateTime? registrationClosesAt,@JsonKey(name: 'completed_at') DateTime? completedAt, String status,@JsonKey(name: 'competition_type') String? competitionType, String? format,@JsonKey(name: 'certification_status') String? certificationStatus,@JsonKey(name: 'is_ranking_eligible') bool isRankingEligible,@JsonKey(name: 'registration_open') bool registrationOpen,@JsonKey(name: 'live_matches_count') int liveMatchesCount, List<TournamentCategoryModel> categories
});


@override $VenueModelCopyWith<$Res>? get venue;

}
/// @nodoc
class __$TournamentModelCopyWithImpl<$Res>
    implements _$TournamentModelCopyWith<$Res> {
  __$TournamentModelCopyWithImpl(this._self, this._then);

  final _TournamentModel _self;
  final $Res Function(_TournamentModel) _then;

/// Create a copy of TournamentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? description = freezed,Object? rules = freezed,Object? imageUrl = freezed,Object? venue = freezed,Object? startDate = null,Object? endDate = null,Object? registrationOpensAt = freezed,Object? registrationClosesAt = freezed,Object? completedAt = freezed,Object? status = null,Object? competitionType = freezed,Object? format = freezed,Object? certificationStatus = freezed,Object? isRankingEligible = null,Object? registrationOpen = null,Object? liveMatchesCount = null,Object? categories = null,}) {
  return _then(_TournamentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,rules: freezed == rules ? _self.rules : rules // ignore: cast_nullable_to_non_nullable
as String?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,venue: freezed == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as VenueModel?,startDate: null == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime,endDate: null == endDate ? _self.endDate : endDate // ignore: cast_nullable_to_non_nullable
as DateTime,registrationOpensAt: freezed == registrationOpensAt ? _self.registrationOpensAt : registrationOpensAt // ignore: cast_nullable_to_non_nullable
as DateTime?,registrationClosesAt: freezed == registrationClosesAt ? _self.registrationClosesAt : registrationClosesAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,competitionType: freezed == competitionType ? _self.competitionType : competitionType // ignore: cast_nullable_to_non_nullable
as String?,format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String?,certificationStatus: freezed == certificationStatus ? _self.certificationStatus : certificationStatus // ignore: cast_nullable_to_non_nullable
as String?,isRankingEligible: null == isRankingEligible ? _self.isRankingEligible : isRankingEligible // ignore: cast_nullable_to_non_nullable
as bool,registrationOpen: null == registrationOpen ? _self.registrationOpen : registrationOpen // ignore: cast_nullable_to_non_nullable
as bool,liveMatchesCount: null == liveMatchesCount ? _self.liveMatchesCount : liveMatchesCount // ignore: cast_nullable_to_non_nullable
as int,categories: null == categories ? _self._categories : categories // ignore: cast_nullable_to_non_nullable
as List<TournamentCategoryModel>,
  ));
}

/// Create a copy of TournamentModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$VenueModelCopyWith<$Res>? get venue {
    if (_self.venue == null) {
    return null;
  }

  return $VenueModelCopyWith<$Res>(_self.venue!, (value) {
    return _then(_self.copyWith(venue: value));
  });
}
}

// dart format on
