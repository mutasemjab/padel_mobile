// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coach_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoachRatingModel {

 num? get average; int get count;
/// Create a copy of CoachRatingModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoachRatingModelCopyWith<CoachRatingModel> get copyWith => _$CoachRatingModelCopyWithImpl<CoachRatingModel>(this as CoachRatingModel, _$identity);

  /// Serializes this CoachRatingModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoachRatingModel&&(identical(other.average, average) || other.average == average)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,average,count);

@override
String toString() {
  return 'CoachRatingModel(average: $average, count: $count)';
}


}

/// @nodoc
abstract mixin class $CoachRatingModelCopyWith<$Res>  {
  factory $CoachRatingModelCopyWith(CoachRatingModel value, $Res Function(CoachRatingModel) _then) = _$CoachRatingModelCopyWithImpl;
@useResult
$Res call({
 num? average, int count
});




}
/// @nodoc
class _$CoachRatingModelCopyWithImpl<$Res>
    implements $CoachRatingModelCopyWith<$Res> {
  _$CoachRatingModelCopyWithImpl(this._self, this._then);

  final CoachRatingModel _self;
  final $Res Function(CoachRatingModel) _then;

/// Create a copy of CoachRatingModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? average = freezed,Object? count = null,}) {
  return _then(_self.copyWith(
average: freezed == average ? _self.average : average // ignore: cast_nullable_to_non_nullable
as num?,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [CoachRatingModel].
extension CoachRatingModelPatterns on CoachRatingModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoachRatingModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoachRatingModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoachRatingModel value)  $default,){
final _that = this;
switch (_that) {
case _CoachRatingModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoachRatingModel value)?  $default,){
final _that = this;
switch (_that) {
case _CoachRatingModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( num? average,  int count)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoachRatingModel() when $default != null:
return $default(_that.average,_that.count);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( num? average,  int count)  $default,) {final _that = this;
switch (_that) {
case _CoachRatingModel():
return $default(_that.average,_that.count);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( num? average,  int count)?  $default,) {final _that = this;
switch (_that) {
case _CoachRatingModel() when $default != null:
return $default(_that.average,_that.count);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CoachRatingModel implements CoachRatingModel {
  const _CoachRatingModel({this.average, this.count = 0});
  factory _CoachRatingModel.fromJson(Map<String, dynamic> json) => _$CoachRatingModelFromJson(json);

@override final  num? average;
@override@JsonKey() final  int count;

/// Create a copy of CoachRatingModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoachRatingModelCopyWith<_CoachRatingModel> get copyWith => __$CoachRatingModelCopyWithImpl<_CoachRatingModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoachRatingModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoachRatingModel&&(identical(other.average, average) || other.average == average)&&(identical(other.count, count) || other.count == count));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,average,count);

@override
String toString() {
  return 'CoachRatingModel(average: $average, count: $count)';
}


}

/// @nodoc
abstract mixin class _$CoachRatingModelCopyWith<$Res> implements $CoachRatingModelCopyWith<$Res> {
  factory _$CoachRatingModelCopyWith(_CoachRatingModel value, $Res Function(_CoachRatingModel) _then) = __$CoachRatingModelCopyWithImpl;
@override @useResult
$Res call({
 num? average, int count
});




}
/// @nodoc
class __$CoachRatingModelCopyWithImpl<$Res>
    implements _$CoachRatingModelCopyWith<$Res> {
  __$CoachRatingModelCopyWithImpl(this._self, this._then);

  final _CoachRatingModel _self;
  final $Res Function(_CoachRatingModel) _then;

/// Create a copy of CoachRatingModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? average = freezed,Object? count = null,}) {
  return _then(_CoachRatingModel(
average: freezed == average ? _self.average : average // ignore: cast_nullable_to_non_nullable
as num?,count: null == count ? _self.count : count // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$CoachModel {

 int get id; String get name; String? get bio;@JsonKey(name: 'photo_url') String? get photoUrl; String? get phone; List<String> get specialties;@JsonKey(name: 'training_types') List<String> get trainingTypes; List<String> get languages;@JsonKey(name: 'years_experience') int? get yearsExperience;@JsonKey(name: 'price_per_hour') num get pricePerHour; String? get currency; String? get city; VenueModel? get venue; CoachRatingModel? get rating;@JsonKey(name: 'next_available_at') DateTime? get nextAvailableAt;@JsonKey(name: 'is_active') bool get isActive;
/// Create a copy of CoachModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoachModelCopyWith<CoachModel> get copyWith => _$CoachModelCopyWithImpl<CoachModel>(this as CoachModel, _$identity);

  /// Serializes this CoachModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoachModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.phone, phone) || other.phone == phone)&&const DeepCollectionEquality().equals(other.specialties, specialties)&&const DeepCollectionEquality().equals(other.trainingTypes, trainingTypes)&&const DeepCollectionEquality().equals(other.languages, languages)&&(identical(other.yearsExperience, yearsExperience) || other.yearsExperience == yearsExperience)&&(identical(other.pricePerHour, pricePerHour) || other.pricePerHour == pricePerHour)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.city, city) || other.city == city)&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.nextAvailableAt, nextAvailableAt) || other.nextAvailableAt == nextAvailableAt)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,bio,photoUrl,phone,const DeepCollectionEquality().hash(specialties),const DeepCollectionEquality().hash(trainingTypes),const DeepCollectionEquality().hash(languages),yearsExperience,pricePerHour,currency,city,venue,rating,nextAvailableAt,isActive);

@override
String toString() {
  return 'CoachModel(id: $id, name: $name, bio: $bio, photoUrl: $photoUrl, phone: $phone, specialties: $specialties, trainingTypes: $trainingTypes, languages: $languages, yearsExperience: $yearsExperience, pricePerHour: $pricePerHour, currency: $currency, city: $city, venue: $venue, rating: $rating, nextAvailableAt: $nextAvailableAt, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class $CoachModelCopyWith<$Res>  {
  factory $CoachModelCopyWith(CoachModel value, $Res Function(CoachModel) _then) = _$CoachModelCopyWithImpl;
@useResult
$Res call({
 int id, String name, String? bio,@JsonKey(name: 'photo_url') String? photoUrl, String? phone, List<String> specialties,@JsonKey(name: 'training_types') List<String> trainingTypes, List<String> languages,@JsonKey(name: 'years_experience') int? yearsExperience,@JsonKey(name: 'price_per_hour') num pricePerHour, String? currency, String? city, VenueModel? venue, CoachRatingModel? rating,@JsonKey(name: 'next_available_at') DateTime? nextAvailableAt,@JsonKey(name: 'is_active') bool isActive
});


$VenueModelCopyWith<$Res>? get venue;$CoachRatingModelCopyWith<$Res>? get rating;

}
/// @nodoc
class _$CoachModelCopyWithImpl<$Res>
    implements $CoachModelCopyWith<$Res> {
  _$CoachModelCopyWithImpl(this._self, this._then);

  final CoachModel _self;
  final $Res Function(CoachModel) _then;

/// Create a copy of CoachModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? bio = freezed,Object? photoUrl = freezed,Object? phone = freezed,Object? specialties = null,Object? trainingTypes = null,Object? languages = null,Object? yearsExperience = freezed,Object? pricePerHour = null,Object? currency = freezed,Object? city = freezed,Object? venue = freezed,Object? rating = freezed,Object? nextAvailableAt = freezed,Object? isActive = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,specialties: null == specialties ? _self.specialties : specialties // ignore: cast_nullable_to_non_nullable
as List<String>,trainingTypes: null == trainingTypes ? _self.trainingTypes : trainingTypes // ignore: cast_nullable_to_non_nullable
as List<String>,languages: null == languages ? _self.languages : languages // ignore: cast_nullable_to_non_nullable
as List<String>,yearsExperience: freezed == yearsExperience ? _self.yearsExperience : yearsExperience // ignore: cast_nullable_to_non_nullable
as int?,pricePerHour: null == pricePerHour ? _self.pricePerHour : pricePerHour // ignore: cast_nullable_to_non_nullable
as num,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,venue: freezed == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as VenueModel?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as CoachRatingModel?,nextAvailableAt: freezed == nextAvailableAt ? _self.nextAvailableAt : nextAvailableAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}
/// Create a copy of CoachModel
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
}/// Create a copy of CoachModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoachRatingModelCopyWith<$Res>? get rating {
    if (_self.rating == null) {
    return null;
  }

  return $CoachRatingModelCopyWith<$Res>(_self.rating!, (value) {
    return _then(_self.copyWith(rating: value));
  });
}
}


/// Adds pattern-matching-related methods to [CoachModel].
extension CoachModelPatterns on CoachModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoachModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoachModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoachModel value)  $default,){
final _that = this;
switch (_that) {
case _CoachModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoachModel value)?  $default,){
final _that = this;
switch (_that) {
case _CoachModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String name,  String? bio, @JsonKey(name: 'photo_url')  String? photoUrl,  String? phone,  List<String> specialties, @JsonKey(name: 'training_types')  List<String> trainingTypes,  List<String> languages, @JsonKey(name: 'years_experience')  int? yearsExperience, @JsonKey(name: 'price_per_hour')  num pricePerHour,  String? currency,  String? city,  VenueModel? venue,  CoachRatingModel? rating, @JsonKey(name: 'next_available_at')  DateTime? nextAvailableAt, @JsonKey(name: 'is_active')  bool isActive)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoachModel() when $default != null:
return $default(_that.id,_that.name,_that.bio,_that.photoUrl,_that.phone,_that.specialties,_that.trainingTypes,_that.languages,_that.yearsExperience,_that.pricePerHour,_that.currency,_that.city,_that.venue,_that.rating,_that.nextAvailableAt,_that.isActive);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String name,  String? bio, @JsonKey(name: 'photo_url')  String? photoUrl,  String? phone,  List<String> specialties, @JsonKey(name: 'training_types')  List<String> trainingTypes,  List<String> languages, @JsonKey(name: 'years_experience')  int? yearsExperience, @JsonKey(name: 'price_per_hour')  num pricePerHour,  String? currency,  String? city,  VenueModel? venue,  CoachRatingModel? rating, @JsonKey(name: 'next_available_at')  DateTime? nextAvailableAt, @JsonKey(name: 'is_active')  bool isActive)  $default,) {final _that = this;
switch (_that) {
case _CoachModel():
return $default(_that.id,_that.name,_that.bio,_that.photoUrl,_that.phone,_that.specialties,_that.trainingTypes,_that.languages,_that.yearsExperience,_that.pricePerHour,_that.currency,_that.city,_that.venue,_that.rating,_that.nextAvailableAt,_that.isActive);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String name,  String? bio, @JsonKey(name: 'photo_url')  String? photoUrl,  String? phone,  List<String> specialties, @JsonKey(name: 'training_types')  List<String> trainingTypes,  List<String> languages, @JsonKey(name: 'years_experience')  int? yearsExperience, @JsonKey(name: 'price_per_hour')  num pricePerHour,  String? currency,  String? city,  VenueModel? venue,  CoachRatingModel? rating, @JsonKey(name: 'next_available_at')  DateTime? nextAvailableAt, @JsonKey(name: 'is_active')  bool isActive)?  $default,) {final _that = this;
switch (_that) {
case _CoachModel() when $default != null:
return $default(_that.id,_that.name,_that.bio,_that.photoUrl,_that.phone,_that.specialties,_that.trainingTypes,_that.languages,_that.yearsExperience,_that.pricePerHour,_that.currency,_that.city,_that.venue,_that.rating,_that.nextAvailableAt,_that.isActive);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CoachModel implements CoachModel {
  const _CoachModel({required this.id, required this.name, this.bio, @JsonKey(name: 'photo_url') this.photoUrl, this.phone, final  List<String> specialties = const [], @JsonKey(name: 'training_types') final  List<String> trainingTypes = const [], final  List<String> languages = const [], @JsonKey(name: 'years_experience') this.yearsExperience, @JsonKey(name: 'price_per_hour') this.pricePerHour = 0, this.currency, this.city, this.venue, this.rating, @JsonKey(name: 'next_available_at') this.nextAvailableAt, @JsonKey(name: 'is_active') this.isActive = true}): _specialties = specialties,_trainingTypes = trainingTypes,_languages = languages;
  factory _CoachModel.fromJson(Map<String, dynamic> json) => _$CoachModelFromJson(json);

@override final  int id;
@override final  String name;
@override final  String? bio;
@override@JsonKey(name: 'photo_url') final  String? photoUrl;
@override final  String? phone;
 final  List<String> _specialties;
@override@JsonKey() List<String> get specialties {
  if (_specialties is EqualUnmodifiableListView) return _specialties;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_specialties);
}

 final  List<String> _trainingTypes;
@override@JsonKey(name: 'training_types') List<String> get trainingTypes {
  if (_trainingTypes is EqualUnmodifiableListView) return _trainingTypes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_trainingTypes);
}

 final  List<String> _languages;
@override@JsonKey() List<String> get languages {
  if (_languages is EqualUnmodifiableListView) return _languages;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_languages);
}

@override@JsonKey(name: 'years_experience') final  int? yearsExperience;
@override@JsonKey(name: 'price_per_hour') final  num pricePerHour;
@override final  String? currency;
@override final  String? city;
@override final  VenueModel? venue;
@override final  CoachRatingModel? rating;
@override@JsonKey(name: 'next_available_at') final  DateTime? nextAvailableAt;
@override@JsonKey(name: 'is_active') final  bool isActive;

/// Create a copy of CoachModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoachModelCopyWith<_CoachModel> get copyWith => __$CoachModelCopyWithImpl<_CoachModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoachModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoachModel&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.phone, phone) || other.phone == phone)&&const DeepCollectionEquality().equals(other._specialties, _specialties)&&const DeepCollectionEquality().equals(other._trainingTypes, _trainingTypes)&&const DeepCollectionEquality().equals(other._languages, _languages)&&(identical(other.yearsExperience, yearsExperience) || other.yearsExperience == yearsExperience)&&(identical(other.pricePerHour, pricePerHour) || other.pricePerHour == pricePerHour)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.city, city) || other.city == city)&&(identical(other.venue, venue) || other.venue == venue)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.nextAvailableAt, nextAvailableAt) || other.nextAvailableAt == nextAvailableAt)&&(identical(other.isActive, isActive) || other.isActive == isActive));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,bio,photoUrl,phone,const DeepCollectionEquality().hash(_specialties),const DeepCollectionEquality().hash(_trainingTypes),const DeepCollectionEquality().hash(_languages),yearsExperience,pricePerHour,currency,city,venue,rating,nextAvailableAt,isActive);

@override
String toString() {
  return 'CoachModel(id: $id, name: $name, bio: $bio, photoUrl: $photoUrl, phone: $phone, specialties: $specialties, trainingTypes: $trainingTypes, languages: $languages, yearsExperience: $yearsExperience, pricePerHour: $pricePerHour, currency: $currency, city: $city, venue: $venue, rating: $rating, nextAvailableAt: $nextAvailableAt, isActive: $isActive)';
}


}

/// @nodoc
abstract mixin class _$CoachModelCopyWith<$Res> implements $CoachModelCopyWith<$Res> {
  factory _$CoachModelCopyWith(_CoachModel value, $Res Function(_CoachModel) _then) = __$CoachModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String name, String? bio,@JsonKey(name: 'photo_url') String? photoUrl, String? phone, List<String> specialties,@JsonKey(name: 'training_types') List<String> trainingTypes, List<String> languages,@JsonKey(name: 'years_experience') int? yearsExperience,@JsonKey(name: 'price_per_hour') num pricePerHour, String? currency, String? city, VenueModel? venue, CoachRatingModel? rating,@JsonKey(name: 'next_available_at') DateTime? nextAvailableAt,@JsonKey(name: 'is_active') bool isActive
});


