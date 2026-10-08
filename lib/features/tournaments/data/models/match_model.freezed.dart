// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$IdNameModel {

 int get id; String get name;
/// Create a copy of IdNameModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$IdNameModelCopyWith<IdNameModel> get copyWith => _$IdNameModelCopyWithImpl<IdNameModel>(this as IdNameModel, _$identity);

  /// Serializes this IdNameModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is IdNameModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'IdNameModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class $IdNameModelCopyWith<$Res>  {
  factory $IdNameModelCopyWith(IdNameModel value, $Res Function(IdNameModel) _then) = _$IdNameModelCopyWithImpl;
@useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class _$IdNameModelCopyWithImpl<$Res>
    implements $IdNameModelCopyWith<$Res> {
  _$IdNameModelCopyWithImpl(this._self, this._then);

  final IdNameModel _self;
  final $Res Function(IdNameModel) _then;

/// Create a copy of IdNameModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [IdNameModel].
extension IdNameModelPatterns on IdNameModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _IdNameModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _IdNameModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _IdNameModel value)  $default,){
final _that = this;
switch (_that) {
case _IdNameModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _IdNameModel value)?  $default,){
final _that = this;
switch (_that) {
case _IdNameModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _IdNameModel() when $default != null:
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name)  $default,) {final _that = this;
switch (_that) {
case _IdNameModel():
return $default(_that.id,_that.name);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name)?  $default,) {final _that = this;
switch (_that) {
case _IdNameModel() when $default != null:
return $default(_that.id,_that.name);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _IdNameModel implements IdNameModel {
  const _IdNameModel({required this.id, required this.name});
  factory _IdNameModel.fromJson(Map<String, dynamic> json) => _$IdNameModelFromJson(json);

@override final  int id;
@override final  String name;

/// Create a copy of IdNameModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$IdNameModelCopyWith<_IdNameModel> get copyWith => __$IdNameModelCopyWithImpl<_IdNameModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$IdNameModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _IdNameModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name);

@override
String toString() {
  return 'IdNameModel(id: $id, name: $name)';
}


}

/// @nodoc
abstract mixin class _$IdNameModelCopyWith<$Res> implements $IdNameModelCopyWith<$Res> {
  factory _$IdNameModelCopyWith(_IdNameModel value, $Res Function(_IdNameModel) _then) = __$IdNameModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name
});




}
/// @nodoc
class __$IdNameModelCopyWithImpl<$Res>
    implements _$IdNameModelCopyWith<$Res> {
  __$IdNameModelCopyWithImpl(this._self, this._then);

  final _IdNameModel _self;
  final $Res Function(_IdNameModel) _then;

/// Create a copy of IdNameModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,}) {
  return _then(_IdNameModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$MatchTeamModel {

 int get id; String get label; int? get seed; String get status;@JsonKey(name: 'withdrawal_reason') String? get withdrawalReason;@JsonKey(name: 'group_id') int? get groupId; List<PlayerSummaryModel> get players;
/// Create a copy of MatchTeamModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchTeamModelCopyWith<MatchTeamModel> get copyWith => _$MatchTeamModelCopyWithImpl<MatchTeamModel>(this as MatchTeamModel, _$identity);

  /// Serializes this MatchTeamModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchTeamModel&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.seed, seed) || other.seed == seed)&&(identical(other.status, status) || other.status == status)&&(identical(other.withdrawalReason, withdrawalReason) || other.withdrawalReason == withdrawalReason)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&const DeepCollectionEquality().equals(other.players, players));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,seed,status,withdrawalReason,groupId,const DeepCollectionEquality().hash(players));

@override
String toString() {
  return 'MatchTeamModel(id: $id, label: $label, seed: $seed, status: $status, withdrawalReason: $withdrawalReason, groupId: $groupId, players: $players)';
}


}

/// @nodoc
abstract mixin class $MatchTeamModelCopyWith<$Res>  {
  factory $MatchTeamModelCopyWith(MatchTeamModel value, $Res Function(MatchTeamModel) _then) = _$MatchTeamModelCopyWithImpl;
@useResult
$Res call({
 int id, String label, int? seed, String status,@JsonKey(name: 'withdrawal_reason') String? withdrawalReason,@JsonKey(name: 'group_id') int? groupId, List<PlayerSummaryModel> players
});




}
/// @nodoc
class _$MatchTeamModelCopyWithImpl<$Res>
    implements $MatchTeamModelCopyWith<$Res> {
  _$MatchTeamModelCopyWithImpl(this._self, this._then);

  final MatchTeamModel _self;
  final $Res Function(MatchTeamModel) _then;

/// Create a copy of MatchTeamModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? label = null,Object? seed = freezed,Object? status = null,Object? withdrawalReason = freezed,Object? groupId = freezed,Object? players = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,seed: freezed == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,withdrawalReason: freezed == withdrawalReason ? _self.withdrawalReason : withdrawalReason // ignore: cast_nullable_to_non_nullable
as String?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int?,players: null == players ? _self.players : players // ignore: cast_nullable_to_non_nullable
as List<PlayerSummaryModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [MatchTeamModel].
extension MatchTeamModelPatterns on MatchTeamModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchTeamModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchTeamModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchTeamModel value)  $default,){
final _that = this;
switch (_that) {
case _MatchTeamModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchTeamModel value)?  $default,){
final _that = this;
switch (_that) {
case _MatchTeamModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String label,  int? seed,  String status, @JsonKey(name: 'withdrawal_reason')  String? withdrawalReason, @JsonKey(name: 'group_id')  int? groupId,  List<PlayerSummaryModel> players)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchTeamModel() when $default != null:
return $default(_that.id,_that.label,_that.seed,_that.status,_that.withdrawalReason,_that.groupId,_that.players);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String label,  int? seed,  String status, @JsonKey(name: 'withdrawal_reason')  String? withdrawalReason, @JsonKey(name: 'group_id')  int? groupId,  List<PlayerSummaryModel> players)  $default,) {final _that = this;
switch (_that) {
case _MatchTeamModel():
return $default(_that.id,_that.label,_that.seed,_that.status,_that.withdrawalReason,_that.groupId,_that.players);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String label,  int? seed,  String status, @JsonKey(name: 'withdrawal_reason')  String? withdrawalReason, @JsonKey(name: 'group_id')  int? groupId,  List<PlayerSummaryModel> players)?  $default,) {final _that = this;
switch (_that) {
case _MatchTeamModel() when $default != null:
return $default(_that.id,_that.label,_that.seed,_that.status,_that.withdrawalReason,_that.groupId,_that.players);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchTeamModel implements MatchTeamModel {
  const _MatchTeamModel({required this.id, required this.label, this.seed, this.status = 'active', @JsonKey(name: 'withdrawal_reason') this.withdrawalReason, @JsonKey(name: 'group_id') this.groupId, final  List<PlayerSummaryModel> players = const []}): _players = players;
  factory _MatchTeamModel.fromJson(Map<String, dynamic> json) => _$MatchTeamModelFromJson(json);

@override final  int id;
@override final  String label;
@override final  int? seed;
@override@JsonKey() final  String status;
@override@JsonKey(name: 'withdrawal_reason') final  String? withdrawalReason;
@override@JsonKey(name: 'group_id') final  int? groupId;
 final  List<PlayerSummaryModel> _players;
@override@JsonKey() List<PlayerSummaryModel> get players {
  if (_players is EqualUnmodifiableListView) return _players;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_players);
}


/// Create a copy of MatchTeamModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchTeamModelCopyWith<_MatchTeamModel> get copyWith => __$MatchTeamModelCopyWithImpl<_MatchTeamModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchTeamModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchTeamModel&&(identical(other.id, id) || other.id == id)&&(identical(other.label, label) || other.label == label)&&(identical(other.seed, seed) || other.seed == seed)&&(identical(other.status, status) || other.status == status)&&(identical(other.withdrawalReason, withdrawalReason) || other.withdrawalReason == withdrawalReason)&&(identical(other.groupId, groupId) || other.groupId == groupId)&&const DeepCollectionEquality().equals(other._players, _players));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,label,seed,status,withdrawalReason,groupId,const DeepCollectionEquality().hash(_players));

@override
String toString() {
  return 'MatchTeamModel(id: $id, label: $label, seed: $seed, status: $status, withdrawalReason: $withdrawalReason, groupId: $groupId, players: $players)';
}


}

/// @nodoc
abstract mixin class _$MatchTeamModelCopyWith<$Res> implements $MatchTeamModelCopyWith<$Res> {
  factory _$MatchTeamModelCopyWith(_MatchTeamModel value, $Res Function(_MatchTeamModel) _then) = __$MatchTeamModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String label, int? seed, String status,@JsonKey(name: 'withdrawal_reason') String? withdrawalReason,@JsonKey(name: 'group_id') int? groupId, List<PlayerSummaryModel> players
});




}
/// @nodoc
class __$MatchTeamModelCopyWithImpl<$Res>
    implements _$MatchTeamModelCopyWith<$Res> {
  __$MatchTeamModelCopyWithImpl(this._self, this._then);

  final _MatchTeamModel _self;
  final $Res Function(_MatchTeamModel) _then;

/// Create a copy of MatchTeamModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? label = null,Object? seed = freezed,Object? status = null,Object? withdrawalReason = freezed,Object? groupId = freezed,Object? players = null,}) {
  return _then(_MatchTeamModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,label: null == label ? _self.label : label // ignore: cast_nullable_to_non_nullable
as String,seed: freezed == seed ? _self.seed : seed // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,withdrawalReason: freezed == withdrawalReason ? _self.withdrawalReason : withdrawalReason // ignore: cast_nullable_to_non_nullable
as String?,groupId: freezed == groupId ? _self.groupId : groupId // ignore: cast_nullable_to_non_nullable
as int?,players: null == players ? _self._players : players // ignore: cast_nullable_to_non_nullable
as List<PlayerSummaryModel>,
  ));
}


}


