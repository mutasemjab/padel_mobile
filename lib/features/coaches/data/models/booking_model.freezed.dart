// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'booking_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$TrainingProgressModel {

 int get id; String get skill;@JsonKey(name: 'skill_label') String? get skillLabel; int get score; String? get notes;@JsonKey(name: 'booking_id') int? get bookingId; Map<String, dynamic>? get coach;@JsonKey(name: 'recorded_at') DateTime? get recordedAt;
/// Create a copy of TrainingProgressModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TrainingProgressModelCopyWith<TrainingProgressModel> get copyWith => _$TrainingProgressModelCopyWithImpl<TrainingProgressModel>(this as TrainingProgressModel, _$identity);

  /// Serializes this TrainingProgressModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TrainingProgressModel&&(identical(other.id, id) || other.id == id)&&(identical(other.skill, skill) || other.skill == skill)&&(identical(other.skillLabel, skillLabel) || other.skillLabel == skillLabel)&&(identical(other.score, score) || other.score == score)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId)&&const DeepCollectionEquality().equals(other.coach, coach)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,skill,skillLabel,score,notes,bookingId,const DeepCollectionEquality().hash(coach),recordedAt);

@override
String toString() {
  return 'TrainingProgressModel(id: $id, skill: $skill, skillLabel: $skillLabel, score: $score, notes: $notes, bookingId: $bookingId, coach: $coach, recordedAt: $recordedAt)';
}


}

