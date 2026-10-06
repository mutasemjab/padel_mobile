// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'venue_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CourtModel {

 int get id; String get name; String? get type;
/// Create a copy of CourtModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CourtModelCopyWith<CourtModel> get copyWith => _$CourtModelCopyWithImpl<CourtModel>(this as CourtModel, _$identity);

  /// Serializes this CourtModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CourtModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type);

@override
String toString() {
  return 'CourtModel(id: $id, name: $name, type: $type)';
}


}

/// @nodoc
abstract mixin class $CourtModelCopyWith<$Res>  {
  factory $CourtModelCopyWith(CourtModel value, $Res Function(CourtModel) _then) = _$CourtModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? type
});




}
/// @nodoc
class _$CourtModelCopyWithImpl<$Res>
    implements $CourtModelCopyWith<$Res> {
  _$CourtModelCopyWithImpl(this._self, this._then);

  final CourtModel _self;
  final $Res Function(CourtModel) _then;

/// Create a copy of CourtModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? type = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [CourtModel].
extension CourtModelPatterns on CourtModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CourtModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CourtModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CourtModel value)  $default,){
final _that = this;
switch (_that) {
case _CourtModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CourtModel value)?  $default,){
final _that = this;
switch (_that) {
case _CourtModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? type)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CourtModel() when $default != null:
return $default(_that.id,_that.name,_that.type);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? type)  $default,) {final _that = this;
switch (_that) {
case _CourtModel():
return $default(_that.id,_that.name,_that.type);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? type)?  $default,) {final _that = this;
switch (_that) {
case _CourtModel() when $default != null:
return $default(_that.id,_that.name,_that.type);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CourtModel implements CourtModel {
  const _CourtModel({required this.id, required this.name, this.type});
  factory _CourtModel.fromJson(Map<String, dynamic> json) => _$CourtModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? type;

/// Create a copy of CourtModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CourtModelCopyWith<_CourtModel> get copyWith => __$CourtModelCopyWithImpl<_CourtModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CourtModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CourtModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.type, type) || other.type == type));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,type);

@override
String toString() {
  return 'CourtModel(id: $id, name: $name, type: $type)';
}


}

/// @nodoc
abstract mixin class _$CourtModelCopyWith<$Res> implements $CourtModelCopyWith<$Res> {
  factory _$CourtModelCopyWith(_CourtModel value, $Res Function(_CourtModel) _then) = __$CourtModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? type
});




}
/// @nodoc
class __$CourtModelCopyWithImpl<$Res>
    implements _$CourtModelCopyWith<$Res> {
  __$CourtModelCopyWithImpl(this._self, this._then);

  final _CourtModel _self;
  final $Res Function(_CourtModel) _then;

/// Create a copy of CourtModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? type = freezed,}) {
  return _then(_CourtModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$VenueModel {

 int get id; String get name; String get city; String? get address; String? get description; num? get latitude; num? get longitude;@JsonKey(name: 'image_url') String? get imageUrl;@JsonKey(name: 'maps_url') String? get mapsUrl; List<CourtModel> get courts;@JsonKey(name: 'courts_count') int? get courtsCount;
/// Create a copy of VenueModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VenueModelCopyWith<VenueModel> get copyWith => _$VenueModelCopyWithImpl<VenueModel>(this as VenueModel, _$identity);

  /// Serializes this VenueModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is VenueModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.city, city) || other.city == city)&&(identical(other.address, address) || other.address == address)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.mapsUrl, mapsUrl) || other.mapsUrl == mapsUrl)&&const DeepCollectionEquality().equals(other.courts, courts)&&(identical(other.courtsCount, courtsCount) || other.courtsCount == courtsCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,city,address,description,latitude,longitude,imageUrl,mapsUrl,const DeepCollectionEquality().hash(courts),courtsCount);

@override
String toString() {
  return 'VenueModel(id: $id, name: $name, city: $city, address: $address, description: $description, latitude: $latitude, longitude: $longitude, imageUrl: $imageUrl, mapsUrl: $mapsUrl, courts: $courts, courtsCount: $courtsCount)';
}


}

/// @nodoc
abstract mixin class $VenueModelCopyWith<$Res>  {
  factory $VenueModelCopyWith(VenueModel value, $Res Function(VenueModel) _then) = _$VenueModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String city, String? address, String? description, num? latitude, num? longitude,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'maps_url') String? mapsUrl, List<CourtModel> courts,@JsonKey(name: 'courts_count') int? courtsCount
});




}
/// @nodoc
class _$VenueModelCopyWithImpl<$Res>
    implements $VenueModelCopyWith<$Res> {
  _$VenueModelCopyWithImpl(this._self, this._then);

  final VenueModel _self;
  final $Res Function(VenueModel) _then;

/// Create a copy of VenueModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? city = null,Object? address = freezed,Object? description = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? imageUrl = freezed,Object? mapsUrl = freezed,Object? courts = null,Object? courtsCount = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as num?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as num?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,mapsUrl: freezed == mapsUrl ? _self.mapsUrl : mapsUrl // ignore: cast_nullable_to_non_nullable
as String?,courts: null == courts ? _self.courts : courts // ignore: cast_nullable_to_non_nullable
as List<CourtModel>,courtsCount: freezed == courtsCount ? _self.courtsCount : courtsCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [VenueModel].
extension VenueModelPatterns on VenueModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _VenueModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _VenueModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _VenueModel value)  $default,){
final _that = this;
switch (_that) {
case _VenueModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _VenueModel value)?  $default,){
final _that = this;
switch (_that) {
case _VenueModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String city,  String? address,  String? description,  num? latitude,  num? longitude, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'maps_url')  String? mapsUrl,  List<CourtModel> courts, @JsonKey(name: 'courts_count')  int? courtsCount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _VenueModel() when $default != null:
return $default(_that.id,_that.name,_that.city,_that.address,_that.description,_that.latitude,_that.longitude,_that.imageUrl,_that.mapsUrl,_that.courts,_that.courtsCount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String city,  String? address,  String? description,  num? latitude,  num? longitude, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'maps_url')  String? mapsUrl,  List<CourtModel> courts, @JsonKey(name: 'courts_count')  int? courtsCount)  $default,) {final _that = this;
switch (_that) {
case _VenueModel():
return $default(_that.id,_that.name,_that.city,_that.address,_that.description,_that.latitude,_that.longitude,_that.imageUrl,_that.mapsUrl,_that.courts,_that.courtsCount);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String city,  String? address,  String? description,  num? latitude,  num? longitude, @JsonKey(name: 'image_url')  String? imageUrl, @JsonKey(name: 'maps_url')  String? mapsUrl,  List<CourtModel> courts, @JsonKey(name: 'courts_count')  int? courtsCount)?  $default,) {final _that = this;
switch (_that) {
case _VenueModel() when $default != null:
return $default(_that.id,_that.name,_that.city,_that.address,_that.description,_that.latitude,_that.longitude,_that.imageUrl,_that.mapsUrl,_that.courts,_that.courtsCount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _VenueModel implements VenueModel {
  const _VenueModel({required this.id, required this.name, this.city = '', this.address, this.description, this.latitude, this.longitude, @JsonKey(name: 'image_url') this.imageUrl, @JsonKey(name: 'maps_url') this.mapsUrl, final  List<CourtModel> courts = const [], @JsonKey(name: 'courts_count') this.courtsCount}): _courts = courts;
  factory _VenueModel.fromJson(Map<String, dynamic> json) => _$VenueModelFromJson(json);

@override final  int id;
@override final  String name;
@override@JsonKey() final  String city;
@override final  String? address;
@override final  String? description;
@override final  num? latitude;
@override final  num? longitude;
@override@JsonKey(name: 'image_url') final  String? imageUrl;
@override@JsonKey(name: 'maps_url') final  String? mapsUrl;
 final  List<CourtModel> _courts;
@override@JsonKey() List<CourtModel> get courts {
  if (_courts is EqualUnmodifiableListView) return _courts;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_courts);
}

@override@JsonKey(name: 'courts_count') final  int? courtsCount;

/// Create a copy of VenueModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VenueModelCopyWith<_VenueModel> get copyWith => __$VenueModelCopyWithImpl<_VenueModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VenueModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _VenueModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.city, city) || other.city == city)&&(identical(other.address, address) || other.address == address)&&(identical(other.description, description) || other.description == description)&&(identical(other.latitude, latitude) || other.latitude == latitude)&&(identical(other.longitude, longitude) || other.longitude == longitude)&&(identical(other.imageUrl, imageUrl) || other.imageUrl == imageUrl)&&(identical(other.mapsUrl, mapsUrl) || other.mapsUrl == mapsUrl)&&const DeepCollectionEquality().equals(other._courts, _courts)&&(identical(other.courtsCount, courtsCount) || other.courtsCount == courtsCount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,city,address,description,latitude,longitude,imageUrl,mapsUrl,const DeepCollectionEquality().hash(_courts),courtsCount);

@override
String toString() {
  return 'VenueModel(id: $id, name: $name, city: $city, address: $address, description: $description, latitude: $latitude, longitude: $longitude, imageUrl: $imageUrl, mapsUrl: $mapsUrl, courts: $courts, courtsCount: $courtsCount)';
}


}

/// @nodoc
abstract mixin class _$VenueModelCopyWith<$Res> implements $VenueModelCopyWith<$Res> {
  factory _$VenueModelCopyWith(_VenueModel value, $Res Function(_VenueModel) _then) = __$VenueModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String city, String? address, String? description, num? latitude, num? longitude,@JsonKey(name: 'image_url') String? imageUrl,@JsonKey(name: 'maps_url') String? mapsUrl, List<CourtModel> courts,@JsonKey(name: 'courts_count') int? courtsCount
});




}
/// @nodoc
class __$VenueModelCopyWithImpl<$Res>
    implements _$VenueModelCopyWith<$Res> {
  __$VenueModelCopyWithImpl(this._self, this._then);

  final _VenueModel _self;
  final $Res Function(_VenueModel) _then;

/// Create a copy of VenueModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? city = null,Object? address = freezed,Object? description = freezed,Object? latitude = freezed,Object? longitude = freezed,Object? imageUrl = freezed,Object? mapsUrl = freezed,Object? courts = null,Object? courtsCount = freezed,}) {
  return _then(_VenueModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,city: null == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String,address: freezed == address ? _self.address : address // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,latitude: freezed == latitude ? _self.latitude : latitude // ignore: cast_nullable_to_non_nullable
as num?,longitude: freezed == longitude ? _self.longitude : longitude // ignore: cast_nullable_to_non_nullable
as num?,imageUrl: freezed == imageUrl ? _self.imageUrl : imageUrl // ignore: cast_nullable_to_non_nullable
as String?,mapsUrl: freezed == mapsUrl ? _self.mapsUrl : mapsUrl // ignore: cast_nullable_to_non_nullable
as String?,courts: null == courts ? _self._courts : courts // ignore: cast_nullable_to_non_nullable
as List<CourtModel>,courtsCount: freezed == courtsCount ? _self.courtsCount : courtsCount // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
