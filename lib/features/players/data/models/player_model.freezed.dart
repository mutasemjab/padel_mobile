// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlayerRefModel {

@JsonKey(name: 'player_id') String get playerId; String get name;@JsonKey(name: 'photo_url') String? get photoUrl; String? get level;
/// Create a copy of PlayerRefModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerRefModelCopyWith<PlayerRefModel> get copyWith => _$PlayerRefModelCopyWithImpl<PlayerRefModel>(this as PlayerRefModel, _$identity);

  /// Serializes this PlayerRefModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerRefModel&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.name, name) || other.name == name)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.level, level) || other.level == level));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playerId,name,photoUrl,level);

@override
String toString() {
  return 'PlayerRefModel(playerId: $playerId, name: $name, photoUrl: $photoUrl, level: $level)';
}


}

/// @nodoc
abstract mixin class $PlayerRefModelCopyWith<$Res>  {
  factory $PlayerRefModelCopyWith(PlayerRefModel value, $Res Function(PlayerRefModel) _then) = _$PlayerRefModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'player_id') String playerId, String name,@JsonKey(name: 'photo_url') String? photoUrl, String? level
});




}
/// @nodoc
class _$PlayerRefModelCopyWithImpl<$Res>
    implements $PlayerRefModelCopyWith<$Res> {
  _$PlayerRefModelCopyWithImpl(this._self, this._then);

  final PlayerRefModel _self;
  final $Res Function(PlayerRefModel) _then;

/// Create a copy of PlayerRefModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? playerId = null,Object? name = null,Object? photoUrl = freezed,Object? level = freezed,}) {
  return _then(_self.copyWith(
playerId: null == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [PlayerRefModel].
extension PlayerRefModelPatterns on PlayerRefModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlayerRefModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayerRefModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlayerRefModel value)  $default,){
final _that = this;
switch (_that) {
case _PlayerRefModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlayerRefModel value)?  $default,){
final _that = this;
switch (_that) {
case _PlayerRefModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'player_id')  String playerId,  String name, @JsonKey(name: 'photo_url')  String? photoUrl,  String? level)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayerRefModel() when $default != null:
return $default(_that.playerId,_that.name,_that.photoUrl,_that.level);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'player_id')  String playerId,  String name, @JsonKey(name: 'photo_url')  String? photoUrl,  String? level)  $default,) {final _that = this;
switch (_that) {
case _PlayerRefModel():
return $default(_that.playerId,_that.name,_that.photoUrl,_that.level);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'player_id')  String playerId,  String name, @JsonKey(name: 'photo_url')  String? photoUrl,  String? level)?  $default,) {final _that = this;
switch (_that) {
case _PlayerRefModel() when $default != null:
return $default(_that.playerId,_that.name,_that.photoUrl,_that.level);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlayerRefModel implements PlayerRefModel {
  const _PlayerRefModel({@JsonKey(name: 'player_id') required this.playerId, required this.name, @JsonKey(name: 'photo_url') this.photoUrl, this.level});
  factory _PlayerRefModel.fromJson(Map<String, dynamic> json) => _$PlayerRefModelFromJson(json);

@override@JsonKey(name: 'player_id') final  String playerId;
@override final  String name;
@override@JsonKey(name: 'photo_url') final  String? photoUrl;
@override final  String? level;

/// Create a copy of PlayerRefModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerRefModelCopyWith<_PlayerRefModel> get copyWith => __$PlayerRefModelCopyWithImpl<_PlayerRefModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlayerRefModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayerRefModel&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.name, name) || other.name == name)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.level, level) || other.level == level));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,playerId,name,photoUrl,level);

@override
String toString() {
  return 'PlayerRefModel(playerId: $playerId, name: $name, photoUrl: $photoUrl, level: $level)';
}


}

/// @nodoc
abstract mixin class _$PlayerRefModelCopyWith<$Res> implements $PlayerRefModelCopyWith<$Res> {
  factory _$PlayerRefModelCopyWith(_PlayerRefModel value, $Res Function(_PlayerRefModel) _then) = __$PlayerRefModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'player_id') String playerId, String name,@JsonKey(name: 'photo_url') String? photoUrl, String? level
});




}
/// @nodoc
class __$PlayerRefModelCopyWithImpl<$Res>
    implements _$PlayerRefModelCopyWith<$Res> {
  __$PlayerRefModelCopyWithImpl(this._self, this._then);

  final _PlayerRefModel _self;
  final $Res Function(_PlayerRefModel) _then;

/// Create a copy of PlayerRefModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? playerId = null,Object? name = null,Object? photoUrl = freezed,Object? level = freezed,}) {
  return _then(_PlayerRefModel(
playerId: null == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}


/// @nodoc
mixin _$PlayerModel {

@JsonKey(name: 'player_id') String get playerId; String get name;// "" for everyone except the owner.
 String get email; String? get phone;@JsonKey(name: 'date_of_birth') String? get dateOfBirth;@JsonKey(name: 'photo_url') String? get photoUrl; String? get country; String? get gender; String? get side; String? get bio; String? get level;@JsonKey(name: 'skill_rating') int get skillRating;@JsonKey(name: 'season_ranking_points') int get seasonRankingPoints; int get xp;@JsonKey(name: 'profile_tier') String? get profileTier;@JsonKey(name: 'is_premium') bool get isPremium;@JsonKey(name: 'is_active') bool get isActive;@JsonKey(name: 'is_owner') bool get isOwner;@JsonKey(name: 'member_since') String? get memberSince;@JsonKey(name: 'main_partner') PlayerRefModel? get mainPartner;
/// Create a copy of PlayerModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerModelCopyWith<PlayerModel> get copyWith => _$PlayerModelCopyWithImpl<PlayerModel>(this as PlayerModel, _$identity);

  /// Serializes this PlayerModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerModel&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.country, country) || other.country == country)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.side, side) || other.side == side)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.level, level) || other.level == level)&&(identical(other.skillRating, skillRating) || other.skillRating == skillRating)&&(identical(other.seasonRankingPoints, seasonRankingPoints) || other.seasonRankingPoints == seasonRankingPoints)&&(identical(other.xp, xp) || other.xp == xp)&&(identical(other.profileTier, profileTier) || other.profileTier == profileTier)&&(identical(other.isPremium, isPremium) || other.isPremium == isPremium)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isOwner, isOwner) || other.isOwner == isOwner)&&(identical(other.memberSince, memberSince) || other.memberSince == memberSince)&&(identical(other.mainPartner, mainPartner) || other.mainPartner == mainPartner));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,playerId,name,email,phone,dateOfBirth,photoUrl,country,gender,side,bio,level,skillRating,seasonRankingPoints,xp,profileTier,isPremium,isActive,isOwner,memberSince,mainPartner]);

@override
String toString() {
  return 'PlayerModel(playerId: $playerId, name: $name, email: $email, phone: $phone, dateOfBirth: $dateOfBirth, photoUrl: $photoUrl, country: $country, gender: $gender, side: $side, bio: $bio, level: $level, skillRating: $skillRating, seasonRankingPoints: $seasonRankingPoints, xp: $xp, profileTier: $profileTier, isPremium: $isPremium, isActive: $isActive, isOwner: $isOwner, memberSince: $memberSince, mainPartner: $mainPartner)';
}


}

/// @nodoc
abstract mixin class $PlayerModelCopyWith<$Res>  {
  factory $PlayerModelCopyWith(PlayerModel value, $Res Function(PlayerModel) _then) = _$PlayerModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'player_id') String playerId, String name, String email, String? phone,@JsonKey(name: 'date_of_birth') String? dateOfBirth,@JsonKey(name: 'photo_url') String? photoUrl, String? country, String? gender, String? side, String? bio, String? level,@JsonKey(name: 'skill_rating') int skillRating,@JsonKey(name: 'season_ranking_points') int seasonRankingPoints, int xp,@JsonKey(name: 'profile_tier') String? profileTier,@JsonKey(name: 'is_premium') bool isPremium,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'is_owner') bool isOwner,@JsonKey(name: 'member_since') String? memberSince,@JsonKey(name: 'main_partner') PlayerRefModel? mainPartner
});


