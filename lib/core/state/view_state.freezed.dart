// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'view_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$ViewState<T> {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ViewState<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ViewState<$T>()';
}


}

/// @nodoc
class $ViewStateCopyWith<T,$Res>  {
$ViewStateCopyWith(ViewState<T> _, $Res Function(ViewState<T>) __);
}


/// Adds pattern-matching-related methods to [ViewState].
extension ViewStatePatterns<T> on ViewState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ViewInitial<T> value)?  initial,TResult Function( ViewLoading<T> value)?  loading,TResult Function( ViewLoaded<T> value)?  loaded,TResult Function( ViewEmpty<T> value)?  empty,TResult Function( ViewError<T> value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ViewInitial() when initial != null:
return initial(_that);case ViewLoading() when loading != null:
return loading(_that);case ViewLoaded() when loaded != null:
return loaded(_that);case ViewEmpty() when empty != null:
return empty(_that);case ViewError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ViewInitial<T> value)  initial,required TResult Function( ViewLoading<T> value)  loading,required TResult Function( ViewLoaded<T> value)  loaded,required TResult Function( ViewEmpty<T> value)  empty,required TResult Function( ViewError<T> value)  error,}){
final _that = this;
switch (_that) {
case ViewInitial():
return initial(_that);case ViewLoading():
return loading(_that);case ViewLoaded():
return loaded(_that);case ViewEmpty():
return empty(_that);case ViewError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ViewInitial<T> value)?  initial,TResult? Function( ViewLoading<T> value)?  loading,TResult? Function( ViewLoaded<T> value)?  loaded,TResult? Function( ViewEmpty<T> value)?  empty,TResult? Function( ViewError<T> value)?  error,}){
final _that = this;
switch (_that) {
case ViewInitial() when initial != null:
return initial(_that);case ViewLoading() when loading != null:
return loading(_that);case ViewLoaded() when loaded != null:
return loaded(_that);case ViewEmpty() when empty != null:
return empty(_that);case ViewError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( T data)?  loaded,TResult Function()?  empty,TResult Function( Failure failure)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ViewInitial() when initial != null:
return initial();case ViewLoading() when loading != null:
return loading();case ViewLoaded() when loaded != null:
return loaded(_that.data);case ViewEmpty() when empty != null:
return empty();case ViewError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( T data)  loaded,required TResult Function()  empty,required TResult Function( Failure failure)  error,}) {final _that = this;
switch (_that) {
case ViewInitial():
return initial();case ViewLoading():
return loading();case ViewLoaded():
return loaded(_that.data);case ViewEmpty():
return empty();case ViewError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( T data)?  loaded,TResult? Function()?  empty,TResult? Function( Failure failure)?  error,}) {final _that = this;
switch (_that) {
case ViewInitial() when initial != null:
return initial();case ViewLoading() when loading != null:
return loading();case ViewLoaded() when loaded != null:
return loaded(_that.data);case ViewEmpty() when empty != null:
return empty();case ViewError() when error != null:
return error(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class ViewInitial<T> implements ViewState<T> {
  const ViewInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ViewInitial<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ViewState<$T>.initial()';
}


}




/// @nodoc


class ViewLoading<T> implements ViewState<T> {
  const ViewLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ViewLoading<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ViewState<$T>.loading()';
}


}




/// @nodoc


class ViewLoaded<T> implements ViewState<T> {
  const ViewLoaded(this.data);
  

 final  T data;

/// Create a copy of ViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ViewLoadedCopyWith<T, ViewLoaded<T>> get copyWith => _$ViewLoadedCopyWithImpl<T, ViewLoaded<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ViewLoaded<T>&&const DeepCollectionEquality().equals(other.data, data));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data));

@override
String toString() {
  return 'ViewState<$T>.loaded(data: $data)';
}


}

/// @nodoc
abstract mixin class $ViewLoadedCopyWith<T,$Res> implements $ViewStateCopyWith<T, $Res> {
  factory $ViewLoadedCopyWith(ViewLoaded<T> value, $Res Function(ViewLoaded<T>) _then) = _$ViewLoadedCopyWithImpl;
@useResult
$Res call({
 T data
});




}
/// @nodoc
class _$ViewLoadedCopyWithImpl<T,$Res>
    implements $ViewLoadedCopyWith<T, $Res> {
  _$ViewLoadedCopyWithImpl(this._self, this._then);

  final ViewLoaded<T> _self;
  final $Res Function(ViewLoaded<T>) _then;

/// Create a copy of ViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? data = freezed,}) {
  return _then(ViewLoaded<T>(
freezed == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class ViewEmpty<T> implements ViewState<T> {
  const ViewEmpty();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ViewEmpty<T>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ViewState<$T>.empty()';
}


}




/// @nodoc


class ViewError<T> implements ViewState<T> {
  const ViewError(this.failure);
  

 final  Failure failure;

/// Create a copy of ViewState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ViewErrorCopyWith<T, ViewError<T>> get copyWith => _$ViewErrorCopyWithImpl<T, ViewError<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ViewError<T>&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'ViewState<$T>.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ViewErrorCopyWith<T,$Res> implements $ViewStateCopyWith<T, $Res> {
  factory $ViewErrorCopyWith(ViewError<T> value, $Res Function(ViewError<T>) _then) = _$ViewErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$ViewErrorCopyWithImpl<T,$Res>
    implements $ViewErrorCopyWith<T, $Res> {
  _$ViewErrorCopyWithImpl(this._self, this._then);

  final ViewError<T> _self;
  final $Res Function(ViewError<T>) _then;

/// Create a copy of ViewState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(ViewError<T>(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

/// @nodoc
mixin _$PagedState<T> {

 PagedStatus get status; List<T> get items; int get page; bool get hasMore; bool get isLoadingMore; Failure? get failure;/// Envelope `meta` of the latest page (e.g. `unread_count`).
 Map<String, dynamic>? get extra;
/// Create a copy of PagedState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PagedStateCopyWith<T, PagedState<T>> get copyWith => _$PagedStateCopyWithImpl<T, PagedState<T>>(this as PagedState<T>, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PagedState<T>&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other.items, items)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.failure, failure) || other.failure == failure)&&const DeepCollectionEquality().equals(other.extra, extra));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(items),page,hasMore,isLoadingMore,failure,const DeepCollectionEquality().hash(extra));

@override
String toString() {
  return 'PagedState<$T>(status: $status, items: $items, page: $page, hasMore: $hasMore, isLoadingMore: $isLoadingMore, failure: $failure, extra: $extra)';
}


}

/// @nodoc
abstract mixin class $PagedStateCopyWith<T,$Res>  {
  factory $PagedStateCopyWith(PagedState<T> value, $Res Function(PagedState<T>) _then) = _$PagedStateCopyWithImpl;
@useResult
$Res call({
 PagedStatus status, List<T> items, int page, bool hasMore, bool isLoadingMore, Failure? failure, Map<String, dynamic>? extra
});




}
/// @nodoc
class _$PagedStateCopyWithImpl<T,$Res>
    implements $PagedStateCopyWith<T, $Res> {
  _$PagedStateCopyWithImpl(this._self, this._then);

  final PagedState<T> _self;
  final $Res Function(PagedState<T>) _then;

/// Create a copy of PagedState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? status = null,Object? items = null,Object? page = null,Object? hasMore = null,Object? isLoadingMore = null,Object? failure = freezed,Object? extra = freezed,}) {
  return _then(_self.copyWith(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PagedStatus,items: null == items ? _self.items : items // ignore: cast_nullable_to_non_nullable
as List<T>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,extra: freezed == extra ? _self.extra : extra // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}

}


/// Adds pattern-matching-related methods to [PagedState].
extension PagedStatePatterns<T> on PagedState<T> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PagedState<T> value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PagedState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PagedState<T> value)  $default,){
final _that = this;
switch (_that) {
case _PagedState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PagedState<T> value)?  $default,){
final _that = this;
switch (_that) {
case _PagedState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( PagedStatus status,  List<T> items,  int page,  bool hasMore,  bool isLoadingMore,  Failure? failure,  Map<String, dynamic>? extra)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PagedState() when $default != null:
return $default(_that.status,_that.items,_that.page,_that.hasMore,_that.isLoadingMore,_that.failure,_that.extra);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( PagedStatus status,  List<T> items,  int page,  bool hasMore,  bool isLoadingMore,  Failure? failure,  Map<String, dynamic>? extra)  $default,) {final _that = this;
switch (_that) {
case _PagedState():
return $default(_that.status,_that.items,_that.page,_that.hasMore,_that.isLoadingMore,_that.failure,_that.extra);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( PagedStatus status,  List<T> items,  int page,  bool hasMore,  bool isLoadingMore,  Failure? failure,  Map<String, dynamic>? extra)?  $default,) {final _that = this;
switch (_that) {
case _PagedState() when $default != null:
return $default(_that.status,_that.items,_that.page,_that.hasMore,_that.isLoadingMore,_that.failure,_that.extra);case _:
  return null;

}
}

}

/// @nodoc


class _PagedState<T> extends PagedState<T> {
  const _PagedState({this.status = PagedStatus.initial, final  List<T> items = const [], this.page = 0, this.hasMore = false, this.isLoadingMore = false, this.failure, final  Map<String, dynamic>? extra}): _items = items,_extra = extra,super._();
  

@override@JsonKey() final  PagedStatus status;
 final  List<T> _items;
@override@JsonKey() List<T> get items {
  if (_items is EqualUnmodifiableListView) return _items;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_items);
}

@override@JsonKey() final  int page;
@override@JsonKey() final  bool hasMore;
@override@JsonKey() final  bool isLoadingMore;
@override final  Failure? failure;
/// Envelope `meta` of the latest page (e.g. `unread_count`).
 final  Map<String, dynamic>? _extra;
/// Envelope `meta` of the latest page (e.g. `unread_count`).
@override Map<String, dynamic>? get extra {
  final value = _extra;
  if (value == null) return null;
  if (_extra is EqualUnmodifiableMapView) return _extra;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableMapView(value);
}


/// Create a copy of PagedState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PagedStateCopyWith<T, _PagedState<T>> get copyWith => __$PagedStateCopyWithImpl<T, _PagedState<T>>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PagedState<T>&&(identical(other.status, status) || other.status == status)&&const DeepCollectionEquality().equals(other._items, _items)&&(identical(other.page, page) || other.page == page)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&(identical(other.isLoadingMore, isLoadingMore) || other.isLoadingMore == isLoadingMore)&&(identical(other.failure, failure) || other.failure == failure)&&const DeepCollectionEquality().equals(other._extra, _extra));
}


@override
int get hashCode => Object.hash(runtimeType,status,const DeepCollectionEquality().hash(_items),page,hasMore,isLoadingMore,failure,const DeepCollectionEquality().hash(_extra));

@override
String toString() {
  return 'PagedState<$T>(status: $status, items: $items, page: $page, hasMore: $hasMore, isLoadingMore: $isLoadingMore, failure: $failure, extra: $extra)';
}


}

/// @nodoc
abstract mixin class _$PagedStateCopyWith<T,$Res> implements $PagedStateCopyWith<T, $Res> {
  factory _$PagedStateCopyWith(_PagedState<T> value, $Res Function(_PagedState<T>) _then) = __$PagedStateCopyWithImpl;
@override @useResult
$Res call({
 PagedStatus status, List<T> items, int page, bool hasMore, bool isLoadingMore, Failure? failure, Map<String, dynamic>? extra
});




}
/// @nodoc
class __$PagedStateCopyWithImpl<T,$Res>
    implements _$PagedStateCopyWith<T, $Res> {
  __$PagedStateCopyWithImpl(this._self, this._then);

  final _PagedState<T> _self;
  final $Res Function(_PagedState<T>) _then;

/// Create a copy of PagedState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? status = null,Object? items = null,Object? page = null,Object? hasMore = null,Object? isLoadingMore = null,Object? failure = freezed,Object? extra = freezed,}) {
  return _then(_PagedState<T>(
status: null == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as PagedStatus,items: null == items ? _self._items : items // ignore: cast_nullable_to_non_nullable
as List<T>,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,isLoadingMore: null == isLoadingMore ? _self.isLoadingMore : isLoadingMore // ignore: cast_nullable_to_non_nullable
as bool,failure: freezed == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure?,extra: freezed == extra ? _self._extra : extra // ignore: cast_nullable_to_non_nullable
as Map<String, dynamic>?,
  ));
}


}

/// @nodoc
mixin _$ActionState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActionState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActionState()';
}


}

/// @nodoc
class $ActionStateCopyWith<$Res>  {
$ActionStateCopyWith(ActionState _, $Res Function(ActionState) __);
}


/// Adds pattern-matching-related methods to [ActionState].
extension ActionStatePatterns on ActionState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( ActionIdle value)?  idle,TResult Function( ActionInProgress value)?  inProgress,TResult Function( ActionSuccess value)?  success,TResult Function( ActionFailure value)?  failure,required TResult orElse(),}){
final _that = this;
switch (_that) {
case ActionIdle() when idle != null:
return idle(_that);case ActionInProgress() when inProgress != null:
return inProgress(_that);case ActionSuccess() when success != null:
return success(_that);case ActionFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( ActionIdle value)  idle,required TResult Function( ActionInProgress value)  inProgress,required TResult Function( ActionSuccess value)  success,required TResult Function( ActionFailure value)  failure,}){
final _that = this;
switch (_that) {
case ActionIdle():
return idle(_that);case ActionInProgress():
return inProgress(_that);case ActionSuccess():
return success(_that);case ActionFailure():
return failure(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( ActionIdle value)?  idle,TResult? Function( ActionInProgress value)?  inProgress,TResult? Function( ActionSuccess value)?  success,TResult? Function( ActionFailure value)?  failure,}){
final _that = this;
switch (_that) {
case ActionIdle() when idle != null:
return idle(_that);case ActionInProgress() when inProgress != null:
return inProgress(_that);case ActionSuccess() when success != null:
return success(_that);case ActionFailure() when failure != null:
return failure(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  inProgress,TResult Function( Object? result)?  success,TResult Function( Failure failure)?  failure,required TResult orElse(),}) {final _that = this;
switch (_that) {
case ActionIdle() when idle != null:
return idle();case ActionInProgress() when inProgress != null:
return inProgress();case ActionSuccess() when success != null:
return success(_that.result);case ActionFailure() when failure != null:
return failure(_that.failure);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  inProgress,required TResult Function( Object? result)  success,required TResult Function( Failure failure)  failure,}) {final _that = this;
switch (_that) {
case ActionIdle():
return idle();case ActionInProgress():
return inProgress();case ActionSuccess():
return success(_that.result);case ActionFailure():
return failure(_that.failure);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  inProgress,TResult? Function( Object? result)?  success,TResult? Function( Failure failure)?  failure,}) {final _that = this;
switch (_that) {
case ActionIdle() when idle != null:
return idle();case ActionInProgress() when inProgress != null:
return inProgress();case ActionSuccess() when success != null:
return success(_that.result);case ActionFailure() when failure != null:
return failure(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class ActionIdle implements ActionState {
  const ActionIdle();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActionIdle);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActionState.idle()';
}


}




/// @nodoc


class ActionInProgress implements ActionState {
  const ActionInProgress();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActionInProgress);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'ActionState.inProgress()';
}


}




/// @nodoc


class ActionSuccess implements ActionState {
  const ActionSuccess([this.result]);
  

 final  Object? result;

/// Create a copy of ActionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActionSuccessCopyWith<ActionSuccess> get copyWith => _$ActionSuccessCopyWithImpl<ActionSuccess>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActionSuccess&&const DeepCollectionEquality().equals(other.result, result));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(result));

@override
String toString() {
  return 'ActionState.success(result: $result)';
}


}

/// @nodoc
abstract mixin class $ActionSuccessCopyWith<$Res> implements $ActionStateCopyWith<$Res> {
  factory $ActionSuccessCopyWith(ActionSuccess value, $Res Function(ActionSuccess) _then) = _$ActionSuccessCopyWithImpl;
@useResult
$Res call({
 Object? result
});




}
/// @nodoc
class _$ActionSuccessCopyWithImpl<$Res>
    implements $ActionSuccessCopyWith<$Res> {
  _$ActionSuccessCopyWithImpl(this._self, this._then);

  final ActionSuccess _self;
  final $Res Function(ActionSuccess) _then;

/// Create a copy of ActionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? result = freezed,}) {
  return _then(ActionSuccess(
freezed == result ? _self.result : result ,
  ));
}


}

/// @nodoc


class ActionFailure implements ActionState {
  const ActionFailure(this.failure);
  

 final  Failure failure;

/// Create a copy of ActionState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ActionFailureCopyWith<ActionFailure> get copyWith => _$ActionFailureCopyWithImpl<ActionFailure>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ActionFailure&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'ActionState.failure(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $ActionFailureCopyWith<$Res> implements $ActionStateCopyWith<$Res> {
  factory $ActionFailureCopyWith(ActionFailure value, $Res Function(ActionFailure) _then) = _$ActionFailureCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$ActionFailureCopyWithImpl<$Res>
    implements $ActionFailureCopyWith<$Res> {
  _$ActionFailureCopyWithImpl(this._self, this._then);

  final ActionFailure _self;
  final $Res Function(ActionFailure) _then;

/// Create a copy of ActionState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(ActionFailure(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
