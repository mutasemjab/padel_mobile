// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'casual_match_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CasualParticipantModel {

 int get id; String get status; PlayerSummaryModel? get player;
/// Create a copy of CasualParticipantModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CasualParticipantModelCopyWith<CasualParticipantModel> get copyWith => _$CasualParticipantModelCopyWithImpl<CasualParticipantModel>(this as CasualParticipantModel, _$identity);

  /// Serializes this CasualParticipantModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CasualParticipantModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.player, player) || other.player == player));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,player);

@override
String toString() {
  return 'CasualParticipantModel(id: $id, status: $status, player: $player)';
}


}

/// @nodoc
abstract mixin class $CasualParticipantModelCopyWith<$Res>  {
  factory $CasualParticipantModelCopyWith(CasualParticipantModel value, $Res Function(CasualParticipantModel) _then) = _$CasualParticipantModelCopyWithImpl;
@useResult
$Res call({
 int id, String status, PlayerSummaryModel? player
});


$PlayerSummaryModelCopyWith<$Res>? get player;

}
/// @nodoc
class _$CasualParticipantModelCopyWithImpl<$Res>
    implements $CasualParticipantModelCopyWith<$Res> {
  _$CasualParticipantModelCopyWithImpl(this._self, this._then);

  final CasualParticipantModel _self;
  final $Res Function(CasualParticipantModel) _then;

/// Create a copy of CasualParticipantModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? player = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,player: freezed == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as PlayerSummaryModel?,
  ));
}
/// Create a copy of CasualParticipantModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerSummaryModelCopyWith<$Res>? get player {
    if (_self.player == null) {
    return null;
  }

  return $PlayerSummaryModelCopyWith<$Res>(_self.player!, (value) {
    return _then(_self.copyWith(player: value));
  });
}
}


/// Adds pattern-matching-related methods to [CasualParticipantModel].
extension CasualParticipantModelPatterns on CasualParticipantModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CasualParticipantModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CasualParticipantModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CasualParticipantModel value)  $default,){
final _that = this;
switch (_that) {
case _CasualParticipantModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CasualParticipantModel value)?  $default,){
final _that = this;
switch (_that) {
case _CasualParticipantModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String status,  PlayerSummaryModel? player)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CasualParticipantModel() when $default != null:
return $default(_that.id,_that.status,_that.player);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String status,  PlayerSummaryModel? player)  $default,) {final _that = this;
switch (_that) {
case _CasualParticipantModel():
return $default(_that.id,_that.status,_that.player);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String status,  PlayerSummaryModel? player)?  $default,) {final _that = this;
switch (_that) {
case _CasualParticipantModel() when $default != null:
return $default(_that.id,_that.status,_that.player);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CasualParticipantModel implements CasualParticipantModel {
  const _CasualParticipantModel({required this.id, this.status = 'requested', this.player});
  factory _CasualParticipantModel.fromJson(Map<String, dynamic> json) => _$CasualParticipantModelFromJson(json);

@override final  int id;
@override@JsonKey() final  String status;
@override final  PlayerSummaryModel? player;

/// Create a copy of CasualParticipantModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CasualParticipantModelCopyWith<_CasualParticipantModel> get copyWith => __$CasualParticipantModelCopyWithImpl<_CasualParticipantModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CasualParticipantModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CasualParticipantModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.player, player) || other.player == player));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,player);

@override
String toString() {
  return 'CasualParticipantModel(id: $id, status: $status, player: $player)';
}


}

/// @nodoc
abstract mixin class _$CasualParticipantModelCopyWith<$Res> implements $CasualParticipantModelCopyWith<$Res> {
  factory _$CasualParticipantModelCopyWith(_CasualParticipantModel value, $Res Function(_CasualParticipantModel) _then) = __$CasualParticipantModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String status, PlayerSummaryModel? player
});


@override $PlayerSummaryModelCopyWith<$Res>? get player;

}
/// @nodoc
class __$CasualParticipantModelCopyWithImpl<$Res>
    implements _$CasualParticipantModelCopyWith<$Res> {
  __$CasualParticipantModelCopyWithImpl(this._self, this._then);

  final _CasualParticipantModel _self;
  final $Res Function(_CasualParticipantModel) _then;

/// Create a copy of CasualParticipantModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? player = freezed,}) {
  return _then(_CasualParticipantModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,player: freezed == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as PlayerSummaryModel?,
  ));
}

