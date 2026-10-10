// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'premium_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PremiumPlanModel {

 String get key; num get price; int get months; String get currency;
/// Create a copy of PremiumPlanModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PremiumPlanModelCopyWith<PremiumPlanModel> get copyWith => _$PremiumPlanModelCopyWithImpl<PremiumPlanModel>(this as PremiumPlanModel, _$identity);

  /// Serializes this PremiumPlanModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PremiumPlanModel&&(identical(other.key, key) || other.key == key)&&(identical(other.price, price) || other.price == price)&&(identical(other.months, months) || other.months == months)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,price,months,currency);

@override
String toString() {
  return 'PremiumPlanModel(key: $key, price: $price, months: $months, currency: $currency)';
}


}

/// @nodoc
abstract mixin class $PremiumPlanModelCopyWith<$Res>  {
  factory $PremiumPlanModelCopyWith(PremiumPlanModel value, $Res Function(PremiumPlanModel) _then) = _$PremiumPlanModelCopyWithImpl;
@useResult
$Res call({
 String key, num price, int months, String currency
});




}
/// @nodoc
class _$PremiumPlanModelCopyWithImpl<$Res>
    implements $PremiumPlanModelCopyWith<$Res> {
  _$PremiumPlanModelCopyWithImpl(this._self, this._then);

  final PremiumPlanModel _self;
  final $Res Function(PremiumPlanModel) _then;

/// Create a copy of PremiumPlanModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? key = null,Object? price = null,Object? months = null,Object? currency = null,}) {
  return _then(_self.copyWith(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as num,months: null == months ? _self.months : months // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PremiumPlanModel].
extension PremiumPlanModelPatterns on PremiumPlanModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PremiumPlanModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PremiumPlanModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PremiumPlanModel value)  $default,){
final _that = this;
switch (_that) {
case _PremiumPlanModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PremiumPlanModel value)?  $default,){
final _that = this;
switch (_that) {
case _PremiumPlanModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String key,  num price,  int months,  String currency)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PremiumPlanModel() when $default != null:
return $default(_that.key,_that.price,_that.months,_that.currency);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String key,  num price,  int months,  String currency)  $default,) {final _that = this;
switch (_that) {
case _PremiumPlanModel():
return $default(_that.key,_that.price,_that.months,_that.currency);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String key,  num price,  int months,  String currency)?  $default,) {final _that = this;
switch (_that) {
case _PremiumPlanModel() when $default != null:
return $default(_that.key,_that.price,_that.months,_that.currency);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PremiumPlanModel implements PremiumPlanModel {
  const _PremiumPlanModel({required this.key, this.price = 0, this.months = 1, this.currency = ''});
  factory _PremiumPlanModel.fromJson(Map<String, dynamic> json) => _$PremiumPlanModelFromJson(json);

@override final  String key;
@override@JsonKey() final  num price;
@override@JsonKey() final  int months;
@override@JsonKey() final  String currency;

/// Create a copy of PremiumPlanModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PremiumPlanModelCopyWith<_PremiumPlanModel> get copyWith => __$PremiumPlanModelCopyWithImpl<_PremiumPlanModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PremiumPlanModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PremiumPlanModel&&(identical(other.key, key) || other.key == key)&&(identical(other.price, price) || other.price == price)&&(identical(other.months, months) || other.months == months)&&(identical(other.currency, currency) || other.currency == currency));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,key,price,months,currency);

@override
String toString() {
  return 'PremiumPlanModel(key: $key, price: $price, months: $months, currency: $currency)';
}


}

/// @nodoc
abstract mixin class _$PremiumPlanModelCopyWith<$Res> implements $PremiumPlanModelCopyWith<$Res> {
  factory _$PremiumPlanModelCopyWith(_PremiumPlanModel value, $Res Function(_PremiumPlanModel) _then) = __$PremiumPlanModelCopyWithImpl;
@override @useResult
$Res call({
 String key, num price, int months, String currency
});




}
/// @nodoc
class __$PremiumPlanModelCopyWithImpl<$Res>
    implements _$PremiumPlanModelCopyWith<$Res> {
  __$PremiumPlanModelCopyWithImpl(this._self, this._then);

  final _PremiumPlanModel _self;
  final $Res Function(_PremiumPlanModel) _then;

/// Create a copy of PremiumPlanModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? key = null,Object? price = null,Object? months = null,Object? currency = null,}) {
  return _then(_PremiumPlanModel(
key: null == key ? _self.key : key // ignore: cast_nullable_to_non_nullable
as String,price: null == price ? _self.price : price // ignore: cast_nullable_to_non_nullable
as num,months: null == months ? _self.months : months // ignore: cast_nullable_to_non_nullable
as int,currency: null == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}


/// @nodoc
mixin _$PremiumCatalogModel {

 List<PremiumPlanModel> get plans;@JsonKey(name: 'checkout_available') bool get checkoutAvailable; List<String> get features;@JsonKey(name: 'never_affects') List<String> get neverAffects;
/// Create a copy of PremiumCatalogModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PremiumCatalogModelCopyWith<PremiumCatalogModel> get copyWith => _$PremiumCatalogModelCopyWithImpl<PremiumCatalogModel>(this as PremiumCatalogModel, _$identity);

  /// Serializes this PremiumCatalogModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PremiumCatalogModel&&const DeepCollectionEquality().equals(other.plans, plans)&&(identical(other.checkoutAvailable, checkoutAvailable) || other.checkoutAvailable == checkoutAvailable)&&const DeepCollectionEquality().equals(other.features, features)&&const DeepCollectionEquality().equals(other.neverAffects, neverAffects));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(plans),checkoutAvailable,const DeepCollectionEquality().hash(features),const DeepCollectionEquality().hash(neverAffects));

@override
String toString() {
  return 'PremiumCatalogModel(plans: $plans, checkoutAvailable: $checkoutAvailable, features: $features, neverAffects: $neverAffects)';
}


}

/// @nodoc
abstract mixin class $PremiumCatalogModelCopyWith<$Res>  {
  factory $PremiumCatalogModelCopyWith(PremiumCatalogModel value, $Res Function(PremiumCatalogModel) _then) = _$PremiumCatalogModelCopyWithImpl;
@useResult
$Res call({
 List<PremiumPlanModel> plans,@JsonKey(name: 'checkout_available') bool checkoutAvailable, List<String> features,@JsonKey(name: 'never_affects') List<String> neverAffects
});




}
/// @nodoc
class _$PremiumCatalogModelCopyWithImpl<$Res>
    implements $PremiumCatalogModelCopyWith<$Res> {
  _$PremiumCatalogModelCopyWithImpl(this._self, this._then);

  final PremiumCatalogModel _self;
  final $Res Function(PremiumCatalogModel) _then;

/// Create a copy of PremiumCatalogModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? plans = null,Object? checkoutAvailable = null,Object? features = null,Object? neverAffects = null,}) {
  return _then(_self.copyWith(
plans: null == plans ? _self.plans : plans // ignore: cast_nullable_to_non_nullable
as List<PremiumPlanModel>,checkoutAvailable: null == checkoutAvailable ? _self.checkoutAvailable : checkoutAvailable // ignore: cast_nullable_to_non_nullable
as bool,features: null == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as List<String>,neverAffects: null == neverAffects ? _self.neverAffects : neverAffects // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [PremiumCatalogModel].
extension PremiumCatalogModelPatterns on PremiumCatalogModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PremiumCatalogModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PremiumCatalogModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PremiumCatalogModel value)  $default,){
final _that = this;
switch (_that) {
case _PremiumCatalogModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PremiumCatalogModel value)?  $default,){
final _that = this;
switch (_that) {
case _PremiumCatalogModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<PremiumPlanModel> plans, @JsonKey(name: 'checkout_available')  bool checkoutAvailable,  List<String> features, @JsonKey(name: 'never_affects')  List<String> neverAffects)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PremiumCatalogModel() when $default != null:
return $default(_that.plans,_that.checkoutAvailable,_that.features,_that.neverAffects);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<PremiumPlanModel> plans, @JsonKey(name: 'checkout_available')  bool checkoutAvailable,  List<String> features, @JsonKey(name: 'never_affects')  List<String> neverAffects)  $default,) {final _that = this;
switch (_that) {
case _PremiumCatalogModel():
return $default(_that.plans,_that.checkoutAvailable,_that.features,_that.neverAffects);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<PremiumPlanModel> plans, @JsonKey(name: 'checkout_available')  bool checkoutAvailable,  List<String> features, @JsonKey(name: 'never_affects')  List<String> neverAffects)?  $default,) {final _that = this;
switch (_that) {
case _PremiumCatalogModel() when $default != null:
return $default(_that.plans,_that.checkoutAvailable,_that.features,_that.neverAffects);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PremiumCatalogModel implements PremiumCatalogModel {
  const _PremiumCatalogModel({final  List<PremiumPlanModel> plans = const [], @JsonKey(name: 'checkout_available') this.checkoutAvailable = false, final  List<String> features = const [], @JsonKey(name: 'never_affects') final  List<String> neverAffects = const []}): _plans = plans,_features = features,_neverAffects = neverAffects;
  factory _PremiumCatalogModel.fromJson(Map<String, dynamic> json) => _$PremiumCatalogModelFromJson(json);

 final  List<PremiumPlanModel> _plans;
@override@JsonKey() List<PremiumPlanModel> get plans {
  if (_plans is EqualUnmodifiableListView) return _plans;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_plans);
}

@override@JsonKey(name: 'checkout_available') final  bool checkoutAvailable;
 final  List<String> _features;
@override@JsonKey() List<String> get features {
  if (_features is EqualUnmodifiableListView) return _features;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_features);
}

 final  List<String> _neverAffects;
@override@JsonKey(name: 'never_affects') List<String> get neverAffects {
  if (_neverAffects is EqualUnmodifiableListView) return _neverAffects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_neverAffects);
}


/// Create a copy of PremiumCatalogModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PremiumCatalogModelCopyWith<_PremiumCatalogModel> get copyWith => __$PremiumCatalogModelCopyWithImpl<_PremiumCatalogModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PremiumCatalogModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PremiumCatalogModel&&const DeepCollectionEquality().equals(other._plans, _plans)&&(identical(other.checkoutAvailable, checkoutAvailable) || other.checkoutAvailable == checkoutAvailable)&&const DeepCollectionEquality().equals(other._features, _features)&&const DeepCollectionEquality().equals(other._neverAffects, _neverAffects));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_plans),checkoutAvailable,const DeepCollectionEquality().hash(_features),const DeepCollectionEquality().hash(_neverAffects));

@override
String toString() {
  return 'PremiumCatalogModel(plans: $plans, checkoutAvailable: $checkoutAvailable, features: $features, neverAffects: $neverAffects)';
}


}

/// @nodoc
abstract mixin class _$PremiumCatalogModelCopyWith<$Res> implements $PremiumCatalogModelCopyWith<$Res> {
  factory _$PremiumCatalogModelCopyWith(_PremiumCatalogModel value, $Res Function(_PremiumCatalogModel) _then) = __$PremiumCatalogModelCopyWithImpl;
@override @useResult
$Res call({
 List<PremiumPlanModel> plans,@JsonKey(name: 'checkout_available') bool checkoutAvailable, List<String> features,@JsonKey(name: 'never_affects') List<String> neverAffects
});




}
/// @nodoc
class __$PremiumCatalogModelCopyWithImpl<$Res>
    implements _$PremiumCatalogModelCopyWith<$Res> {
  __$PremiumCatalogModelCopyWithImpl(this._self, this._then);

  final _PremiumCatalogModel _self;
  final $Res Function(_PremiumCatalogModel) _then;

/// Create a copy of PremiumCatalogModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? plans = null,Object? checkoutAvailable = null,Object? features = null,Object? neverAffects = null,}) {
  return _then(_PremiumCatalogModel(
plans: null == plans ? _self._plans : plans // ignore: cast_nullable_to_non_nullable
as List<PremiumPlanModel>,checkoutAvailable: null == checkoutAvailable ? _self.checkoutAvailable : checkoutAvailable // ignore: cast_nullable_to_non_nullable
as bool,features: null == features ? _self._features : features // ignore: cast_nullable_to_non_nullable
as List<String>,neverAffects: null == neverAffects ? _self._neverAffects : neverAffects // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}


/// @nodoc
mixin _$SubscriptionModel {

 int get id; String get status;@JsonKey(name: 'started_at') DateTime? get startedAt;@JsonKey(name: 'ends_at') DateTime? get endsAt; String? get provider; String? get plan; num? get amount; String? get currency;@JsonKey(name: 'days_left') int? get daysLeft;
/// Create a copy of SubscriptionModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SubscriptionModelCopyWith<SubscriptionModel> get copyWith => _$SubscriptionModelCopyWithImpl<SubscriptionModel>(this as SubscriptionModel, _$identity);

  /// Serializes this SubscriptionModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SubscriptionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.daysLeft, daysLeft) || other.daysLeft == daysLeft));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,startedAt,endsAt,provider,plan,amount,currency,daysLeft);

@override
String toString() {
  return 'SubscriptionModel(id: $id, status: $status, startedAt: $startedAt, endsAt: $endsAt, provider: $provider, plan: $plan, amount: $amount, currency: $currency, daysLeft: $daysLeft)';
}


}

/// @nodoc
abstract mixin class $SubscriptionModelCopyWith<$Res>  {
  factory $SubscriptionModelCopyWith(SubscriptionModel value, $Res Function(SubscriptionModel) _then) = _$SubscriptionModelCopyWithImpl;
@useResult
$Res call({
 int id, String status,@JsonKey(name: 'started_at') DateTime? startedAt,@JsonKey(name: 'ends_at') DateTime? endsAt, String? provider, String? plan, num? amount, String? currency,@JsonKey(name: 'days_left') int? daysLeft
});




}
/// @nodoc
class _$SubscriptionModelCopyWithImpl<$Res>
    implements $SubscriptionModelCopyWith<$Res> {
  _$SubscriptionModelCopyWithImpl(this._self, this._then);

  final SubscriptionModel _self;
  final $Res Function(SubscriptionModel) _then;

/// Create a copy of SubscriptionModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? startedAt = freezed,Object? endsAt = freezed,Object? provider = freezed,Object? plan = freezed,Object? amount = freezed,Object? currency = freezed,Object? daysLeft = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endsAt: freezed == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,provider: freezed == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String?,plan: freezed == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as num?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,daysLeft: freezed == daysLeft ? _self.daysLeft : daysLeft // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [SubscriptionModel].
extension SubscriptionModelPatterns on SubscriptionModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SubscriptionModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SubscriptionModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SubscriptionModel value)  $default,){
final _that = this;
switch (_that) {
case _SubscriptionModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SubscriptionModel value)?  $default,){
final _that = this;
switch (_that) {
case _SubscriptionModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String status, @JsonKey(name: 'started_at')  DateTime? startedAt, @JsonKey(name: 'ends_at')  DateTime? endsAt,  String? provider,  String? plan,  num? amount,  String? currency, @JsonKey(name: 'days_left')  int? daysLeft)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SubscriptionModel() when $default != null:
return $default(_that.id,_that.status,_that.startedAt,_that.endsAt,_that.provider,_that.plan,_that.amount,_that.currency,_that.daysLeft);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String status, @JsonKey(name: 'started_at')  DateTime? startedAt, @JsonKey(name: 'ends_at')  DateTime? endsAt,  String? provider,  String? plan,  num? amount,  String? currency, @JsonKey(name: 'days_left')  int? daysLeft)  $default,) {final _that = this;
switch (_that) {
case _SubscriptionModel():
return $default(_that.id,_that.status,_that.startedAt,_that.endsAt,_that.provider,_that.plan,_that.amount,_that.currency,_that.daysLeft);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String status, @JsonKey(name: 'started_at')  DateTime? startedAt, @JsonKey(name: 'ends_at')  DateTime? endsAt,  String? provider,  String? plan,  num? amount,  String? currency, @JsonKey(name: 'days_left')  int? daysLeft)?  $default,) {final _that = this;
switch (_that) {
case _SubscriptionModel() when $default != null:
return $default(_that.id,_that.status,_that.startedAt,_that.endsAt,_that.provider,_that.plan,_that.amount,_that.currency,_that.daysLeft);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SubscriptionModel implements SubscriptionModel {
  const _SubscriptionModel({required this.id, this.status = '', @JsonKey(name: 'started_at') this.startedAt, @JsonKey(name: 'ends_at') this.endsAt, this.provider, this.plan, this.amount, this.currency, @JsonKey(name: 'days_left') this.daysLeft});
  factory _SubscriptionModel.fromJson(Map<String, dynamic> json) => _$SubscriptionModelFromJson(json);

@override final  int id;
@override@JsonKey() final  String status;
@override@JsonKey(name: 'started_at') final  DateTime? startedAt;
@override@JsonKey(name: 'ends_at') final  DateTime? endsAt;
@override final  String? provider;
@override final  String? plan;
@override final  num? amount;
@override final  String? currency;
@override@JsonKey(name: 'days_left') final  int? daysLeft;

/// Create a copy of SubscriptionModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SubscriptionModelCopyWith<_SubscriptionModel> get copyWith => __$SubscriptionModelCopyWithImpl<_SubscriptionModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SubscriptionModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SubscriptionModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.endsAt, endsAt) || other.endsAt == endsAt)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.plan, plan) || other.plan == plan)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.daysLeft, daysLeft) || other.daysLeft == daysLeft));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,startedAt,endsAt,provider,plan,amount,currency,daysLeft);

@override
String toString() {
  return 'SubscriptionModel(id: $id, status: $status, startedAt: $startedAt, endsAt: $endsAt, provider: $provider, plan: $plan, amount: $amount, currency: $currency, daysLeft: $daysLeft)';
}


}

/// @nodoc
abstract mixin class _$SubscriptionModelCopyWith<$Res> implements $SubscriptionModelCopyWith<$Res> {
  factory _$SubscriptionModelCopyWith(_SubscriptionModel value, $Res Function(_SubscriptionModel) _then) = __$SubscriptionModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String status,@JsonKey(name: 'started_at') DateTime? startedAt,@JsonKey(name: 'ends_at') DateTime? endsAt, String? provider, String? plan, num? amount, String? currency,@JsonKey(name: 'days_left') int? daysLeft
});




}
/// @nodoc
class __$SubscriptionModelCopyWithImpl<$Res>
    implements _$SubscriptionModelCopyWith<$Res> {
  __$SubscriptionModelCopyWithImpl(this._self, this._then);

  final _SubscriptionModel _self;
  final $Res Function(_SubscriptionModel) _then;

/// Create a copy of SubscriptionModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? startedAt = freezed,Object? endsAt = freezed,Object? provider = freezed,Object? plan = freezed,Object? amount = freezed,Object? currency = freezed,Object? daysLeft = freezed,}) {
  return _then(_SubscriptionModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,endsAt: freezed == endsAt ? _self.endsAt : endsAt // ignore: cast_nullable_to_non_nullable
as DateTime?,provider: freezed == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String?,plan: freezed == plan ? _self.plan : plan // ignore: cast_nullable_to_non_nullable
as String?,amount: freezed == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as num?,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,daysLeft: freezed == daysLeft ? _self.daysLeft : daysLeft // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}


/// @nodoc
mixin _$PremiumStatusModel {

@JsonKey(name: 'is_premium') bool get isPremium; String? get tier; SubscriptionModel? get subscription; List<String> get features;@JsonKey(name: 'never_affects') List<String> get neverAffects;
/// Create a copy of PremiumStatusModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PremiumStatusModelCopyWith<PremiumStatusModel> get copyWith => _$PremiumStatusModelCopyWithImpl<PremiumStatusModel>(this as PremiumStatusModel, _$identity);

  /// Serializes this PremiumStatusModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PremiumStatusModel&&(identical(other.isPremium, isPremium) || other.isPremium == isPremium)&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.subscription, subscription) || other.subscription == subscription)&&const DeepCollectionEquality().equals(other.features, features)&&const DeepCollectionEquality().equals(other.neverAffects, neverAffects));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isPremium,tier,subscription,const DeepCollectionEquality().hash(features),const DeepCollectionEquality().hash(neverAffects));

@override
String toString() {
  return 'PremiumStatusModel(isPremium: $isPremium, tier: $tier, subscription: $subscription, features: $features, neverAffects: $neverAffects)';
}


}

/// @nodoc
abstract mixin class $PremiumStatusModelCopyWith<$Res>  {
  factory $PremiumStatusModelCopyWith(PremiumStatusModel value, $Res Function(PremiumStatusModel) _then) = _$PremiumStatusModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'is_premium') bool isPremium, String? tier, SubscriptionModel? subscription, List<String> features,@JsonKey(name: 'never_affects') List<String> neverAffects
});


$SubscriptionModelCopyWith<$Res>? get subscription;

}
/// @nodoc
class _$PremiumStatusModelCopyWithImpl<$Res>
    implements $PremiumStatusModelCopyWith<$Res> {
  _$PremiumStatusModelCopyWithImpl(this._self, this._then);

  final PremiumStatusModel _self;
  final $Res Function(PremiumStatusModel) _then;

/// Create a copy of PremiumStatusModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isPremium = null,Object? tier = freezed,Object? subscription = freezed,Object? features = null,Object? neverAffects = null,}) {
  return _then(_self.copyWith(
isPremium: null == isPremium ? _self.isPremium : isPremium // ignore: cast_nullable_to_non_nullable
as bool,tier: freezed == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String?,subscription: freezed == subscription ? _self.subscription : subscription // ignore: cast_nullable_to_non_nullable
as SubscriptionModel?,features: null == features ? _self.features : features // ignore: cast_nullable_to_non_nullable
as List<String>,neverAffects: null == neverAffects ? _self.neverAffects : neverAffects // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}
/// Create a copy of PremiumStatusModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubscriptionModelCopyWith<$Res>? get subscription {
    if (_self.subscription == null) {
    return null;
  }

  return $SubscriptionModelCopyWith<$Res>(_self.subscription!, (value) {
    return _then(_self.copyWith(subscription: value));
  });
}
}


/// Adds pattern-matching-related methods to [PremiumStatusModel].
extension PremiumStatusModelPatterns on PremiumStatusModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PremiumStatusModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PremiumStatusModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PremiumStatusModel value)  $default,){
final _that = this;
switch (_that) {
case _PremiumStatusModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PremiumStatusModel value)?  $default,){
final _that = this;
switch (_that) {
case _PremiumStatusModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'is_premium')  bool isPremium,  String? tier,  SubscriptionModel? subscription,  List<String> features, @JsonKey(name: 'never_affects')  List<String> neverAffects)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PremiumStatusModel() when $default != null:
return $default(_that.isPremium,_that.tier,_that.subscription,_that.features,_that.neverAffects);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'is_premium')  bool isPremium,  String? tier,  SubscriptionModel? subscription,  List<String> features, @JsonKey(name: 'never_affects')  List<String> neverAffects)  $default,) {final _that = this;
switch (_that) {
case _PremiumStatusModel():
return $default(_that.isPremium,_that.tier,_that.subscription,_that.features,_that.neverAffects);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'is_premium')  bool isPremium,  String? tier,  SubscriptionModel? subscription,  List<String> features, @JsonKey(name: 'never_affects')  List<String> neverAffects)?  $default,) {final _that = this;
switch (_that) {
case _PremiumStatusModel() when $default != null:
return $default(_that.isPremium,_that.tier,_that.subscription,_that.features,_that.neverAffects);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PremiumStatusModel implements PremiumStatusModel {
  const _PremiumStatusModel({@JsonKey(name: 'is_premium') this.isPremium = false, this.tier, this.subscription, final  List<String> features = const [], @JsonKey(name: 'never_affects') final  List<String> neverAffects = const []}): _features = features,_neverAffects = neverAffects;
  factory _PremiumStatusModel.fromJson(Map<String, dynamic> json) => _$PremiumStatusModelFromJson(json);

@override@JsonKey(name: 'is_premium') final  bool isPremium;
@override final  String? tier;
@override final  SubscriptionModel? subscription;
 final  List<String> _features;
@override@JsonKey() List<String> get features {
  if (_features is EqualUnmodifiableListView) return _features;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_features);
}

 final  List<String> _neverAffects;
@override@JsonKey(name: 'never_affects') List<String> get neverAffects {
  if (_neverAffects is EqualUnmodifiableListView) return _neverAffects;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_neverAffects);
}


/// Create a copy of PremiumStatusModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PremiumStatusModelCopyWith<_PremiumStatusModel> get copyWith => __$PremiumStatusModelCopyWithImpl<_PremiumStatusModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PremiumStatusModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PremiumStatusModel&&(identical(other.isPremium, isPremium) || other.isPremium == isPremium)&&(identical(other.tier, tier) || other.tier == tier)&&(identical(other.subscription, subscription) || other.subscription == subscription)&&const DeepCollectionEquality().equals(other._features, _features)&&const DeepCollectionEquality().equals(other._neverAffects, _neverAffects));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,isPremium,tier,subscription,const DeepCollectionEquality().hash(_features),const DeepCollectionEquality().hash(_neverAffects));

@override
String toString() {
  return 'PremiumStatusModel(isPremium: $isPremium, tier: $tier, subscription: $subscription, features: $features, neverAffects: $neverAffects)';
}


}

