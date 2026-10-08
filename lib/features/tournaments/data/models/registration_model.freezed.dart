// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'registration_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$RegistrationTournamentModel {

 int get id; String get name;@JsonKey(name: 'start_date') DateTime? get startDate;
/// Create a copy of RegistrationTournamentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegistrationTournamentModelCopyWith<RegistrationTournamentModel> get copyWith => _$RegistrationTournamentModelCopyWithImpl<RegistrationTournamentModel>(this as RegistrationTournamentModel, _$identity);

  /// Serializes this RegistrationTournamentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationTournamentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.startDate, startDate) || other.startDate == startDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,startDate);

@override
String toString() {
  return 'RegistrationTournamentModel(id: $id, name: $name, startDate: $startDate)';
}


}

/// @nodoc
abstract mixin class $RegistrationTournamentModelCopyWith<$Res>  {
  factory $RegistrationTournamentModelCopyWith(RegistrationTournamentModel value, $Res Function(RegistrationTournamentModel) _then) = _$RegistrationTournamentModelCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'start_date') DateTime? startDate
});




}
/// @nodoc
class _$RegistrationTournamentModelCopyWithImpl<$Res>
    implements $RegistrationTournamentModelCopyWith<$Res> {
  _$RegistrationTournamentModelCopyWithImpl(this._self, this._then);

  final RegistrationTournamentModel _self;
  final $Res Function(RegistrationTournamentModel) _then;

/// Create a copy of RegistrationTournamentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? startDate = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [RegistrationTournamentModel].
extension RegistrationTournamentModelPatterns on RegistrationTournamentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegistrationTournamentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegistrationTournamentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegistrationTournamentModel value)  $default,){
final _that = this;
switch (_that) {
case _RegistrationTournamentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegistrationTournamentModel value)?  $default,){
final _that = this;
switch (_that) {
case _RegistrationTournamentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'start_date')  DateTime? startDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegistrationTournamentModel() when $default != null:
return $default(_that.id,_that.name,_that.startDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'start_date')  DateTime? startDate)  $default,) {final _that = this;
switch (_that) {
case _RegistrationTournamentModel():
return $default(_that.id,_that.name,_that.startDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: 'start_date')  DateTime? startDate)?  $default,) {final _that = this;
switch (_that) {
case _RegistrationTournamentModel() when $default != null:
return $default(_that.id,_that.name,_that.startDate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegistrationTournamentModel implements RegistrationTournamentModel {
  const _RegistrationTournamentModel({required this.id, required this.name, @JsonKey(name: 'start_date') this.startDate});
  factory _RegistrationTournamentModel.fromJson(Map<String, dynamic> json) => _$RegistrationTournamentModelFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'start_date') final  DateTime? startDate;

/// Create a copy of RegistrationTournamentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegistrationTournamentModelCopyWith<_RegistrationTournamentModel> get copyWith => __$RegistrationTournamentModelCopyWithImpl<_RegistrationTournamentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegistrationTournamentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegistrationTournamentModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.startDate, startDate) || other.startDate == startDate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,startDate);

@override
String toString() {
  return 'RegistrationTournamentModel(id: $id, name: $name, startDate: $startDate)';
}


}

/// @nodoc
abstract mixin class _$RegistrationTournamentModelCopyWith<$Res> implements $RegistrationTournamentModelCopyWith<$Res> {
  factory _$RegistrationTournamentModelCopyWith(_RegistrationTournamentModel value, $Res Function(_RegistrationTournamentModel) _then) = __$RegistrationTournamentModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'start_date') DateTime? startDate
});




}
/// @nodoc
class __$RegistrationTournamentModelCopyWithImpl<$Res>
    implements _$RegistrationTournamentModelCopyWith<$Res> {
  __$RegistrationTournamentModelCopyWithImpl(this._self, this._then);

  final _RegistrationTournamentModel _self;
  final $Res Function(_RegistrationTournamentModel) _then;

/// Create a copy of RegistrationTournamentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? startDate = freezed,}) {
  return _then(_RegistrationTournamentModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,startDate: freezed == startDate ? _self.startDate : startDate // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$RegistrationCategoryModel {

 int get id; String get name;@JsonKey(name: 'registration_fee') num get registrationFee; RegistrationTournamentModel get tournament;
/// Create a copy of RegistrationCategoryModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegistrationCategoryModelCopyWith<RegistrationCategoryModel> get copyWith => _$RegistrationCategoryModelCopyWithImpl<RegistrationCategoryModel>(this as RegistrationCategoryModel, _$identity);

  /// Serializes this RegistrationCategoryModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.registrationFee, registrationFee) || other.registrationFee == registrationFee)&&(identical(other.tournament, tournament) || other.tournament == tournament));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,registrationFee,tournament);

@override
String toString() {
  return 'RegistrationCategoryModel(id: $id, name: $name, registrationFee: $registrationFee, tournament: $tournament)';
}


}

/// @nodoc
abstract mixin class $RegistrationCategoryModelCopyWith<$Res>  {
  factory $RegistrationCategoryModelCopyWith(RegistrationCategoryModel value, $Res Function(RegistrationCategoryModel) _then) = _$RegistrationCategoryModelCopyWithImpl;
@useResult
$Res call({
 int id, String name,@JsonKey(name: 'registration_fee') num registrationFee, RegistrationTournamentModel tournament
});


$RegistrationTournamentModelCopyWith<$Res> get tournament;

}
/// @nodoc
class _$RegistrationCategoryModelCopyWithImpl<$Res>
    implements $RegistrationCategoryModelCopyWith<$Res> {
  _$RegistrationCategoryModelCopyWithImpl(this._self, this._then);

  final RegistrationCategoryModel _self;
  final $Res Function(RegistrationCategoryModel) _then;

/// Create a copy of RegistrationCategoryModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? registrationFee = null,Object? tournament = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,registrationFee: null == registrationFee ? _self.registrationFee : registrationFee // ignore: cast_nullable_to_non_nullable
as num,tournament: null == tournament ? _self.tournament : tournament // ignore: cast_nullable_to_non_nullable
as RegistrationTournamentModel,
  ));
}
/// Create a copy of RegistrationCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegistrationTournamentModelCopyWith<$Res> get tournament {
  
  return $RegistrationTournamentModelCopyWith<$Res>(_self.tournament, (value) {
    return _then(_self.copyWith(tournament: value));
  });
}
}