/// Create a copy of CasualParticipantModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerSummaryModelCopyWith<$Res>? get player {
    if (_self.player == null) {
    return null;
  }

  return $PlayerSummaryModelCopyWith<$Res>(_self.player!, (value) {
    return _then(_self.copyWith(player: value));
  });
}
}


/// @nodoc
mixin _$CasualMatchModel {

 int get id; PlayerSummaryModel get creator; VenueModel? get venue; CourtModel? get court; String? get title;@JsonKey(name: 'has_custom_title') bool get hasCustomTitle;@JsonKey(name: 'cancel_reason') String? get cancelReason;@JsonKey(name: 'match_type') String get matchType;@JsonKey(name: 'scheduled_at') DateTime get scheduledAt;@JsonKey(name: 'required_level') String? get requiredLevel;@JsonKey(name: 'preferred_side') String? get preferredSide;@JsonKey(name: 'players_needed') int get playersNeeded;@JsonKey(name: 'accepted_count') int get acceptedCount;@JsonKey(name: 'spots_left') int? get spotsLeft; String get status; String? get notes;@JsonKey(name: 'is_creator') bool get isCreator;@JsonKey(name: 'my_participation') CasualParticipantModel? get myParticipation; List<CasualParticipantModel> get participants;
/// Create a copy of CasualMatchModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CasualMatchModelCopyWith<CasualMatchModel> get copyWith => _$CasualMatchModelCopyWithImpl<CasualMatchModel>(this as CasualMatchModel, _$identity);

  /// Serializes this CasualMatchModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CasualMatchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.creator, creator) || other.creator == creator)&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.court, court) || other.court == court)&&(identical(other.title, title) || other.title == title)&&(identical(other.hasCustomTitle, hasCustomTitle) || other.hasCustomTitle == hasCustomTitle)&&(identical(other.cancelReason, cancelReason) || other.cancelReason == cancelReason)&&(identical(other.matchType, matchType) || other.matchType == matchType)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.requiredLevel, requiredLevel) || other.requiredLevel == requiredLevel)&&(identical(other.preferredSide, preferredSide) || other.preferredSide == preferredSide)&&(identical(other.playersNeeded, playersNeeded) || other.playersNeeded == playersNeeded)&&(identical(other.acceptedCount, acceptedCount) || other.acceptedCount == acceptedCount)&&(identical(other.spotsLeft, spotsLeft) || other.spotsLeft == spotsLeft)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isCreator, isCreator) || other.isCreator == isCreator)&&(identical(other.myParticipation, myParticipation) || other.myParticipation == myParticipation)&&const DeepCollectionEquality().equals(other.participants, participants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,creator,venue,court,title,hasCustomTitle,cancelReason,matchType,scheduledAt,requiredLevel,preferredSide,playersNeeded,acceptedCount,spotsLeft,status,notes,isCreator,myParticipation,const DeepCollectionEquality().hash(participants)]);

@override
String toString() {
  return 'CasualMatchModel(id: $id, creator: $creator, venue: $venue, court: $court, title: $title, hasCustomTitle: $hasCustomTitle, cancelReason: $cancelReason, matchType: $matchType, scheduledAt: $scheduledAt, requiredLevel: $requiredLevel, preferredSide: $preferredSide, playersNeeded: $playersNeeded, acceptedCount: $acceptedCount, spotsLeft: $spotsLeft, status: $status, notes: $notes, isCreator: $isCreator, myParticipation: $myParticipation, participants: $participants)';
}


}

