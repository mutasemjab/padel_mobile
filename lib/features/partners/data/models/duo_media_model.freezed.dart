// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'duo_media_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DuoMediaModel {

 int get id; String get status;@JsonKey(name: 'media_type') String get mediaType;@JsonKey(name: 'media_url') String? get mediaUrl;@JsonKey(name: 'thumbnail_url') String? get thumbnailUrl; String? get error;@JsonKey(name: 'requested_at') DateTime? get requestedAt;@JsonKey(name: 'completed_at') DateTime? get completedAt;
/// Create a copy of DuoMediaModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DuoMediaModelCopyWith<DuoMediaModel> get copyWith => _$DuoMediaModelCopyWithImpl<DuoMediaModel>(this as DuoMediaModel, _$identity);

  /// Serializes this DuoMediaModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DuoMediaModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.mediaUrl, mediaUrl) || other.mediaUrl == mediaUrl)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.error, error) || other.error == error)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,mediaType,mediaUrl,thumbnailUrl,error,requestedAt,completedAt);

@override
String toString() {
  return 'DuoMediaModel(id: $id, status: $status, mediaType: $mediaType, mediaUrl: $mediaUrl, thumbnailUrl: $thumbnailUrl, error: $error, requestedAt: $requestedAt, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class $DuoMediaModelCopyWith<$Res>  {
  factory $DuoMediaModelCopyWith(DuoMediaModel value, $Res Function(DuoMediaModel) _then) = _$DuoMediaModelCopyWithImpl;
@useResult
$Res call({
 int id, String status,@JsonKey(name: 'media_type') String mediaType,@JsonKey(name: 'media_url') String? mediaUrl,@JsonKey(name: 'thumbnail_url') String? thumbnailUrl, String? error,@JsonKey(name: 'requested_at') DateTime? requestedAt,@JsonKey(name: 'completed_at') DateTime? completedAt
});




}
/// @nodoc
class _$DuoMediaModelCopyWithImpl<$Res>
    implements $DuoMediaModelCopyWith<$Res> {
  _$DuoMediaModelCopyWithImpl(this._self, this._then);

  final DuoMediaModel _self;
  final $Res Function(DuoMediaModel) _then;

/// Create a copy of DuoMediaModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? mediaType = null,Object? mediaUrl = freezed,Object? thumbnailUrl = freezed,Object? error = freezed,Object? requestedAt = freezed,Object? completedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String,mediaUrl: freezed == mediaUrl ? _self.mediaUrl : mediaUrl // ignore: cast_nullable_to_non_nullable
as String?,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,requestedAt: freezed == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [DuoMediaModel].
extension DuoMediaModelPatterns on DuoMediaModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DuoMediaModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DuoMediaModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DuoMediaModel value)  $default,){
final _that = this;
switch (_that) {
case _DuoMediaModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DuoMediaModel value)?  $default,){
final _that = this;
switch (_that) {
case _DuoMediaModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String status, @JsonKey(name: 'media_type')  String mediaType, @JsonKey(name: 'media_url')  String? mediaUrl, @JsonKey(name: 'thumbnail_url')  String? thumbnailUrl,  String? error, @JsonKey(name: 'requested_at')  DateTime? requestedAt, @JsonKey(name: 'completed_at')  DateTime? completedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DuoMediaModel() when $default != null:
return $default(_that.id,_that.status,_that.mediaType,_that.mediaUrl,_that.thumbnailUrl,_that.error,_that.requestedAt,_that.completedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String status, @JsonKey(name: 'media_type')  String mediaType, @JsonKey(name: 'media_url')  String? mediaUrl, @JsonKey(name: 'thumbnail_url')  String? thumbnailUrl,  String? error, @JsonKey(name: 'requested_at')  DateTime? requestedAt, @JsonKey(name: 'completed_at')  DateTime? completedAt)  $default,) {final _that = this;
switch (_that) {
case _DuoMediaModel():
return $default(_that.id,_that.status,_that.mediaType,_that.mediaUrl,_that.thumbnailUrl,_that.error,_that.requestedAt,_that.completedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String status, @JsonKey(name: 'media_type')  String mediaType, @JsonKey(name: 'media_url')  String? mediaUrl, @JsonKey(name: 'thumbnail_url')  String? thumbnailUrl,  String? error, @JsonKey(name: 'requested_at')  DateTime? requestedAt, @JsonKey(name: 'completed_at')  DateTime? completedAt)?  $default,) {final _that = this;
switch (_that) {
case _DuoMediaModel() when $default != null:
return $default(_that.id,_that.status,_that.mediaType,_that.mediaUrl,_that.thumbnailUrl,_that.error,_that.requestedAt,_that.completedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DuoMediaModel implements DuoMediaModel {
  const _DuoMediaModel({required this.id, this.status = 'queued', @JsonKey(name: 'media_type') this.mediaType = 'video', @JsonKey(name: 'media_url') this.mediaUrl, @JsonKey(name: 'thumbnail_url') this.thumbnailUrl, this.error, @JsonKey(name: 'requested_at') this.requestedAt, @JsonKey(name: 'completed_at') this.completedAt});
  factory _DuoMediaModel.fromJson(Map<String, dynamic> json) => _$DuoMediaModelFromJson(json);

@override final  int id;
@override@JsonKey() final  String status;
@override@JsonKey(name: 'media_type') final  String mediaType;
@override@JsonKey(name: 'media_url') final  String? mediaUrl;
@override@JsonKey(name: 'thumbnail_url') final  String? thumbnailUrl;
@override final  String? error;
@override@JsonKey(name: 'requested_at') final  DateTime? requestedAt;
@override@JsonKey(name: 'completed_at') final  DateTime? completedAt;

/// Create a copy of DuoMediaModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DuoMediaModelCopyWith<_DuoMediaModel> get copyWith => __$DuoMediaModelCopyWithImpl<_DuoMediaModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DuoMediaModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DuoMediaModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.mediaUrl, mediaUrl) || other.mediaUrl == mediaUrl)&&(identical(other.thumbnailUrl, thumbnailUrl) || other.thumbnailUrl == thumbnailUrl)&&(identical(other.error, error) || other.error == error)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,mediaType,mediaUrl,thumbnailUrl,error,requestedAt,completedAt);

@override
String toString() {
  return 'DuoMediaModel(id: $id, status: $status, mediaType: $mediaType, mediaUrl: $mediaUrl, thumbnailUrl: $thumbnailUrl, error: $error, requestedAt: $requestedAt, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class _$DuoMediaModelCopyWith<$Res> implements $DuoMediaModelCopyWith<$Res> {
  factory _$DuoMediaModelCopyWith(_DuoMediaModel value, $Res Function(_DuoMediaModel) _then) = __$DuoMediaModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String status,@JsonKey(name: 'media_type') String mediaType,@JsonKey(name: 'media_url') String? mediaUrl,@JsonKey(name: 'thumbnail_url') String? thumbnailUrl, String? error,@JsonKey(name: 'requested_at') DateTime? requestedAt,@JsonKey(name: 'completed_at') DateTime? completedAt
});




}
/// @nodoc
class __$DuoMediaModelCopyWithImpl<$Res>
    implements _$DuoMediaModelCopyWith<$Res> {
  __$DuoMediaModelCopyWithImpl(this._self, this._then);

  final _DuoMediaModel _self;
  final $Res Function(_DuoMediaModel) _then;

/// Create a copy of DuoMediaModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? mediaType = null,Object? mediaUrl = freezed,Object? thumbnailUrl = freezed,Object? error = freezed,Object? requestedAt = freezed,Object? completedAt = freezed,}) {
  return _then(_DuoMediaModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String,mediaUrl: freezed == mediaUrl ? _self.mediaUrl : mediaUrl // ignore: cast_nullable_to_non_nullable
as String?,thumbnailUrl: freezed == thumbnailUrl ? _self.thumbnailUrl : thumbnailUrl // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,requestedAt: freezed == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$DuoMediaStateModel {

@JsonKey(name: 'provider_configured') bool get providerConfigured;@JsonKey(name: 'requires_photos') bool get requiresPhotos; DuoMediaModel? get current;@JsonKey(name: 'latest_completed') DuoMediaModel? get latestCompleted;
/// Create a copy of DuoMediaStateModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DuoMediaStateModelCopyWith<DuoMediaStateModel> get copyWith => _$DuoMediaStateModelCopyWithImpl<DuoMediaStateModel>(this as DuoMediaStateModel, _$identity);

  /// Serializes this DuoMediaStateModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DuoMediaStateModel&&(identical(other.providerConfigured, providerConfigured) || other.providerConfigured == providerConfigured)&&(identical(other.requiresPhotos, requiresPhotos) || other.requiresPhotos == requiresPhotos)&&(identical(other.current, current) || other.current == current)&&(identical(other.latestCompleted, latestCompleted) || other.latestCompleted == latestCompleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,providerConfigured,requiresPhotos,current,latestCompleted);

@override
String toString() {
  return 'DuoMediaStateModel(providerConfigured: $providerConfigured, requiresPhotos: $requiresPhotos, current: $current, latestCompleted: $latestCompleted)';
}


}

/// @nodoc
abstract mixin class $DuoMediaStateModelCopyWith<$Res>  {
  factory $DuoMediaStateModelCopyWith(DuoMediaStateModel value, $Res Function(DuoMediaStateModel) _then) = _$DuoMediaStateModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'provider_configured') bool providerConfigured,@JsonKey(name: 'requires_photos') bool requiresPhotos, DuoMediaModel? current,@JsonKey(name: 'latest_completed') DuoMediaModel? latestCompleted
});


$DuoMediaModelCopyWith<$Res>? get current;$DuoMediaModelCopyWith<$Res>? get latestCompleted;

}
/// @nodoc
class _$DuoMediaStateModelCopyWithImpl<$Res>
    implements $DuoMediaStateModelCopyWith<$Res> {
  _$DuoMediaStateModelCopyWithImpl(this._self, this._then);

  final DuoMediaStateModel _self;
  final $Res Function(DuoMediaStateModel) _then;

/// Create a copy of DuoMediaStateModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? providerConfigured = null,Object? requiresPhotos = null,Object? current = freezed,Object? latestCompleted = freezed,}) {
  return _then(_self.copyWith(
providerConfigured: null == providerConfigured ? _self.providerConfigured : providerConfigured // ignore: cast_nullable_to_non_nullable
as bool,requiresPhotos: null == requiresPhotos ? _self.requiresPhotos : requiresPhotos // ignore: cast_nullable_to_non_nullable
as bool,current: freezed == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as DuoMediaModel?,latestCompleted: freezed == latestCompleted ? _self.latestCompleted : latestCompleted // ignore: cast_nullable_to_non_nullable
as DuoMediaModel?,
  ));
}
/// Create a copy of DuoMediaStateModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DuoMediaModelCopyWith<$Res>? get current {
    if (_self.current == null) {
    return null;
  }

  return $DuoMediaModelCopyWith<$Res>(_self.current!, (value) {
    return _then(_self.copyWith(current: value));
  });
}/// Create a copy of DuoMediaStateModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DuoMediaModelCopyWith<$Res>? get latestCompleted {
    if (_self.latestCompleted == null) {
    return null;
  }

  return $DuoMediaModelCopyWith<$Res>(_self.latestCompleted!, (value) {
    return _then(_self.copyWith(latestCompleted: value));
  });
}
}