/// Adds pattern-matching-related methods to [RegistrationCategoryModel].
extension RegistrationCategoryModelPatterns on RegistrationCategoryModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegistrationCategoryModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegistrationCategoryModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegistrationCategoryModel value)  $default,){
final _that = this;
switch (_that) {
case _RegistrationCategoryModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegistrationCategoryModel value)?  $default,){
final _that = this;
switch (_that) {
case _RegistrationCategoryModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'registration_fee')  num registrationFee,  RegistrationTournamentModel tournament)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegistrationCategoryModel() when $default != null:
return $default(_that.id,_that.name,_that.registrationFee,_that.tournament);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name, @JsonKey(name: 'registration_fee')  num registrationFee,  RegistrationTournamentModel tournament)  $default,) {final _that = this;
switch (_that) {
case _RegistrationCategoryModel():
return $default(_that.id,_that.name,_that.registrationFee,_that.tournament);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name, @JsonKey(name: 'registration_fee')  num registrationFee,  RegistrationTournamentModel tournament)?  $default,) {final _that = this;
switch (_that) {
case _RegistrationCategoryModel() when $default != null:
return $default(_that.id,_that.name,_that.registrationFee,_that.tournament);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegistrationCategoryModel implements RegistrationCategoryModel {
  const _RegistrationCategoryModel({required this.id, required this.name, @JsonKey(name: 'registration_fee') this.registrationFee = 0, required this.tournament});
  factory _RegistrationCategoryModel.fromJson(Map<String, dynamic> json) => _$RegistrationCategoryModelFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey(name: 'registration_fee') final  num registrationFee;
@override final  RegistrationTournamentModel tournament;

/// Create a copy of RegistrationCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegistrationCategoryModelCopyWith<_RegistrationCategoryModel> get copyWith => __$RegistrationCategoryModelCopyWithImpl<_RegistrationCategoryModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegistrationCategoryModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegistrationCategoryModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.registrationFee, registrationFee) || other.registrationFee == registrationFee)&&(identical(other.tournament, tournament) || other.tournament == tournament));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,registrationFee,tournament);

@override
String toString() {
  return 'RegistrationCategoryModel(id: $id, name: $name, registrationFee: $registrationFee, tournament: $tournament)';
}


}

/// @nodoc
abstract mixin class _$RegistrationCategoryModelCopyWith<$Res> implements $RegistrationCategoryModelCopyWith<$Res> {
  factory _$RegistrationCategoryModelCopyWith(_RegistrationCategoryModel value, $Res Function(_RegistrationCategoryModel) _then) = __$RegistrationCategoryModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name,@JsonKey(name: 'registration_fee') num registrationFee, RegistrationTournamentModel tournament
});


@override $RegistrationTournamentModelCopyWith<$Res> get tournament;

}
/// @nodoc
class __$RegistrationCategoryModelCopyWithImpl<$Res>
    implements _$RegistrationCategoryModelCopyWith<$Res> {
  __$RegistrationCategoryModelCopyWithImpl(this._self, this._then);

  final _RegistrationCategoryModel _self;
  final $Res Function(_RegistrationCategoryModel) _then;

/// Create a copy of RegistrationCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? registrationFee = null,Object? tournament = null,}) {
  return _then(_RegistrationCategoryModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,registrationFee: null == registrationFee ? _self.registrationFee : registrationFee // ignore: cast_nullable_to_non_nullable
as num,tournament: null == tournament ? _self.tournament : tournament // ignore: cast_nullable_to_non_nullable
as RegistrationTournamentModel,
  ));
}

