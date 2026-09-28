// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'tournament_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$TournamentDetailState {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TournamentDetailState);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TournamentDetailState()';
}


}

/// @nodoc
class $TournamentDetailStateCopyWith<$Res>  {
$TournamentDetailStateCopyWith(TournamentDetailState _, $Res Function(TournamentDetailState) __);
}


/// Adds pattern-matching-related methods to [TournamentDetailState].
extension TournamentDetailStatePatterns on TournamentDetailState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( TournamentDetailInitial value)?  initial,TResult Function( TournamentDetailLoading value)?  loading,TResult Function( TournamentDetailLoaded value)?  loaded,TResult Function( TournamentDetailError value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case TournamentDetailInitial() when initial != null:
return initial(_that);case TournamentDetailLoading() when loading != null:
return loading(_that);case TournamentDetailLoaded() when loaded != null:
return loaded(_that);case TournamentDetailError() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( TournamentDetailInitial value)  initial,required TResult Function( TournamentDetailLoading value)  loading,required TResult Function( TournamentDetailLoaded value)  loaded,required TResult Function( TournamentDetailError value)  error,}){
final _that = this;
switch (_that) {
case TournamentDetailInitial():
return initial(_that);case TournamentDetailLoading():
return loading(_that);case TournamentDetailLoaded():
return loaded(_that);case TournamentDetailError():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( TournamentDetailInitial value)?  initial,TResult? Function( TournamentDetailLoading value)?  loading,TResult? Function( TournamentDetailLoaded value)?  loaded,TResult? Function( TournamentDetailError value)?  error,}){
final _that = this;
switch (_that) {
case TournamentDetailInitial() when initial != null:
return initial(_that);case TournamentDetailLoading() when loading != null:
return loading(_that);case TournamentDetailLoaded() when loaded != null:
return loaded(_that);case TournamentDetailError() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  initial,TResult Function()?  loading,TResult Function( Tournament tournament,  List<Match> liveMatches,  List<Registration> myRegistrations)?  loaded,TResult Function( Failure failure)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case TournamentDetailInitial() when initial != null:
return initial();case TournamentDetailLoading() when loading != null:
return loading();case TournamentDetailLoaded() when loaded != null:
return loaded(_that.tournament,_that.liveMatches,_that.myRegistrations);case TournamentDetailError() when error != null:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  initial,required TResult Function()  loading,required TResult Function( Tournament tournament,  List<Match> liveMatches,  List<Registration> myRegistrations)  loaded,required TResult Function( Failure failure)  error,}) {final _that = this;
switch (_that) {
case TournamentDetailInitial():
return initial();case TournamentDetailLoading():
return loading();case TournamentDetailLoaded():
return loaded(_that.tournament,_that.liveMatches,_that.myRegistrations);case TournamentDetailError():
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  initial,TResult? Function()?  loading,TResult? Function( Tournament tournament,  List<Match> liveMatches,  List<Registration> myRegistrations)?  loaded,TResult? Function( Failure failure)?  error,}) {final _that = this;
switch (_that) {
case TournamentDetailInitial() when initial != null:
return initial();case TournamentDetailLoading() when loading != null:
return loading();case TournamentDetailLoaded() when loaded != null:
return loaded(_that.tournament,_that.liveMatches,_that.myRegistrations);case TournamentDetailError() when error != null:
return error(_that.failure);case _:
  return null;

}
}

}

/// @nodoc


class TournamentDetailInitial implements TournamentDetailState {
  const TournamentDetailInitial();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TournamentDetailInitial);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TournamentDetailState.initial()';
}


}




/// @nodoc


class TournamentDetailLoading implements TournamentDetailState {
  const TournamentDetailLoading();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TournamentDetailLoading);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'TournamentDetailState.loading()';
}


}




/// @nodoc


class TournamentDetailLoaded implements TournamentDetailState {
  const TournamentDetailLoaded({required this.tournament, final  List<Match> liveMatches = const [], final  List<Registration> myRegistrations = const []}): _liveMatches = liveMatches,_myRegistrations = myRegistrations;
  

 final  Tournament tournament;
 final  List<Match> _liveMatches;
@JsonKey() List<Match> get liveMatches {
  if (_liveMatches is EqualUnmodifiableListView) return _liveMatches;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_liveMatches);
}