/// @nodoc
mixin _$SetScoreModel {

@JsonKey(name: 'team_one') int get teamOne;@JsonKey(name: 'team_two') int get teamTwo;
/// Create a copy of SetScoreModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SetScoreModelCopyWith<SetScoreModel> get copyWith => _$SetScoreModelCopyWithImpl<SetScoreModel>(this as SetScoreModel, _$identity);

  /// Serializes this SetScoreModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SetScoreModel&&(identical(other.teamOne, teamOne) || other.teamOne == teamOne)&&(identical(other.teamTwo, teamTwo) || other.teamTwo == teamTwo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,teamOne,teamTwo);

@override
String toString() {
  return 'SetScoreModel(teamOne: $teamOne, teamTwo: $teamTwo)';
}


}

/// @nodoc
abstract mixin class $SetScoreModelCopyWith<$Res>  {
  factory $SetScoreModelCopyWith(SetScoreModel value, $Res Function(SetScoreModel) _then) = _$SetScoreModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'team_one') int teamOne,@JsonKey(name: 'team_two') int teamTwo
});




}
/// @nodoc
class _$SetScoreModelCopyWithImpl<$Res>
    implements $SetScoreModelCopyWith<$Res> {
  _$SetScoreModelCopyWithImpl(this._self, this._then);

  final SetScoreModel _self;
  final $Res Function(SetScoreModel) _then;

/// Create a copy of SetScoreModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? teamOne = null,Object? teamTwo = null,}) {
  return _then(_self.copyWith(
teamOne: null == teamOne ? _self.teamOne : teamOne // ignore: cast_nullable_to_non_nullable
as int,teamTwo: null == teamTwo ? _self.teamTwo : teamTwo // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [SetScoreModel].
extension SetScoreModelPatterns on SetScoreModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SetScoreModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SetScoreModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SetScoreModel value)  $default,){
final _that = this;
switch (_that) {
case _SetScoreModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SetScoreModel value)?  $default,){
final _that = this;
switch (_that) {
case _SetScoreModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'team_one')  int teamOne, @JsonKey(name: 'team_two')  int teamTwo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SetScoreModel() when $default != null:
return $default(_that.teamOne,_that.teamTwo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'team_one')  int teamOne, @JsonKey(name: 'team_two')  int teamTwo)  $default,) {final _that = this;
switch (_that) {
case _SetScoreModel():
return $default(_that.teamOne,_that.teamTwo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'team_one')  int teamOne, @JsonKey(name: 'team_two')  int teamTwo)?  $default,) {final _that = this;
switch (_that) {
case _SetScoreModel() when $default != null:
return $default(_that.teamOne,_that.teamTwo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SetScoreModel implements SetScoreModel {
  const _SetScoreModel({@JsonKey(name: 'team_one') this.teamOne = 0, @JsonKey(name: 'team_two') this.teamTwo = 0});
  factory _SetScoreModel.fromJson(Map<String, dynamic> json) => _$SetScoreModelFromJson(json);

@override@JsonKey(name: 'team_one') final  int teamOne;
@override@JsonKey(name: 'team_two') final  int teamTwo;

/// Create a copy of SetScoreModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SetScoreModelCopyWith<_SetScoreModel> get copyWith => __$SetScoreModelCopyWithImpl<_SetScoreModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SetScoreModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SetScoreModel&&(identical(other.teamOne, teamOne) || other.teamOne == teamOne)&&(identical(other.teamTwo, teamTwo) || other.teamTwo == teamTwo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,teamOne,teamTwo);

@override
String toString() {
  return 'SetScoreModel(teamOne: $teamOne, teamTwo: $teamTwo)';
}


}

/// @nodoc
abstract mixin class _$SetScoreModelCopyWith<$Res> implements $SetScoreModelCopyWith<$Res> {
  factory _$SetScoreModelCopyWith(_SetScoreModel value, $Res Function(_SetScoreModel) _then) = __$SetScoreModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'team_one') int teamOne,@JsonKey(name: 'team_two') int teamTwo
});




}
/// @nodoc
class __$SetScoreModelCopyWithImpl<$Res>
    implements _$SetScoreModelCopyWith<$Res> {
  __$SetScoreModelCopyWithImpl(this._self, this._then);

  final _SetScoreModel _self;
  final $Res Function(_SetScoreModel) _then;

/// Create a copy of SetScoreModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? teamOne = null,Object? teamTwo = null,}) {
  return _then(_SetScoreModel(
teamOne: null == teamOne ? _self.teamOne : teamOne // ignore: cast_nullable_to_non_nullable
as int,teamTwo: null == teamTwo ? _self.teamTwo : teamTwo // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$GameScoreModel {

@JsonKey(name: 'team_one') int get teamOne;@JsonKey(name: 'team_two') int get teamTwo;
/// Create a copy of GameScoreModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$GameScoreModelCopyWith<GameScoreModel> get copyWith => _$GameScoreModelCopyWithImpl<GameScoreModel>(this as GameScoreModel, _$identity);

  /// Serializes this GameScoreModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is GameScoreModel&&(identical(other.teamOne, teamOne) || other.teamOne == teamOne)&&(identical(other.teamTwo, teamTwo) || other.teamTwo == teamTwo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,teamOne,teamTwo);

@override
String toString() {
  return 'GameScoreModel(teamOne: $teamOne, teamTwo: $teamTwo)';
}


}

/// @nodoc
abstract mixin class $GameScoreModelCopyWith<$Res>  {
  factory $GameScoreModelCopyWith(GameScoreModel value, $Res Function(GameScoreModel) _then) = _$GameScoreModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'team_one') int teamOne,@JsonKey(name: 'team_two') int teamTwo
});




}
/// @nodoc
class _$GameScoreModelCopyWithImpl<$Res>
    implements $GameScoreModelCopyWith<$Res> {
  _$GameScoreModelCopyWithImpl(this._self, this._then);

  final GameScoreModel _self;
  final $Res Function(GameScoreModel) _then;

/// Create a copy of GameScoreModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? teamOne = null,Object? teamTwo = null,}) {
  return _then(_self.copyWith(
teamOne: null == teamOne ? _self.teamOne : teamOne // ignore: cast_nullable_to_non_nullable
as int,teamTwo: null == teamTwo ? _self.teamTwo : teamTwo // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [GameScoreModel].
extension GameScoreModelPatterns on GameScoreModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _GameScoreModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _GameScoreModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _GameScoreModel value)  $default,){
final _that = this;
switch (_that) {
case _GameScoreModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _GameScoreModel value)?  $default,){
final _that = this;
switch (_that) {
case _GameScoreModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'team_one')  int teamOne, @JsonKey(name: 'team_two')  int teamTwo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _GameScoreModel() when $default != null:
return $default(_that.teamOne,_that.teamTwo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'team_one')  int teamOne, @JsonKey(name: 'team_two')  int teamTwo)  $default,) {final _that = this;
switch (_that) {
case _GameScoreModel():
return $default(_that.teamOne,_that.teamTwo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'team_one')  int teamOne, @JsonKey(name: 'team_two')  int teamTwo)?  $default,) {final _that = this;
switch (_that) {
case _GameScoreModel() when $default != null:
return $default(_that.teamOne,_that.teamTwo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _GameScoreModel implements GameScoreModel {
  const _GameScoreModel({@JsonKey(name: 'team_one') this.teamOne = 0, @JsonKey(name: 'team_two') this.teamTwo = 0});
  factory _GameScoreModel.fromJson(Map<String, dynamic> json) => _$GameScoreModelFromJson(json);

@override@JsonKey(name: 'team_one') final  int teamOne;
@override@JsonKey(name: 'team_two') final  int teamTwo;

/// Create a copy of GameScoreModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$GameScoreModelCopyWith<_GameScoreModel> get copyWith => __$GameScoreModelCopyWithImpl<_GameScoreModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$GameScoreModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _GameScoreModel&&(identical(other.teamOne, teamOne) || other.teamOne == teamOne)&&(identical(other.teamTwo, teamTwo) || other.teamTwo == teamTwo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,teamOne,teamTwo);

@override
String toString() {
  return 'GameScoreModel(teamOne: $teamOne, teamTwo: $teamTwo)';
}


}

/// @nodoc
abstract mixin class _$GameScoreModelCopyWith<$Res> implements $GameScoreModelCopyWith<$Res> {
  factory _$GameScoreModelCopyWith(_GameScoreModel value, $Res Function(_GameScoreModel) _then) = __$GameScoreModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'team_one') int teamOne,@JsonKey(name: 'team_two') int teamTwo
});




}
/// @nodoc
class __$GameScoreModelCopyWithImpl<$Res>
    implements _$GameScoreModelCopyWith<$Res> {
  __$GameScoreModelCopyWithImpl(this._self, this._then);

  final _GameScoreModel _self;
  final $Res Function(_GameScoreModel) _then;

/// Create a copy of GameScoreModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? teamOne = null,Object? teamTwo = null,}) {
  return _then(_GameScoreModel(
teamOne: null == teamOne ? _self.teamOne : teamOne // ignore: cast_nullable_to_non_nullable
as int,teamTwo: null == teamTwo ? _self.teamTwo : teamTwo // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$PointDisplayModel {

@JsonKey(name: 'team_one', fromJson: _str) String get teamOne;@JsonKey(name: 'team_two', fromJson: _str) String get teamTwo;
/// Create a copy of PointDisplayModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PointDisplayModelCopyWith<PointDisplayModel> get copyWith => _$PointDisplayModelCopyWithImpl<PointDisplayModel>(this as PointDisplayModel, _$identity);

  /// Serializes this PointDisplayModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PointDisplayModel&&(identical(other.teamOne, teamOne) || other.teamOne == teamOne)&&(identical(other.teamTwo, teamTwo) || other.teamTwo == teamTwo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,teamOne,teamTwo);

@override
String toString() {
  return 'PointDisplayModel(teamOne: $teamOne, teamTwo: $teamTwo)';
}


}

/// @nodoc
abstract mixin class $PointDisplayModelCopyWith<$Res>  {
  factory $PointDisplayModelCopyWith(PointDisplayModel value, $Res Function(PointDisplayModel) _then) = _$PointDisplayModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'team_one', fromJson: _str) String teamOne,@JsonKey(name: 'team_two', fromJson: _str) String teamTwo
});




}
/// @nodoc
class _$PointDisplayModelCopyWithImpl<$Res>
    implements $PointDisplayModelCopyWith<$Res> {
  _$PointDisplayModelCopyWithImpl(this._self, this._then);

  final PointDisplayModel _self;
  final $Res Function(PointDisplayModel) _then;

/// Create a copy of PointDisplayModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? teamOne = null,Object? teamTwo = null,}) {
  return _then(_self.copyWith(
teamOne: null == teamOne ? _self.teamOne : teamOne // ignore: cast_nullable_to_non_nullable
as String,teamTwo: null == teamTwo ? _self.teamTwo : teamTwo // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PointDisplayModel].
extension PointDisplayModelPatterns on PointDisplayModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PointDisplayModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PointDisplayModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PointDisplayModel value)  $default,){
final _that = this;
switch (_that) {
case _PointDisplayModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PointDisplayModel value)?  $default,){
final _that = this;
switch (_that) {
case _PointDisplayModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'team_one', fromJson: _str)  String teamOne, @JsonKey(name: 'team_two', fromJson: _str)  String teamTwo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PointDisplayModel() when $default != null:
return $default(_that.teamOne,_that.teamTwo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'team_one', fromJson: _str)  String teamOne, @JsonKey(name: 'team_two', fromJson: _str)  String teamTwo)  $default,) {final _that = this;
switch (_that) {
case _PointDisplayModel():
return $default(_that.teamOne,_that.teamTwo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'team_one', fromJson: _str)  String teamOne, @JsonKey(name: 'team_two', fromJson: _str)  String teamTwo)?  $default,) {final _that = this;
switch (_that) {
case _PointDisplayModel() when $default != null:
return $default(_that.teamOne,_that.teamTwo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PointDisplayModel implements PointDisplayModel {
  const _PointDisplayModel({@JsonKey(name: 'team_one', fromJson: _str) this.teamOne = '0', @JsonKey(name: 'team_two', fromJson: _str) this.teamTwo = '0'});
  factory _PointDisplayModel.fromJson(Map<String, dynamic> json) => _$PointDisplayModelFromJson(json);

@override@JsonKey(name: 'team_one', fromJson: _str) final  String teamOne;
@override@JsonKey(name: 'team_two', fromJson: _str) final  String teamTwo;

/// Create a copy of PointDisplayModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PointDisplayModelCopyWith<_PointDisplayModel> get copyWith => __$PointDisplayModelCopyWithImpl<_PointDisplayModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PointDisplayModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PointDisplayModel&&(identical(other.teamOne, teamOne) || other.teamOne == teamOne)&&(identical(other.teamTwo, teamTwo) || other.teamTwo == teamTwo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,teamOne,teamTwo);

@override
String toString() {
  return 'PointDisplayModel(teamOne: $teamOne, teamTwo: $teamTwo)';
}


}

/// @nodoc
abstract mixin class _$PointDisplayModelCopyWith<$Res> implements $PointDisplayModelCopyWith<$Res> {
  factory _$PointDisplayModelCopyWith(_PointDisplayModel value, $Res Function(_PointDisplayModel) _then) = __$PointDisplayModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'team_one', fromJson: _str) String teamOne,@JsonKey(name: 'team_two', fromJson: _str) String teamTwo
});




}
/// @nodoc
class __$PointDisplayModelCopyWithImpl<$Res>
    implements _$PointDisplayModelCopyWith<$Res> {
  __$PointDisplayModelCopyWithImpl(this._self, this._then);

  final _PointDisplayModel _self;
  final $Res Function(_PointDisplayModel) _then;

/// Create a copy of PointDisplayModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? teamOne = null,Object? teamTwo = null,}) {
  return _then(_PointDisplayModel(
teamOne: null == teamOne ? _self.teamOne : teamOne // ignore: cast_nullable_to_non_nullable
as String,teamTwo: null == teamTwo ? _self.teamTwo : teamTwo // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$LiveScoreModel {

 List<SetScoreModel> get sets;@JsonKey(name: 'current_set_games') GameScoreModel? get currentSetGames;@JsonKey(name: 'current_game') GameScoreModel? get currentGame;@JsonKey(name: 'is_tiebreak') bool get isTiebreak;
/// Create a copy of LiveScoreModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LiveScoreModelCopyWith<LiveScoreModel> get copyWith => _$LiveScoreModelCopyWithImpl<LiveScoreModel>(this as LiveScoreModel, _$identity);

  /// Serializes this LiveScoreModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LiveScoreModel&&const DeepCollectionEquality().equals(other.sets, sets)&&(identical(other.currentSetGames, currentSetGames) || other.currentSetGames == currentSetGames)&&(identical(other.currentGame, currentGame) || other.currentGame == currentGame)&&(identical(other.isTiebreak, isTiebreak) || other.isTiebreak == isTiebreak));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(sets),currentSetGames,currentGame,isTiebreak);

@override
String toString() {
  return 'LiveScoreModel(sets: $sets, currentSetGames: $currentSetGames, currentGame: $currentGame, isTiebreak: $isTiebreak)';
}


}

/// @nodoc
abstract mixin class $LiveScoreModelCopyWith<$Res>  {
  factory $LiveScoreModelCopyWith(LiveScoreModel value, $Res Function(LiveScoreModel) _then) = _$LiveScoreModelCopyWithImpl;
@useResult
$Res call({
 List<SetScoreModel> sets,@JsonKey(name: 'current_set_games') GameScoreModel? currentSetGames,@JsonKey(name: 'current_game') GameScoreModel? currentGame,@JsonKey(name: 'is_tiebreak') bool isTiebreak
});


$GameScoreModelCopyWith<$Res>? get currentSetGames;$GameScoreModelCopyWith<$Res>? get currentGame;

}
/// @nodoc
class _$LiveScoreModelCopyWithImpl<$Res>
    implements $LiveScoreModelCopyWith<$Res> {
  _$LiveScoreModelCopyWithImpl(this._self, this._then);

  final LiveScoreModel _self;
  final $Res Function(LiveScoreModel) _then;

/// Create a copy of LiveScoreModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? sets = null,Object? currentSetGames = freezed,Object? currentGame = freezed,Object? isTiebreak = null,}) {
  return _then(_self.copyWith(
sets: null == sets ? _self.sets : sets // ignore: cast_nullable_to_non_nullable
as List<SetScoreModel>,currentSetGames: freezed == currentSetGames ? _self.currentSetGames : currentSetGames // ignore: cast_nullable_to_non_nullable
as GameScoreModel?,currentGame: freezed == currentGame ? _self.currentGame : currentGame // ignore: cast_nullable_to_non_nullable
as GameScoreModel?,isTiebreak: null == isTiebreak ? _self.isTiebreak : isTiebreak // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of LiveScoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameScoreModelCopyWith<$Res>? get currentSetGames {
    if (_self.currentSetGames == null) {
    return null;
  }

  return $GameScoreModelCopyWith<$Res>(_self.currentSetGames!, (value) {
    return _then(_self.copyWith(currentSetGames: value));
  });
}/// Create a copy of LiveScoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameScoreModelCopyWith<$Res>? get currentGame {
    if (_self.currentGame == null) {
    return null;
  }

  return $GameScoreModelCopyWith<$Res>(_self.currentGame!, (value) {
    return _then(_self.copyWith(currentGame: value));
  });
}
}


/// Adds pattern-matching-related methods to [LiveScoreModel].
extension LiveScoreModelPatterns on LiveScoreModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LiveScoreModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LiveScoreModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LiveScoreModel value)  $default,){
final _that = this;
switch (_that) {
case _LiveScoreModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LiveScoreModel value)?  $default,){
final _that = this;
switch (_that) {
case _LiveScoreModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SetScoreModel> sets, @JsonKey(name: 'current_set_games')  GameScoreModel? currentSetGames, @JsonKey(name: 'current_game')  GameScoreModel? currentGame, @JsonKey(name: 'is_tiebreak')  bool isTiebreak)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LiveScoreModel() when $default != null:
return $default(_that.sets,_that.currentSetGames,_that.currentGame,_that.isTiebreak);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SetScoreModel> sets, @JsonKey(name: 'current_set_games')  GameScoreModel? currentSetGames, @JsonKey(name: 'current_game')  GameScoreModel? currentGame, @JsonKey(name: 'is_tiebreak')  bool isTiebreak)  $default,) {final _that = this;
switch (_that) {
case _LiveScoreModel():
return $default(_that.sets,_that.currentSetGames,_that.currentGame,_that.isTiebreak);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SetScoreModel> sets, @JsonKey(name: 'current_set_games')  GameScoreModel? currentSetGames, @JsonKey(name: 'current_game')  GameScoreModel? currentGame, @JsonKey(name: 'is_tiebreak')  bool isTiebreak)?  $default,) {final _that = this;
switch (_that) {
case _LiveScoreModel() when $default != null:
return $default(_that.sets,_that.currentSetGames,_that.currentGame,_that.isTiebreak);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LiveScoreModel implements LiveScoreModel {
  const _LiveScoreModel({final  List<SetScoreModel> sets = const [], @JsonKey(name: 'current_set_games') this.currentSetGames, @JsonKey(name: 'current_game') this.currentGame, @JsonKey(name: 'is_tiebreak') this.isTiebreak = false}): _sets = sets;
  factory _LiveScoreModel.fromJson(Map<String, dynamic> json) => _$LiveScoreModelFromJson(json);

 final  List<SetScoreModel> _sets;
@override@JsonKey() List<SetScoreModel> get sets {
  if (_sets is EqualUnmodifiableListView) return _sets;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sets);
}

@override@JsonKey(name: 'current_set_games') final  GameScoreModel? currentSetGames;
@override@JsonKey(name: 'current_game') final  GameScoreModel? currentGame;
@override@JsonKey(name: 'is_tiebreak') final  bool isTiebreak;

/// Create a copy of LiveScoreModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LiveScoreModelCopyWith<_LiveScoreModel> get copyWith => __$LiveScoreModelCopyWithImpl<_LiveScoreModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LiveScoreModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LiveScoreModel&&const DeepCollectionEquality().equals(other._sets, _sets)&&(identical(other.currentSetGames, currentSetGames) || other.currentSetGames == currentSetGames)&&(identical(other.currentGame, currentGame) || other.currentGame == currentGame)&&(identical(other.isTiebreak, isTiebreak) || other.isTiebreak == isTiebreak));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_sets),currentSetGames,currentGame,isTiebreak);

@override
String toString() {
  return 'LiveScoreModel(sets: $sets, currentSetGames: $currentSetGames, currentGame: $currentGame, isTiebreak: $isTiebreak)';
}


}

/// @nodoc
abstract mixin class _$LiveScoreModelCopyWith<$Res> implements $LiveScoreModelCopyWith<$Res> {
  factory _$LiveScoreModelCopyWith(_LiveScoreModel value, $Res Function(_LiveScoreModel) _then) = __$LiveScoreModelCopyWithImpl;
@override @useResult
$Res call({
 List<SetScoreModel> sets,@JsonKey(name: 'current_set_games') GameScoreModel? currentSetGames,@JsonKey(name: 'current_game') GameScoreModel? currentGame,@JsonKey(name: 'is_tiebreak') bool isTiebreak
});


@override $GameScoreModelCopyWith<$Res>? get currentSetGames;@override $GameScoreModelCopyWith<$Res>? get currentGame;

}
/// @nodoc
class __$LiveScoreModelCopyWithImpl<$Res>
    implements _$LiveScoreModelCopyWith<$Res> {
  __$LiveScoreModelCopyWithImpl(this._self, this._then);

  final _LiveScoreModel _self;
  final $Res Function(_LiveScoreModel) _then;

/// Create a copy of LiveScoreModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? sets = null,Object? currentSetGames = freezed,Object? currentGame = freezed,Object? isTiebreak = null,}) {
  return _then(_LiveScoreModel(
sets: null == sets ? _self._sets : sets // ignore: cast_nullable_to_non_nullable
as List<SetScoreModel>,currentSetGames: freezed == currentSetGames ? _self.currentSetGames : currentSetGames // ignore: cast_nullable_to_non_nullable
as GameScoreModel?,currentGame: freezed == currentGame ? _self.currentGame : currentGame // ignore: cast_nullable_to_non_nullable
as GameScoreModel?,isTiebreak: null == isTiebreak ? _self.isTiebreak : isTiebreak // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of LiveScoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameScoreModelCopyWith<$Res>? get currentSetGames {
    if (_self.currentSetGames == null) {
    return null;
  }

  return $GameScoreModelCopyWith<$Res>(_self.currentSetGames!, (value) {
    return _then(_self.copyWith(currentSetGames: value));
  });
}/// Create a copy of LiveScoreModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$GameScoreModelCopyWith<$Res>? get currentGame {
    if (_self.currentGame == null) {
    return null;
  }

  return $GameScoreModelCopyWith<$Res>(_self.currentGame!, (value) {
    return _then(_self.copyWith(currentGame: value));
  });
}
}


/// @nodoc
mixin _$MatchResultModel {

 int get id;@JsonKey(name: 'result_type') String get resultType;@JsonKey(name: 'verification_status') String get verificationStatus;@JsonKey(name: 'verified_at') DateTime? get verifiedAt;
/// Create a copy of MatchResultModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchResultModelCopyWith<MatchResultModel> get copyWith => _$MatchResultModelCopyWithImpl<MatchResultModel>(this as MatchResultModel, _$identity);

  /// Serializes this MatchResultModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchResultModel&&(identical(other.id, id) || other.id == id)&&(identical(other.resultType, resultType) || other.resultType == resultType)&&(identical(other.verificationStatus, verificationStatus) || other.verificationStatus == verificationStatus)&&(identical(other.verifiedAt, verifiedAt) || other.verifiedAt == verifiedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,resultType,verificationStatus,verifiedAt);

@override
String toString() {
  return 'MatchResultModel(id: $id, resultType: $resultType, verificationStatus: $verificationStatus, verifiedAt: $verifiedAt)';
}


}

/// @nodoc
abstract mixin class $MatchResultModelCopyWith<$Res>  {
  factory $MatchResultModelCopyWith(MatchResultModel value, $Res Function(MatchResultModel) _then) = _$MatchResultModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'result_type') String resultType,@JsonKey(name: 'verification_status') String verificationStatus,@JsonKey(name: 'verified_at') DateTime? verifiedAt
});




}
/// @nodoc
class _$MatchResultModelCopyWithImpl<$Res>
    implements $MatchResultModelCopyWith<$Res> {
  _$MatchResultModelCopyWithImpl(this._self, this._then);

  final MatchResultModel _self;
  final $Res Function(MatchResultModel) _then;

/// Create a copy of MatchResultModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? resultType = null,Object? verificationStatus = null,Object? verifiedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,resultType: null == resultType ? _self.resultType : resultType // ignore: cast_nullable_to_non_nullable
as String,verificationStatus: null == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as String,verifiedAt: freezed == verifiedAt ? _self.verifiedAt : verifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [MatchResultModel].
extension MatchResultModelPatterns on MatchResultModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchResultModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchResultModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchResultModel value)  $default,){
final _that = this;
switch (_that) {
case _MatchResultModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchResultModel value)?  $default,){
final _that = this;
switch (_that) {
case _MatchResultModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'result_type')  String resultType, @JsonKey(name: 'verification_status')  String verificationStatus, @JsonKey(name: 'verified_at')  DateTime? verifiedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchResultModel() when $default != null:
return $default(_that.id,_that.resultType,_that.verificationStatus,_that.verifiedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'result_type')  String resultType, @JsonKey(name: 'verification_status')  String verificationStatus, @JsonKey(name: 'verified_at')  DateTime? verifiedAt)  $default,) {final _that = this;
switch (_that) {
case _MatchResultModel():
return $default(_that.id,_that.resultType,_that.verificationStatus,_that.verifiedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'result_type')  String resultType, @JsonKey(name: 'verification_status')  String verificationStatus, @JsonKey(name: 'verified_at')  DateTime? verifiedAt)?  $default,) {final _that = this;
switch (_that) {
case _MatchResultModel() when $default != null:
return $default(_that.id,_that.resultType,_that.verificationStatus,_that.verifiedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchResultModel implements MatchResultModel {
  const _MatchResultModel({required this.id, @JsonKey(name: 'result_type') this.resultType = 'played', @JsonKey(name: 'verification_status') this.verificationStatus = 'pending', @JsonKey(name: 'verified_at') this.verifiedAt});
  factory _MatchResultModel.fromJson(Map<String, dynamic> json) => _$MatchResultModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'result_type') final  String resultType;
@override@JsonKey(name: 'verification_status') final  String verificationStatus;
@override@JsonKey(name: 'verified_at') final  DateTime? verifiedAt;

/// Create a copy of MatchResultModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchResultModelCopyWith<_MatchResultModel> get copyWith => __$MatchResultModelCopyWithImpl<_MatchResultModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchResultModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchResultModel&&(identical(other.id, id) || other.id == id)&&(identical(other.resultType, resultType) || other.resultType == resultType)&&(identical(other.verificationStatus, verificationStatus) || other.verificationStatus == verificationStatus)&&(identical(other.verifiedAt, verifiedAt) || other.verifiedAt == verifiedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,resultType,verificationStatus,verifiedAt);

@override
String toString() {
  return 'MatchResultModel(id: $id, resultType: $resultType, verificationStatus: $verificationStatus, verifiedAt: $verifiedAt)';
}


}

/// @nodoc
abstract mixin class _$MatchResultModelCopyWith<$Res> implements $MatchResultModelCopyWith<$Res> {
  factory _$MatchResultModelCopyWith(_MatchResultModel value, $Res Function(_MatchResultModel) _then) = __$MatchResultModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'result_type') String resultType,@JsonKey(name: 'verification_status') String verificationStatus,@JsonKey(name: 'verified_at') DateTime? verifiedAt
});




}
/// @nodoc
class __$MatchResultModelCopyWithImpl<$Res>
    implements _$MatchResultModelCopyWith<$Res> {
  __$MatchResultModelCopyWithImpl(this._self, this._then);

  final _MatchResultModel _self;
  final $Res Function(_MatchResultModel) _then;

/// Create a copy of MatchResultModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? resultType = null,Object? verificationStatus = null,Object? verifiedAt = freezed,}) {
  return _then(_MatchResultModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,resultType: null == resultType ? _self.resultType : resultType // ignore: cast_nullable_to_non_nullable
as String,verificationStatus: null == verificationStatus ? _self.verificationStatus : verificationStatus // ignore: cast_nullable_to_non_nullable
as String,verifiedAt: freezed == verifiedAt ? _self.verifiedAt : verifiedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$MatchModel {

 int get id;@JsonKey(name: 'tournament_id') int? get tournamentId;@JsonKey(name: 'category_id') int? get categoryId; IdNameModel? get category; IdNameModel? get group; IdNameModel? get tournament; String? get round;@JsonKey(name: 'round_label') String? get roundLabel;@JsonKey(name: 'round_position') int? get roundPosition; String get status;@JsonKey(name: 'is_live') bool get isLive;@JsonKey(name: 'scheduled_at') DateTime? get scheduledAt;@JsonKey(name: 'started_at') DateTime? get startedAt;@JsonKey(name: 'completed_at') DateTime? get completedAt; String? get court;@JsonKey(name: 'court_id') int? get courtId;@JsonKey(name: 'team_one') MatchTeamModel? get teamOne;@JsonKey(name: 'team_two') MatchTeamModel? get teamTwo;@JsonKey(name: 'sets_won_team_one') int get setsWonTeamOne;@JsonKey(name: 'sets_won_team_two') int get setsWonTeamTwo;@JsonKey(name: 'live_score') LiveScoreModel? get liveScore;@JsonKey(name: 'current_game_display') PointDisplayModel? get currentGameDisplay; int get version;@JsonKey(name: 'winner_team_id') int? get winnerTeamId;@JsonKey(name: 'next_match_id') int? get nextMatchId;@JsonKey(name: 'is_bye') bool get isBye; MatchResultModel? get result;@JsonKey(name: 'deuce_enabled') bool get deuceEnabled;@JsonKey(name: 'last_point') PointEventModel? get lastPoint;@JsonKey(name: 'ended_early') bool get endedEarly;
/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MatchModelCopyWith<MatchModel> get copyWith => _$MatchModelCopyWithImpl<MatchModel>(this as MatchModel, _$identity);

  /// Serializes this MatchModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MatchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.tournamentId, tournamentId) || other.tournamentId == tournamentId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.category, category) || other.category == category)&&(identical(other.group, group) || other.group == group)&&(identical(other.tournament, tournament) || other.tournament == tournament)&&(identical(other.round, round) || other.round == round)&&(identical(other.roundLabel, roundLabel) || other.roundLabel == roundLabel)&&(identical(other.roundPosition, roundPosition) || other.roundPosition == roundPosition)&&(identical(other.status, status) || other.status == status)&&(identical(other.isLive, isLive) || other.isLive == isLive)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.court, court) || other.court == court)&&(identical(other.courtId, courtId) || other.courtId == courtId)&&(identical(other.teamOne, teamOne) || other.teamOne == teamOne)&&(identical(other.teamTwo, teamTwo) || other.teamTwo == teamTwo)&&(identical(other.setsWonTeamOne, setsWonTeamOne) || other.setsWonTeamOne == setsWonTeamOne)&&(identical(other.setsWonTeamTwo, setsWonTeamTwo) || other.setsWonTeamTwo == setsWonTeamTwo)&&(identical(other.liveScore, liveScore) || other.liveScore == liveScore)&&(identical(other.currentGameDisplay, currentGameDisplay) || other.currentGameDisplay == currentGameDisplay)&&(identical(other.version, version) || other.version == version)&&(identical(other.winnerTeamId, winnerTeamId) || other.winnerTeamId == winnerTeamId)&&(identical(other.nextMatchId, nextMatchId) || other.nextMatchId == nextMatchId)&&(identical(other.isBye, isBye) || other.isBye == isBye)&&(identical(other.result, result) || other.result == result)&&(identical(other.deuceEnabled, deuceEnabled) || other.deuceEnabled == deuceEnabled)&&(identical(other.lastPoint, lastPoint) || other.lastPoint == lastPoint)&&(identical(other.endedEarly, endedEarly) || other.endedEarly == endedEarly));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,tournamentId,categoryId,category,group,tournament,round,roundLabel,roundPosition,status,isLive,scheduledAt,startedAt,completedAt,court,courtId,teamOne,teamTwo,setsWonTeamOne,setsWonTeamTwo,liveScore,currentGameDisplay,version,winnerTeamId,nextMatchId,isBye,result,deuceEnabled,lastPoint,endedEarly]);

@override
String toString() {
  return 'MatchModel(id: $id, tournamentId: $tournamentId, categoryId: $categoryId, category: $category, group: $group, tournament: $tournament, round: $round, roundLabel: $roundLabel, roundPosition: $roundPosition, status: $status, isLive: $isLive, scheduledAt: $scheduledAt, startedAt: $startedAt, completedAt: $completedAt, court: $court, courtId: $courtId, teamOne: $teamOne, teamTwo: $teamTwo, setsWonTeamOne: $setsWonTeamOne, setsWonTeamTwo: $setsWonTeamTwo, liveScore: $liveScore, currentGameDisplay: $currentGameDisplay, version: $version, winnerTeamId: $winnerTeamId, nextMatchId: $nextMatchId, isBye: $isBye, result: $result, deuceEnabled: $deuceEnabled, lastPoint: $lastPoint, endedEarly: $endedEarly)';
}


}

/// @nodoc
abstract mixin class $MatchModelCopyWith<$Res>  {
  factory $MatchModelCopyWith(MatchModel value, $Res Function(MatchModel) _then) = _$MatchModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'tournament_id') int? tournamentId,@JsonKey(name: 'category_id') int? categoryId, IdNameModel? category, IdNameModel? group, IdNameModel? tournament, String? round,@JsonKey(name: 'round_label') String? roundLabel,@JsonKey(name: 'round_position') int? roundPosition, String status,@JsonKey(name: 'is_live') bool isLive,@JsonKey(name: 'scheduled_at') DateTime? scheduledAt,@JsonKey(name: 'started_at') DateTime? startedAt,@JsonKey(name: 'completed_at') DateTime? completedAt, String? court,@JsonKey(name: 'court_id') int? courtId,@JsonKey(name: 'team_one') MatchTeamModel? teamOne,@JsonKey(name: 'team_two') MatchTeamModel? teamTwo,@JsonKey(name: 'sets_won_team_one') int setsWonTeamOne,@JsonKey(name: 'sets_won_team_two') int setsWonTeamTwo,@JsonKey(name: 'live_score') LiveScoreModel? liveScore,@JsonKey(name: 'current_game_display') PointDisplayModel? currentGameDisplay, int version,@JsonKey(name: 'winner_team_id') int? winnerTeamId,@JsonKey(name: 'next_match_id') int? nextMatchId,@JsonKey(name: 'is_bye') bool isBye, MatchResultModel? result,@JsonKey(name: 'deuce_enabled') bool deuceEnabled,@JsonKey(name: 'last_point') PointEventModel? lastPoint,@JsonKey(name: 'ended_early') bool endedEarly
});