/// Create a copy of RegistrationCategoryModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegistrationTournamentModelCopyWith<$Res> get tournament {
  
  return $RegistrationTournamentModelCopyWith<$Res>(_self.tournament, (value) {
    return _then(_self.copyWith(tournament: value));
  });
}
}


/// @nodoc
mixin _$RegistrationModel {

 int get id; String get status;@JsonKey(name: 'payment_status') String get paymentStatus;@JsonKey(name: 'registered_at') DateTime? get registeredAt;@JsonKey(name: 'promoted_at') DateTime? get promotedAt; String? get notes; PlayerSummaryModel? get player; PlayerSummaryModel? get partner; RegistrationCategoryModel get category;@JsonKey(name: 'can_cancel') bool get canCancel;@JsonKey(name: 'can_edit') bool get canEdit;@JsonKey(name: 'review_note') String? get reviewNote;@JsonKey(name: 'needs_my_confirmation') bool get needsMyConfirmation;@JsonKey(name: 'partner_confirmed') bool get partnerConfirmed;
/// Create a copy of RegistrationModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$RegistrationModelCopyWith<RegistrationModel> get copyWith => _$RegistrationModelCopyWithImpl<RegistrationModel>(this as RegistrationModel, _$identity);

  /// Serializes this RegistrationModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is RegistrationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.registeredAt, registeredAt) || other.registeredAt == registeredAt)&&(identical(other.promotedAt, promotedAt) || other.promotedAt == promotedAt)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.player, player) || other.player == player)&&(identical(other.partner, partner) || other.partner == partner)&&(identical(other.category, category) || other.category == category)&&(identical(other.canCancel, canCancel) || other.canCancel == canCancel)&&(identical(other.canEdit, canEdit) || other.canEdit == canEdit)&&(identical(other.reviewNote, reviewNote) || other.reviewNote == reviewNote)&&(identical(other.needsMyConfirmation, needsMyConfirmation) || other.needsMyConfirmation == needsMyConfirmation)&&(identical(other.partnerConfirmed, partnerConfirmed) || other.partnerConfirmed == partnerConfirmed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,paymentStatus,registeredAt,promotedAt,notes,player,partner,category,canCancel,canEdit,reviewNote,needsMyConfirmation,partnerConfirmed);

@override
String toString() {
  return 'RegistrationModel(id: $id, status: $status, paymentStatus: $paymentStatus, registeredAt: $registeredAt, promotedAt: $promotedAt, notes: $notes, player: $player, partner: $partner, category: $category, canCancel: $canCancel, canEdit: $canEdit, reviewNote: $reviewNote, needsMyConfirmation: $needsMyConfirmation, partnerConfirmed: $partnerConfirmed)';
}


}

