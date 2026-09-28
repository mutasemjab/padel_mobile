// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tournaments_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TournamentsEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TournamentsEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TournamentsEvent()';
}


}

/// @nodoc
class $TournamentsEventCopyWith<$Res>  {
$TournamentsEventCopyWith(TournamentsEvent _, $Res Function(TournamentsEvent) __);
}


/// Adds pattern-matching-related methods to [TournamentsEvent].
extension TournamentsEventPatterns on TournamentsEvent {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TournamentsRequested value)?  requested,TResult Function( TournamentsStatusFilterChanged value)?  statusFilterChanged,TResult Function( TournamentsCompetitionTypeChanged value)?  competitionTypeChanged,TResult Function( TournamentsQueryChanged value)?  queryChanged,TResult Function( TournamentsMoreRequested value)?  moreRequested,TResult Function( TournamentsRefreshed value)?  refreshed,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TournamentsRequested() when requested != null:
return requested(_that);case TournamentsStatusFilterChanged() when statusFilterChanged != null:
return statusFilterChanged(_that);case TournamentsCompetitionTypeChanged() when competitionTypeChanged != null:
return competitionTypeChanged(_that);case TournamentsQueryChanged() when queryChanged != null:
return queryChanged(_that);case TournamentsMoreRequested() when moreRequested != null:
return moreRequested(_that);case TournamentsRefreshed() when refreshed != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TournamentsRequested value)  requested,required TResult Function( TournamentsStatusFilterChanged value)  statusFilterChanged,required TResult Function( TournamentsCompetitionTypeChanged value)  competitionTypeChanged,required TResult Function( TournamentsQueryChanged value)  queryChanged,required TResult Function( TournamentsMoreRequested value)  moreRequested,required TResult Function( TournamentsRefreshed value)  refreshed,}){
final _that = this;
switch (_that) {
case TournamentsRequested():
return requested(_that);case TournamentsStatusFilterChanged():
return statusFilterChanged(_that);case TournamentsCompetitionTypeChanged():
return competitionTypeChanged(_that);case TournamentsQueryChanged():
return queryChanged(_that);case TournamentsMoreRequested():
return moreRequested(_that);case TournamentsRefreshed():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TournamentsRequested value)?  requested,TResult? Function( TournamentsStatusFilterChanged value)?  statusFilterChanged,TResult? Function( TournamentsCompetitionTypeChanged value)?  competitionTypeChanged,TResult? Function( TournamentsQueryChanged value)?  queryChanged,TResult? Function( TournamentsMoreRequested value)?  moreRequested,TResult? Function( TournamentsRefreshed value)?  refreshed,}){
final _that = this;
switch (_that) {
case TournamentsRequested() when requested != null:
return requested(_that);case TournamentsStatusFilterChanged() when statusFilterChanged != null:
return statusFilterChanged(_that);case TournamentsCompetitionTypeChanged() when competitionTypeChanged != null:
return competitionTypeChanged(_that);case TournamentsQueryChanged() when queryChanged != null:
return queryChanged(_that);case TournamentsMoreRequested() when moreRequested != null:
return moreRequested(_that);case TournamentsRefreshed() when refreshed != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String? status,  String? competitionType,  String? query)?  requested,TResult Function( String? status)?  statusFilterChanged,TResult Function( String? competitionType)?  competitionTypeChanged,TResult Function( String query)?  queryChanged,TResult Function()?  moreRequested,TResult Function()?  refreshed,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TournamentsRequested() when requested != null:
return requested(_that.status,_that.competitionType,_that.query);case TournamentsStatusFilterChanged() when statusFilterChanged != null:
return statusFilterChanged(_that.status);case TournamentsCompetitionTypeChanged() when competitionTypeChanged != null:
return competitionTypeChanged(_that.competitionType);case TournamentsQueryChanged() when queryChanged != null:
return queryChanged(_that.query);case TournamentsMoreRequested() when moreRequested != null:
return moreRequested();case TournamentsRefreshed() when refreshed != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String? status,  String? competitionType,  String? query)  requested,required TResult Function( String? status)  statusFilterChanged,required TResult Function( String? competitionType)  competitionTypeChanged,required TResult Function( String query)  queryChanged,required TResult Function()  moreRequested,required TResult Function()  refreshed,}) {final _that = this;
switch (_that) {
case TournamentsRequested():
return requested(_that.status,_that.competitionType,_that.query);case TournamentsStatusFilterChanged():
return statusFilterChanged(_that.status);case TournamentsCompetitionTypeChanged():
return competitionTypeChanged(_that.competitionType);case TournamentsQueryChanged():
return queryChanged(_that.query);case TournamentsMoreRequested():
return moreRequested();case TournamentsRefreshed():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String? status,  String? competitionType,  String? query)?  requested,TResult? Function( String? status)?  statusFilterChanged,TResult? Function( String? competitionType)?  competitionTypeChanged,TResult? Function( String query)?  queryChanged,TResult? Function()?  moreRequested,TResult? Function()?  refreshed,}) {final _that = this;
switch (_that) {
case TournamentsRequested() when requested != null:
return requested(_that.status,_that.competitionType,_that.query);case TournamentsStatusFilterChanged() when statusFilterChanged != null:
return statusFilterChanged(_that.status);case TournamentsCompetitionTypeChanged() when competitionTypeChanged != null:
return competitionTypeChanged(_that.competitionType);case TournamentsQueryChanged() when queryChanged != null:
return queryChanged(_that.query);case TournamentsMoreRequested() when moreRequested != null:
return moreRequested();case TournamentsRefreshed() when refreshed != null:
return refreshed();case _:
  return null;

}
}

}