@override $VenueModelCopyWith<$Res>? get venue;@override $CoachRatingModelCopyWith<$Res>? get rating;

}
/// @nodoc
class __$CoachModelCopyWithImpl<$Res>
    implements _$CoachModelCopyWith<$Res> {
  __$CoachModelCopyWithImpl(this._self, this._then);

  final _CoachModel _self;
  final $Res Function(_CoachModel) _then;

/// Create a copy of CoachModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? bio = freezed,Object? photoUrl = freezed,Object? phone = freezed,Object? specialties = null,Object? trainingTypes = null,Object? languages = null,Object? yearsExperience = freezed,Object? pricePerHour = null,Object? currency = freezed,Object? city = freezed,Object? venue = freezed,Object? rating = freezed,Object? nextAvailableAt = freezed,Object? isActive = null,}) {
  return _then(_CoachModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,specialties: null == specialties ? _self._specialties : specialties // ignore: cast_nullable_to_non_nullable
as List<String>,trainingTypes: null == trainingTypes ? _self._trainingTypes : trainingTypes // ignore: cast_nullable_to_non_nullable
as List<String>,languages: null == languages ? _self._languages : languages // ignore: cast_nullable_to_non_nullable
as List<String>,yearsExperience: freezed == yearsExperience ? _self.yearsExperience : yearsExperience // ignore: cast_nullable_to_non_nullable
as int?,pricePerHour: null == pricePerHour ? _self.pricePerHour : pricePerHour // ignore: cast_nullable_to_non_nullable
as num,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,city: freezed == city ? _self.city : city // ignore: cast_nullable_to_non_nullable
as String?,venue: freezed == venue ? _self.venue : venue // ignore: cast_nullable_to_non_nullable
as VenueModel?,rating: freezed == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as CoachRatingModel?,nextAvailableAt: freezed == nextAvailableAt ? _self.nextAvailableAt : nextAvailableAt // ignore: cast_nullable_to_non_nullable
as DateTime?,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

/// Create a copy of CoachModel
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
}/// Create a copy of CoachModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CoachRatingModelCopyWith<$Res>? get rating {
    if (_self.rating == null) {
    return null;
  }

  return $CoachRatingModelCopyWith<$Res>(_self.rating!, (value) {
    return _then(_self.copyWith(rating: value));
  });
}
}