$IdNameModelCopyWith<$Res>? get category;$IdNameModelCopyWith<$Res>? get group;$IdNameModelCopyWith<$Res>? get tournament;$MatchTeamModelCopyWith<$Res>? get teamOne;$MatchTeamModelCopyWith<$Res>? get teamTwo;$LiveScoreModelCopyWith<$Res>? get liveScore;$PointDisplayModelCopyWith<$Res>? get currentGameDisplay;$MatchResultModelCopyWith<$Res>? get result;$PointEventModelCopyWith<$Res>? get lastPoint;

}
/// @nodoc
class _$MatchModelCopyWithImpl<$Res>
    implements $MatchModelCopyWith<$Res> {
  _$MatchModelCopyWithImpl(this._self, this._then);

  final MatchModel _self;
  final $Res Function(MatchModel) _then;

/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? tournamentId = freezed,Object? categoryId = freezed,Object? category = freezed,Object? group = freezed,Object? tournament = freezed,Object? round = freezed,Object? roundLabel = freezed,Object? roundPosition = freezed,Object? status = null,Object? isLive = null,Object? scheduledAt = freezed,Object? startedAt = freezed,Object? completedAt = freezed,Object? court = freezed,Object? courtId = freezed,Object? teamOne = freezed,Object? teamTwo = freezed,Object? setsWonTeamOne = null,Object? setsWonTeamTwo = null,Object? liveScore = freezed,Object? currentGameDisplay = freezed,Object? version = null,Object? winnerTeamId = freezed,Object? nextMatchId = freezed,Object? isBye = null,Object? result = freezed,Object? deuceEnabled = null,Object? lastPoint = freezed,Object? endedEarly = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tournamentId: freezed == tournamentId ? _self.tournamentId : tournamentId // ignore: cast_nullable_to_non_nullable
as int?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as IdNameModel?,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as IdNameModel?,tournament: freezed == tournament ? _self.tournament : tournament // ignore: cast_nullable_to_non_nullable
as IdNameModel?,round: freezed == round ? _self.round : round // ignore: cast_nullable_to_non_nullable
as String?,roundLabel: freezed == roundLabel ? _self.roundLabel : roundLabel // ignore: cast_nullable_to_non_nullable
as String?,roundPosition: freezed == roundPosition ? _self.roundPosition : roundPosition // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,isLive: null == isLive ? _self.isLive : isLive // ignore: cast_nullable_to_non_nullable
as bool,scheduledAt: freezed == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,court: freezed == court ? _self.court : court // ignore: cast_nullable_to_non_nullable
as String?,courtId: freezed == courtId ? _self.courtId : courtId // ignore: cast_nullable_to_non_nullable
as int?,teamOne: freezed == teamOne ? _self.teamOne : teamOne // ignore: cast_nullable_to_non_nullable
as MatchTeamModel?,teamTwo: freezed == teamTwo ? _self.teamTwo : teamTwo // ignore: cast_nullable_to_non_nullable
as MatchTeamModel?,setsWonTeamOne: null == setsWonTeamOne ? _self.setsWonTeamOne : setsWonTeamOne // ignore: cast_nullable_to_non_nullable
as int,setsWonTeamTwo: null == setsWonTeamTwo ? _self.setsWonTeamTwo : setsWonTeamTwo // ignore: cast_nullable_to_non_nullable
as int,liveScore: freezed == liveScore ? _self.liveScore : liveScore // ignore: cast_nullable_to_non_nullable
as LiveScoreModel?,currentGameDisplay: freezed == currentGameDisplay ? _self.currentGameDisplay : currentGameDisplay // ignore: cast_nullable_to_non_nullable
as PointDisplayModel?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,winnerTeamId: freezed == winnerTeamId ? _self.winnerTeamId : winnerTeamId // ignore: cast_nullable_to_non_nullable
as int?,nextMatchId: freezed == nextMatchId ? _self.nextMatchId : nextMatchId // ignore: cast_nullable_to_non_nullable
as int?,isBye: null == isBye ? _self.isBye : isBye // ignore: cast_nullable_to_non_nullable
as bool,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as MatchResultModel?,deuceEnabled: null == deuceEnabled ? _self.deuceEnabled : deuceEnabled // ignore: cast_nullable_to_non_nullable
as bool,lastPoint: freezed == lastPoint ? _self.lastPoint : lastPoint // ignore: cast_nullable_to_non_nullable
as PointEventModel?,endedEarly: null == endedEarly ? _self.endedEarly : endedEarly // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $IdNameModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameModelCopyWith<$Res>? get group {
    if (_self.group == null) {
    return null;
  }

  return $IdNameModelCopyWith<$Res>(_self.group!, (value) {
    return _then(_self.copyWith(group: value));
  });
}/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameModelCopyWith<$Res>? get tournament {
    if (_self.tournament == null) {
    return null;
  }

  return $IdNameModelCopyWith<$Res>(_self.tournament!, (value) {
    return _then(_self.copyWith(tournament: value));
  });
}/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchTeamModelCopyWith<$Res>? get teamOne {
    if (_self.teamOne == null) {
    return null;
  }

  return $MatchTeamModelCopyWith<$Res>(_self.teamOne!, (value) {
    return _then(_self.copyWith(teamOne: value));
  });
}/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchTeamModelCopyWith<$Res>? get teamTwo {
    if (_self.teamTwo == null) {
    return null;
  }

  return $MatchTeamModelCopyWith<$Res>(_self.teamTwo!, (value) {
    return _then(_self.copyWith(teamTwo: value));
  });
}/// Create a copy of MatchModel
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
}/// Create a copy of MatchModel
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
}/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchResultModelCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $MatchResultModelCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}/// Create a copy of MatchModel
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