/// @nodoc
abstract mixin class $TrainingProgressModelCopyWith<$Res>  {
  factory $TrainingProgressModelCopyWith(TrainingProgressModel value, $Res Function(TrainingProgressModel) _then) = _$TrainingProgressModelCopyWithImpl;
@useResult
$Res call({
 int id, String skill,@JsonKey(name: 'skill_label') String? skillLabel, int score, String? notes,@JsonKey(name: 'booking_id') int? bookingId, Map<String, dynamic>? coach,@JsonKey(name: 'recorded_at') DateTime? recordedAt
});




}
/// @nodoc
class _$TrainingProgressModelCopyWithImpl<$Res>
    implements $TrainingProgressModelCopyWith<$Res> {
  _$TrainingProgressModelCopyWithImpl(this._self, this._then);

  final TrainingProgressModel _self;
  final $Res Function(TrainingProgressModel) _then;

/// Create a copy of TrainingProgressModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? skill = null,Object? skillLabel = freezed,Object? score = null,Object? notes = freezed,Object? bookingId = freezed,Object? coach = freezed,Object? recordedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,skill: null == skill ? _self.skill : skill // ignore: cast_nullable_to_non_nullable
as String,skillLabel: freezed == skillLabel ? _self.skillLabel : skillLabel // ignore: cast_nullable_to_non_nullable
as String?,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,bookingId: freezed == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as int?,coach: freezed == coach ? _self.coach : coach // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,recordedAt: freezed == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [TrainingProgressModel].
extension TrainingProgressModelPatterns on TrainingProgressModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _TrainingProgressModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _TrainingProgressModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _TrainingProgressModel value)  $default,){
final _that = this;
switch (_that) {
case _TrainingProgressModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _TrainingProgressModel value)?  $default,){
final _that = this;
switch (_that) {
case _TrainingProgressModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String skill, @JsonKey(name: 'skill_label')  String? skillLabel,  int score,  String? notes, @JsonKey(name: 'booking_id')  int? bookingId,  Map<String, dynamic>? coach, @JsonKey(name: 'recorded_at')  DateTime? recordedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _TrainingProgressModel() when $default != null:
return $default(_that.id,_that.skill,_that.skillLabel,_that.score,_that.notes,_that.bookingId,_that.coach,_that.recordedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String skill, @JsonKey(name: 'skill_label')  String? skillLabel,  int score,  String? notes, @JsonKey(name: 'booking_id')  int? bookingId,  Map<String, dynamic>? coach, @JsonKey(name: 'recorded_at')  DateTime? recordedAt)  $default,) {final _that = this;
switch (_that) {
case _TrainingProgressModel():
return $default(_that.id,_that.skill,_that.skillLabel,_that.score,_that.notes,_that.bookingId,_that.coach,_that.recordedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String skill, @JsonKey(name: 'skill_label')  String? skillLabel,  int score,  String? notes, @JsonKey(name: 'booking_id')  int? bookingId,  Map<String, dynamic>? coach, @JsonKey(name: 'recorded_at')  DateTime? recordedAt)?  $default,) {final _that = this;
switch (_that) {
case _TrainingProgressModel() when $default != null:
return $default(_that.id,_that.skill,_that.skillLabel,_that.score,_that.notes,_that.bookingId,_that.coach,_that.recordedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _TrainingProgressModel implements TrainingProgressModel {
  const _TrainingProgressModel({required this.id, required this.skill, @JsonKey(name: 'skill_label') this.skillLabel, this.score = 0, this.notes, @JsonKey(name: 'booking_id') this.bookingId, final  Map<String, dynamic>? coach, @JsonKey(name: 'recorded_at') this.recordedAt}): _coach = coach;
  factory _TrainingProgressModel.fromJson(Map<String, dynamic> json) => _$TrainingProgressModelFromJson(json);

@override final  int id;
@override final  String skill;
@override@JsonKey(name: 'skill_label') final  String? skillLabel;
@override@JsonKey() final  int score;
@override final  String? notes;
@override@JsonKey(name: 'booking_id') final  int? bookingId;
 final  Map<String, dynamic>? _coach;
@override Map<String, dynamic>? get coach {
  final value = _coach;
  if (value == null) return null;
  if (_coach is EqualUnmodifiableMapView) return _coach;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey(name: 'recorded_at') final  DateTime? recordedAt;

/// Create a copy of TrainingProgressModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$TrainingProgressModelCopyWith<_TrainingProgressModel> get copyWith => __$TrainingProgressModelCopyWithImpl<_TrainingProgressModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$TrainingProgressModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _TrainingProgressModel&&(identical(other.id, id) || other.id == id)&&(identical(other.skill, skill) || other.skill == skill)&&(identical(other.skillLabel, skillLabel) || other.skillLabel == skillLabel)&&(identical(other.score, score) || other.score == score)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.bookingId, bookingId) || other.bookingId == bookingId)&&const DeepCollectionEquality().equals(other._coach, _coach)&&(identical(other.recordedAt, recordedAt) || other.recordedAt == recordedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,skill,skillLabel,score,notes,bookingId,const DeepCollectionEquality().hash(_coach),recordedAt);

@override
String toString() {
  return 'TrainingProgressModel(id: $id, skill: $skill, skillLabel: $skillLabel, score: $score, notes: $notes, bookingId: $bookingId, coach: $coach, recordedAt: $recordedAt)';
}


}

/// @nodoc
abstract mixin class _$TrainingProgressModelCopyWith<$Res> implements $TrainingProgressModelCopyWith<$Res> {
  factory _$TrainingProgressModelCopyWith(_TrainingProgressModel value, $Res Function(_TrainingProgressModel) _then) = __$TrainingProgressModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String skill,@JsonKey(name: 'skill_label') String? skillLabel, int score, String? notes,@JsonKey(name: 'booking_id') int? bookingId, Map<String, dynamic>? coach,@JsonKey(name: 'recorded_at') DateTime? recordedAt
});




}
/// @nodoc
class __$TrainingProgressModelCopyWithImpl<$Res>
    implements _$TrainingProgressModelCopyWith<$Res> {
  __$TrainingProgressModelCopyWithImpl(this._self, this._then);

  final _TrainingProgressModel _self;
  final $Res Function(_TrainingProgressModel) _then;

/// Create a copy of TrainingProgressModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? skill = null,Object? skillLabel = freezed,Object? score = null,Object? notes = freezed,Object? bookingId = freezed,Object? coach = freezed,Object? recordedAt = freezed,}) {
  return _then(_TrainingProgressModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,skill: null == skill ? _self.skill : skill // ignore: cast_nullable_to_non_nullable
as String,skillLabel: freezed == skillLabel ? _self.skillLabel : skillLabel // ignore: cast_nullable_to_non_nullable
as String?,score: null == score ? _self.score : score // ignore: cast_nullable_to_non_nullable
as int,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,bookingId: freezed == bookingId ? _self.bookingId : bookingId // ignore: cast_nullable_to_non_nullable
as int?,coach: freezed == coach ? _self._coach : coach // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,recordedAt: freezed == recordedAt ? _self.recordedAt : recordedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$BookingModel {

 int get id; String get status;@JsonKey(name: 'scheduled_at') DateTime? get scheduledAt;@JsonKey(name: 'duration_minutes') int get durationMinutes; String? get location;@JsonKey(name: 'training_type') String? get trainingType; num? get price; String? get currency; String? get notes; String? get feedback;@JsonKey(name: 'xp_awarded') int? get xpAwarded; Map<String, dynamic> get coach; PlayerSummaryModel? get player;@JsonKey(name: 'availability_id') int? get availabilityId;@JsonKey(name: 'confirmed_at') DateTime? get confirmedAt;@JsonKey(name: 'completed_at') DateTime? get completedAt;@JsonKey(name: 'cancelled_at') DateTime? get cancelledAt;@JsonKey(name: 'cancelled_by') String? get cancelledBy;@JsonKey(name: 'cancellation_reason') String? get cancellationReason;@JsonKey(name: 'rejection_reason') String? get rejectionReason;@JsonKey(name: 'can_cancel') bool get canCancel;@JsonKey(name: 'can_review') bool get canReview; Map<String, dynamic>? get review; List<TrainingProgressModel> get progress;@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of BookingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookingModelCopyWith<BookingModel> get copyWith => _$BookingModelCopyWithImpl<BookingModel>(this as BookingModel, _$identity);

  /// Serializes this BookingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookingModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.location, location) || other.location == location)&&(identical(other.trainingType, trainingType) || other.trainingType == trainingType)&&(identical(other.price, price) || other.price == price)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.feedback, feedback) || other.feedback == feedback)&&(identical(other.xpAwarded, xpAwarded) || other.xpAwarded == xpAwarded)&&const DeepCollectionEquality().equals(other.coach, coach)&&(identical(other.player, player) || other.player == player)&&(identical(other.availabilityId, availabilityId) || other.availabilityId == availabilityId)&&(identical(other.confirmedAt, confirmedAt) || other.confirmedAt == confirmedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&(identical(other.cancelledBy, cancelledBy) || other.cancelledBy == cancelledBy)&&(identical(other.cancellationReason, cancellationReason) || other.cancellationReason == cancellationReason)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.canCancel, canCancel) || other.canCancel == canCancel)&&(identical(other.canReview, canReview) || other.canReview == canReview)&&const DeepCollectionEquality().equals(other.review, review)&&const DeepCollectionEquality().equals(other.progress, progress)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,status,scheduledAt,durationMinutes,location,trainingType,price,currency,notes,feedback,xpAwarded,const DeepCollectionEquality().hash(coach),player,availabilityId,confirmedAt,completedAt,cancelledAt,cancelledBy,cancellationReason,rejectionReason,canCancel,canReview,const DeepCollectionEquality().hash(review),const DeepCollectionEquality().hash(progress),createdAt]);

@override
String toString() {
  return 'BookingModel(id: $id, status: $status, scheduledAt: $scheduledAt, durationMinutes: $durationMinutes, location: $location, trainingType: $trainingType, price: $price, currency: $currency, notes: $notes, feedback: $feedback, xpAwarded: $xpAwarded, coach: $coach, player: $player, availabilityId: $availabilityId, confirmedAt: $confirmedAt, completedAt: $completedAt, cancelledAt: $cancelledAt, cancelledBy: $cancelledBy, cancellationReason: $cancellationReason, rejectionReason: $rejectionReason, canCancel: $canCancel, canReview: $canReview, review: $review, progress: $progress, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $BookingModelCopyWith<$Res>  {
  factory $BookingModelCopyWith(BookingModel value, $Res Function(BookingModel) _then) = _$BookingModelCopyWithImpl;
@useResult
$Res call({
 int id, String status,@JsonKey(name: 'scheduled_at') DateTime? scheduledAt,@JsonKey(name: 'duration_minutes') int durationMinutes, String? location,@JsonKey(name: 'training_type') String? trainingType, num? price, String? currency, String? notes, String? feedback,@JsonKey(name: 'xp_awarded') int? xpAwarded, Map<String, dynamic> coach, PlayerSummaryModel? player,@JsonKey(name: 'availability_id') int? availabilityId,@JsonKey(name: 'confirmed_at') DateTime? confirmedAt,@JsonKey(name: 'completed_at') DateTime? completedAt,@JsonKey(name: 'cancelled_at') DateTime? cancelledAt,@JsonKey(name: 'cancelled_by') String? cancelledBy,@JsonKey(name: 'cancellation_reason') String? cancellationReason,@JsonKey(name: 'rejection_reason') String? rejectionReason,@JsonKey(name: 'can_cancel') bool canCancel,@JsonKey(name: 'can_review') bool canReview, Map<String, dynamic>? review, List<TrainingProgressModel> progress,@JsonKey(name: 'created_at') DateTime? createdAt
});


$PlayerSummaryModelCopyWith<$Res>? get player;

}
/// @nodoc
class _$BookingModelCopyWithImpl<$Res>
    implements $BookingModelCopyWith<$Res> {
  _$BookingModelCopyWithImpl(this._self, this._then);

  final BookingModel _self;
  final $Res Function(BookingModel) _then;

/// Create a copy of BookingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? scheduledAt = freezed,Object? durationMinutes = null,Object? location = freezed,Object? trainingType = freezed,Object? price = freezed,Object? currency = freezed,Object? notes = freezed,Object? feedback = freezed,Object? xpAwarded = freezed,Object? coach = null,Object? player = freezed,Object? availabilityId = freezed,Object? confirmedAt = freezed,Object? completedAt = freezed,Object? cancelledAt = freezed,Object? cancelledBy = freezed,Object? cancellationReason = freezed,Object? rejectionReason = freezed,Object? canCancel = null,Object? canReview = null,Object? review = freezed,Object? progress = null,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,scheduledAt: freezed == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,trainingType: freezed == trainingType ? _self.trainingType : trainingType // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as num?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,feedback: freezed == feedback ? _self.feedback : feedback // ignore: cast_nullable_to_non_nullable
as String?,xpAwarded: freezed == xpAwarded ? _self.xpAwarded : xpAwarded // ignore: cast_nullable_to_non_nullable
as int?,coach: null == coach ? _self.coach : coach // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,player: freezed == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as PlayerSummaryModel?,availabilityId: freezed == availabilityId ? _self.availabilityId : availabilityId // ignore: cast_nullable_to_non_nullable
as int?,confirmedAt: freezed == confirmedAt ? _self.confirmedAt : confirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,cancelledBy: freezed == cancelledBy ? _self.cancelledBy : cancelledBy // ignore: cast_nullable_to_non_nullable
as String?,cancellationReason: freezed == cancellationReason ? _self.cancellationReason : cancellationReason // ignore: cast_nullable_to_non_nullable
as String?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,canCancel: null == canCancel ? _self.canCancel : canCancel // ignore: cast_nullable_to_non_nullable
as bool,canReview: null == canReview ? _self.canReview : canReview // ignore: cast_nullable_to_non_nullable
as bool,review: freezed == review ? _self.review : review // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as List<TrainingProgressModel>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}
/// Create a copy of BookingModel
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


/// Adds pattern-matching-related methods to [BookingModel].
extension BookingModelPatterns on BookingModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookingModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookingModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookingModel value)  $default,){
final _that = this;
switch (_that) {
case _BookingModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookingModel value)?  $default,){
final _that = this;
switch (_that) {
case _BookingModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String status, @JsonKey(name: 'scheduled_at')  DateTime? scheduledAt, @JsonKey(name: 'duration_minutes')  int durationMinutes,  String? location, @JsonKey(name: 'training_type')  String? trainingType,  num? price,  String? currency,  String? notes,  String? feedback, @JsonKey(name: 'xp_awarded')  int? xpAwarded,  Map<String, dynamic> coach,  PlayerSummaryModel? player, @JsonKey(name: 'availability_id')  int? availabilityId, @JsonKey(name: 'confirmed_at')  DateTime? confirmedAt, @JsonKey(name: 'completed_at')  DateTime? completedAt, @JsonKey(name: 'cancelled_at')  DateTime? cancelledAt, @JsonKey(name: 'cancelled_by')  String? cancelledBy, @JsonKey(name: 'cancellation_reason')  String? cancellationReason, @JsonKey(name: 'rejection_reason')  String? rejectionReason, @JsonKey(name: 'can_cancel')  bool canCancel, @JsonKey(name: 'can_review')  bool canReview,  Map<String, dynamic>? review,  List<TrainingProgressModel> progress, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookingModel() when $default != null:
return $default(_that.id,_that.status,_that.scheduledAt,_that.durationMinutes,_that.location,_that.trainingType,_that.price,_that.currency,_that.notes,_that.feedback,_that.xpAwarded,_that.coach,_that.player,_that.availabilityId,_that.confirmedAt,_that.completedAt,_that.cancelledAt,_that.cancelledBy,_that.cancellationReason,_that.rejectionReason,_that.canCancel,_that.canReview,_that.review,_that.progress,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String status, @JsonKey(name: 'scheduled_at')  DateTime? scheduledAt, @JsonKey(name: 'duration_minutes')  int durationMinutes,  String? location, @JsonKey(name: 'training_type')  String? trainingType,  num? price,  String? currency,  String? notes,  String? feedback, @JsonKey(name: 'xp_awarded')  int? xpAwarded,  Map<String, dynamic> coach,  PlayerSummaryModel? player, @JsonKey(name: 'availability_id')  int? availabilityId, @JsonKey(name: 'confirmed_at')  DateTime? confirmedAt, @JsonKey(name: 'completed_at')  DateTime? completedAt, @JsonKey(name: 'cancelled_at')  DateTime? cancelledAt, @JsonKey(name: 'cancelled_by')  String? cancelledBy, @JsonKey(name: 'cancellation_reason')  String? cancellationReason, @JsonKey(name: 'rejection_reason')  String? rejectionReason, @JsonKey(name: 'can_cancel')  bool canCancel, @JsonKey(name: 'can_review')  bool canReview,  Map<String, dynamic>? review,  List<TrainingProgressModel> progress, @JsonKey(name: 'created_at')  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _BookingModel():
return $default(_that.id,_that.status,_that.scheduledAt,_that.durationMinutes,_that.location,_that.trainingType,_that.price,_that.currency,_that.notes,_that.feedback,_that.xpAwarded,_that.coach,_that.player,_that.availabilityId,_that.confirmedAt,_that.completedAt,_that.cancelledAt,_that.cancelledBy,_that.cancellationReason,_that.rejectionReason,_that.canCancel,_that.canReview,_that.review,_that.progress,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String status, @JsonKey(name: 'scheduled_at')  DateTime? scheduledAt, @JsonKey(name: 'duration_minutes')  int durationMinutes,  String? location, @JsonKey(name: 'training_type')  String? trainingType,  num? price,  String? currency,  String? notes,  String? feedback, @JsonKey(name: 'xp_awarded')  int? xpAwarded,  Map<String, dynamic> coach,  PlayerSummaryModel? player, @JsonKey(name: 'availability_id')  int? availabilityId, @JsonKey(name: 'confirmed_at')  DateTime? confirmedAt, @JsonKey(name: 'completed_at')  DateTime? completedAt, @JsonKey(name: 'cancelled_at')  DateTime? cancelledAt, @JsonKey(name: 'cancelled_by')  String? cancelledBy, @JsonKey(name: 'cancellation_reason')  String? cancellationReason, @JsonKey(name: 'rejection_reason')  String? rejectionReason, @JsonKey(name: 'can_cancel')  bool canCancel, @JsonKey(name: 'can_review')  bool canReview,  Map<String, dynamic>? review,  List<TrainingProgressModel> progress, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _BookingModel() when $default != null:
return $default(_that.id,_that.status,_that.scheduledAt,_that.durationMinutes,_that.location,_that.trainingType,_that.price,_that.currency,_that.notes,_that.feedback,_that.xpAwarded,_that.coach,_that.player,_that.availabilityId,_that.confirmedAt,_that.completedAt,_that.cancelledAt,_that.cancelledBy,_that.cancellationReason,_that.rejectionReason,_that.canCancel,_that.canReview,_that.review,_that.progress,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _BookingModel implements BookingModel {
  const _BookingModel({required this.id, this.status = 'pending', @JsonKey(name: 'scheduled_at') this.scheduledAt, @JsonKey(name: 'duration_minutes') this.durationMinutes = 60, this.location, @JsonKey(name: 'training_type') this.trainingType, this.price, this.currency, this.notes, this.feedback, @JsonKey(name: 'xp_awarded') this.xpAwarded, required final  Map<String, dynamic> coach, this.player, @JsonKey(name: 'availability_id') this.availabilityId, @JsonKey(name: 'confirmed_at') this.confirmedAt, @JsonKey(name: 'completed_at') this.completedAt, @JsonKey(name: 'cancelled_at') this.cancelledAt, @JsonKey(name: 'cancelled_by') this.cancelledBy, @JsonKey(name: 'cancellation_reason') this.cancellationReason, @JsonKey(name: 'rejection_reason') this.rejectionReason, @JsonKey(name: 'can_cancel') this.canCancel = false, @JsonKey(name: 'can_review') this.canReview = false, final  Map<String, dynamic>? review, final  List<TrainingProgressModel> progress = const [], @JsonKey(name: 'created_at') this.createdAt}): _coach = coach,_review = review,_progress = progress;
  factory _BookingModel.fromJson(Map<String, dynamic> json) => _$BookingModelFromJson(json);

@override final  int id;
@override@JsonKey() final  String status;
@override@JsonKey(name: 'scheduled_at') final  DateTime? scheduledAt;
@override@JsonKey(name: 'duration_minutes') final  int durationMinutes;
@override final  String? location;
@override@JsonKey(name: 'training_type') final  String? trainingType;
@override final  num? price;
@override final  String? currency;
@override final  String? notes;
@override final  String? feedback;
@override@JsonKey(name: 'xp_awarded') final  int? xpAwarded;
 final  Map<String, dynamic> _coach;
@override Map<String, dynamic> get coach {
  if (_coach is EqualUnmodifiableMapView) return _coach;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(_coach);
}

@override final  PlayerSummaryModel? player;
@override@JsonKey(name: 'availability_id') final  int? availabilityId;
@override@JsonKey(name: 'confirmed_at') final  DateTime? confirmedAt;
@override@JsonKey(name: 'completed_at') final  DateTime? completedAt;
@override@JsonKey(name: 'cancelled_at') final  DateTime? cancelledAt;
@override@JsonKey(name: 'cancelled_by') final  String? cancelledBy;
@override@JsonKey(name: 'cancellation_reason') final  String? cancellationReason;
@override@JsonKey(name: 'rejection_reason') final  String? rejectionReason;
@override@JsonKey(name: 'can_cancel') final  bool canCancel;
@override@JsonKey(name: 'can_review') final  bool canReview;
 final  Map<String, dynamic>? _review;
@override Map<String, dynamic>? get review {
  final value = _review;
  if (value == null) return null;
  if (_review is EqualUnmodifiableMapView) return _review;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

 final  List<TrainingProgressModel> _progress;
@override@JsonKey() List<TrainingProgressModel> get progress {
  if (_progress is EqualUnmodifiableListView) return _progress;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_progress);
}

@override@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of BookingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookingModelCopyWith<_BookingModel> get copyWith => __$BookingModelCopyWithImpl<_BookingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookingModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookingModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.location, location) || other.location == location)&&(identical(other.trainingType, trainingType) || other.trainingType == trainingType)&&(identical(other.price, price) || other.price == price)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.feedback, feedback) || other.feedback == feedback)&&(identical(other.xpAwarded, xpAwarded) || other.xpAwarded == xpAwarded)&&const DeepCollectionEquality().equals(other._coach, _coach)&&(identical(other.player, player) || other.player == player)&&(identical(other.availabilityId, availabilityId) || other.availabilityId == availabilityId)&&(identical(other.confirmedAt, confirmedAt) || other.confirmedAt == confirmedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.cancelledAt, cancelledAt) || other.cancelledAt == cancelledAt)&&(identical(other.cancelledBy, cancelledBy) || other.cancelledBy == cancelledBy)&&(identical(other.cancellationReason, cancellationReason) || other.cancellationReason == cancellationReason)&&(identical(other.rejectionReason, rejectionReason) || other.rejectionReason == rejectionReason)&&(identical(other.canCancel, canCancel) || other.canCancel == canCancel)&&(identical(other.canReview, canReview) || other.canReview == canReview)&&const DeepCollectionEquality().equals(other._review, _review)&&const DeepCollectionEquality().equals(other._progress, _progress)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,status,scheduledAt,durationMinutes,location,trainingType,price,currency,notes,feedback,xpAwarded,const DeepCollectionEquality().hash(_coach),player,availabilityId,confirmedAt,completedAt,cancelledAt,cancelledBy,cancellationReason,rejectionReason,canCancel,canReview,const DeepCollectionEquality().hash(_review),const DeepCollectionEquality().hash(_progress),createdAt]);

@override
String toString() {
  return 'BookingModel(id: $id, status: $status, scheduledAt: $scheduledAt, durationMinutes: $durationMinutes, location: $location, trainingType: $trainingType, price: $price, currency: $currency, notes: $notes, feedback: $feedback, xpAwarded: $xpAwarded, coach: $coach, player: $player, availabilityId: $availabilityId, confirmedAt: $confirmedAt, completedAt: $completedAt, cancelledAt: $cancelledAt, cancelledBy: $cancelledBy, cancellationReason: $cancellationReason, rejectionReason: $rejectionReason, canCancel: $canCancel, canReview: $canReview, review: $review, progress: $progress, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$BookingModelCopyWith<$Res> implements $BookingModelCopyWith<$Res> {
  factory _$BookingModelCopyWith(_BookingModel value, $Res Function(_BookingModel) _then) = __$BookingModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String status,@JsonKey(name: 'scheduled_at') DateTime? scheduledAt,@JsonKey(name: 'duration_minutes') int durationMinutes, String? location,@JsonKey(name: 'training_type') String? trainingType, num? price, String? currency, String? notes, String? feedback,@JsonKey(name: 'xp_awarded') int? xpAwarded, Map<String, dynamic> coach, PlayerSummaryModel? player,@JsonKey(name: 'availability_id') int? availabilityId,@JsonKey(name: 'confirmed_at') DateTime? confirmedAt,@JsonKey(name: 'completed_at') DateTime? completedAt,@JsonKey(name: 'cancelled_at') DateTime? cancelledAt,@JsonKey(name: 'cancelled_by') String? cancelledBy,@JsonKey(name: 'cancellation_reason') String? cancellationReason,@JsonKey(name: 'rejection_reason') String? rejectionReason,@JsonKey(name: 'can_cancel') bool canCancel,@JsonKey(name: 'can_review') bool canReview, Map<String, dynamic>? review, List<TrainingProgressModel> progress,@JsonKey(name: 'created_at') DateTime? createdAt
});


@override $PlayerSummaryModelCopyWith<$Res>? get player;

}
/// @nodoc
class __$BookingModelCopyWithImpl<$Res>
    implements _$BookingModelCopyWith<$Res> {
  __$BookingModelCopyWithImpl(this._self, this._then);

  final _BookingModel _self;
  final $Res Function(_BookingModel) _then;

/// Create a copy of BookingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? scheduledAt = freezed,Object? durationMinutes = null,Object? location = freezed,Object? trainingType = freezed,Object? price = freezed,Object? currency = freezed,Object? notes = freezed,Object? feedback = freezed,Object? xpAwarded = freezed,Object? coach = null,Object? player = freezed,Object? availabilityId = freezed,Object? confirmedAt = freezed,Object? completedAt = freezed,Object? cancelledAt = freezed,Object? cancelledBy = freezed,Object? cancellationReason = freezed,Object? rejectionReason = freezed,Object? canCancel = null,Object? canReview = null,Object? review = freezed,Object? progress = null,Object? createdAt = freezed,}) {
  return _then(_BookingModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,scheduledAt: freezed == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,location: freezed == location ? _self.location : location // ignore: cast_nullable_to_non_nullable
as String?,trainingType: freezed == trainingType ? _self.trainingType : trainingType // ignore: cast_nullable_to_non_nullable
as String?,price: freezed == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as num?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,feedback: freezed == feedback ? _self.feedback : feedback // ignore: cast_nullable_to_non_nullable
as String?,xpAwarded: freezed == xpAwarded ? _self.xpAwarded : xpAwarded // ignore: cast_nullable_to_non_nullable
as int?,coach: null == coach ? _self._coach : coach // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>,player: freezed == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as PlayerSummaryModel?,availabilityId: freezed == availabilityId ? _self.availabilityId : availabilityId // ignore: cast_nullable_to_non_nullable
as int?,confirmedAt: freezed == confirmedAt ? _self.confirmedAt : confirmedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,cancelledAt: freezed == cancelledAt ? _self.cancelledAt : cancelledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,cancelledBy: freezed == cancelledBy ? _self.cancelledBy : cancelledBy // ignore: cast_nullable_to_non_nullable
as String?,cancellationReason: freezed == cancellationReason ? _self.cancellationReason : cancellationReason // ignore: cast_nullable_to_non_nullable
as String?,rejectionReason: freezed == rejectionReason ? _self.rejectionReason : rejectionReason // ignore: cast_nullable_to_non_nullable
as String?,canCancel: null == canCancel ? _self.canCancel : canCancel // ignore: cast_nullable_to_non_nullable
as bool,canReview: null == canReview ? _self.canReview : canReview // ignore: cast_nullable_to_non_nullable
as bool,review: freezed == review ? _self._review : review // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,progress: null == progress ? _self._progress : progress // ignore: cast_nullable_to_non_nullable
as List<TrainingProgressModel>,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

/// Create a copy of BookingModel
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

// dart format on