/// @nodoc
mixin _$AvailabilitySlotModel {

 int get id;@JsonKey(name: 'coach_id') int get coachId; DateTime get date;@JsonKey(name: 'start_time') String get startTime;@JsonKey(name: 'end_time') String get endTime;@JsonKey(name: 'starts_at') DateTime? get startsAt;@JsonKey(name: 'ends_at') DateTime? get endsAt;@JsonKey(name: 'duration_minutes') int get durationMinutes; String get status;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'is_bookable') bool get isBookable;
/// Create a copy of AvailabilitySlotModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvailabilitySlotModelCopyWith<AvailabilitySlotModel> get copyWith => _$AvailabilitySlotModelCopyWithImpl<AvailabilitySlotModel>(this as AvailabilitySlotModel, _$identity);

  /// Serializes this AvailabilitySlotModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvailabilitySlotModel&&(identical(other.id, id) || other.id == id)&&(identical(other.coachId, coachId) || other.coachId == coachId)&&(identical(other.date, date) || other.date == date)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.status, status) || other.status == status)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isBookable, isBookable) || other.isBookable == isBookable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,coachId,date,startTime,endTime,startsAt,endsAt,durationMinutes,status,isActive,isBookable);

@override
String toString() {
  return 'AvailabilitySlotModel(id: $id, coachId: $coachId, date: $date, startTime: $startTime, endTime: $endTime, startsAt: $startsAt, endsAt: $endsAt, durationMinutes: $durationMinutes, status: $status, isActive: $isActive, isBookable: $isBookable)';
}


}