$PlayerRefModelCopyWith<$Res>? get mainPartner;

}
/// @nodoc
class _$PlayerModelCopyWithImpl<$Res>
    implements $PlayerModelCopyWith<$Res> {
  _$PlayerModelCopyWithImpl(this._self, this._then);

  final PlayerModel _self;
  final $Res Function(PlayerModel) _then;

/// Create a copy of PlayerModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? playerId = null,Object? name = null,Object? email = null,Object? phone = freezed,Object? dateOfBirth = freezed,Object? photoUrl = freezed,Object? country = freezed,Object? gender = freezed,Object? side = freezed,Object? bio = freezed,Object? level = freezed,Object? skillRating = null,Object? seasonRankingPoints = null,Object? xp = null,Object? profileTier = freezed,Object? isPremium = null,Object? isActive = null,Object? isOwner = null,Object? memberSince = freezed,Object? mainPartner = freezed,}) {
  return _then(_self.copyWith(
playerId: null == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,side: freezed == side ? _self.side : side // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String?,skillRating: null == skillRating ? _self.skillRating : skillRating // ignore: cast_nullable_to_non_nullable
as int,seasonRankingPoints: null == seasonRankingPoints ? _self.seasonRankingPoints : seasonRankingPoints // ignore: cast_nullable_to_non_nullable
as int,xp: null == xp ? _self.xp : xp // ignore: cast_nullable_to_non_nullable
as int,profileTier: freezed == profileTier ? _self.profileTier : profileTier // ignore: cast_nullable_to_non_nullable
as String?,isPremium: null == isPremium ? _self.isPremium : isPremium // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isOwner: null == isOwner ? _self.isOwner : isOwner // ignore: cast_nullable_to_non_nullable
as bool,memberSince: freezed == memberSince ? _self.memberSince : memberSince // ignore: cast_nullable_to_non_nullable
as String?,mainPartner: freezed == mainPartner ? _self.mainPartner : mainPartner // ignore: cast_nullable_to_non_nullable
as PlayerRefModel?,
  ));
}
/// Create a copy of PlayerModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerRefModelCopyWith<$Res>? get mainPartner {
    if (_self.mainPartner == null) {
    return null;
  }

  return $PlayerRefModelCopyWith<$Res>(_self.mainPartner!, (value) {
    return _then(_self.copyWith(mainPartner: value));
  });
}
}