/// Adds pattern-matching-related methods to [MatchModel].
extension MatchModelPatterns on MatchModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MatchModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MatchModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MatchModel value)  $default,){
final _that = this;
switch (_that) {
case _MatchModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MatchModel value)?  $default,){
final _that = this;
switch (_that) {
case _MatchModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'tournament_id')  int? tournamentId, @JsonKey(name: 'category_id')  int? categoryId,  IdNameModel? category,  IdNameModel? group,  IdNameModel? tournament,  String? round, @JsonKey(name: 'round_label')  String? roundLabel, @JsonKey(name: 'round_position')  int? roundPosition,  String status, @JsonKey(name: 'is_live')  bool isLive, @JsonKey(name: 'scheduled_at')  DateTime? scheduledAt, @JsonKey(name: 'started_at')  DateTime? startedAt, @JsonKey(name: 'completed_at')  DateTime? completedAt,  String? court, @JsonKey(name: 'court_id')  int? courtId, @JsonKey(name: 'team_one')  MatchTeamModel? teamOne, @JsonKey(name: 'team_two')  MatchTeamModel? teamTwo, @JsonKey(name: 'sets_won_team_one')  int setsWonTeamOne, @JsonKey(name: 'sets_won_team_two')  int setsWonTeamTwo, @JsonKey(name: 'live_score')  LiveScoreModel? liveScore, @JsonKey(name: 'current_game_display')  PointDisplayModel? currentGameDisplay,  int version, @JsonKey(name: 'winner_team_id')  int? winnerTeamId, @JsonKey(name: 'next_match_id')  int? nextMatchId, @JsonKey(name: 'is_bye')  bool isBye,  MatchResultModel? result, @JsonKey(name: 'deuce_enabled')  bool deuceEnabled, @JsonKey(name: 'last_point')  PointEventModel? lastPoint, @JsonKey(name: 'ended_early')  bool endedEarly)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MatchModel() when $default != null:
return $default(_that.id,_that.tournamentId,_that.categoryId,_that.category,_that.group,_that.tournament,_that.round,_that.roundLabel,_that.roundPosition,_that.status,_that.isLive,_that.scheduledAt,_that.startedAt,_that.completedAt,_that.court,_that.courtId,_that.teamOne,_that.teamTwo,_that.setsWonTeamOne,_that.setsWonTeamTwo,_that.liveScore,_that.currentGameDisplay,_that.version,_that.winnerTeamId,_that.nextMatchId,_that.isBye,_that.result,_that.deuceEnabled,_that.lastPoint,_that.endedEarly);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'tournament_id')  int? tournamentId, @JsonKey(name: 'category_id')  int? categoryId,  IdNameModel? category,  IdNameModel? group,  IdNameModel? tournament,  String? round, @JsonKey(name: 'round_label')  String? roundLabel, @JsonKey(name: 'round_position')  int? roundPosition,  String status, @JsonKey(name: 'is_live')  bool isLive, @JsonKey(name: 'scheduled_at')  DateTime? scheduledAt, @JsonKey(name: 'started_at')  DateTime? startedAt, @JsonKey(name: 'completed_at')  DateTime? completedAt,  String? court, @JsonKey(name: 'court_id')  int? courtId, @JsonKey(name: 'team_one')  MatchTeamModel? teamOne, @JsonKey(name: 'team_two')  MatchTeamModel? teamTwo, @JsonKey(name: 'sets_won_team_one')  int setsWonTeamOne, @JsonKey(name: 'sets_won_team_two')  int setsWonTeamTwo, @JsonKey(name: 'live_score')  LiveScoreModel? liveScore, @JsonKey(name: 'current_game_display')  PointDisplayModel? currentGameDisplay,  int version, @JsonKey(name: 'winner_team_id')  int? winnerTeamId, @JsonKey(name: 'next_match_id')  int? nextMatchId, @JsonKey(name: 'is_bye')  bool isBye,  MatchResultModel? result, @JsonKey(name: 'deuce_enabled')  bool deuceEnabled, @JsonKey(name: 'last_point')  PointEventModel? lastPoint, @JsonKey(name: 'ended_early')  bool endedEarly)  $default,) {final _that = this;
switch (_that) {
case _MatchModel():
return $default(_that.id,_that.tournamentId,_that.categoryId,_that.category,_that.group,_that.tournament,_that.round,_that.roundLabel,_that.roundPosition,_that.status,_that.isLive,_that.scheduledAt,_that.startedAt,_that.completedAt,_that.court,_that.courtId,_that.teamOne,_that.teamTwo,_that.setsWonTeamOne,_that.setsWonTeamTwo,_that.liveScore,_that.currentGameDisplay,_that.version,_that.winnerTeamId,_that.nextMatchId,_that.isBye,_that.result,_that.deuceEnabled,_that.lastPoint,_that.endedEarly);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'tournament_id')  int? tournamentId, @JsonKey(name: 'category_id')  int? categoryId,  IdNameModel? category,  IdNameModel? group,  IdNameModel? tournament,  String? round, @JsonKey(name: 'round_label')  String? roundLabel, @JsonKey(name: 'round_position')  int? roundPosition,  String status, @JsonKey(name: 'is_live')  bool isLive, @JsonKey(name: 'scheduled_at')  DateTime? scheduledAt, @JsonKey(name: 'started_at')  DateTime? startedAt, @JsonKey(name: 'completed_at')  DateTime? completedAt,  String? court, @JsonKey(name: 'court_id')  int? courtId, @JsonKey(name: 'team_one')  MatchTeamModel? teamOne, @JsonKey(name: 'team_two')  MatchTeamModel? teamTwo, @JsonKey(name: 'sets_won_team_one')  int setsWonTeamOne, @JsonKey(name: 'sets_won_team_two')  int setsWonTeamTwo, @JsonKey(name: 'live_score')  LiveScoreModel? liveScore, @JsonKey(name: 'current_game_display')  PointDisplayModel? currentGameDisplay,  int version, @JsonKey(name: 'winner_team_id')  int? winnerTeamId, @JsonKey(name: 'next_match_id')  int? nextMatchId, @JsonKey(name: 'is_bye')  bool isBye,  MatchResultModel? result, @JsonKey(name: 'deuce_enabled')  bool deuceEnabled, @JsonKey(name: 'last_point')  PointEventModel? lastPoint, @JsonKey(name: 'ended_early')  bool endedEarly)?  $default,) {final _that = this;
switch (_that) {
case _MatchModel() when $default != null:
return $default(_that.id,_that.tournamentId,_that.categoryId,_that.category,_that.group,_that.tournament,_that.round,_that.roundLabel,_that.roundPosition,_that.status,_that.isLive,_that.scheduledAt,_that.startedAt,_that.completedAt,_that.court,_that.courtId,_that.teamOne,_that.teamTwo,_that.setsWonTeamOne,_that.setsWonTeamTwo,_that.liveScore,_that.currentGameDisplay,_that.version,_that.winnerTeamId,_that.nextMatchId,_that.isBye,_that.result,_that.deuceEnabled,_that.lastPoint,_that.endedEarly);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MatchModel implements MatchModel {
  const _MatchModel({required this.id, @JsonKey(name: 'tournament_id') this.tournamentId, @JsonKey(name: 'category_id') this.categoryId, this.category, this.group, this.tournament, this.round, @JsonKey(name: 'round_label') this.roundLabel, @JsonKey(name: 'round_position') this.roundPosition, this.status = 'scheduled', @JsonKey(name: 'is_live') this.isLive = false, @JsonKey(name: 'scheduled_at') this.scheduledAt, @JsonKey(name: 'started_at') this.startedAt, @JsonKey(name: 'completed_at') this.completedAt, this.court, @JsonKey(name: 'court_id') this.courtId, @JsonKey(name: 'team_one') this.teamOne, @JsonKey(name: 'team_two') this.teamTwo, @JsonKey(name: 'sets_won_team_one') this.setsWonTeamOne = 0, @JsonKey(name: 'sets_won_team_two') this.setsWonTeamTwo = 0, @JsonKey(name: 'live_score') this.liveScore, @JsonKey(name: 'current_game_display') this.currentGameDisplay, this.version = 0, @JsonKey(name: 'winner_team_id') this.winnerTeamId, @JsonKey(name: 'next_match_id') this.nextMatchId, @JsonKey(name: 'is_bye') this.isBye = false, this.result, @JsonKey(name: 'deuce_enabled') this.deuceEnabled = true, @JsonKey(name: 'last_point') this.lastPoint, @JsonKey(name: 'ended_early') this.endedEarly = false});
  factory _MatchModel.fromJson(Map<String, dynamic> json) => _$MatchModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'tournament_id') final  int? tournamentId;
@override@JsonKey(name: 'category_id') final  int? categoryId;
@override final  IdNameModel? category;
@override final  IdNameModel? group;
@override final  IdNameModel? tournament;
@override final  String? round;
@override@JsonKey(name: 'round_label') final  String? roundLabel;
@override@JsonKey(name: 'round_position') final  int? roundPosition;
@override@JsonKey() final  String status;
@override@JsonKey(name: 'is_live') final  bool isLive;
@override@JsonKey(name: 'scheduled_at') final  DateTime? scheduledAt;
@override@JsonKey(name: 'started_at') final  DateTime? startedAt;
@override@JsonKey(name: 'completed_at') final  DateTime? completedAt;
@override final  String? court;
@override@JsonKey(name: 'court_id') final  int? courtId;
@override@JsonKey(name: 'team_one') final  MatchTeamModel? teamOne;
@override@JsonKey(name: 'team_two') final  MatchTeamModel? teamTwo;
@override@JsonKey(name: 'sets_won_team_one') final  int setsWonTeamOne;
@override@JsonKey(name: 'sets_won_team_two') final  int setsWonTeamTwo;
@override@JsonKey(name: 'live_score') final  LiveScoreModel? liveScore;
@override@JsonKey(name: 'current_game_display') final  PointDisplayModel? currentGameDisplay;
@override@JsonKey() final  int version;
@override@JsonKey(name: 'winner_team_id') final  int? winnerTeamId;
@override@JsonKey(name: 'next_match_id') final  int? nextMatchId;
@override@JsonKey(name: 'is_bye') final  bool isBye;
@override final  MatchResultModel? result;
@override@JsonKey(name: 'deuce_enabled') final  bool deuceEnabled;
@override@JsonKey(name: 'last_point') final  PointEventModel? lastPoint;
@override@JsonKey(name: 'ended_early') final  bool endedEarly;

/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MatchModelCopyWith<_MatchModel> get copyWith => __$MatchModelCopyWithImpl<_MatchModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MatchModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MatchModel&&(identical(other.id, id) || other.id == id)&&(identical(other.tournamentId, tournamentId) || other.tournamentId == tournamentId)&&(identical(other.categoryId, categoryId) || other.categoryId == categoryId)&&(identical(other.category, category) || other.category == category)&&(identical(other.group, group) || other.group == group)&&(identical(other.tournament, tournament) || other.tournament == tournament)&&(identical(other.round, round) || other.round == round)&&(identical(other.roundLabel, roundLabel) || other.roundLabel == roundLabel)&&(identical(other.roundPosition, roundPosition) || other.roundPosition == roundPosition)&&(identical(other.status, status) || other.status == status)&&(identical(other.isLive, isLive) || other.isLive == isLive)&&(identical(other.scheduledAt, scheduledAt) || other.scheduledAt == scheduledAt)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt)&&(identical(other.court, court) || other.court == court)&&(identical(other.courtId, courtId) || other.courtId == courtId)&&(identical(other.teamOne, teamOne) || other.teamOne == teamOne)&&(identical(other.teamTwo, teamTwo) || other.teamTwo == teamTwo)&&(identical(other.setsWonTeamOne, setsWonTeamOne) || other.setsWonTeamOne == setsWonTeamOne)&&(identical(other.setsWonTeamTwo, setsWonTeamTwo) || other.setsWonTeamTwo == setsWonTeamTwo)&&(identical(other.liveScore, liveScore) || other.liveScore == liveScore)&&(identical(other.currentGameDisplay, currentGameDisplay) || other.currentGameDisplay == currentGameDisplay)&&(identical(other.version, version) || other.version == version)&&(identical(other.winnerTeamId, winnerTeamId) || other.winnerTeamId == winnerTeamId)&&(identical(other.nextMatchId, nextMatchId) || other.nextMatchId == nextMatchId)&&(identical(other.isBye, isBye) || other.isBye == isBye)&&(identical(other.result, result) || other.result == result)&&(identical(other.deuceEnabled, deuceEnabled) || other.deuceEnabled == deuceEnabled)&&(identical(other.lastPoint, lastPoint) || other.lastPoint == lastPoint)&&(identical(other.endedEarly, endedEarly) || other.endedEarly == endedEarly));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,tournamentId,categoryId,category,group,tournament,round,roundLabel,roundPosition,status,isLive,scheduledAt,startedAt,completedAt,court,courtId,teamOne,teamTwo,setsWonTeamOne,setsWonTeamTwo,liveScore,currentGameDisplay,version,winnerTeamId,nextMatchId,isBye,result,deuceEnabled,lastPoint,endedEarly]);