/// @nodoc


class TournamentsRequested implements TournamentsEvent {
  const TournamentsRequested({this.status, this.competitionType, this.query});
  

 final  String? status;
 final  String? competitionType;
 final  String? query;

/// Create a copy of TournamentsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TournamentsRequestedCopyWith<TournamentsRequested> get copyWith => _$TournamentsRequestedCopyWithImpl<TournamentsRequested>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TournamentsRequested&&(identical(other.status, status) || other.status == status)&&(identical(other.competitionType, competitionType) || other.competitionType == competitionType)&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,status,competitionType,query);

@override
String toString() {
  return 'TournamentsEvent.requested(status: $status, competitionType: $competitionType, query: $query)';
}


}

/// @nodoc
abstract mixin class $TournamentsRequestedCopyWith<$Res> implements $TournamentsEventCopyWith<$Res> {
  factory $TournamentsRequestedCopyWith(TournamentsRequested value, $Res Function(TournamentsRequested) _then) = _$TournamentsRequestedCopyWithImpl;
@useResult
$Res call({
 String? status, String? competitionType, String? query
});




}
/// @nodoc
class _$TournamentsRequestedCopyWithImpl<$Res>
    implements $TournamentsRequestedCopyWith<$Res> {
  _$TournamentsRequestedCopyWithImpl(this._self, this._then);

  final TournamentsRequested _self;
  final $Res Function(TournamentsRequested) _then;

/// Create a copy of TournamentsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? status = freezed,Object? competitionType = freezed,Object? query = freezed,}) {
  return _then(TournamentsRequested(
status: freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,competitionType: freezed == competitionType ? _self.competitionType : competitionType // ignore: cast_nullable_to_non_nullable
as String?,query: freezed == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class TournamentsStatusFilterChanged implements TournamentsEvent {
  const TournamentsStatusFilterChanged(this.status);
  

 final  String? status;

/// Create a copy of TournamentsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TournamentsStatusFilterChangedCopyWith<TournamentsStatusFilterChanged> get copyWith => _$TournamentsStatusFilterChangedCopyWithImpl<TournamentsStatusFilterChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TournamentsStatusFilterChanged&&(identical(other.status, status) || other.status == status));
}


@override
int get hashCode => Object.hash(runtimeType,status);

@override
String toString() {
  return 'TournamentsEvent.statusFilterChanged(status: $status)';
}


}

/// @nodoc
abstract mixin class $TournamentsStatusFilterChangedCopyWith<$Res> implements $TournamentsEventCopyWith<$Res> {
  factory $TournamentsStatusFilterChangedCopyWith(TournamentsStatusFilterChanged value, $Res Function(TournamentsStatusFilterChanged) _then) = _$TournamentsStatusFilterChangedCopyWithImpl;
@useResult
$Res call({
 String? status
});




}
/// @nodoc
class _$TournamentsStatusFilterChangedCopyWithImpl<$Res>
    implements $TournamentsStatusFilterChangedCopyWith<$Res> {
  _$TournamentsStatusFilterChangedCopyWithImpl(this._self, this._then);

  final TournamentsStatusFilterChanged _self;
  final $Res Function(TournamentsStatusFilterChanged) _then;

/// Create a copy of TournamentsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? status = freezed,}) {
  return _then(TournamentsStatusFilterChanged(
freezed == status ? _self.status : status // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class TournamentsCompetitionTypeChanged implements TournamentsEvent {
  const TournamentsCompetitionTypeChanged(this.competitionType);
  

 final  String? competitionType;

/// Create a copy of TournamentsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TournamentsCompetitionTypeChangedCopyWith<TournamentsCompetitionTypeChanged> get copyWith => _$TournamentsCompetitionTypeChangedCopyWithImpl<TournamentsCompetitionTypeChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TournamentsCompetitionTypeChanged&&(identical(other.competitionType, competitionType) || other.competitionType == competitionType));
}


@override
int get hashCode => Object.hash(runtimeType,competitionType);

@override
String toString() {
  return 'TournamentsEvent.competitionTypeChanged(competitionType: $competitionType)';
}


}

/// @nodoc
abstract mixin class $TournamentsCompetitionTypeChangedCopyWith<$Res> implements $TournamentsEventCopyWith<$Res> {
  factory $TournamentsCompetitionTypeChangedCopyWith(TournamentsCompetitionTypeChanged value, $Res Function(TournamentsCompetitionTypeChanged) _then) = _$TournamentsCompetitionTypeChangedCopyWithImpl;
@useResult
$Res call({
 String? competitionType
});




}
/// @nodoc
class _$TournamentsCompetitionTypeChangedCopyWithImpl<$Res>
    implements $TournamentsCompetitionTypeChangedCopyWith<$Res> {
  _$TournamentsCompetitionTypeChangedCopyWithImpl(this._self, this._then);

  final TournamentsCompetitionTypeChanged _self;
  final $Res Function(TournamentsCompetitionTypeChanged) _then;

/// Create a copy of TournamentsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? competitionType = freezed,}) {
  return _then(TournamentsCompetitionTypeChanged(
freezed == competitionType ? _self.competitionType : competitionType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

/// @nodoc


class TournamentsQueryChanged implements TournamentsEvent {
  const TournamentsQueryChanged(this.query);
  

 final  String query;

/// Create a copy of TournamentsEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TournamentsQueryChangedCopyWith<TournamentsQueryChanged> get copyWith => _$TournamentsQueryChangedCopyWithImpl<TournamentsQueryChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TournamentsQueryChanged&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'TournamentsEvent.queryChanged(query: $query)';
}


}

/// @nodoc
abstract mixin class $TournamentsQueryChangedCopyWith<$Res> implements $TournamentsEventCopyWith<$Res> {
  factory $TournamentsQueryChangedCopyWith(TournamentsQueryChanged value, $Res Function(TournamentsQueryChanged) _then) = _$TournamentsQueryChangedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$TournamentsQueryChangedCopyWithImpl<$Res>
    implements $TournamentsQueryChangedCopyWith<$Res> {
  _$TournamentsQueryChangedCopyWithImpl(this._self, this._then);

  final TournamentsQueryChanged _self;
  final $Res Function(TournamentsQueryChanged) _then;

/// Create a copy of TournamentsEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then(TournamentsQueryChanged(
null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class TournamentsMoreRequested implements TournamentsEvent {
  const TournamentsMoreRequested();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TournamentsMoreRequested);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TournamentsEvent.moreRequested()';
}


}




/// @nodoc


class TournamentsRefreshed implements TournamentsEvent {
  const TournamentsRefreshed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TournamentsRefreshed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TournamentsEvent.refreshed()';
}


}




// dart format on
