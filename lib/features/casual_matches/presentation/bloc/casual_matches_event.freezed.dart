// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'casual_matches_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CasualMatchesEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CasualMatchesEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CasualMatchesEvent()';
}


}

/// @nodoc
class $CasualMatchesEventCopyWith<$Res>  {
$CasualMatchesEventCopyWith(CasualMatchesEvent _, $Res Function(CasualMatchesEvent) __);
}


/// Adds pattern-matching-related methods to [CasualMatchesEvent].
extension CasualMatchesEventPatterns on CasualMatchesEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CasualMatchesRequested value)?  requested,TResult Function( CasualMatchesMatchTypeFilterChanged value)?  matchTypeFilterChanged,TResult Function( CasualMatchesMoreRequested value)?  moreRequested,TResult Function( CasualMatchesRefreshed value)?  refreshed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CasualMatchesRequested() when requested != null:
return requested(_that);case CasualMatchesMatchTypeFilterChanged() when matchTypeFilterChanged != null:
return matchTypeFilterChanged(_that);case CasualMatchesMoreRequested() when moreRequested != null:
return moreRequested(_that);case CasualMatchesRefreshed() when refreshed != null:
return refreshed(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CasualMatchesRequested value)  requested,required TResult Function( CasualMatchesMatchTypeFilterChanged value)  matchTypeFilterChanged,required TResult Function( CasualMatchesMoreRequested value)  moreRequested,required TResult Function( CasualMatchesRefreshed value)  refreshed,}){
final _that = this;
switch (_that) {
case CasualMatchesRequested():
return requested(_that);case CasualMatchesMatchTypeFilterChanged():
return matchTypeFilterChanged(_that);case CasualMatchesMoreRequested():
return moreRequested(_that);case CasualMatchesRefreshed():
return refreshed(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CasualMatchesRequested value)?  requested,TResult? Function( CasualMatchesMatchTypeFilterChanged value)?  matchTypeFilterChanged,TResult? Function( CasualMatchesMoreRequested value)?  moreRequested,TResult? Function( CasualMatchesRefreshed value)?  refreshed,}){
final _that = this;
switch (_that) {
case CasualMatchesRequested() when requested != null:
return requested(_that);case CasualMatchesMatchTypeFilterChanged() when matchTypeFilterChanged != null:
return matchTypeFilterChanged(_that);case CasualMatchesMoreRequested() when moreRequested != null:
return moreRequested(_that);case CasualMatchesRefreshed() when refreshed != null:
return refreshed(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? matchType)?  requested,TResult Function( String? matchType)?  matchTypeFilterChanged,TResult Function()?  moreRequested,TResult Function()?  refreshed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CasualMatchesRequested() when requested != null:
return requested(_that.matchType);case CasualMatchesMatchTypeFilterChanged() when matchTypeFilterChanged != null:
return matchTypeFilterChanged(_that.matchType);case CasualMatchesMoreRequested() when moreRequested != null:
return moreRequested();case CasualMatchesRefreshed() when refreshed != null:
return refreshed();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? matchType)  requested,required TResult Function( String? matchType)  matchTypeFilterChanged,required TResult Function()  moreRequested,required TResult Function()  refreshed,}) {final _that = this;
switch (_that) {
case CasualMatchesRequested():
return requested(_that.matchType);case CasualMatchesMatchTypeFilterChanged():
return matchTypeFilterChanged(_that.matchType);case CasualMatchesMoreRequested():
return moreRequested();case CasualMatchesRefreshed():
return refreshed();}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? matchType)?  requested,TResult? Function( String? matchType)?  matchTypeFilterChanged,TResult? Function()?  moreRequested,TResult? Function()?  refreshed,}) {final _that = this;
switch (_that) {
case CasualMatchesRequested() when requested != null:
return requested(_that.matchType);case CasualMatchesMatchTypeFilterChanged() when matchTypeFilterChanged != null:
return matchTypeFilterChanged(_that.matchType);case CasualMatchesMoreRequested() when moreRequested != null:
return moreRequested();case CasualMatchesRefreshed() when refreshed != null:
return refreshed();case _:
  return null;

}
}

}