@override
String toString() {
  return 'MatchModel(id: $id, tournamentId: $tournamentId, categoryId: $categoryId, category: $category, group: $group, tournament: $tournament, round: $round, roundLabel: $roundLabel, roundPosition: $roundPosition, status: $status, isLive: $isLive, scheduledAt: $scheduledAt, startedAt: $startedAt, completedAt: $completedAt, court: $court, courtId: $courtId, teamOne: $teamOne, teamTwo: $teamTwo, setsWonTeamOne: $setsWonTeamOne, setsWonTeamTwo: $setsWonTeamTwo, liveScore: $liveScore, currentGameDisplay: $currentGameDisplay, version: $version, winnerTeamId: $winnerTeamId, nextMatchId: $nextMatchId, isBye: $isBye, result: $result, deuceEnabled: $deuceEnabled, lastPoint: $lastPoint, endedEarly: $endedEarly)';
}


}

/// @nodoc
abstract mixin class _$MatchModelCopyWith<$Res> implements $MatchModelCopyWith<$Res> {
  factory _$MatchModelCopyWith(_MatchModel value, $Res Function(_MatchModel) _then) = __$MatchModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'tournament_id') int? tournamentId,@JsonKey(name: 'category_id') int? categoryId, IdNameModel? category, IdNameModel? group, IdNameModel? tournament, String? round,@JsonKey(name: 'round_label') String? roundLabel,@JsonKey(name: 'round_position') int? roundPosition, String status,@JsonKey(name: 'is_live') bool isLive,@JsonKey(name: 'scheduled_at') DateTime? scheduledAt,@JsonKey(name: 'started_at') DateTime? startedAt,@JsonKey(name: 'completed_at') DateTime? completedAt, String? court,@JsonKey(name: 'court_id') int? courtId,@JsonKey(name: 'team_one') MatchTeamModel? teamOne,@JsonKey(name: 'team_two') MatchTeamModel? teamTwo,@JsonKey(name: 'sets_won_team_one') int setsWonTeamOne,@JsonKey(name: 'sets_won_team_two') int setsWonTeamTwo,@JsonKey(name: 'live_score') LiveScoreModel? liveScore,@JsonKey(name: 'current_game_display') PointDisplayModel? currentGameDisplay, int version,@JsonKey(name: 'winner_team_id') int? winnerTeamId,@JsonKey(name: 'next_match_id') int? nextMatchId,@JsonKey(name: 'is_bye') bool isBye, MatchResultModel? result,@JsonKey(name: 'deuce_enabled') bool deuceEnabled,@JsonKey(name: 'last_point') PointEventModel? lastPoint,@JsonKey(name: 'ended_early') bool endedEarly
});