/// @nodoc
abstract mixin class $CasualMatchModelCopyWith<$Res>  {
  factory $CasualMatchModelCopyWith(CasualMatchModel value, $Res Function(CasualMatchModel) _then) = _$CasualMatchModelCopyWithImpl;
@useResult
$Res call({
 int id, PlayerSummaryModel creator, VenueModel? venue, CourtModel? court, String? title,@JsonKey(name: 'has_custom_title') bool hasCustomTitle,@JsonKey(name: 'cancel_reason') String? cancelReason,@JsonKey(name: 'match_type') String matchType,@JsonKey(name: 'scheduled_at') DateTime scheduledAt,@JsonKey(name: 'required_level') String? requiredLevel,@JsonKey(name: 'preferred_side') String? preferredSide,@JsonKey(name: 'players_needed') int playersNeeded,@JsonKey(name: 'accepted_count') int acceptedCount,@JsonKey(name: 'spots_left') int? spotsLeft, String status, String? notes,@JsonKey(name: 'is_creator') bool isCreator,@JsonKey(name: 'my_participation') CasualParticipantModel? myParticipation, List<CasualParticipantModel> participants
});


$PlayerSummaryModelCopyWith<$Res> get creator;$VenueModelCopyWith<$Res>? get venue;$CourtModelCopyWith<$Res>? get court;$CasualParticipantModelCopyWith<$Res>? get myParticipation;

}
/// @nodoc
class _$CasualMatchModelCopyWithImpl<$Res>
    implements $CasualMatchModelCopyWith<$Res> {
  _$CasualMatchModelCopyWithImpl(this._self, this._then);

  final CasualMatchModel _self;
  final $Res Function(CasualMatchModel) _then;

/// Create a copy of CasualMatchModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? creator = null,Object? venue = freezed,Object? court = freezed,Object? title = freezed,Object? hasCustomTitle = null,Object? cancelReason = freezed,Object? matchType = null,Object? scheduledAt = null,Object? requiredLevel = freezed,Object? preferredSide = freezed,Object? playersNeeded = null,Object? acceptedCount = null,Object? spotsLeft = freezed,Object? status = null,Object? notes = freezed,Object? isCreator = null,Object? myParticipation = freezed,Object? participants = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,creator: null == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as PlayerSummaryModel,venue: freezed == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as VenueModel?,court: freezed == court ? _self.court : court // ignore: cast_nullable_to_non_nullable
as CourtModel?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,hasCustomTitle: null == hasCustomTitle ? _self.hasCustomTitle : hasCustomTitle // ignore: cast_nullable_to_non_nullable
as bool,cancelReason: freezed == cancelReason ? _self.cancelReason : cancelReason // ignore: cast_nullable_to_non_nullable
as String?,matchType: null == matchType ? _self.matchType : matchType // ignore: cast_nullable_to_non_nullable
as String,scheduledAt: null == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime,requiredLevel: freezed == requiredLevel ? _self.requiredLevel : requiredLevel // ignore: cast_nullable_to_non_nullable
as String?,preferredSide: freezed == preferredSide ? _self.preferredSide : preferredSide // ignore: cast_nullable_to_non_nullable
as String?,playersNeeded: null == playersNeeded ? _self.playersNeeded : playersNeeded // ignore: cast_nullable_to_non_nullable
as int,acceptedCount: null == acceptedCount ? _self.acceptedCount : acceptedCount // ignore: cast_nullable_to_non_nullable
as int,spotsLeft: freezed == spotsLeft ? _self.spotsLeft : spotsLeft // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,isCreator: null == isCreator ? _self.isCreator : isCreator // ignore: cast_nullable_to_non_nullable
as bool,myParticipation: freezed == myParticipation ? _self.myParticipation : myParticipation // ignore: cast_nullable_to_non_nullable
as CasualParticipantModel?,participants: null == participants ? _self.participants : participants // ignore: cast_nullable_to_non_nullable
as List<CasualParticipantModel>,
  ));
}
/// Create a copy of CasualMatchModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerSummaryModelCopyWith<$Res> get creator {
  
  return $PlayerSummaryModelCopyWith<$Res>(_self.creator, (value) {
    return _then(_self.copyWith(creator: value));
  });
}/// Create a copy of CasualMatchModel
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
}/// Create a copy of CasualMatchModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CourtModelCopyWith<$Res>? get court {
    if (_self.court == null) {
    return null;
  }

  return $CourtModelCopyWith<$Res>(_self.court!, (value) {
    return _then(_self.copyWith(court: value));
  });
}/// Create a copy of CasualMatchModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CasualParticipantModelCopyWith<$Res>? get myParticipation {
    if (_self.myParticipation == null) {
    return null;
  }

  return $CasualParticipantModelCopyWith<$Res>(_self.myParticipation!, (value) {
    return _then(_self.copyWith(myParticipation: value));
  });
}
}