/// @nodoc
abstract mixin class $RegistrationModelCopyWith<$Res>  {
  factory $RegistrationModelCopyWith(RegistrationModel value, $Res Function(RegistrationModel) _then) = _$RegistrationModelCopyWithImpl;
@useResult
$Res call({
 int id, String status,@JsonKey(name: 'payment_status') String paymentStatus,@JsonKey(name: 'registered_at') DateTime? registeredAt,@JsonKey(name: 'promoted_at') DateTime? promotedAt, String? notes, PlayerSummaryModel? player, PlayerSummaryModel? partner, RegistrationCategoryModel category,@JsonKey(name: 'can_cancel') bool canCancel,@JsonKey(name: 'can_edit') bool canEdit,@JsonKey(name: 'review_note') String? reviewNote,@JsonKey(name: 'needs_my_confirmation') bool needsMyConfirmation,@JsonKey(name: 'partner_confirmed') bool partnerConfirmed
});


$PlayerSummaryModelCopyWith<$Res>? get player;$PlayerSummaryModelCopyWith<$Res>? get partner;$RegistrationCategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class _$RegistrationModelCopyWithImpl<$Res>
    implements $RegistrationModelCopyWith<$Res> {
  _$RegistrationModelCopyWithImpl(this._self, this._then);

  final RegistrationModel _self;
  final $Res Function(RegistrationModel) _then;

/// Create a copy of RegistrationModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? paymentStatus = null,Object? registeredAt = freezed,Object? promotedAt = freezed,Object? notes = freezed,Object? player = freezed,Object? partner = freezed,Object? category = null,Object? canCancel = null,Object? canEdit = null,Object? reviewNote = freezed,Object? needsMyConfirmation = null,Object? partnerConfirmed = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String,registeredAt: freezed == registeredAt ? _self.registeredAt : registeredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,promotedAt: freezed == promotedAt ? _self.promotedAt : promotedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,player: freezed == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as PlayerSummaryModel?,partner: freezed == partner ? _self.partner : partner // ignore: cast_nullable_to_non_nullable
as PlayerSummaryModel?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as RegistrationCategoryModel,canCancel: null == canCancel ? _self.canCancel : canCancel // ignore: cast_nullable_to_non_nullable
as bool,canEdit: null == canEdit ? _self.canEdit : canEdit // ignore: cast_nullable_to_non_nullable
as bool,reviewNote: freezed == reviewNote ? _self.reviewNote : reviewNote // ignore: cast_nullable_to_non_nullable
as String?,needsMyConfirmation: null == needsMyConfirmation ? _self.needsMyConfirmation : needsMyConfirmation // ignore: cast_nullable_to_non_nullable
as bool,partnerConfirmed: null == partnerConfirmed ? _self.partnerConfirmed : partnerConfirmed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of RegistrationModel
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
}/// Create a copy of RegistrationModel
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
}/// Create a copy of RegistrationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegistrationCategoryModelCopyWith<$Res> get category {
  
  return $RegistrationCategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}


