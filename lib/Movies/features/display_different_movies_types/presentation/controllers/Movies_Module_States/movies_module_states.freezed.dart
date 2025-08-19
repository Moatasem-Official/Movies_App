// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movies_module_states.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$MoviesModuleStates<T,E> implements DiagnosticableTreeMixin {




@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'MoviesModuleStates<$T, $E>'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MoviesModuleStates<T, E>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'MoviesModuleStates<$T, $E>()';
}


}

/// @nodoc
class $MoviesModuleStatesCopyWith<T,E,$Res>  {
$MoviesModuleStatesCopyWith(MoviesModuleStates<T, E> _, $Res Function(MoviesModuleStates<T, E>) __);
}


/// Adds pattern-matching-related methods to [MoviesModuleStates].
extension MoviesModuleStatesPatterns<T,E> on MoviesModuleStates<T, E> {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _Idle<T, E> value)?  idle,TResult Function( _Loading<T, E> value)?  loading,TResult Function( _Loaded<T, E> value)?  loaded,TResult Function( _Error<T, E> value)?  error,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _Idle<T, E> value)  idle,required TResult Function( _Loading<T, E> value)  loading,required TResult Function( _Loaded<T, E> value)  loaded,required TResult Function( _Error<T, E> value)  error,}){
final _that = this;
switch (_that) {
case _Idle():
return idle(_that);case _Loading():
return loading(_that);case _Loaded():
return loaded(_that);case _Error():
return error(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _Idle<T, E> value)?  idle,TResult? Function( _Loading<T, E> value)?  loading,TResult? Function( _Loaded<T, E> value)?  loaded,TResult? Function( _Error<T, E> value)?  error,}){
final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle(_that);case _Loading() when loading != null:
return loading(_that);case _Loaded() when loaded != null:
return loaded(_that);case _Error() when error != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  idle,TResult Function()?  loading,TResult Function( T movies)?  loaded,TResult Function( E message)?  error,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.movies);case _Error() when error != null:
return error(_that.message);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  idle,required TResult Function()  loading,required TResult Function( T movies)  loaded,required TResult Function( E message)  error,}) {final _that = this;
switch (_that) {
case _Idle():
return idle();case _Loading():
return loading();case _Loaded():
return loaded(_that.movies);case _Error():
return error(_that.message);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  idle,TResult? Function()?  loading,TResult? Function( T movies)?  loaded,TResult? Function( E message)?  error,}) {final _that = this;
switch (_that) {
case _Idle() when idle != null:
return idle();case _Loading() when loading != null:
return loading();case _Loaded() when loaded != null:
return loaded(_that.movies);case _Error() when error != null:
return error(_that.message);case _:
  return null;

}
}

}

/// @nodoc


class _Idle<T,E> with DiagnosticableTreeMixin implements MoviesModuleStates<T, E> {
  const _Idle();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'MoviesModuleStates<$T, $E>.idle'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Idle<T, E>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'MoviesModuleStates<$T, $E>.idle()';
}


}




/// @nodoc


class _Loading<T,E> with DiagnosticableTreeMixin implements MoviesModuleStates<T, E> {
  const _Loading();
  





@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'MoviesModuleStates<$T, $E>.loading'))
    ;
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loading<T, E>);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'MoviesModuleStates<$T, $E>.loading()';
}


}




/// @nodoc


class _Loaded<T,E> with DiagnosticableTreeMixin implements MoviesModuleStates<T, E> {
  const _Loaded(this.movies);
  

 final  T movies;

/// Create a copy of MoviesModuleStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoadedCopyWith<T, E, _Loaded<T, E>> get copyWith => __$LoadedCopyWithImpl<T, E, _Loaded<T, E>>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'MoviesModuleStates<$T, $E>.loaded'))
    ..add(DiagnosticsProperty('movies', movies));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Loaded<T, E>&&const DeepCollectionEquality().equals(other.movies, movies));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(movies));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'MoviesModuleStates<$T, $E>.loaded(movies: $movies)';
}


}

/// @nodoc
abstract mixin class _$LoadedCopyWith<T,E,$Res> implements $MoviesModuleStatesCopyWith<T, E, $Res> {
  factory _$LoadedCopyWith(_Loaded<T, E> value, $Res Function(_Loaded<T, E>) _then) = __$LoadedCopyWithImpl;
@useResult
$Res call({
 T movies
});




}
/// @nodoc
class __$LoadedCopyWithImpl<T,E,$Res>
    implements _$LoadedCopyWith<T, E, $Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded<T, E> _self;
  final $Res Function(_Loaded<T, E>) _then;

/// Create a copy of MoviesModuleStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? movies = freezed,}) {
  return _then(_Loaded<T, E>(
freezed == movies ? _self.movies : movies // ignore: cast_nullable_to_non_nullable
as T,
  ));
}


}

/// @nodoc


class _Error<T,E> with DiagnosticableTreeMixin implements MoviesModuleStates<T, E> {
  const _Error(this.message);
  

 final  E message;

/// Create a copy of MoviesModuleStates
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ErrorCopyWith<T, E, _Error<T, E>> get copyWith => __$ErrorCopyWithImpl<T, E, _Error<T, E>>(this, _$identity);


@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'MoviesModuleStates<$T, $E>.error'))
    ..add(DiagnosticsProperty('message', message));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Error<T, E>&&const DeepCollectionEquality().equals(other.message, message));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(message));

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'MoviesModuleStates<$T, $E>.error(message: $message)';
}


}

/// @nodoc
abstract mixin class _$ErrorCopyWith<T,E,$Res> implements $MoviesModuleStatesCopyWith<T, E, $Res> {
  factory _$ErrorCopyWith(_Error<T, E> value, $Res Function(_Error<T, E>) _then) = __$ErrorCopyWithImpl;
@useResult
$Res call({
 E message
});




}
/// @nodoc
class __$ErrorCopyWithImpl<T,E,$Res>
    implements _$ErrorCopyWith<T, E, $Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error<T, E> _self;
  final $Res Function(_Error<T, E>) _then;

/// Create a copy of MoviesModuleStates
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? message = freezed,}) {
  return _then(_Error<T, E>(
freezed == message ? _self.message : message // ignore: cast_nullable_to_non_nullable
as E,
  ));
}


}

// dart format on