/// Adds pattern-matching-related methods to [CasualMatchModel].
extension CasualMatchModelPatterns on CasualMatchModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CasualMatchModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CasualMatchModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CasualMatchModel value)  $default,){
final _that = this;
switch (_that) {
case _CasualMatchModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CasualMatchModel value)?  $default,){
final _that = this;
switch (_that) {
case _CasualMatchModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  PlayerSummaryModel creator,  VenueModel? venue,  CourtModel? court,  String? title, @JsonKey(name: 'has_custom_title')  bool hasCustomTitle, @JsonKey(name: 'cancel_reason')  String? cancelReason, @JsonKey(name: 'match_type')  String matchType, @JsonKey(name: 'scheduled_at')  DateTime scheduledAt, @JsonKey(name: 'required_level')  String? requiredLevel, @JsonKey(name: 'preferred_side')  String? preferredSide, @JsonKey(name: 'players_needed')  int playersNeeded, @JsonKey(name: 'accepted_count')  int acceptedCount, @JsonKey(name: 'spots_left')  int? spotsLeft,  String status,  String? notes, @JsonKey(name: 'is_creator')  bool isCreator, @JsonKey(name: 'my_participation')  CasualParticipantModel? myParticipation,  List<CasualParticipantModel> participants)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CasualMatchModel() when $default != null:
return $default(_that.id,_that.creator,_that.venue,_that.court,_that.title,_that.hasCustomTitle,_that.cancelReason,_that.matchType,_that.scheduledAt,_that.requiredLevel,_that.preferredSide,_that.playersNeeded,_that.acceptedCount,_that.spotsLeft,_that.status,_that.notes,_that.isCreator,_that.myParticipation,_that.participants);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  PlayerSummaryModel creator,  VenueModel? venue,  CourtModel? court,  String? title, @JsonKey(name: 'has_custom_title')  bool hasCustomTitle, @JsonKey(name: 'cancel_reason')  String? cancelReason, @JsonKey(name: 'match_type')  String matchType, @JsonKey(name: 'scheduled_at')  DateTime scheduledAt, @JsonKey(name: 'required_level')  String? requiredLevel, @JsonKey(name: 'preferred_side')  String? preferredSide, @JsonKey(name: 'players_needed')  int playersNeeded, @JsonKey(name: 'accepted_count')  int acceptedCount, @JsonKey(name: 'spots_left')  int? spotsLeft,  String status,  String? notes, @JsonKey(name: 'is_creator')  bool isCreator, @JsonKey(name: 'my_participation')  CasualParticipantModel? myParticipation,  List<CasualParticipantModel> participants)  $default,) {final _that = this;
switch (_that) {
case _CasualMatchModel():
return $default(_that.id,_that.creator,_that.venue,_that.court,_that.title,_that.hasCustomTitle,_that.cancelReason,_that.matchType,_that.scheduledAt,_that.requiredLevel,_that.preferredSide,_that.playersNeeded,_that.acceptedCount,_that.spotsLeft,_that.status,_that.notes,_that.isCreator,_that.myParticipation,_that.participants);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  PlayerSummaryModel creator,  VenueModel? venue,  CourtModel? court,  String? title, @JsonKey(name: 'has_custom_title')  bool hasCustomTitle, @JsonKey(name: 'cancel_reason')  String? cancelReason, @JsonKey(name: 'match_type')  String matchType, @JsonKey(name: 'scheduled_at')  DateTime scheduledAt, @JsonKey(name: 'required_level')  String? requiredLevel, @JsonKey(name: 'preferred_side')  String? preferredSide, @JsonKey(name: 'players_needed')  int playersNeeded, @JsonKey(name: 'accepted_count')  int acceptedCount, @JsonKey(name: 'spots_left')  int? spotsLeft,  String status,  String? notes, @JsonKey(name: 'is_creator')  bool isCreator, @JsonKey(name: 'my_participation')  CasualParticipantModel? myParticipation,  List<CasualParticipantModel> participants)?  $default,) {final _that = this;
switch (_that) {
case _CasualMatchModel() when $default != null:
return $default(_that.id,_that.creator,_that.venue,_that.court,_that.title,_that.hasCustomTitle,_that.cancelReason,_that.matchType,_that.scheduledAt,_that.requiredLevel,_that.preferredSide,_that.playersNeeded,_that.acceptedCount,_that.spotsLeft,_that.status,_that.notes,_that.isCreator,_that.myParticipation,_that.participants);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CasualMatchModel implements CasualMatchModel {
  const _CasualMatchModel({required this.id, required this.creator, this.venue, this.court, this.title, @JsonKey(name: 'has_custom_title') this.hasCustomTitle = false, @JsonKey(name: 'cancel_reason') this.cancelReason, @JsonKey(name: 'match_type') required this.matchType, @JsonKey(name: 'scheduled_at') required this.scheduledAt, @JsonKey(name: 'required_level') this.requiredLevel, @JsonKey(name: 'preferred_side') this.preferredSide, @JsonKey(name: 'players_needed') this.playersNeeded = 0, @JsonKey(name: 'accepted_count') this.acceptedCount = 0, @JsonKey(name: 'spots_left') this.spotsLeft, this.status = 'open', this.notes, @JsonKey(name: 'is_creator') this.isCreator = false, @JsonKey(name: 'my_participation') this.myParticipation, final  List<CasualParticipantModel> participants = const []}): _participants = participants;
  factory _CasualMatchModel.fromJson(Map<String, dynamic> json) => _$CasualMatchModelFromJson(json);

@override final  int id;
@override final  PlayerSummaryModel creator;
@override final  VenueModel? venue;
@override final  CourtModel? court;
@override final  String? title;
@override@JsonKey(name: 'has_custom_title') final  bool hasCustomTitle;
@override@JsonKey(name: 'cancel_reason') final  String? cancelReason;
@override@JsonKey(name: 'match_type') final  String matchType;
@override@JsonKey(name: 'scheduled_at') final  DateTime scheduledAt;
@override@JsonKey(name: 'required_level') final  String? requiredLevel;
@override@JsonKey(name: 'preferred_side') final  String? preferredSide;
@override@JsonKey(name: 'players_needed') final  int playersNeeded;
@override@JsonKey(name: 'accepted_count') final  int acceptedCount;
@override@JsonKey(name: 'spots_left') final  int? spotsLeft;
@override@JsonKey() final  String status;
@override final  String? notes;
@override@JsonKey(name: 'is_creator') final  bool isCreator;
@override@JsonKey(name: 'my_participation') final  CasualParticipantModel? myParticipation;
 final  List<CasualParticipantModel> _participants;
@override@JsonKey() List<CasualParticipantModel> get participants {
  if (_participants is EqualUnmodifiableListView) return _participants;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_participants);
}


/// Create a copy of CasualMatchModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CasualMatchModelCopyWith<_CasualMatchModel> get copyWith => __$CasualMatchModelCopyWithImpl<_CasualMatchModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CasualMatchModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CasualMatchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.creator, creator) || other.creator == creator)&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.court, court) || other.court == court)&&(identical(other.title, title) || other.title == title)&&(identical(other.hasCustomTitle, hasCustomTitle) || other.hasCustomTitle == hasCustomTitle)&&(identical(other.cancelReason, cancelReason) || other.cancelReason == cancelReason)&&(identical(other.matchType, matchType) || other.matchType == matchType)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.requiredLevel, requiredLevel) || other.requiredLevel == requiredLevel)&&(identical(other.preferredSide, preferredSide) || other.preferredSide == preferredSide)&&(identical(other.playersNeeded, playersNeeded) || other.playersNeeded == playersNeeded)&&(identical(other.acceptedCount, acceptedCount) || other.acceptedCount == acceptedCount)&&(identical(other.spotsLeft, spotsLeft) || other.spotsLeft == spotsLeft)&&(identical(other.status, status) || other.status == status)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.isCreator, isCreator) || other.isCreator == isCreator)&&(identical(other.myParticipation, myParticipation) || other.myParticipation == myParticipation)&&const DeepCollectionEquality().equals(other._participants, _participants));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,creator,venue,court,title,hasCustomTitle,cancelReason,matchType,scheduledAt,requiredLevel,preferredSide,playersNeeded,acceptedCount,spotsLeft,status,notes,isCreator,myParticipation,const DeepCollectionEquality().hash(_participants)]);

@override
String toString() {
  return 'CasualMatchModel(id: $id, creator: $creator, venue: $venue, court: $court, title: $title, hasCustomTitle: $hasCustomTitle, cancelReason: $cancelReason, matchType: $matchType, scheduledAt: $scheduledAt, requiredLevel: $requiredLevel, preferredSide: $preferredSide, playersNeeded: $playersNeeded, acceptedCount: $acceptedCount, spotsLeft: $spotsLeft, status: $status, notes: $notes, isCreator: $isCreator, myParticipation: $myParticipation, participants: $participants)';
}


}

/// @nodoc
abstract mixin class _$CasualMatchModelCopyWith<$Res> implements $CasualMatchModelCopyWith<$Res> {
  factory _$CasualMatchModelCopyWith(_CasualMatchModel value, $Res Function(_CasualMatchModel) _then) = __$CasualMatchModelCopyWithImpl;
@override @useResult
$Res call({
 int id, PlayerSummaryModel creator, VenueModel? venue, CourtModel? court, String? title,@JsonKey(name: 'has_custom_title') bool hasCustomTitle,@JsonKey(name: 'cancel_reason') String? cancelReason,@JsonKey(name: 'match_type') String matchType,@JsonKey(name: 'scheduled_at') DateTime scheduledAt,@JsonKey(name: 'required_level') String? requiredLevel,@JsonKey(name: 'preferred_side') String? preferredSide,@JsonKey(name: 'players_needed') int playersNeeded,@JsonKey(name: 'accepted_count') int acceptedCount,@JsonKey(name: 'spots_left') int? spotsLeft, String status, String? notes,@JsonKey(name: 'is_creator') bool isCreator,@JsonKey(name: 'my_participation') CasualParticipantModel? myParticipation, List<CasualParticipantModel> participants
});


@override $PlayerSummaryModelCopyWith<$Res> get creator;@override $VenueModelCopyWith<$Res>? get venue;@override $CourtModelCopyWith<$Res>? get court;@override $CasualParticipantModelCopyWith<$Res>? get myParticipation;

}
/// @nodoc
class __$CasualMatchModelCopyWithImpl<$Res>
    implements _$CasualMatchModelCopyWith<$Res> {
  __$CasualMatchModelCopyWithImpl(this._self, this._then);

  final _CasualMatchModel _self;
  final $Res Function(_CasualMatchModel) _then;

/// Create a copy of CasualMatchModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? creator = null,Object? venue = freezed,Object? court = freezed,Object? title = freezed,Object? hasCustomTitle = null,Object? cancelReason = freezed,Object? matchType = null,Object? scheduledAt = null,Object? requiredLevel = freezed,Object? preferredSide = freezed,Object? playersNeeded = null,Object? acceptedCount = null,Object? spotsLeft = freezed,Object? status = null,Object? notes = freezed,Object? isCreator = null,Object? myParticipation = freezed,Object? participants = null,}) {
  return _then(_CasualMatchModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,creator: null == creator ? _self.creator : creator // ignore: cast_nullable_to_non_nullable
as PlayerSummaryModel,venue: freezed == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as VenueModel?,court: freezed == court ? _self.court : court // ignore: cast_nullable_to_non_nullable
as CourtModel?,title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,hasCustomTitle: null == hasCustomTitle ? _self.hasCustomTitle : hasCustomTitle // ignore: cast_nullable_to_non_nullable
as bool,cancelReason: freezed == cancelReason ? _self.cancelReason : cancelReason // ignore: cast_nullable_to_non_nullable
as String?,matchType: null == matchType ? _self.matchType : matchType // ignore: cast_nullable_to_non_nullable
as String,scheduledAt: null == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime,requiredLevel: freezed == requiredLevel ? _self.requiredLevel : requiredLevel // ignore: cast_nullable_to_non_nullable
as String?,preferredSide: freezed == preferredSide ? _self.preferredSide : preferredSide // ignore: cast_nullable_to_non_nullable
as String?,playersNeeded: null == playersNeeded ? _self.playersNeeded : playersNeeded // ignore: cast_nullable_to_non_nullable
as int,acceptedCount: null == acceptedCount ? _self.acceptedCount : acceptedCount // ignore: cast_nullable_to_non_nullable
as int,spotsLeft: freezed == spotsLeft ? _self.spotsLeft : spotsLeft // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,isCreator: null == isCreator ? _self.isCreator : isCreator // ignore: cast_nullable_to_non_nullable
as bool,myParticipation: freezed == myParticipation ? _self.myParticipation : myParticipation // ignore: cast_nullable_to_non_nullable
as CasualParticipantModel?,participants: null == participants ? _self._participants : participants // ignore: cast_nullable_to_non_nullable
as List<CasualParticipantModel>,
  ));
}

/// Create a copy of CasualMatchModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerSummaryModelCopyWith<$Res> get creator {
  
  return $PlayerSummaryModelCopyWith<$Res>(_self.creator, (value) {
    return _then(_self.copyWith(creator: value));
  });
}/// Create a copy of CasualMatchModel
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
}/// Create a copy of CasualMatchModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CourtModelCopyWith<$Res>? get court {
    if (_self.court == null) {
    return null;
  }

  return $CourtModelCopyWith<$Res>(_self.court!, (value) {
    return _then(_self.copyWith(court: value));
  });
}/// Create a copy of CasualMatchModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CasualParticipantModelCopyWith<$Res>? get myParticipation {
    if (_self.myParticipation == null) {
    return null;
  }

  return $CasualParticipantModelCopyWith<$Res>(_self.myParticipation!, (value) {
    return _then(_self.copyWith(myParticipation: value));
  });
}
}

// dart format on