/// The player's own registrations in this tournament (drives the
/// per-category CTA: register / waitlist / registered / payment pending).
 final  List<Registration> _myRegistrations;
/// The player's own registrations in this tournament (drives the
/// per-category CTA: register / waitlist / registered / payment pending).
@JsonKey() List<Registration> get myRegistrations {
  if (_myRegistrations is EqualUnmodifiableListView) return _myRegistrations;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_myRegistrations);
}


/// Create a copy of TournamentDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TournamentDetailLoadedCopyWith<TournamentDetailLoaded> get copyWith => _$TournamentDetailLoadedCopyWithImpl<TournamentDetailLoaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TournamentDetailLoaded&&(identical(other.tournament, tournament) || other.tournament == tournament)&&const DeepCollectionEquality().equals(other._liveMatches, _liveMatches)&&const DeepCollectionEquality().equals(other._myRegistrations, _myRegistrations));
}


@override
int get hashCode => Object.hash(runtimeType,tournament,const DeepCollectionEquality().hash(_liveMatches),const DeepCollectionEquality().hash(_myRegistrations));

@override
String toString() {
  return 'TournamentDetailState.loaded(tournament: $tournament, liveMatches: $liveMatches, myRegistrations: $myRegistrations)';
}


}

/// @nodoc
abstract mixin class $TournamentDetailLoadedCopyWith<$Res> implements $TournamentDetailStateCopyWith<$Res> {
  factory $TournamentDetailLoadedCopyWith(TournamentDetailLoaded value, $Res Function(TournamentDetailLoaded) _then) = _$TournamentDetailLoadedCopyWithImpl;
@useResult
$Res call({
 Tournament tournament, List<Match> liveMatches, List<Registration> myRegistrations
});




}
/// @nodoc
class _$TournamentDetailLoadedCopyWithImpl<$Res>
    implements $TournamentDetailLoadedCopyWith<$Res> {
  _$TournamentDetailLoadedCopyWithImpl(this._self, this._then);

  final TournamentDetailLoaded _self;
  final $Res Function(TournamentDetailLoaded) _then;

/// Create a copy of TournamentDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? tournament = null,Object? liveMatches = null,Object? myRegistrations = null,}) {
  return _then(TournamentDetailLoaded(
tournament: null == tournament ? _self.tournament : tournament // ignore: cast_nullable_to_non_nullable
as Tournament,liveMatches: null == liveMatches ? _self._liveMatches : liveMatches // ignore: cast_nullable_to_non_nullable
as List<Match>,myRegistrations: null == myRegistrations ? _self._myRegistrations : myRegistrations // ignore: cast_nullable_to_non_nullable
as List<Registration>,
  ));
}


}

/// @nodoc


class TournamentDetailError implements TournamentDetailState {
  const TournamentDetailError(this.failure);
  

 final  Failure failure;

/// Create a copy of TournamentDetailState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$TournamentDetailErrorCopyWith<TournamentDetailError> get copyWith => _$TournamentDetailErrorCopyWithImpl<TournamentDetailError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is TournamentDetailError&&(identical(other.failure, failure) || other.failure == failure));
}


@override
int get hashCode => Object.hash(runtimeType,failure);

@override
String toString() {
  return 'TournamentDetailState.error(failure: $failure)';
}


}

/// @nodoc
abstract mixin class $TournamentDetailErrorCopyWith<$Res> implements $TournamentDetailStateCopyWith<$Res> {
  factory $TournamentDetailErrorCopyWith(TournamentDetailError value, $Res Function(TournamentDetailError) _then) = _$TournamentDetailErrorCopyWithImpl;
@useResult
$Res call({
 Failure failure
});




}
/// @nodoc
class _$TournamentDetailErrorCopyWithImpl<$Res>
    implements $TournamentDetailErrorCopyWith<$Res> {
  _$TournamentDetailErrorCopyWithImpl(this._self, this._then);

  final TournamentDetailError _self;
  final $Res Function(TournamentDetailError) _then;

/// Create a copy of TournamentDetailState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? failure = null,}) {
  return _then(TournamentDetailError(
null == failure ? _self.failure : failure // ignore: cast_nullable_to_non_nullable
as Failure,
  ));
}


}

// dart format on