/// @nodoc
abstract mixin class $AvailabilitySlotModelCopyWith<$Res>  {
  factory $AvailabilitySlotModelCopyWith(AvailabilitySlotModel value, $Res Function(AvailabilitySlotModel) _then) = _$AvailabilitySlotModelCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'coach_id') int coachId, DateTime date,@JsonKey(name: 'start_time') String startTime,@JsonKey(name: 'end_time') String endTime,@JsonKey(name: 'starts_at') DateTime? startsAt,@JsonKey(name: 'ends_at') DateTime? endsAt,@JsonKey(name: 'duration_minutes') int durationMinutes, String status,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'is_bookable') bool isBookable
});




}
/// @nodoc
class _$AvailabilitySlotModelCopyWithImpl<$Res>
    implements $AvailabilitySlotModelCopyWith<$Res> {
  _$AvailabilitySlotModelCopyWithImpl(this._self, this._then);

  final AvailabilitySlotModel _self;
  final $Res Function(AvailabilitySlotModel) _then;

/// Create a copy of AvailabilitySlotModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? coachId = null,Object? date = null,Object? startTime = null,Object? endTime = null,Object? startsAt = freezed,Object? endsAt = freezed,Object? durationMinutes = null,Object? status = null,Object? isActive = null,Object? isBookable = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,coachId: null == coachId ? _self.coachId : coachId // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,startsAt: freezed == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endsAt: freezed == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isBookable: null == isBookable ? _self.isBookable : isBookable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [AvailabilitySlotModel].
extension AvailabilitySlotModelPatterns on AvailabilitySlotModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AvailabilitySlotModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AvailabilitySlotModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AvailabilitySlotModel value)  $default,){
final _that = this;
switch (_that) {
case _AvailabilitySlotModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AvailabilitySlotModel value)?  $default,){
final _that = this;
switch (_that) {
case _AvailabilitySlotModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'coach_id')  int coachId,  DateTime date, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime, @JsonKey(name: 'starts_at')  DateTime? startsAt, @JsonKey(name: 'ends_at')  DateTime? endsAt, @JsonKey(name: 'duration_minutes')  int durationMinutes,  String status, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'is_bookable')  bool isBookable)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AvailabilitySlotModel() when $default != null:
return $default(_that.id,_that.coachId,_that.date,_that.startTime,_that.endTime,_that.startsAt,_that.endsAt,_that.durationMinutes,_that.status,_that.isActive,_that.isBookable);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'coach_id')  int coachId,  DateTime date, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime, @JsonKey(name: 'starts_at')  DateTime? startsAt, @JsonKey(name: 'ends_at')  DateTime? endsAt, @JsonKey(name: 'duration_minutes')  int durationMinutes,  String status, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'is_bookable')  bool isBookable)  $default,) {final _that = this;
switch (_that) {
case _AvailabilitySlotModel():
return $default(_that.id,_that.coachId,_that.date,_that.startTime,_that.endTime,_that.startsAt,_that.endsAt,_that.durationMinutes,_that.status,_that.isActive,_that.isBookable);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'coach_id')  int coachId,  DateTime date, @JsonKey(name: 'start_time')  String startTime, @JsonKey(name: 'end_time')  String endTime, @JsonKey(name: 'starts_at')  DateTime? startsAt, @JsonKey(name: 'ends_at')  DateTime? endsAt, @JsonKey(name: 'duration_minutes')  int durationMinutes,  String status, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'is_bookable')  bool isBookable)?  $default,) {final _that = this;
switch (_that) {
case _AvailabilitySlotModel() when $default != null:
return $default(_that.id,_that.coachId,_that.date,_that.startTime,_that.endTime,_that.startsAt,_that.endsAt,_that.durationMinutes,_that.status,_that.isActive,_that.isBookable);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AvailabilitySlotModel implements AvailabilitySlotModel {
  const _AvailabilitySlotModel({required this.id, @JsonKey(name: 'coach_id') this.coachId = 0, required this.date, @JsonKey(name: 'start_time') required this.startTime, @JsonKey(name: 'end_time') required this.endTime, @JsonKey(name: 'starts_at') this.startsAt, @JsonKey(name: 'ends_at') this.endsAt, @JsonKey(name: 'duration_minutes') this.durationMinutes = 60, this.status = 'available', @JsonKey(name: 'is_active') this.isActive = true, @JsonKey(name: 'is_bookable') this.isBookable = false});
  factory _AvailabilitySlotModel.fromJson(Map<String, dynamic> json) => _$AvailabilitySlotModelFromJson(json);

@override final  int id;
@override@JsonKey(name: 'coach_id') final  int coachId;
@override final  DateTime date;
@override@JsonKey(name: 'start_time') final  String startTime;
@override@JsonKey(name: 'end_time') final  String endTime;
@override@JsonKey(name: 'starts_at') final  DateTime? startsAt;
@override@JsonKey(name: 'ends_at') final  DateTime? endsAt;
@override@JsonKey(name: 'duration_minutes') final  int durationMinutes;
@override@JsonKey() final  String status;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'is_bookable') final  bool isBookable;

/// Create a copy of AvailabilitySlotModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AvailabilitySlotModelCopyWith<_AvailabilitySlotModel> get copyWith => __$AvailabilitySlotModelCopyWithImpl<_AvailabilitySlotModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AvailabilitySlotModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AvailabilitySlotModel&&(identical(other.id, id) || other.id == id)&&(identical(other.coachId, coachId) || other.coachId == coachId)&&(identical(other.date, date) || other.date == date)&&(identical(other.startTime, startTime) || other.startTime == startTime)&&(identical(other.endTime, endTime) || other.endTime == endTime)&&(identical(other.startsAt, startsAt) || other.startsAt == startsAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.durationMinutes, durationMinutes) || other.durationMinutes == durationMinutes)&&(identical(other.status, status) || other.status == status)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isBookable, isBookable) || other.isBookable == isBookable));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,coachId,date,startTime,endTime,startsAt,endsAt,durationMinutes,status,isActive,isBookable);

@override
String toString() {
  return 'AvailabilitySlotModel(id: $id, coachId: $coachId, date: $date, startTime: $startTime, endTime: $endTime, startsAt: $startsAt, endsAt: $endsAt, durationMinutes: $durationMinutes, status: $status, isActive: $isActive, isBookable: $isBookable)';
}


}

/// @nodoc
abstract mixin class _$AvailabilitySlotModelCopyWith<$Res> implements $AvailabilitySlotModelCopyWith<$Res> {
  factory _$AvailabilitySlotModelCopyWith(_AvailabilitySlotModel value, $Res Function(_AvailabilitySlotModel) _then) = __$AvailabilitySlotModelCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'coach_id') int coachId, DateTime date,@JsonKey(name: 'start_time') String startTime,@JsonKey(name: 'end_time') String endTime,@JsonKey(name: 'starts_at') DateTime? startsAt,@JsonKey(name: 'ends_at') DateTime? endsAt,@JsonKey(name: 'duration_minutes') int durationMinutes, String status,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'is_bookable') bool isBookable
});




}
/// @nodoc
class __$AvailabilitySlotModelCopyWithImpl<$Res>
    implements _$AvailabilitySlotModelCopyWith<$Res> {
  __$AvailabilitySlotModelCopyWithImpl(this._self, this._then);

  final _AvailabilitySlotModel _self;
  final $Res Function(_AvailabilitySlotModel) _then;

/// Create a copy of AvailabilitySlotModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? coachId = null,Object? date = null,Object? startTime = null,Object? endTime = null,Object? startsAt = freezed,Object? endsAt = freezed,Object? durationMinutes = null,Object? status = null,Object? isActive = null,Object? isBookable = null,}) {
  return _then(_AvailabilitySlotModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,coachId: null == coachId ? _self.coachId : coachId // ignore: cast_nullable_to_non_nullable
as int,date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,startTime: null == startTime ? _self.startTime : startTime // ignore: cast_nullable_to_non_nullable
as String,endTime: null == endTime ? _self.endTime : endTime // ignore: cast_nullable_to_non_nullable
as String,startsAt: freezed == startsAt ? _self.startsAt : startsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endsAt: freezed == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,durationMinutes: null == durationMinutes ? _self.durationMinutes : durationMinutes // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isBookable: null == isBookable ? _self.isBookable : isBookable // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}


/// @nodoc
mixin _$AvailabilityDayModel {

 DateTime get date; List<AvailabilitySlotModel> get slots;
/// Create a copy of AvailabilityDayModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AvailabilityDayModelCopyWith<AvailabilityDayModel> get copyWith => _$AvailabilityDayModelCopyWithImpl<AvailabilityDayModel>(this as AvailabilityDayModel, _$identity);

  /// Serializes this AvailabilityDayModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AvailabilityDayModel&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other.slots, slots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,const DeepCollectionEquality().hash(slots));

@override
String toString() {
  return 'AvailabilityDayModel(date: $date, slots: $slots)';
}


}

/// @nodoc
abstract mixin class $AvailabilityDayModelCopyWith<$Res>  {
  factory $AvailabilityDayModelCopyWith(AvailabilityDayModel value, $Res Function(AvailabilityDayModel) _then) = _$AvailabilityDayModelCopyWithImpl;
@useResult
$Res call({
 DateTime date, List<AvailabilitySlotModel> slots
});




}
/// @nodoc
class _$AvailabilityDayModelCopyWithImpl<$Res>
    implements $AvailabilityDayModelCopyWith<$Res> {
  _$AvailabilityDayModelCopyWithImpl(this._self, this._then);

  final AvailabilityDayModel _self;
  final $Res Function(AvailabilityDayModel) _then;

/// Create a copy of AvailabilityDayModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? slots = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,slots: null == slots ? _self.slots : slots // ignore: cast_nullable_to_non_nullable
as List<AvailabilitySlotModel>,
  ));
}

}