/// Adds pattern-matching-related methods to [PlayerModel].
extension PlayerModelPatterns on PlayerModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlayerModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayerModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlayerModel value)  $default,){
final _that = this;
switch (_that) {
case _PlayerModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlayerModel value)?  $default,){
final _that = this;
switch (_that) {
case _PlayerModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'player_id')  String playerId,  String name,  String email,  String? phone, @JsonKey(name: 'date_of_birth')  String? dateOfBirth, @JsonKey(name: 'photo_url')  String? photoUrl,  String? country,  String? gender,  String? side,  String? bio,  String? level, @JsonKey(name: 'skill_rating')  int skillRating, @JsonKey(name: 'season_ranking_points')  int seasonRankingPoints,  int xp, @JsonKey(name: 'profile_tier')  String? profileTier, @JsonKey(name: 'is_premium')  bool isPremium, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'is_owner')  bool isOwner, @JsonKey(name: 'member_since')  String? memberSince, @JsonKey(name: 'main_partner')  PlayerRefModel? mainPartner)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayerModel() when $default != null:
return $default(_that.playerId,_that.name,_that.email,_that.phone,_that.dateOfBirth,_that.photoUrl,_that.country,_that.gender,_that.side,_that.bio,_that.level,_that.skillRating,_that.seasonRankingPoints,_that.xp,_that.profileTier,_that.isPremium,_that.isActive,_that.isOwner,_that.memberSince,_that.mainPartner);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'player_id')  String playerId,  String name,  String email,  String? phone, @JsonKey(name: 'date_of_birth')  String? dateOfBirth, @JsonKey(name: 'photo_url')  String? photoUrl,  String? country,  String? gender,  String? side,  String? bio,  String? level, @JsonKey(name: 'skill_rating')  int skillRating, @JsonKey(name: 'season_ranking_points')  int seasonRankingPoints,  int xp, @JsonKey(name: 'profile_tier')  String? profileTier, @JsonKey(name: 'is_premium')  bool isPremium, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'is_owner')  bool isOwner, @JsonKey(name: 'member_since')  String? memberSince, @JsonKey(name: 'main_partner')  PlayerRefModel? mainPartner)  $default,) {final _that = this;
switch (_that) {
case _PlayerModel():
return $default(_that.playerId,_that.name,_that.email,_that.phone,_that.dateOfBirth,_that.photoUrl,_that.country,_that.gender,_that.side,_that.bio,_that.level,_that.skillRating,_that.seasonRankingPoints,_that.xp,_that.profileTier,_that.isPremium,_that.isActive,_that.isOwner,_that.memberSince,_that.mainPartner);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'player_id')  String playerId,  String name,  String email,  String? phone, @JsonKey(name: 'date_of_birth')  String? dateOfBirth, @JsonKey(name: 'photo_url')  String? photoUrl,  String? country,  String? gender,  String? side,  String? bio,  String? level, @JsonKey(name: 'skill_rating')  int skillRating, @JsonKey(name: 'season_ranking_points')  int seasonRankingPoints,  int xp, @JsonKey(name: 'profile_tier')  String? profileTier, @JsonKey(name: 'is_premium')  bool isPremium, @JsonKey(name: 'is_active')  bool isActive, @JsonKey(name: 'is_owner')  bool isOwner, @JsonKey(name: 'member_since')  String? memberSince, @JsonKey(name: 'main_partner')  PlayerRefModel? mainPartner)?  $default,) {final _that = this;
switch (_that) {
case _PlayerModel() when $default != null:
return $default(_that.playerId,_that.name,_that.email,_that.phone,_that.dateOfBirth,_that.photoUrl,_that.country,_that.gender,_that.side,_that.bio,_that.level,_that.skillRating,_that.seasonRankingPoints,_that.xp,_that.profileTier,_that.isPremium,_that.isActive,_that.isOwner,_that.memberSince,_that.mainPartner);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlayerModel implements PlayerModel {
  const _PlayerModel({@JsonKey(name: 'player_id') required this.playerId, required this.name, this.email = '', this.phone, @JsonKey(name: 'date_of_birth') this.dateOfBirth, @JsonKey(name: 'photo_url') this.photoUrl, this.country, this.gender, this.side, this.bio, this.level, @JsonKey(name: 'skill_rating') this.skillRating = 0, @JsonKey(name: 'season_ranking_points') this.seasonRankingPoints = 0, this.xp = 0, @JsonKey(name: 'profile_tier') this.profileTier, @JsonKey(name: 'is_premium') this.isPremium = false, @JsonKey(name: 'is_active') this.isActive = true, @JsonKey(name: 'is_owner') this.isOwner = false, @JsonKey(name: 'member_since') this.memberSince, @JsonKey(name: 'main_partner') this.mainPartner});
  factory _PlayerModel.fromJson(Map<String, dynamic> json) => _$PlayerModelFromJson(json);

@override@JsonKey(name: 'player_id') final  String playerId;
@override final  String name;
// "" for everyone except the owner.
@override@JsonKey() final  String email;
@override final  String? phone;
@override@JsonKey(name: 'date_of_birth') final  String? dateOfBirth;
@override@JsonKey(name: 'photo_url') final  String? photoUrl;
@override final  String? country;
@override final  String? gender;
@override final  String? side;
@override final  String? bio;
@override final  String? level;
@override@JsonKey(name: 'skill_rating') final  int skillRating;
@override@JsonKey(name: 'season_ranking_points') final  int seasonRankingPoints;
@override@JsonKey() final  int xp;
@override@JsonKey(name: 'profile_tier') final  String? profileTier;
@override@JsonKey(name: 'is_premium') final  bool isPremium;
@override@JsonKey(name: 'is_active') final  bool isActive;
@override@JsonKey(name: 'is_owner') final  bool isOwner;
@override@JsonKey(name: 'member_since') final  String? memberSince;
@override@JsonKey(name: 'main_partner') final  PlayerRefModel? mainPartner;

/// Create a copy of PlayerModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerModelCopyWith<_PlayerModel> get copyWith => __$PlayerModelCopyWithImpl<_PlayerModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlayerModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayerModel&&(identical(other.playerId, playerId) || other.playerId == playerId)&&(identical(other.name, name) || other.name == name)&&(identical(other.email, email) || other.email == email)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.dateOfBirth, dateOfBirth) || other.dateOfBirth == dateOfBirth)&&(identical(other.photoUrl, photoUrl) || other.photoUrl == photoUrl)&&(identical(other.country, country) || other.country == country)&&(identical(other.gender, gender) || other.gender == gender)&&(identical(other.side, side) || other.side == side)&&(identical(other.bio, bio) || other.bio == bio)&&(identical(other.level, level) || other.level == level)&&(identical(other.skillRating, skillRating) || other.skillRating == skillRating)&&(identical(other.seasonRankingPoints, seasonRankingPoints) || other.seasonRankingPoints == seasonRankingPoints)&&(identical(other.xp, xp) || other.xp == xp)&&(identical(other.profileTier, profileTier) || other.profileTier == profileTier)&&(identical(other.isPremium, isPremium) || other.isPremium == isPremium)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isOwner, isOwner) || other.isOwner == isOwner)&&(identical(other.memberSince, memberSince) || other.memberSince == memberSince)&&(identical(other.mainPartner, mainPartner) || other.mainPartner == mainPartner));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,playerId,name,email,phone,dateOfBirth,photoUrl,country,gender,side,bio,level,skillRating,seasonRankingPoints,xp,profileTier,isPremium,isActive,isOwner,memberSince,mainPartner]);

@override
String toString() {
  return 'PlayerModel(playerId: $playerId, name: $name, email: $email, phone: $phone, dateOfBirth: $dateOfBirth, photoUrl: $photoUrl, country: $country, gender: $gender, side: $side, bio: $bio, level: $level, skillRating: $skillRating, seasonRankingPoints: $seasonRankingPoints, xp: $xp, profileTier: $profileTier, isPremium: $isPremium, isActive: $isActive, isOwner: $isOwner, memberSince: $memberSince, mainPartner: $mainPartner)';
}


}

/// @nodoc
abstract mixin class _$PlayerModelCopyWith<$Res> implements $PlayerModelCopyWith<$Res> {
  factory _$PlayerModelCopyWith(_PlayerModel value, $Res Function(_PlayerModel) _then) = __$PlayerModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'player_id') String playerId, String name, String email, String? phone,@JsonKey(name: 'date_of_birth') String? dateOfBirth,@JsonKey(name: 'photo_url') String? photoUrl, String? country, String? gender, String? side, String? bio, String? level,@JsonKey(name: 'skill_rating') int skillRating,@JsonKey(name: 'season_ranking_points') int seasonRankingPoints, int xp,@JsonKey(name: 'profile_tier') String? profileTier,@JsonKey(name: 'is_premium') bool isPremium,@JsonKey(name: 'is_active') bool isActive,@JsonKey(name: 'is_owner') bool isOwner,@JsonKey(name: 'member_since') String? memberSince,@JsonKey(name: 'main_partner') PlayerRefModel? mainPartner
});