/// @nodoc
abstract mixin class _$PremiumStatusModelCopyWith<$Res> implements $PremiumStatusModelCopyWith<$Res> {
  factory _$PremiumStatusModelCopyWith(_PremiumStatusModel value, $Res Function(_PremiumStatusModel) _then) = __$PremiumStatusModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'is_premium') bool isPremium, String? tier, SubscriptionModel? subscription, List<String> features,@JsonKey(name: 'never_affects') List<String> neverAffects
});


@override $SubscriptionModelCopyWith<$Res>? get subscription;

}
/// @nodoc
class __$PremiumStatusModelCopyWithImpl<$Res>
    implements _$PremiumStatusModelCopyWith<$Res> {
  __$PremiumStatusModelCopyWithImpl(this._self, this._then);

  final _PremiumStatusModel _self;
  final $Res Function(_PremiumStatusModel) _then;

/// Create a copy of PremiumStatusModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isPremium = null,Object? tier = freezed,Object? subscription = freezed,Object? features = null,Object? neverAffects = null,}) {
  return _then(_PremiumStatusModel(
isPremium: null == isPremium ? _self.isPremium : isPremium // ignore: cast_nullable_to_non_nullable
as bool,tier: freezed == tier ? _self.tier : tier // ignore: cast_nullable_to_non_nullable
as String?,subscription: freezed == subscription ? _self.subscription : subscription // ignore: cast_nullable_to_non_nullable
as SubscriptionModel?,features: null == features ? _self._features : features // ignore: cast_nullable_to_non_nullable
as List<String>,neverAffects: null == neverAffects ? _self._neverAffects : neverAffects // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

/// Create a copy of PremiumStatusModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$SubscriptionModelCopyWith<$Res>? get subscription {
    if (_self.subscription == null) {
    return null;
  }

  return $SubscriptionModelCopyWith<$Res>(_self.subscription!, (value) {
    return _then(_self.copyWith(subscription: value));
  });
}
}


/// @nodoc
mixin _$PaymentModel {

 String get reference; String? get type; num get amount; String? get currency; String? get provider; String get status;@JsonKey(name: 'checkout_url') String? get checkoutUrl;// Object, not Map: older servers sent an empty list ([]) here.
@JsonKey(name: 'client_data') Object? get clientData;@JsonKey(name: 'failure_reason') String? get failureReason;@JsonKey(name: 'paid_at') DateTime? get paidAt;@JsonKey(name: 'created_at') DateTime? get createdAt;
/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PaymentModelCopyWith<PaymentModel> get copyWith => _$PaymentModelCopyWithImpl<PaymentModel>(this as PaymentModel, _$identity);

  /// Serializes this PaymentModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PaymentModel&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.status, status) || other.status == status)&&(identical(other.checkoutUrl, checkoutUrl) || other.checkoutUrl == checkoutUrl)&&const DeepCollectionEquality().equals(other.clientData, clientData)&&(identical(other.failureReason, failureReason) || other.failureReason == failureReason)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reference,type,amount,currency,provider,status,checkoutUrl,const DeepCollectionEquality().hash(clientData),failureReason,paidAt,createdAt);

@override
String toString() {
  return 'PaymentModel(reference: $reference, type: $type, amount: $amount, currency: $currency, provider: $provider, status: $status, checkoutUrl: $checkoutUrl, clientData: $clientData, failureReason: $failureReason, paidAt: $paidAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class $PaymentModelCopyWith<$Res>  {
  factory $PaymentModelCopyWith(PaymentModel value, $Res Function(PaymentModel) _then) = _$PaymentModelCopyWithImpl;
@useResult
$Res call({
 String reference, String? type, num amount, String? currency, String? provider, String status,@JsonKey(name: 'checkout_url') String? checkoutUrl,@JsonKey(name: 'client_data') Object? clientData,@JsonKey(name: 'failure_reason') String? failureReason,@JsonKey(name: 'paid_at') DateTime? paidAt,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class _$PaymentModelCopyWithImpl<$Res>
    implements $PaymentModelCopyWith<$Res> {
  _$PaymentModelCopyWithImpl(this._self, this._then);

  final PaymentModel _self;
  final $Res Function(PaymentModel) _then;

/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? reference = null,Object? type = freezed,Object? amount = null,Object? currency = freezed,Object? provider = freezed,Object? status = null,Object? checkoutUrl = freezed,Object? clientData = freezed,Object? failureReason = freezed,Object? paidAt = freezed,Object? createdAt = freezed,}) {
  return _then(_self.copyWith(
reference: null == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as num,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,provider: freezed == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,checkoutUrl: freezed == checkoutUrl ? _self.checkoutUrl : checkoutUrl // ignore: cast_nullable_to_non_nullable
as String?,clientData: freezed == clientData ? _self.clientData : clientData ,failureReason: freezed == failureReason ? _self.failureReason : failureReason // ignore: cast_nullable_to_non_nullable
as String?,paidAt: freezed == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [PaymentModel].
extension PaymentModelPatterns on PaymentModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PaymentModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PaymentModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PaymentModel value)  $default,){
final _that = this;
switch (_that) {
case _PaymentModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PaymentModel value)?  $default,){
final _that = this;
switch (_that) {
case _PaymentModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String reference,  String? type,  num amount,  String? currency,  String? provider,  String status, @JsonKey(name: 'checkout_url')  String? checkoutUrl, @JsonKey(name: 'client_data')  Object? clientData, @JsonKey(name: 'failure_reason')  String? failureReason, @JsonKey(name: 'paid_at')  DateTime? paidAt, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PaymentModel() when $default != null:
return $default(_that.reference,_that.type,_that.amount,_that.currency,_that.provider,_that.status,_that.checkoutUrl,_that.clientData,_that.failureReason,_that.paidAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String reference,  String? type,  num amount,  String? currency,  String? provider,  String status, @JsonKey(name: 'checkout_url')  String? checkoutUrl, @JsonKey(name: 'client_data')  Object? clientData, @JsonKey(name: 'failure_reason')  String? failureReason, @JsonKey(name: 'paid_at')  DateTime? paidAt, @JsonKey(name: 'created_at')  DateTime? createdAt)  $default,) {final _that = this;
switch (_that) {
case _PaymentModel():
return $default(_that.reference,_that.type,_that.amount,_that.currency,_that.provider,_that.status,_that.checkoutUrl,_that.clientData,_that.failureReason,_that.paidAt,_that.createdAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String reference,  String? type,  num amount,  String? currency,  String? provider,  String status, @JsonKey(name: 'checkout_url')  String? checkoutUrl, @JsonKey(name: 'client_data')  Object? clientData, @JsonKey(name: 'failure_reason')  String? failureReason, @JsonKey(name: 'paid_at')  DateTime? paidAt, @JsonKey(name: 'created_at')  DateTime? createdAt)?  $default,) {final _that = this;
switch (_that) {
case _PaymentModel() when $default != null:
return $default(_that.reference,_that.type,_that.amount,_that.currency,_that.provider,_that.status,_that.checkoutUrl,_that.clientData,_that.failureReason,_that.paidAt,_that.createdAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PaymentModel implements PaymentModel {
  const _PaymentModel({required this.reference, this.type, this.amount = 0, this.currency, this.provider, this.status = 'pending', @JsonKey(name: 'checkout_url') this.checkoutUrl, @JsonKey(name: 'client_data') this.clientData, @JsonKey(name: 'failure_reason') this.failureReason, @JsonKey(name: 'paid_at') this.paidAt, @JsonKey(name: 'created_at') this.createdAt});
  factory _PaymentModel.fromJson(Map<String, dynamic> json) => _$PaymentModelFromJson(json);

@override final  String reference;
@override final  String? type;
@override@JsonKey() final  num amount;
@override final  String? currency;
@override final  String? provider;
@override@JsonKey() final  String status;
@override@JsonKey(name: 'checkout_url') final  String? checkoutUrl;
// Object, not Map: older servers sent an empty list ([]) here.
@override@JsonKey(name: 'client_data') final  Object? clientData;
@override@JsonKey(name: 'failure_reason') final  String? failureReason;
@override@JsonKey(name: 'paid_at') final  DateTime? paidAt;
@override@JsonKey(name: 'created_at') final  DateTime? createdAt;

/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PaymentModelCopyWith<_PaymentModel> get copyWith => __$PaymentModelCopyWithImpl<_PaymentModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PaymentModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PaymentModel&&(identical(other.reference, reference) || other.reference == reference)&&(identical(other.type, type) || other.type == type)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.currency, currency) || other.currency == currency)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.status, status) || other.status == status)&&(identical(other.checkoutUrl, checkoutUrl) || other.checkoutUrl == checkoutUrl)&&const DeepCollectionEquality().equals(other.clientData, clientData)&&(identical(other.failureReason, failureReason) || other.failureReason == failureReason)&&(identical(other.paidAt, paidAt) || other.paidAt == paidAt)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,reference,type,amount,currency,provider,status,checkoutUrl,const DeepCollectionEquality().hash(clientData),failureReason,paidAt,createdAt);

@override
String toString() {
  return 'PaymentModel(reference: $reference, type: $type, amount: $amount, currency: $currency, provider: $provider, status: $status, checkoutUrl: $checkoutUrl, clientData: $clientData, failureReason: $failureReason, paidAt: $paidAt, createdAt: $createdAt)';
}


}

/// @nodoc
abstract mixin class _$PaymentModelCopyWith<$Res> implements $PaymentModelCopyWith<$Res> {
  factory _$PaymentModelCopyWith(_PaymentModel value, $Res Function(_PaymentModel) _then) = __$PaymentModelCopyWithImpl;
@override @useResult
$Res call({
 String reference, String? type, num amount, String? currency, String? provider, String status,@JsonKey(name: 'checkout_url') String? checkoutUrl,@JsonKey(name: 'client_data') Object? clientData,@JsonKey(name: 'failure_reason') String? failureReason,@JsonKey(name: 'paid_at') DateTime? paidAt,@JsonKey(name: 'created_at') DateTime? createdAt
});




}
/// @nodoc
class __$PaymentModelCopyWithImpl<$Res>
    implements _$PaymentModelCopyWith<$Res> {
  __$PaymentModelCopyWithImpl(this._self, this._then);

  final _PaymentModel _self;
  final $Res Function(_PaymentModel) _then;

/// Create a copy of PaymentModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? reference = null,Object? type = freezed,Object? amount = null,Object? currency = freezed,Object? provider = freezed,Object? status = null,Object? checkoutUrl = freezed,Object? clientData = freezed,Object? failureReason = freezed,Object? paidAt = freezed,Object? createdAt = freezed,}) {
  return _then(_PaymentModel(
reference: null == reference ? _self.reference : reference // ignore: cast_nullable_to_non_nullable
as String,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as num,currency: freezed == currency ? _self.currency : currency // ignore: cast_nullable_to_non_nullable
as String?,provider: freezed == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String?,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,checkoutUrl: freezed == checkoutUrl ? _self.checkoutUrl : checkoutUrl // ignore: cast_nullable_to_non_nullable
as String?,clientData: freezed == clientData ? _self.clientData : clientData ,failureReason: freezed == failureReason ? _self.failureReason : failureReason // ignore: cast_nullable_to_non_nullable
as String?,paidAt: freezed == paidAt ? _self.paidAt : paidAt // ignore: cast_nullable_to_non_nullable
as DateTime?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}


/// @nodoc
mixin _$ThreeDAssetModel {

 int get id; String get status; String? get provider;@JsonKey(name: 'provider_job_id') String? get providerJobId;@JsonKey(name: 'asset_url') String? get assetUrl; String? get error;@JsonKey(name: 'requested_at') DateTime? get requestedAt;@JsonKey(name: 'completed_at') DateTime? get completedAt;
/// Create a copy of ThreeDAssetModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ThreeDAssetModelCopyWith<ThreeDAssetModel> get copyWith => _$ThreeDAssetModelCopyWithImpl<ThreeDAssetModel>(this as ThreeDAssetModel, _$identity);

  /// Serializes this ThreeDAssetModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ThreeDAssetModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.providerJobId, providerJobId) || other.providerJobId == providerJobId)&&(identical(other.assetUrl, assetUrl) || other.assetUrl == assetUrl)&&(identical(other.error, error) || other.error == error)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,provider,providerJobId,assetUrl,error,requestedAt,completedAt);

@override
String toString() {
  return 'ThreeDAssetModel(id: $id, status: $status, provider: $provider, providerJobId: $providerJobId, assetUrl: $assetUrl, error: $error, requestedAt: $requestedAt, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class $ThreeDAssetModelCopyWith<$Res>  {
  factory $ThreeDAssetModelCopyWith(ThreeDAssetModel value, $Res Function(ThreeDAssetModel) _then) = _$ThreeDAssetModelCopyWithImpl;
@useResult
$Res call({
 int id, String status, String? provider,@JsonKey(name: 'provider_job_id') String? providerJobId,@JsonKey(name: 'asset_url') String? assetUrl, String? error,@JsonKey(name: 'requested_at') DateTime? requestedAt,@JsonKey(name: 'completed_at') DateTime? completedAt
});




}
/// @nodoc
class _$ThreeDAssetModelCopyWithImpl<$Res>
    implements $ThreeDAssetModelCopyWith<$Res> {
  _$ThreeDAssetModelCopyWithImpl(this._self, this._then);

  final ThreeDAssetModel _self;
  final $Res Function(ThreeDAssetModel) _then;

/// Create a copy of ThreeDAssetModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? status = null,Object? provider = freezed,Object? providerJobId = freezed,Object? assetUrl = freezed,Object? error = freezed,Object? requestedAt = freezed,Object? completedAt = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,provider: freezed == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String?,providerJobId: freezed == providerJobId ? _self.providerJobId : providerJobId // ignore: cast_nullable_to_non_nullable
as String?,assetUrl: freezed == assetUrl ? _self.assetUrl : assetUrl // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,requestedAt: freezed == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}

}


/// Adds pattern-matching-related methods to [ThreeDAssetModel].
extension ThreeDAssetModelPatterns on ThreeDAssetModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ThreeDAssetModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ThreeDAssetModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ThreeDAssetModel value)  $default,){
final _that = this;
switch (_that) {
case _ThreeDAssetModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ThreeDAssetModel value)?  $default,){
final _that = this;
switch (_that) {
case _ThreeDAssetModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  String status,  String? provider, @JsonKey(name: 'provider_job_id')  String? providerJobId, @JsonKey(name: 'asset_url')  String? assetUrl,  String? error, @JsonKey(name: 'requested_at')  DateTime? requestedAt, @JsonKey(name: 'completed_at')  DateTime? completedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ThreeDAssetModel() when $default != null:
return $default(_that.id,_that.status,_that.provider,_that.providerJobId,_that.assetUrl,_that.error,_that.requestedAt,_that.completedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  String status,  String? provider, @JsonKey(name: 'provider_job_id')  String? providerJobId, @JsonKey(name: 'asset_url')  String? assetUrl,  String? error, @JsonKey(name: 'requested_at')  DateTime? requestedAt, @JsonKey(name: 'completed_at')  DateTime? completedAt)  $default,) {final _that = this;
switch (_that) {
case _ThreeDAssetModel():
return $default(_that.id,_that.status,_that.provider,_that.providerJobId,_that.assetUrl,_that.error,_that.requestedAt,_that.completedAt);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  String status,  String? provider, @JsonKey(name: 'provider_job_id')  String? providerJobId, @JsonKey(name: 'asset_url')  String? assetUrl,  String? error, @JsonKey(name: 'requested_at')  DateTime? requestedAt, @JsonKey(name: 'completed_at')  DateTime? completedAt)?  $default,) {final _that = this;
switch (_that) {
case _ThreeDAssetModel() when $default != null:
return $default(_that.id,_that.status,_that.provider,_that.providerJobId,_that.assetUrl,_that.error,_that.requestedAt,_that.completedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ThreeDAssetModel implements ThreeDAssetModel {
  const _ThreeDAssetModel({required this.id, this.status = 'pending', this.provider, @JsonKey(name: 'provider_job_id') this.providerJobId, @JsonKey(name: 'asset_url') this.assetUrl, this.error, @JsonKey(name: 'requested_at') this.requestedAt, @JsonKey(name: 'completed_at') this.completedAt});
  factory _ThreeDAssetModel.fromJson(Map<String, dynamic> json) => _$ThreeDAssetModelFromJson(json);

@override final  int id;
@override@JsonKey() final  String status;
@override final  String? provider;
@override@JsonKey(name: 'provider_job_id') final  String? providerJobId;
@override@JsonKey(name: 'asset_url') final  String? assetUrl;
@override final  String? error;
@override@JsonKey(name: 'requested_at') final  DateTime? requestedAt;
@override@JsonKey(name: 'completed_at') final  DateTime? completedAt;

/// Create a copy of ThreeDAssetModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ThreeDAssetModelCopyWith<_ThreeDAssetModel> get copyWith => __$ThreeDAssetModelCopyWithImpl<_ThreeDAssetModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ThreeDAssetModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ThreeDAssetModel&&(identical(other.id, id) || other.id == id)&&(identical(other.status, status) || other.status == status)&&(identical(other.provider, provider) || other.provider == provider)&&(identical(other.providerJobId, providerJobId) || other.providerJobId == providerJobId)&&(identical(other.assetUrl, assetUrl) || other.assetUrl == assetUrl)&&(identical(other.error, error) || other.error == error)&&(identical(other.requestedAt, requestedAt) || other.requestedAt == requestedAt)&&(identical(other.completedAt, completedAt) || other.completedAt == completedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,status,provider,providerJobId,assetUrl,error,requestedAt,completedAt);

@override
String toString() {
  return 'ThreeDAssetModel(id: $id, status: $status, provider: $provider, providerJobId: $providerJobId, assetUrl: $assetUrl, error: $error, requestedAt: $requestedAt, completedAt: $completedAt)';
}


}

/// @nodoc
abstract mixin class _$ThreeDAssetModelCopyWith<$Res> implements $ThreeDAssetModelCopyWith<$Res> {
  factory _$ThreeDAssetModelCopyWith(_ThreeDAssetModel value, $Res Function(_ThreeDAssetModel) _then) = __$ThreeDAssetModelCopyWithImpl;
@override @useResult
$Res call({
 int id, String status, String? provider,@JsonKey(name: 'provider_job_id') String? providerJobId,@JsonKey(name: 'asset_url') String? assetUrl, String? error,@JsonKey(name: 'requested_at') DateTime? requestedAt,@JsonKey(name: 'completed_at') DateTime? completedAt
});




}
/// @nodoc
class __$ThreeDAssetModelCopyWithImpl<$Res>
    implements _$ThreeDAssetModelCopyWith<$Res> {
  __$ThreeDAssetModelCopyWithImpl(this._self, this._then);

  final _ThreeDAssetModel _self;
  final $Res Function(_ThreeDAssetModel) _then;

/// Create a copy of ThreeDAssetModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? status = null,Object? provider = freezed,Object? providerJobId = freezed,Object? assetUrl = freezed,Object? error = freezed,Object? requestedAt = freezed,Object? completedAt = freezed,}) {
  return _then(_ThreeDAssetModel(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String,provider: freezed == provider ? _self.provider : provider // ignore: cast_nullable_to_non_nullable
as String?,providerJobId: freezed == providerJobId ? _self.providerJobId : providerJobId // ignore: cast_nullable_to_non_nullable
as String?,assetUrl: freezed == assetUrl ? _self.assetUrl : assetUrl // ignore: cast_nullable_to_non_nullable
as String?,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,requestedAt: freezed == requestedAt ? _self.requestedAt : requestedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,completedAt: freezed == completedAt ? _self.completedAt : completedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,
  ));
}


}

// dart format on