/// Adds pattern-matching-related methods to [AvailabilityDayModel].
extension AvailabilityDayModelPatterns on AvailabilityDayModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AvailabilityDayModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AvailabilityDayModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AvailabilityDayModel value)  $default,){
final _that = this;
switch (_that) {
case _AvailabilityDayModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AvailabilityDayModel value)?  $default,){
final _that = this;
switch (_that) {
case _AvailabilityDayModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DateTime date,  List<AvailabilitySlotModel> slots)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AvailabilityDayModel() when $default != null:
return $default(_that.date,_that.slots);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DateTime date,  List<AvailabilitySlotModel> slots)  $default,) {final _that = this;
switch (_that) {
case _AvailabilityDayModel():
return $default(_that.date,_that.slots);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DateTime date,  List<AvailabilitySlotModel> slots)?  $default,) {final _that = this;
switch (_that) {
case _AvailabilityDayModel() when $default != null:
return $default(_that.date,_that.slots);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AvailabilityDayModel implements AvailabilityDayModel {
  const _AvailabilityDayModel({required this.date, final  List<AvailabilitySlotModel> slots = const []}): _slots = slots;
  factory _AvailabilityDayModel.fromJson(Map<String, dynamic> json) => _$AvailabilityDayModelFromJson(json);

@override final  DateTime date;
 final  List<AvailabilitySlotModel> _slots;
@override@JsonKey() List<AvailabilitySlotModel> get slots {
  if (_slots is EqualUnmodifiableListView) return _slots;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_slots);
}


/// Create a copy of AvailabilityDayModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AvailabilityDayModelCopyWith<_AvailabilityDayModel> get copyWith => __$AvailabilityDayModelCopyWithImpl<_AvailabilityDayModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AvailabilityDayModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AvailabilityDayModel&&(identical(other.date, date) || other.date == date)&&const DeepCollectionEquality().equals(other._slots, _slots));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,const DeepCollectionEquality().hash(_slots));

@override
String toString() {
  return 'AvailabilityDayModel(date: $date, slots: $slots)';
}


}

/// @nodoc
abstract mixin class _$AvailabilityDayModelCopyWith<$Res> implements $AvailabilityDayModelCopyWith<$Res> {
  factory _$AvailabilityDayModelCopyWith(_AvailabilityDayModel value, $Res Function(_AvailabilityDayModel) _then) = __$AvailabilityDayModelCopyWithImpl;
@override @useResult
$Res call({
 DateTime date, List<AvailabilitySlotModel> slots
});




}
/// @nodoc
class __$AvailabilityDayModelCopyWithImpl<$Res>
    implements _$AvailabilityDayModelCopyWith<$Res> {
  __$AvailabilityDayModelCopyWithImpl(this._self, this._then);

  final _AvailabilityDayModel _self;
  final $Res Function(_AvailabilityDayModel) _then;

/// Create a copy of AvailabilityDayModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? slots = null,}) {
  return _then(_AvailabilityDayModel(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as DateTime,slots: null == slots ? _self._slots : slots // ignore: cast_nullable_to_non_nullable
as List<AvailabilitySlotModel>,
  ));
}


}