@override $PlayerRefModelCopyWith<$Res>? get mainPartner;

}
/// @nodoc
class __$PlayerModelCopyWithImpl<$Res>
    implements _$PlayerModelCopyWith<$Res> {
  __$PlayerModelCopyWithImpl(this._self, this._then);

  final _PlayerModel _self;
  final $Res Function(_PlayerModel) _then;

/// Create a copy of PlayerModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? playerId = null,Object? name = null,Object? email = null,Object? phone = freezed,Object? dateOfBirth = freezed,Object? photoUrl = freezed,Object? country = freezed,Object? gender = freezed,Object? side = freezed,Object? bio = freezed,Object? level = freezed,Object? skillRating = null,Object? seasonRankingPoints = null,Object? xp = null,Object? profileTier = freezed,Object? isPremium = null,Object? isActive = null,Object? isOwner = null,Object? memberSince = freezed,Object? mainPartner = freezed,}) {
  return _then(_PlayerModel(
playerId: null == playerId ? _self.playerId : playerId // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,email: null == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String,phone: freezed == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String?,dateOfBirth: freezed == dateOfBirth ? _self.dateOfBirth : dateOfBirth // ignore: cast_nullable_to_non_nullable
as String?,photoUrl: freezed == photoUrl ? _self.photoUrl : photoUrl // ignore: cast_nullable_to_non_nullable
as String?,country: freezed == country ? _self.country : country // ignore: cast_nullable_to_non_nullable
as String?,gender: freezed == gender ? _self.gender : gender // ignore: cast_nullable_to_non_nullable
as String?,side: freezed == side ? _self.side : side // ignore: cast_nullable_to_non_nullable
as String?,bio: freezed == bio ? _self.bio : bio // ignore: cast_nullable_to_non_nullable
as String?,level: freezed == level ? _self.level : level // ignore: cast_nullable_to_non_nullable
as String?,skillRating: null == skillRating ? _self.skillRating : skillRating // ignore: cast_nullable_to_non_nullable
as int,seasonRankingPoints: null == seasonRankingPoints ? _self.seasonRankingPoints : seasonRankingPoints // ignore: cast_nullable_to_non_nullable
as int,xp: null == xp ? _self.xp : xp // ignore: cast_nullable_to_non_nullable
as int,profileTier: freezed == profileTier ? _self.profileTier : profileTier // ignore: cast_nullable_to_non_nullable
as String?,isPremium: null == isPremium ? _self.isPremium : isPremium // ignore: cast_nullable_to_non_nullable
as bool,isActive: null == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool,isOwner: null == isOwner ? _self.isOwner : isOwner // ignore: cast_nullable_to_non_nullable
as bool,memberSince: freezed == memberSince ? _self.memberSince : memberSince // ignore: cast_nullable_to_non_nullable
as String?,mainPartner: freezed == mainPartner ? _self.mainPartner : mainPartner // ignore: cast_nullable_to_non_nullable
as PlayerRefModel?,
  ));
}

/// Create a copy of PlayerModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PlayerRefModelCopyWith<$Res>? get mainPartner {
    if (_self.mainPartner == null) {
    return null;
  }

  return $PlayerRefModelCopyWith<$Res>(_self.mainPartner!, (value) {
    return _then(_self.copyWith(mainPartner: value));
  });
}
}

// dart format on