/// Adds pattern-matching-related methods to [DuoMediaStateModel].
extension DuoMediaStateModelPatterns on DuoMediaStateModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DuoMediaStateModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DuoMediaStateModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DuoMediaStateModel value)  $default,){
final _that = this;
switch (_that) {
case _DuoMediaStateModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DuoMediaStateModel value)?  $default,){
final _that = this;
switch (_that) {
case _DuoMediaStateModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'provider_configured')  bool providerConfigured, @JsonKey(name: 'requires_photos')  bool requiresPhotos,  DuoMediaModel? current, @JsonKey(name: 'latest_completed')  DuoMediaModel? latestCompleted)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DuoMediaStateModel() when $default != null:
return $default(_that.providerConfigured,_that.requiresPhotos,_that.current,_that.latestCompleted);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'provider_configured')  bool providerConfigured, @JsonKey(name: 'requires_photos')  bool requiresPhotos,  DuoMediaModel? current, @JsonKey(name: 'latest_completed')  DuoMediaModel? latestCompleted)  $default,) {final _that = this;
switch (_that) {
case _DuoMediaStateModel():
return $default(_that.providerConfigured,_that.requiresPhotos,_that.current,_that.latestCompleted);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'provider_configured')  bool providerConfigured, @JsonKey(name: 'requires_photos')  bool requiresPhotos,  DuoMediaModel? current, @JsonKey(name: 'latest_completed')  DuoMediaModel? latestCompleted)?  $default,) {final _that = this;
switch (_that) {
case _DuoMediaStateModel() when $default != null:
return $default(_that.providerConfigured,_that.requiresPhotos,_that.current,_that.latestCompleted);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DuoMediaStateModel implements DuoMediaStateModel {
  const _DuoMediaStateModel({@JsonKey(name: 'provider_configured') this.providerConfigured = false, @JsonKey(name: 'requires_photos') this.requiresPhotos = false, this.current, @JsonKey(name: 'latest_completed') this.latestCompleted});
  factory _DuoMediaStateModel.fromJson(Map<String, dynamic> json) => _$DuoMediaStateModelFromJson(json);

@override@JsonKey(name: 'provider_configured') final  bool providerConfigured;
@override@JsonKey(name: 'requires_photos') final  bool requiresPhotos;
@override final  DuoMediaModel? current;
@override@JsonKey(name: 'latest_completed') final  DuoMediaModel? latestCompleted;

/// Create a copy of DuoMediaStateModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DuoMediaStateModelCopyWith<_DuoMediaStateModel> get copyWith => __$DuoMediaStateModelCopyWithImpl<_DuoMediaStateModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DuoMediaStateModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DuoMediaStateModel&&(identical(other.providerConfigured, providerConfigured) || other.providerConfigured == providerConfigured)&&(identical(other.requiresPhotos, requiresPhotos) || other.requiresPhotos == requiresPhotos)&&(identical(other.current, current) || other.current == current)&&(identical(other.latestCompleted, latestCompleted) || other.latestCompleted == latestCompleted));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,providerConfigured,requiresPhotos,current,latestCompleted);

@override
String toString() {
  return 'DuoMediaStateModel(providerConfigured: $providerConfigured, requiresPhotos: $requiresPhotos, current: $current, latestCompleted: $latestCompleted)';
}


}

/// @nodoc
abstract mixin class _$DuoMediaStateModelCopyWith<$Res> implements $DuoMediaStateModelCopyWith<$Res> {
  factory _$DuoMediaStateModelCopyWith(_DuoMediaStateModel value, $Res Function(_DuoMediaStateModel) _then) = __$DuoMediaStateModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'provider_configured') bool providerConfigured,@JsonKey(name: 'requires_photos') bool requiresPhotos, DuoMediaModel? current,@JsonKey(name: 'latest_completed') DuoMediaModel? latestCompleted
});


