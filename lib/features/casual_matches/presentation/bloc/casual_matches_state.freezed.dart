// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'casual_matches_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$CasualMatchesState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CasualMatchesState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CasualMatchesState()';
}


}

/// @nodoc
class $CasualMatchesStateCopyWith<$Res>  {
$CasualMatchesStateCopyWith(CasualMatchesState _, $Res Function(CasualMatchesState) __);
}


/// Adds pattern-matching-related methods to [CasualMatchesState].
extension CasualMatchesStatePatterns on CasualMatchesState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( CasualMatchesInitial value)?  initial,TResult Function( CasualMatchesLoading value)?  loading,TResult Function( CasualMatchesLoaded value)?  loaded,TResult Function( CasualMatchesError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case CasualMatchesInitial() when initial != null:
return initial(_that);case CasualMatchesLoading() when loading != null:
return loading(_that);case CasualMatchesLoaded() when loaded != null:
return loaded(_that);case CasualMatchesError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( CasualMatchesInitial value)  initial,required TResult Function( CasualMatchesLoading value)  loading,required TResult Function( CasualMatchesLoaded value)  loaded,required TResult Function( CasualMatchesError value)  error,}){
final _that = this;
switch (_that) {
case CasualMatchesInitial():
return initial(_that);case CasualMatchesLoading():
return loading(_that);case CasualMatchesLoaded():
return loaded(_that);case CasualMatchesError():
return error(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( CasualMatchesInitial value)?  initial,TResult? Function( CasualMatchesLoading value)?  loading,TResult? Function( CasualMatchesLoaded value)?  loaded,TResult? Function( CasualMatchesError value)?  error,}){
final _that = this;
switch (_that) {
case CasualMatchesInitial() when initial != null:
return initial(_that);case CasualMatchesLoading() when loading != null:
return loading(_that);case CasualMatchesLoaded() when loaded != null:
return loaded(_that);case CasualMatchesError() when error != null:
return error(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( List<CasualMatch> items,  String? matchTypeFilter,  int currentPage,  bool hasMore,  bool isLoadingMore)?  loaded,TResult Function( Failure failure)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case CasualMatchesInitial() when initial != null:
return initial();case CasualMatchesLoading() when loading != null:
return loading();case CasualMatchesLoaded() when loaded != null:
return loaded(_that.items,_that.matchTypeFilter,_that.currentPage,_that.hasMore,_that.isLoadingMore);case CasualMatchesError() when error != null:
return error(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( List<CasualMatch> items,  String? matchTypeFilter,  int currentPage,  bool hasMore,  bool isLoadingMore)  loaded,required TResult Function( Failure failure)  error,}) {final _that = this;
switch (_that) {
case CasualMatchesInitial():
return initial();case CasualMatchesLoading():
return loading();case CasualMatchesLoaded():
return loaded(_that.items,_that.matchTypeFilter,_that.currentPage,_that.hasMore,_that.isLoadingMore);case CasualMatchesError():
return error(_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( List<CasualMatch> items,  String? matchTypeFilter,  int currentPage,  bool hasMore,  bool isLoadingMore)?  loaded,TResult? Function( Failure failure)?  error,}) {final _that = this;
switch (_that) {
case CasualMatchesInitial() when initial != null:
return initial();case CasualMatchesLoading() when loading != null:
return loading();case CasualMatchesLoaded() when loaded != null:
return loaded(_that.items,_that.matchTypeFilter,_that.currentPage,_that.hasMore,_that.isLoadingMore);case CasualMatchesError() when error != null:
return error(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class CasualMatchesInitial implements CasualMatchesState {
  const CasualMatchesInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CasualMatchesInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CasualMatchesState.initial()';
}


}




/// @nodoc


class CasualMatchesLoading implements CasualMatchesState {
  const CasualMatchesLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CasualMatchesLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'CasualMatchesState.loading()';
}


}




/// @nodoc


class CasualMatchesLoaded implements CasualMatchesState {
  const CasualMatchesLoaded({required final  List<CasualMatch> items, this.matchTypeFilter, required this.currentPage, required this.hasMore, this.isLoadingMore = false}): _items = items;
  

 final  List<CasualMatch> _items;
 List<CasualMatch> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  String? matchTypeFilter;
 final  int currentPage;
 final  bool hasMore;
@JsonKey() final  bool isLoadingMore;

/// Create a copy of CasualMatchesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CasualMatchesLoadedCopyWith<CasualMatchesLoaded> get copyWith => _$CasualMatchesLoadedCopyWithImpl<CasualMatchesLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CasualMatchesLoaded&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.matchTypeFilter, matchTypeFilter) || other.matchTypeFilter == matchTypeFilter)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),matchTypeFilter,currentPage,hasMore,isLoadingMore);

@override
String toString() {
  return 'CasualMatchesState.loaded(items: $items, matchTypeFilter: $matchTypeFilter, currentPage: $currentPage, hasMore: $hasMore, isLoadingMore: $isLoadingMore)';
}


}

/// @nodoc
abstract mixin class $CasualMatchesLoadedCopyWith<$Res> implements $CasualMatchesStateCopyWith<$Res> {
  factory $CasualMatchesLoadedCopyWith(CasualMatchesLoaded value, $Res Function(CasualMatchesLoaded) _then) = _$CasualMatchesLoadedCopyWithImpl;
@useResult
$Res call({
 List<CasualMatch> items, String? matchTypeFilter, int currentPage, bool hasMore, bool isLoadingMore
});




}
/// @nodoc
class _$CasualMatchesLoadedCopyWithImpl<$Res>
    implements $CasualMatchesLoadedCopyWith<$Res> {
  _$CasualMatchesLoadedCopyWithImpl(this._self, this._then);

  final CasualMatchesLoaded _self;
  final $Res Function(CasualMatchesLoaded) _then;

/// Create a copy of CasualMatchesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? items = null,Object? matchTypeFilter = freezed,Object? currentPage = null,Object? hasMore = null,Object? isLoadingMore = null,}) {
  return _then(CasualMatchesLoaded(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<CasualMatch>,matchTypeFilter: freezed == matchTypeFilter ? _self.matchTypeFilter : matchTypeFilter // ignore: cast_nullable_to_non_nullable
as String?,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class CasualMatchesError implements CasualMatchesState {
  const CasualMatchesError(this.failure);
  

 final  Failure failure;

/// Create a copy of CasualMatchesState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CasualMatchesErrorCopyWith<CasualMatchesError> get copyWith => _$CasualMatchesErrorCopyWithImpl<CasualMatchesError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CasualMatchesError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'CasualMatchesState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $CasualMatchesErrorCopyWith<$Res> implements $CasualMatchesStateCopyWith<$Res> {
  factory $CasualMatchesErrorCopyWith(CasualMatchesError value, $Res Function(CasualMatchesError) _then) = _$CasualMatchesErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$CasualMatchesErrorCopyWithImpl<$Res>
    implements $CasualMatchesErrorCopyWith<$Res> {
  _$CasualMatchesErrorCopyWithImpl(this._self, this._then);

  final CasualMatchesError _self;
  final $Res Function(CasualMatchesError) _then;

/// Create a copy of CasualMatchesState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(CasualMatchesError(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