/// @nodoc
mixin _$CoachReviewModel {

 int get id; int get rating; String? get comment; Map<String, dynamic>? get player;@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of CoachReviewModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CoachReviewModelCopyWith<CoachReviewModel> get copyWith => _$CoachReviewModelCopyWithImpl<CoachReviewModel>(this as CoachReviewModel, _$identity);

  /// Serializes this CoachReviewModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CoachReviewModel&&(identical(other.id, id) || other.id == id)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&const DeepCollectionEquality().equals(other.player, player)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rating,comment,const DeepCollectionEquality().hash(player),createdAt);

@override
String toString() {
  return 'CoachReviewModel(id: $id, rating: $rating, comment: $comment, player: $player, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $CoachReviewModelCopyWith<$Res>  {
  factory $CoachReviewModelCopyWith(CoachReviewModel value, $Res Function(CoachReviewModel) _then) = _$CoachReviewModelCopyWithImpl;
@useResult
$Res call({
 int id, int rating, String? comment, Map<String, dynamic>? player,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class _$CoachReviewModelCopyWithImpl<$Res>
    implements $CoachReviewModelCopyWith<$Res> {
  _$CoachReviewModelCopyWithImpl(this._self, this._then);

  final CoachReviewModel _self;
  final $Res Function(CoachReviewModel) _then;

/// Create a copy of CoachReviewModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? rating = null,Object? comment = freezed,Object? player = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,player: freezed == player ? _self.player : player // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [CoachReviewModel].
extension CoachReviewModelPatterns on CoachReviewModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CoachReviewModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CoachReviewModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CoachReviewModel value)  $default,){
final _that = this;
switch (_that) {
case _CoachReviewModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CoachReviewModel value)?  $default,){
final _that = this;
switch (_that) {
case _CoachReviewModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int rating,  String? comment,  Map<String, dynamic>? player, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CoachReviewModel() when $default != null:
return $default(_that.id,_that.rating,_that.comment,_that.player,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int rating,  String? comment,  Map<String, dynamic>? player, @JsonKey(name: 'created_at')  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _CoachReviewModel():
return $default(_that.id,_that.rating,_that.comment,_that.player,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int rating,  String? comment,  Map<String, dynamic>? player, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _CoachReviewModel() when $default != null:
return $default(_that.id,_that.rating,_that.comment,_that.player,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CoachReviewModel implements CoachReviewModel {
  const _CoachReviewModel({required this.id, this.rating = 0, this.comment, final  Map<String, dynamic>? player, @JsonKey(name: 'created_at') this.createdAt}): _player = player;
  factory _CoachReviewModel.fromJson(Map<String, dynamic> json) => _$CoachReviewModelFromJson(json);

@override final  int id;
@override@JsonKey() final  int rating;
@override final  String? comment;
 final  Map<String, dynamic>? _player;
@override Map<String, dynamic>? get player {
  final value = _player;
  if (value == null) return null;
  if (_player is EqualUnmodifiableMapView) return _player;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}

@override@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of CoachReviewModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CoachReviewModelCopyWith<_CoachReviewModel> get copyWith => __$CoachReviewModelCopyWithImpl<_CoachReviewModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CoachReviewModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CoachReviewModel&&(identical(other.id, id) || other.id == id)&&(identical(other.rating, rating) || other.rating == rating)&&(identical(other.comment, comment) || other.comment == comment)&&const DeepCollectionEquality().equals(other._player, _player)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,rating,comment,const DeepCollectionEquality().hash(_player),createdAt);

@override
String toString() {
  return 'CoachReviewModel(id: $id, rating: $rating, comment: $comment, player: $player, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$CoachReviewModelCopyWith<$Res> implements $CoachReviewModelCopyWith<$Res> {
  factory _$CoachReviewModelCopyWith(_CoachReviewModel value, $Res Function(_CoachReviewModel) _then) = __$CoachReviewModelCopyWithImpl;
@override @useResult
$Res call({
 int id, int rating, String? comment, Map<String, dynamic>? player,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class __$CoachReviewModelCopyWithImpl<$Res>
    implements _$CoachReviewModelCopyWith<$Res> {
  __$CoachReviewModelCopyWithImpl(this._self, this._then);

  final _CoachReviewModel _self;
  final $Res Function(_CoachReviewModel) _then;

/// Create a copy of CoachReviewModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? rating = null,Object? comment = freezed,Object? player = freezed,Object? createdAt = freezed,}) {
  return _then(_CoachReviewModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,rating: null == rating ? _self.rating : rating // ignore: cast_nullable_to_non_nullable
as int,comment: freezed == comment ? _self.comment : comment // ignore: cast_nullable_to_non_nullable
as String?,player: freezed == player ? _self._player : player // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