@override $IdNameModelCopyWith<$Res>? get category;@override $IdNameModelCopyWith<$Res>? get group;@override $IdNameModelCopyWith<$Res>? get tournament;@override $MatchTeamModelCopyWith<$Res>? get teamOne;@override $MatchTeamModelCopyWith<$Res>? get teamTwo;@override $LiveScoreModelCopyWith<$Res>? get liveScore;@override $PointDisplayModelCopyWith<$Res>? get currentGameDisplay;@override $MatchResultModelCopyWith<$Res>? get result;@override $PointEventModelCopyWith<$Res>? get lastPoint;

}
/// @nodoc
class __$MatchModelCopyWithImpl<$Res>
    implements _$MatchModelCopyWith<$Res> {
  __$MatchModelCopyWithImpl(this._self, this._then);

  final _MatchModel _self;
  final $Res Function(_MatchModel) _then;

/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? tournamentId = freezed,Object? categoryId = freezed,Object? category = freezed,Object? group = freezed,Object? tournament = freezed,Object? round = freezed,Object? roundLabel = freezed,Object? roundPosition = freezed,Object? status = null,Object? isLive = null,Object? scheduledAt = freezed,Object? startedAt = freezed,Object? completedAt = freezed,Object? court = freezed,Object? courtId = freezed,Object? teamOne = freezed,Object? teamTwo = freezed,Object? setsWonTeamOne = null,Object? setsWonTeamTwo = null,Object? liveScore = freezed,Object? currentGameDisplay = freezed,Object? version = null,Object? winnerTeamId = freezed,Object? nextMatchId = freezed,Object? isBye = null,Object? result = freezed,Object? deuceEnabled = null,Object? lastPoint = freezed,Object? endedEarly = null,}) {
  return _then(_MatchModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,tournamentId: freezed == tournamentId ? _self.tournamentId : tournamentId // ignore: cast_nullable_to_non_nullable
as int?,categoryId: freezed == categoryId ? _self.categoryId : categoryId // ignore: cast_nullable_to_non_nullable
as int?,category: freezed == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as IdNameModel?,group: freezed == group ? _self.group : group // ignore: cast_nullable_to_non_nullable
as IdNameModel?,tournament: freezed == tournament ? _self.tournament : tournament // ignore: cast_nullable_to_non_nullable
as IdNameModel?,round: freezed == round ? _self.round : round // ignore: cast_nullable_to_non_nullable
as String?,roundLabel: freezed == roundLabel ? _self.roundLabel : roundLabel // ignore: cast_nullable_to_non_nullable
as String?,roundPosition: freezed == roundPosition ? _self.roundPosition : roundPosition // ignore: cast_nullable_to_non_nullable
as int?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,isLive: null == isLive ? _self.isLive : isLive // ignore: cast_nullable_to_non_nullable
as bool,scheduledAt: freezed == scheduledAt ? _self.scheduledAt : scheduledAt // ignore: cast_nullable_to_non_nullable
as DateTime?,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,court: freezed == court ? _self.court : court // ignore: cast_nullable_to_non_nullable
as String?,courtId: freezed == courtId ? _self.courtId : courtId // ignore: cast_nullable_to_non_nullable
as int?,teamOne: freezed == teamOne ? _self.teamOne : teamOne // ignore: cast_nullable_to_non_nullable
as MatchTeamModel?,teamTwo: freezed == teamTwo ? _self.teamTwo : teamTwo // ignore: cast_nullable_to_non_nullable
as MatchTeamModel?,setsWonTeamOne: null == setsWonTeamOne ? _self.setsWonTeamOne : setsWonTeamOne // ignore: cast_nullable_to_non_nullable
as int,setsWonTeamTwo: null == setsWonTeamTwo ? _self.setsWonTeamTwo : setsWonTeamTwo // ignore: cast_nullable_to_non_nullable
as int,liveScore: freezed == liveScore ? _self.liveScore : liveScore // ignore: cast_nullable_to_non_nullable
as LiveScoreModel?,currentGameDisplay: freezed == currentGameDisplay ? _self.currentGameDisplay : currentGameDisplay // ignore: cast_nullable_to_non_nullable
as PointDisplayModel?,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as int,winnerTeamId: freezed == winnerTeamId ? _self.winnerTeamId : winnerTeamId // ignore: cast_nullable_to_non_nullable
as int?,nextMatchId: freezed == nextMatchId ? _self.nextMatchId : nextMatchId // ignore: cast_nullable_to_non_nullable
as int?,isBye: null == isBye ? _self.isBye : isBye // ignore: cast_nullable_to_non_nullable
as bool,result: freezed == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as MatchResultModel?,deuceEnabled: null == deuceEnabled ? _self.deuceEnabled : deuceEnabled // ignore: cast_nullable_to_non_nullable
as bool,lastPoint: freezed == lastPoint ? _self.lastPoint : lastPoint // ignore: cast_nullable_to_non_nullable
as PointEventModel?,endedEarly: null == endedEarly ? _self.endedEarly : endedEarly // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameModelCopyWith<$Res>? get category {
    if (_self.category == null) {
    return null;
  }

  return $IdNameModelCopyWith<$Res>(_self.category!, (value) {
    return _then(_self.copyWith(category: value));
  });
}/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameModelCopyWith<$Res>? get group {
    if (_self.group == null) {
    return null;
  }

  return $IdNameModelCopyWith<$Res>(_self.group!, (value) {
    return _then(_self.copyWith(group: value));
  });
}/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$IdNameModelCopyWith<$Res>? get tournament {
    if (_self.tournament == null) {
    return null;
  }

  return $IdNameModelCopyWith<$Res>(_self.tournament!, (value) {
    return _then(_self.copyWith(tournament: value));
  });
}/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchTeamModelCopyWith<$Res>? get teamOne {
    if (_self.teamOne == null) {
    return null;
  }

  return $MatchTeamModelCopyWith<$Res>(_self.teamOne!, (value) {
    return _then(_self.copyWith(teamOne: value));
  });
}/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchTeamModelCopyWith<$Res>? get teamTwo {
    if (_self.teamTwo == null) {
    return null;
  }

  return $MatchTeamModelCopyWith<$Res>(_self.teamTwo!, (value) {
    return _then(_self.copyWith(teamTwo: value));
  });
}/// Create a copy of MatchModel
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
}/// Create a copy of MatchModel
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
}/// Create a copy of MatchModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MatchResultModelCopyWith<$Res>? get result {
    if (_self.result == null) {
    return null;
  }

  return $MatchResultModelCopyWith<$Res>(_self.result!, (value) {
    return _then(_self.copyWith(result: value));
  });
}/// Create a copy of MatchModel
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