@override $DuoMediaModelCopyWith<$Res>? get current;@override $DuoMediaModelCopyWith<$Res>? get latestCompleted;

}
/// @nodoc
class __$DuoMediaStateModelCopyWithImpl<$Res>
    implements _$DuoMediaStateModelCopyWith<$Res> {
  __$DuoMediaStateModelCopyWithImpl(this._self, this._then);

  final _DuoMediaStateModel _self;
  final $Res Function(_DuoMediaStateModel) _then;

/// Create a copy of DuoMediaStateModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? providerConfigured = null,Object? requiresPhotos = null,Object? current = freezed,Object? latestCompleted = freezed,}) {
  return _then(_DuoMediaStateModel(
providerConfigured: null == providerConfigured ? _self.providerConfigured : providerConfigured // ignore: cast_nullable_to_non_nullable
as bool,requiresPhotos: null == requiresPhotos ? _self.requiresPhotos : requiresPhotos // ignore: cast_nullable_to_non_nullable
as bool,current: freezed == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as DuoMediaModel?,latestCompleted: freezed == latestCompleted ? _self.latestCompleted : latestCompleted // ignore: cast_nullable_to_non_nullable
as DuoMediaModel?,
  ));
}

/// Create a copy of DuoMediaStateModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DuoMediaModelCopyWith<$Res>? get current {
    if (_self.current == null) {
    return null;
  }

  return $DuoMediaModelCopyWith<$Res>(_self.current!, (value) {
    return _then(_self.copyWith(current: value));
  });
}/// Create a copy of DuoMediaStateModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DuoMediaModelCopyWith<$Res>? get latestCompleted {
    if (_self.latestCompleted == null) {
    return null;
  }

  return $DuoMediaModelCopyWith<$Res>(_self.latestCompleted!, (value) {
    return _then(_self.copyWith(latestCompleted: value));
  });
}
}

// dart format on
