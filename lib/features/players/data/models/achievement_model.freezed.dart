// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'achievement_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AchievementProgressModel {

 int get current; int get target;
/// Create a copy of AchievementProgressModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AchievementProgressModelCopyWith<AchievementProgressModel> get copyWith => _$AchievementProgressModelCopyWithImpl<AchievementProgressModel>(this as AchievementProgressModel, _$identity);

  /// Serializes this AchievementProgressModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AchievementProgressModel&&(identical(other.current, current) || other.current == current)&&(identical(other.target, target) || other.target == target));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,current,target);

@override
String toString() {
  return 'AchievementProgressModel(current: $current, target: $target)';
}


}

/// @nodoc
abstract mixin class $AchievementProgressModelCopyWith<$Res>  {
  factory $AchievementProgressModelCopyWith(AchievementProgressModel value, $Res Function(AchievementProgressModel) _then) = _$AchievementProgressModelCopyWithImpl;
@useResult
$Res call({
 int current, int target
});




}
/// @nodoc
class _$AchievementProgressModelCopyWithImpl<$Res>
    implements $AchievementProgressModelCopyWith<$Res> {
  _$AchievementProgressModelCopyWithImpl(this._self, this._then);

  final AchievementProgressModel _self;
  final $Res Function(AchievementProgressModel) _then;

/// Create a copy of AchievementProgressModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? current = null,Object? target = null,}) {
  return _then(_self.copyWith(
current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as int,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [AchievementProgressModel].
extension AchievementProgressModelPatterns on AchievementProgressModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AchievementProgressModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AchievementProgressModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AchievementProgressModel value)  $default,){
final _that = this;
switch (_that) {
case _AchievementProgressModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AchievementProgressModel value)?  $default,){
final _that = this;
switch (_that) {
case _AchievementProgressModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int current,  int target)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AchievementProgressModel() when $default != null:
return $default(_that.current,_that.target);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int current,  int target)  $default,) {final _that = this;
switch (_that) {
case _AchievementProgressModel():
return $default(_that.current,_that.target);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int current,  int target)?  $default,) {final _that = this;
switch (_that) {
case _AchievementProgressModel() when $default != null:
return $default(_that.current,_that.target);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AchievementProgressModel implements AchievementProgressModel {
  const _AchievementProgressModel({this.current = 0, this.target = 0});
  factory _AchievementProgressModel.fromJson(Map<String, dynamic> json) => _$AchievementProgressModelFromJson(json);

@override@JsonKey() final  int current;
@override@JsonKey() final  int target;

/// Create a copy of AchievementProgressModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AchievementProgressModelCopyWith<_AchievementProgressModel> get copyWith => __$AchievementProgressModelCopyWithImpl<_AchievementProgressModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AchievementProgressModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AchievementProgressModel&&(identical(other.current, current) || other.current == current)&&(identical(other.target, target) || other.target == target));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,current,target);

@override
String toString() {
  return 'AchievementProgressModel(current: $current, target: $target)';
}


}

/// @nodoc
abstract mixin class _$AchievementProgressModelCopyWith<$Res> implements $AchievementProgressModelCopyWith<$Res> {
  factory _$AchievementProgressModelCopyWith(_AchievementProgressModel value, $Res Function(_AchievementProgressModel) _then) = __$AchievementProgressModelCopyWithImpl;
@override @useResult
$Res call({
 int current, int target
});




}
/// @nodoc
class __$AchievementProgressModelCopyWithImpl<$Res>
    implements _$AchievementProgressModelCopyWith<$Res> {
  __$AchievementProgressModelCopyWithImpl(this._self, this._then);

  final _AchievementProgressModel _self;
  final $Res Function(_AchievementProgressModel) _then;

/// Create a copy of AchievementProgressModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? current = null,Object? target = null,}) {
  return _then(_AchievementProgressModel(
current: null == current ? _self.current : current // ignore: cast_nullable_to_non_nullable
as int,target: null == target ? _self.target : target // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}


/// @nodoc
mixin _$AchievementModel {

 String get code; String get name; String get description; String get category; String get rarity;@JsonKey(name: 'xp_reward') int get xpReward;@JsonKey(name: 'is_premium_badge') bool get isPremiumBadge;@JsonKey(name: 'is_automatic') bool get isAutomatic;@JsonKey(name: 'icon_url') String? get iconUrl;@JsonKey(name: 'unlocked_at') DateTime? get unlockedAt; AchievementProgressModel? get progress; Map<String, dynamic>? get meta;
/// Create a copy of AchievementModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AchievementModelCopyWith<AchievementModel> get copyWith => _$AchievementModelCopyWithImpl<AchievementModel>(this as AchievementModel, _$identity);

  /// Serializes this AchievementModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AchievementModel&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.rarity, rarity) || other.rarity == rarity)&&(identical(other.xpReward, xpReward) || other.xpReward == xpReward)&&(identical(other.isPremiumBadge, isPremiumBadge) || other.isPremiumBadge == isPremiumBadge)&&(identical(other.isAutomatic, isAutomatic) || other.isAutomatic == isAutomatic)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.unlockedAt, unlockedAt) || other.unlockedAt == unlockedAt)&&(identical(other.progress, progress) || other.progress == progress)&&const DeepCollectionEquality().equals(other.meta, meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name,description,category,rarity,xpReward,isPremiumBadge,isAutomatic,iconUrl,unlockedAt,progress,const DeepCollectionEquality().hash(meta));

@override
String toString() {
  return 'AchievementModel(code: $code, name: $name, description: $description, category: $category, rarity: $rarity, xpReward: $xpReward, isPremiumBadge: $isPremiumBadge, isAutomatic: $isAutomatic, iconUrl: $iconUrl, unlockedAt: $unlockedAt, progress: $progress, meta: $meta)';
}


}

/// @nodoc
abstract mixin class $AchievementModelCopyWith<$Res>  {
  factory $AchievementModelCopyWith(AchievementModel value, $Res Function(AchievementModel) _then) = _$AchievementModelCopyWithImpl;
@useResult
$Res call({
 String code, String name, String description, String category, String rarity,@JsonKey(name: 'xp_reward') int xpReward,@JsonKey(name: 'is_premium_badge') bool isPremiumBadge,@JsonKey(name: 'is_automatic') bool isAutomatic,@JsonKey(name: 'icon_url') String? iconUrl,@JsonKey(name: 'unlocked_at') DateTime? unlockedAt, AchievementProgressModel? progress, Map<String, dynamic>? meta
});


$AchievementProgressModelCopyWith<$Res>? get progress;

}
/// @nodoc
class _$AchievementModelCopyWithImpl<$Res>
    implements $AchievementModelCopyWith<$Res> {
  _$AchievementModelCopyWithImpl(this._self, this._then);

  final AchievementModel _self;
  final $Res Function(AchievementModel) _then;

/// Create a copy of AchievementModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? code = null,Object? name = null,Object? description = null,Object? category = null,Object? rarity = null,Object? xpReward = null,Object? isPremiumBadge = null,Object? isAutomatic = null,Object? iconUrl = freezed,Object? unlockedAt = freezed,Object? progress = freezed,Object? meta = freezed,}) {
  return _then(_self.copyWith(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,rarity: null == rarity ? _self.rarity : rarity // ignore: cast_nullable_to_non_nullable
as String,xpReward: null == xpReward ? _self.xpReward : xpReward // ignore: cast_nullable_to_non_nullable
as int,isPremiumBadge: null == isPremiumBadge ? _self.isPremiumBadge : isPremiumBadge // ignore: cast_nullable_to_non_nullable
as bool,isAutomatic: null == isAutomatic ? _self.isAutomatic : isAutomatic // ignore: cast_nullable_to_non_nullable
as bool,iconUrl: freezed == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String?,unlockedAt: freezed == unlockedAt ? _self.unlockedAt : unlockedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as AchievementProgressModel?,meta: freezed == meta ? _self.meta : meta // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}
/// Create a copy of AchievementModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AchievementProgressModelCopyWith<$Res>? get progress {
    if (_self.progress == null) {
    return null;
  }

  return $AchievementProgressModelCopyWith<$Res>(_self.progress!, (value) {
    return _then(_self.copyWith(progress: value));
  });
}
}


/// Adds pattern-matching-related methods to [AchievementModel].
extension AchievementModelPatterns on AchievementModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AchievementModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AchievementModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AchievementModel value)  $default,){
final _that = this;
switch (_that) {
case _AchievementModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AchievementModel value)?  $default,){
final _that = this;
switch (_that) {
case _AchievementModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String code,  String name,  String description,  String category,  String rarity, @JsonKey(name: 'xp_reward')  int xpReward, @JsonKey(name: 'is_premium_badge')  bool isPremiumBadge, @JsonKey(name: 'is_automatic')  bool isAutomatic, @JsonKey(name: 'icon_url')  String? iconUrl, @JsonKey(name: 'unlocked_at')  DateTime? unlockedAt,  AchievementProgressModel? progress,  Map<String, dynamic>? meta)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AchievementModel() when $default != null:
return $default(_that.code,_that.name,_that.description,_that.category,_that.rarity,_that.xpReward,_that.isPremiumBadge,_that.isAutomatic,_that.iconUrl,_that.unlockedAt,_that.progress,_that.meta);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String code,  String name,  String description,  String category,  String rarity, @JsonKey(name: 'xp_reward')  int xpReward, @JsonKey(name: 'is_premium_badge')  bool isPremiumBadge, @JsonKey(name: 'is_automatic')  bool isAutomatic, @JsonKey(name: 'icon_url')  String? iconUrl, @JsonKey(name: 'unlocked_at')  DateTime? unlockedAt,  AchievementProgressModel? progress,  Map<String, dynamic>? meta)  $default,) {final _that = this;
switch (_that) {
case _AchievementModel():
return $default(_that.code,_that.name,_that.description,_that.category,_that.rarity,_that.xpReward,_that.isPremiumBadge,_that.isAutomatic,_that.iconUrl,_that.unlockedAt,_that.progress,_that.meta);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String code,  String name,  String description,  String category,  String rarity, @JsonKey(name: 'xp_reward')  int xpReward, @JsonKey(name: 'is_premium_badge')  bool isPremiumBadge, @JsonKey(name: 'is_automatic')  bool isAutomatic, @JsonKey(name: 'icon_url')  String? iconUrl, @JsonKey(name: 'unlocked_at')  DateTime? unlockedAt,  AchievementProgressModel? progress,  Map<String, dynamic>? meta)?  $default,) {final _that = this;
switch (_that) {
case _AchievementModel() when $default != null:
return $default(_that.code,_that.name,_that.description,_that.category,_that.rarity,_that.xpReward,_that.isPremiumBadge,_that.isAutomatic,_that.iconUrl,_that.unlockedAt,_that.progress,_that.meta);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AchievementModel implements AchievementModel {
  const _AchievementModel({required this.code, required this.name, this.description = '', this.category = 'social', this.rarity = 'common', @JsonKey(name: 'xp_reward') this.xpReward = 0, @JsonKey(name: 'is_premium_badge') this.isPremiumBadge = false, @JsonKey(name: 'is_automatic') this.isAutomatic = true, @JsonKey(name: 'icon_url') this.iconUrl, @JsonKey(name: 'unlocked_at') this.unlockedAt, this.progress, final  Map<String, dynamic>? meta}): _meta = meta;
  factory _AchievementModel.fromJson(Map<String, dynamic> json) => _$AchievementModelFromJson(json);

@override final  String code;
@override final  String name;
@override@JsonKey() final  String description;
@override@JsonKey() final  String category;
@override@JsonKey() final  String rarity;
@override@JsonKey(name: 'xp_reward') final  int xpReward;
@override@JsonKey(name: 'is_premium_badge') final  bool isPremiumBadge;
@override@JsonKey(name: 'is_automatic') final  bool isAutomatic;
@override@JsonKey(name: 'icon_url') final  String? iconUrl;
@override@JsonKey(name: 'unlocked_at') final  DateTime? unlockedAt;
@override final  AchievementProgressModel? progress;
 final  Map<String, dynamic>? _meta;
@override Map<String, dynamic>? get meta {
  final value = _meta;
  if (value == null) return null;
  if (_meta is EqualUnmodifiableMapView) return _meta;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of AchievementModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AchievementModelCopyWith<_AchievementModel> get copyWith => __$AchievementModelCopyWithImpl<_AchievementModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AchievementModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AchievementModel&&(identical(other.code, code) || other.code == code)&&(identical(other.name, name) || other.name == name)&&(identical(other.description, description) || other.description == description)&&(identical(other.category, category) || other.category == category)&&(identical(other.rarity, rarity) || other.rarity == rarity)&&(identical(other.xpReward, xpReward) || other.xpReward == xpReward)&&(identical(other.isPremiumBadge, isPremiumBadge) || other.isPremiumBadge == isPremiumBadge)&&(identical(other.isAutomatic, isAutomatic) || other.isAutomatic == isAutomatic)&&(identical(other.iconUrl, iconUrl) || other.iconUrl == iconUrl)&&(identical(other.unlockedAt, unlockedAt) || other.unlockedAt == unlockedAt)&&(identical(other.progress, progress) || other.progress == progress)&&const DeepCollectionEquality().equals(other._meta, _meta));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,code,name,description,category,rarity,xpReward,isPremiumBadge,isAutomatic,iconUrl,unlockedAt,progress,const DeepCollectionEquality().hash(_meta));

@override
String toString() {
  return 'AchievementModel(code: $code, name: $name, description: $description, category: $category, rarity: $rarity, xpReward: $xpReward, isPremiumBadge: $isPremiumBadge, isAutomatic: $isAutomatic, iconUrl: $iconUrl, unlockedAt: $unlockedAt, progress: $progress, meta: $meta)';
}


}

/// @nodoc
abstract mixin class _$AchievementModelCopyWith<$Res> implements $AchievementModelCopyWith<$Res> {
  factory _$AchievementModelCopyWith(_AchievementModel value, $Res Function(_AchievementModel) _then) = __$AchievementModelCopyWithImpl;
@override @useResult
$Res call({
 String code, String name, String description, String category, String rarity,@JsonKey(name: 'xp_reward') int xpReward,@JsonKey(name: 'is_premium_badge') bool isPremiumBadge,@JsonKey(name: 'is_automatic') bool isAutomatic,@JsonKey(name: 'icon_url') String? iconUrl,@JsonKey(name: 'unlocked_at') DateTime? unlockedAt, AchievementProgressModel? progress, Map<String, dynamic>? meta
});


@override $AchievementProgressModelCopyWith<$Res>? get progress;

}
/// @nodoc
class __$AchievementModelCopyWithImpl<$Res>
    implements _$AchievementModelCopyWith<$Res> {
  __$AchievementModelCopyWithImpl(this._self, this._then);

  final _AchievementModel _self;
  final $Res Function(_AchievementModel) _then;

/// Create a copy of AchievementModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? code = null,Object? name = null,Object? description = null,Object? category = null,Object? rarity = null,Object? xpReward = null,Object? isPremiumBadge = null,Object? isAutomatic = null,Object? iconUrl = freezed,Object? unlockedAt = freezed,Object? progress = freezed,Object? meta = freezed,}) {
  return _then(_AchievementModel(
code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,rarity: null == rarity ? _self.rarity : rarity // ignore: cast_nullable_to_non_nullable
as String,xpReward: null == xpReward ? _self.xpReward : xpReward // ignore: cast_nullable_to_non_nullable
as int,isPremiumBadge: null == isPremiumBadge ? _self.isPremiumBadge : isPremiumBadge // ignore: cast_nullable_to_non_nullable
as bool,isAutomatic: null == isAutomatic ? _self.isAutomatic : isAutomatic // ignore: cast_nullable_to_non_nullable
as bool,iconUrl: freezed == iconUrl ? _self.iconUrl : iconUrl // ignore: cast_nullable_to_non_nullable
as String?,unlockedAt: freezed == unlockedAt ? _self.unlockedAt : unlockedAt // ignore: cast_nullable_to_non_nullable
as DateTime?,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as AchievementProgressModel?,meta: freezed == meta ? _self._meta : meta // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

/// Create a copy of AchievementModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$AchievementProgressModelCopyWith<$Res>? get progress {
    if (_self.progress == null) {
    return null;
  }

  return $AchievementProgressModelCopyWith<$Res>(_self.progress!, (value) {
    return _then(_self.copyWith(progress: value));
  });
}
}

// dart format on