/// @nodoc


class CasualMatchesRequested implements CasualMatchesEvent {
  const CasualMatchesRequested({this.matchType});
  

 final  String? matchType;

/// Create a copy of CasualMatchesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CasualMatchesRequestedCopyWith<CasualMatchesRequested> get copyWith => _$CasualMatchesRequestedCopyWithImpl<CasualMatchesRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CasualMatchesRequested&&(identical(other.matchType, matchType) || other.matchType == matchType));
}


@override
int get hashCode => Object.hash(runtimeType,matchType);

@override
String toString() {
  return 'CasualMatchesEvent.requested(matchType: $matchType)';
}


}

/// @nodoc
abstract mixin class $CasualMatchesRequestedCopyWith<$Res> implements $CasualMatchesEventCopyWith<$Res> {
  factory $CasualMatchesRequestedCopyWith(CasualMatchesRequested value, $Res Function(CasualMatchesRequested) _then) = _$CasualMatchesRequestedCopyWithImpl;
@useResult
$Res call({
 String? matchType
});




}
/// @nodoc
class _$CasualMatchesRequestedCopyWithImpl<$Res>
    implements $CasualMatchesRequestedCopyWith<$Res> {
  _$CasualMatchesRequestedCopyWithImpl(this._self, this._then);

  final CasualMatchesRequested _self;
  final $Res Function(CasualMatchesRequested) _then;

/// Create a copy of CasualMatchesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? matchType = freezed,}) {
  return _then(CasualMatchesRequested(
matchType: freezed == matchType ? _self.matchType : matchType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class CasualMatchesMatchTypeFilterChanged implements CasualMatchesEvent {
  const CasualMatchesMatchTypeFilterChanged(this.matchType);
  

 final  String? matchType;

/// Create a copy of CasualMatchesEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CasualMatchesMatchTypeFilterChangedCopyWith<CasualMatchesMatchTypeFilterChanged> get copyWith => _$CasualMatchesMatchTypeFilterChangedCopyWithImpl<CasualMatchesMatchTypeFilterChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CasualMatchesMatchTypeFilterChanged&&(identical(other.matchType, matchType) || other.matchType == matchType));
}


@override
int get hashCode => Object.hash(runtimeType,matchType);

@override
String toString() {
  return 'CasualMatchesEvent.matchTypeFilterChanged(matchType: $matchType)';
}


}

/// @nodoc
abstract mixin class $CasualMatchesMatchTypeFilterChangedCopyWith<$Res> implements $CasualMatchesEventCopyWith<$Res> {
  factory $CasualMatchesMatchTypeFilterChangedCopyWith(CasualMatchesMatchTypeFilterChanged value, $Res Function(CasualMatchesMatchTypeFilterChanged) _then) = _$CasualMatchesMatchTypeFilterChangedCopyWithImpl;
@useResult
$Res call({
 String? matchType
});




}
/// @nodoc
class _$CasualMatchesMatchTypeFilterChangedCopyWithImpl<$Res>
    implements $CasualMatchesMatchTypeFilterChangedCopyWith<$Res> {
  _$CasualMatchesMatchTypeFilterChangedCopyWithImpl(this._self, this._then);

  final CasualMatchesMatchTypeFilterChanged _self;
  final $Res Function(CasualMatchesMatchTypeFilterChanged) _then;

/// Create a copy of CasualMatchesEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? matchType = freezed,}) {
  return _then(CasualMatchesMatchTypeFilterChanged(
freezed == matchType ? _self.matchType : matchType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class CasualMatchesMoreRequested implements CasualMatchesEvent {
  const CasualMatchesMoreRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CasualMatchesMoreRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CasualMatchesEvent.moreRequested()';
}


}




/// @nodoc


class CasualMatchesRefreshed implements CasualMatchesEvent {
  const CasualMatchesRefreshed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CasualMatchesRefreshed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CasualMatchesEvent.refreshed()';
}


}




// dart format on