/// Adds pattern-matching-related methods to [RegistrationModel].
extension RegistrationModelPatterns on RegistrationModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _RegistrationModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RegistrationModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _RegistrationModel value)  $default,){
final _that = this;
switch (_that) {
case _RegistrationModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _RegistrationModel value)?  $default,){
final _that = this;
switch (_that) {
case _RegistrationModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String status, @JsonKey(name: 'payment_status')  String paymentStatus, @JsonKey(name: 'registered_at')  DateTime? registeredAt, @JsonKey(name: 'promoted_at')  DateTime? promotedAt,  String? notes,  PlayerSummaryModel? player,  PlayerSummaryModel? partner,  RegistrationCategoryModel category, @JsonKey(name: 'can_cancel')  bool canCancel, @JsonKey(name: 'can_edit')  bool canEdit, @JsonKey(name: 'review_note')  String? reviewNote, @JsonKey(name: 'needs_my_confirmation')  bool needsMyConfirmation, @JsonKey(name: 'partner_confirmed')  bool partnerConfirmed)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RegistrationModel() when $default != null:
return $default(_that.id,_that.status,_that.paymentStatus,_that.registeredAt,_that.promotedAt,_that.notes,_that.player,_that.partner,_that.category,_that.canCancel,_that.canEdit,_that.reviewNote,_that.needsMyConfirmation,_that.partnerConfirmed);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String status, @JsonKey(name: 'payment_status')  String paymentStatus, @JsonKey(name: 'registered_at')  DateTime? registeredAt, @JsonKey(name: 'promoted_at')  DateTime? promotedAt,  String? notes,  PlayerSummaryModel? player,  PlayerSummaryModel? partner,  RegistrationCategoryModel category, @JsonKey(name: 'can_cancel')  bool canCancel, @JsonKey(name: 'can_edit')  bool canEdit, @JsonKey(name: 'review_note')  String? reviewNote, @JsonKey(name: 'needs_my_confirmation')  bool needsMyConfirmation, @JsonKey(name: 'partner_confirmed')  bool partnerConfirmed)  $default,) {final _that = this;
switch (_that) {
case _RegistrationModel():
return $default(_that.id,_that.status,_that.paymentStatus,_that.registeredAt,_that.promotedAt,_that.notes,_that.player,_that.partner,_that.category,_that.canCancel,_that.canEdit,_that.reviewNote,_that.needsMyConfirmation,_that.partnerConfirmed);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String status, @JsonKey(name: 'payment_status')  String paymentStatus, @JsonKey(name: 'registered_at')  DateTime? registeredAt, @JsonKey(name: 'promoted_at')  DateTime? promotedAt,  String? notes,  PlayerSummaryModel? player,  PlayerSummaryModel? partner,  RegistrationCategoryModel category, @JsonKey(name: 'can_cancel')  bool canCancel, @JsonKey(name: 'can_edit')  bool canEdit, @JsonKey(name: 'review_note')  String? reviewNote, @JsonKey(name: 'needs_my_confirmation')  bool needsMyConfirmation, @JsonKey(name: 'partner_confirmed')  bool partnerConfirmed)?  $default,) {final _that = this;
switch (_that) {
case _RegistrationModel() when $default != null:
return $default(_that.id,_that.status,_that.paymentStatus,_that.registeredAt,_that.promotedAt,_that.notes,_that.player,_that.partner,_that.category,_that.canCancel,_that.canEdit,_that.reviewNote,_that.needsMyConfirmation,_that.partnerConfirmed);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _RegistrationModel implements RegistrationModel {
  const _RegistrationModel({required this.id, this.status = 'pending', @JsonKey(name: 'payment_status') this.paymentStatus = 'not_required', @JsonKey(name: 'registered_at') this.registeredAt, @JsonKey(name: 'promoted_at') this.promotedAt, this.notes, this.player, this.partner, required this.category, @JsonKey(name: 'can_cancel') this.canCancel = false, @JsonKey(name: 'can_edit') this.canEdit = false, @JsonKey(name: 'review_note') this.reviewNote, @JsonKey(name: 'needs_my_confirmation') this.needsMyConfirmation = false, @JsonKey(name: 'partner_confirmed') this.partnerConfirmed = true});
  factory _RegistrationModel.fromJson(Map<String, dynamic> json) => _$RegistrationModelFromJson(json);

@override final  int id;
@override@JsonKey() final  String status;
@override@JsonKey(name: 'payment_status') final  String paymentStatus;
@override@JsonKey(name: 'registered_at') final  DateTime? registeredAt;
@override@JsonKey(name: 'promoted_at') final  DateTime? promotedAt;
@override final  String? notes;
@override final  PlayerSummaryModel? player;
@override final  PlayerSummaryModel? partner;
@override final  RegistrationCategoryModel category;
@override@JsonKey(name: 'can_cancel') final  bool canCancel;
@override@JsonKey(name: 'can_edit') final  bool canEdit;
@override@JsonKey(name: 'review_note') final  String? reviewNote;
@override@JsonKey(name: 'needs_my_confirmation') final  bool needsMyConfirmation;
@override@JsonKey(name: 'partner_confirmed') final  bool partnerConfirmed;

/// Create a copy of RegistrationModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$RegistrationModelCopyWith<_RegistrationModel> get copyWith => __$RegistrationModelCopyWithImpl<_RegistrationModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$RegistrationModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RegistrationModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.paymentStatus, paymentStatus) || other.paymentStatus == paymentStatus)&&(identical(other.registeredAt, registeredAt) || other.registeredAt == registeredAt)&&(identical(other.promotedAt, promotedAt) || other.promotedAt == promotedAt)&&(identical(other.notes, notes) || other.notes == notes)&&(identical(other.player, player) || other.player == player)&&(identical(other.partner, partner) || other.partner == partner)&&(identical(other.category, category) || other.category == category)&&(identical(other.canCancel, canCancel) || other.canCancel == canCancel)&&(identical(other.canEdit, canEdit) || other.canEdit == canEdit)&&(identical(other.reviewNote, reviewNote) || other.reviewNote == reviewNote)&&(identical(other.needsMyConfirmation, needsMyConfirmation) || other.needsMyConfirmation == needsMyConfirmation)&&(identical(other.partnerConfirmed, partnerConfirmed) || other.partnerConfirmed == partnerConfirmed));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,paymentStatus,registeredAt,promotedAt,notes,player,partner,category,canCancel,canEdit,reviewNote,needsMyConfirmation,partnerConfirmed);

@override
String toString() {
  return 'RegistrationModel(id: $id, status: $status, paymentStatus: $paymentStatus, registeredAt: $registeredAt, promotedAt: $promotedAt, notes: $notes, player: $player, partner: $partner, category: $category, canCancel: $canCancel, canEdit: $canEdit, reviewNote: $reviewNote, needsMyConfirmation: $needsMyConfirmation, partnerConfirmed: $partnerConfirmed)';
}


}

/// @nodoc
abstract mixin class _$RegistrationModelCopyWith<$Res> implements $RegistrationModelCopyWith<$Res> {
  factory _$RegistrationModelCopyWith(_RegistrationModel value, $Res Function(_RegistrationModel) _then) = __$RegistrationModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String status,@JsonKey(name: 'payment_status') String paymentStatus,@JsonKey(name: 'registered_at') DateTime? registeredAt,@JsonKey(name: 'promoted_at') DateTime? promotedAt, String? notes, PlayerSummaryModel? player, PlayerSummaryModel? partner, RegistrationCategoryModel category,@JsonKey(name: 'can_cancel') bool canCancel,@JsonKey(name: 'can_edit') bool canEdit,@JsonKey(name: 'review_note') String? reviewNote,@JsonKey(name: 'needs_my_confirmation') bool needsMyConfirmation,@JsonKey(name: 'partner_confirmed') bool partnerConfirmed
});


@override $PlayerSummaryModelCopyWith<$Res>? get player;@override $PlayerSummaryModelCopyWith<$Res>? get partner;@override $RegistrationCategoryModelCopyWith<$Res> get category;

}
/// @nodoc
class __$RegistrationModelCopyWithImpl<$Res>
    implements _$RegistrationModelCopyWith<$Res> {
  __$RegistrationModelCopyWithImpl(this._self, this._then);

  final _RegistrationModel _self;
  final $Res Function(_RegistrationModel) _then;

/// Create a copy of RegistrationModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? paymentStatus = null,Object? registeredAt = freezed,Object? promotedAt = freezed,Object? notes = freezed,Object? player = freezed,Object? partner = freezed,Object? category = null,Object? canCancel = null,Object? canEdit = null,Object? reviewNote = freezed,Object? needsMyConfirmation = null,Object? partnerConfirmed = null,}) {
  return _then(_RegistrationModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,paymentStatus: null == paymentStatus ? _self.paymentStatus : paymentStatus // ignore: cast_nullable_to_non_nullable
as String,registeredAt: freezed == registeredAt ? _self.registeredAt : registeredAt // ignore: cast_nullable_to_non_nullable
as DateTime?,promotedAt: freezed == promotedAt ? _self.promotedAt : promotedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,player: freezed == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as PlayerSummaryModel?,partner: freezed == partner ? _self.partner : partner // ignore: cast_nullable_to_non_nullable
as PlayerSummaryModel?,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as RegistrationCategoryModel,canCancel: null == canCancel ? _self.canCancel : canCancel // ignore: cast_nullable_to_non_nullable
as bool,canEdit: null == canEdit ? _self.canEdit : canEdit // ignore: cast_nullable_to_non_nullable
as bool,reviewNote: freezed == reviewNote ? _self.reviewNote : reviewNote // ignore: cast_nullable_to_non_nullable
as String?,needsMyConfirmation: null == needsMyConfirmation ? _self.needsMyConfirmation : needsMyConfirmation // ignore: cast_nullable_to_non_nullable
as bool,partnerConfirmed: null == partnerConfirmed ? _self.partnerConfirmed : partnerConfirmed // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of RegistrationModel
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
}/// Create a copy of RegistrationModel
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
}/// Create a copy of RegistrationModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$RegistrationCategoryModelCopyWith<$Res> get category {
  
  return $RegistrationCategoryModelCopyWith<$Res>(_self.category, (value) {
    return _then(_self.copyWith(category: value));
  });
}
}

// dart format on
