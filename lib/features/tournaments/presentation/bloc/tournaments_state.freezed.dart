// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tournaments_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TournamentsState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TournamentsState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TournamentsState()';
}


}

/// @nodoc
class $TournamentsStateCopyWith<$Res>  {
$TournamentsStateCopyWith(TournamentsState _, $Res Function(TournamentsState) __);
}


/// Adds pattern-matching-related methods to [TournamentsState].
extension TournamentsStatePatterns on TournamentsState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TournamentsInitial value)?  initial,TResult Function( TournamentsLoading value)?  loading,TResult Function( TournamentsLoaded value)?  loaded,TResult Function( TournamentsError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TournamentsInitial() when initial != null:
return initial(_that);case TournamentsLoading() when loading != null:
return loading(_that);case TournamentsLoaded() when loaded != null:
return loaded(_that);case TournamentsError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TournamentsInitial value)  initial,required TResult Function( TournamentsLoading value)  loading,required TResult Function( TournamentsLoaded value)  loaded,required TResult Function( TournamentsError value)  error,}){
final _that = this;
switch (_that) {
case TournamentsInitial():
return initial(_that);case TournamentsLoading():
return loading(_that);case TournamentsLoaded():
return loaded(_that);case TournamentsError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TournamentsInitial value)?  initial,TResult? Function( TournamentsLoading value)?  loading,TResult? Function( TournamentsLoaded value)?  loaded,TResult? Function( TournamentsError value)?  error,}){
final _that = this;
switch (_that) {
case TournamentsInitial() when initial != null:
return initial(_that);case TournamentsLoading() when loading != null:
return loading(_that);case TournamentsLoaded() when loaded != null:
return loaded(_that);case TournamentsError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function( String? statusFilter,  String? competitionTypeFilter,  String query)?  loading,TResult Function( List<Tournament> items,  String? statusFilter,  String? competitionTypeFilter,  String query,  int currentPage,  bool hasMore,  bool isLoadingMore)?  loaded,TResult Function( Failure failure)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TournamentsInitial() when initial != null:
return initial();case TournamentsLoading() when loading != null:
return loading(_that.statusFilter,_that.competitionTypeFilter,_that.query);case TournamentsLoaded() when loaded != null:
return loaded(_that.items,_that.statusFilter,_that.competitionTypeFilter,_that.query,_that.currentPage,_that.hasMore,_that.isLoadingMore);case TournamentsError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function( String? statusFilter,  String? competitionTypeFilter,  String query)  loading,required TResult Function( List<Tournament> items,  String? statusFilter,  String? competitionTypeFilter,  String query,  int currentPage,  bool hasMore,  bool isLoadingMore)  loaded,required TResult Function( Failure failure)  error,}) {final _that = this;
switch (_that) {
case TournamentsInitial():
return initial();case TournamentsLoading():
return loading(_that.statusFilter,_that.competitionTypeFilter,_that.query);case TournamentsLoaded():
return loaded(_that.items,_that.statusFilter,_that.competitionTypeFilter,_that.query,_that.currentPage,_that.hasMore,_that.isLoadingMore);case TournamentsError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function( String? statusFilter,  String? competitionTypeFilter,  String query)?  loading,TResult? Function( List<Tournament> items,  String? statusFilter,  String? competitionTypeFilter,  String query,  int currentPage,  bool hasMore,  bool isLoadingMore)?  loaded,TResult? Function( Failure failure)?  error,}) {final _that = this;
switch (_that) {
case TournamentsInitial() when initial != null:
return initial();case TournamentsLoading() when loading != null:
return loading(_that.statusFilter,_that.competitionTypeFilter,_that.query);case TournamentsLoaded() when loaded != null:
return loaded(_that.items,_that.statusFilter,_that.competitionTypeFilter,_that.query,_that.currentPage,_that.hasMore,_that.isLoadingMore);case TournamentsError() when error != null:
return error(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class TournamentsInitial implements TournamentsState {
  const TournamentsInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TournamentsInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TournamentsState.initial()';
}


}




/// @nodoc


class TournamentsLoading implements TournamentsState {
  const TournamentsLoading({this.statusFilter, this.competitionTypeFilter, this.query = ''});
  

 final  String? statusFilter;
 final  String? competitionTypeFilter;
@JsonKey() final  String query;

/// Create a copy of TournamentsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TournamentsLoadingCopyWith<TournamentsLoading> get copyWith => _$TournamentsLoadingCopyWithImpl<TournamentsLoading>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TournamentsLoading&&(identical(other.statusFilter, statusFilter) || other.statusFilter == statusFilter)&&(identical(other.competitionTypeFilter, competitionTypeFilter) || other.competitionTypeFilter == competitionTypeFilter)&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,statusFilter,competitionTypeFilter,query);

@override
String toString() {
  return 'TournamentsState.loading(statusFilter: $statusFilter, competitionTypeFilter: $competitionTypeFilter, query: $query)';
}


}

/// @nodoc
abstract mixin class $TournamentsLoadingCopyWith<$Res> implements $TournamentsStateCopyWith<$Res> {
  factory $TournamentsLoadingCopyWith(TournamentsLoading value, $Res Function(TournamentsLoading) _then) = _$TournamentsLoadingCopyWithImpl;
@useResult
$Res call({
 String? statusFilter, String? competitionTypeFilter, String query
});




}
/// @nodoc
class _$TournamentsLoadingCopyWithImpl<$Res>
    implements $TournamentsLoadingCopyWith<$Res> {
  _$TournamentsLoadingCopyWithImpl(this._self, this._then);

  final TournamentsLoading _self;
  final $Res Function(TournamentsLoading) _then;

/// Create a copy of TournamentsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? statusFilter = freezed,Object? competitionTypeFilter = freezed,Object? query = null,}) {
  return _then(TournamentsLoading(
statusFilter: freezed == statusFilter ? _self.statusFilter : statusFilter // ignore: cast_nullable_to_non_nullable
as String?,competitionTypeFilter: freezed == competitionTypeFilter ? _self.competitionTypeFilter : competitionTypeFilter // ignore: cast_nullable_to_non_nullable
as String?,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TournamentsLoaded implements TournamentsState {
  const TournamentsLoaded({required final  List<Tournament> items, this.statusFilter, this.competitionTypeFilter, this.query = '', required this.currentPage, required this.hasMore, this.isLoadingMore = false}): _items = items;
  

 final  List<Tournament> _items;
 List<Tournament> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

 final  String? statusFilter;
 final  String? competitionTypeFilter;
@JsonKey() final  String query;
 final  int currentPage;
 final  bool hasMore;
@JsonKey() final  bool isLoadingMore;

/// Create a copy of TournamentsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TournamentsLoadedCopyWith<TournamentsLoaded> get copyWith => _$TournamentsLoadedCopyWithImpl<TournamentsLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TournamentsLoaded&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.statusFilter, statusFilter) || other.statusFilter == statusFilter)&&(identical(other.competitionTypeFilter, competitionTypeFilter) || other.competitionTypeFilter == competitionTypeFilter)&&(identical(other.query, query) || other.query == query)&&(identical(other.currentPage, currentPage) || other.currentPage == currentPage)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_items),statusFilter,competitionTypeFilter,query,currentPage,hasMore,isLoadingMore);

@override
String toString() {
  return 'TournamentsState.loaded(items: $items, statusFilter: $statusFilter, competitionTypeFilter: $competitionTypeFilter, query: $query, currentPage: $currentPage, hasMore: $hasMore, isLoadingMore: $isLoadingMore)';
}


}

/// @nodoc
abstract mixin class $TournamentsLoadedCopyWith<$Res> implements $TournamentsStateCopyWith<$Res> {
  factory $TournamentsLoadedCopyWith(TournamentsLoaded value, $Res Function(TournamentsLoaded) _then) = _$TournamentsLoadedCopyWithImpl;
@useResult
$Res call({
 List<Tournament> items, String? statusFilter, String? competitionTypeFilter, String query, int currentPage, bool hasMore, bool isLoadingMore
});




}
/// @nodoc
class _$TournamentsLoadedCopyWithImpl<$Res>
    implements $TournamentsLoadedCopyWith<$Res> {
  _$TournamentsLoadedCopyWithImpl(this._self, this._then);

  final TournamentsLoaded _self;
  final $Res Function(TournamentsLoaded) _then;

/// Create a copy of TournamentsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? items = null,Object? statusFilter = freezed,Object? competitionTypeFilter = freezed,Object? query = null,Object? currentPage = null,Object? hasMore = null,Object? isLoadingMore = null,}) {
  return _then(TournamentsLoaded(
items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<Tournament>,statusFilter: freezed == statusFilter ? _self.statusFilter : statusFilter // ignore: cast_nullable_to_non_nullable
as String?,competitionTypeFilter: freezed == competitionTypeFilter ? _self.competitionTypeFilter : competitionTypeFilter // ignore: cast_nullable_to_non_nullable
as String?,query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,currentPage: null == currentPage ? _self.currentPage : currentPage // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

/// @nodoc


class TournamentsError implements TournamentsState {
  const TournamentsError(this.failure);
  

 final  Failure failure;

/// Create a copy of TournamentsState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TournamentsErrorCopyWith<TournamentsError> get copyWith => _$TournamentsErrorCopyWithImpl<TournamentsError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TournamentsError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'TournamentsState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $TournamentsErrorCopyWith<$Res> implements $TournamentsStateCopyWith<$Res> {
  factory $TournamentsErrorCopyWith(TournamentsError value, $Res Function(TournamentsError) _then) = _$TournamentsErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$TournamentsErrorCopyWithImpl<$Res>
    implements $TournamentsErrorCopyWith<$Res> {
  _$TournamentsErrorCopyWithImpl(this._self, this._then);

  final TournamentsError _self;
  final $Res Function(TournamentsError) _then;

/// Create a copy of TournamentsState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(TournamentsError(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
