// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'network_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$NetworkException {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is NetworkException);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkException()';
}


}

/// @nodoc
class $NetworkExceptionCopyWith<$Res>  {
$NetworkExceptionCopyWith(NetworkException _, $Res Function(NetworkException) __);
}


/// Adds pattern-matching-related methods to [NetworkException].
extension NetworkExceptionPatterns on NetworkException {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _RequestCancelled value)?  requestCancelled,TResult Function( _UnauthorizedRequest value)?  unauthorizedRequest,TResult Function( _BadRequest value)?  badRequest,TResult Function( _NotFound value)?  notFound,TResult Function( _MethodNotAllowed value)?  methodNotAllowed,TResult Function( _NotAcceptable value)?  notAcceptable,TResult Function( _RequestTimeout value)?  requestTimeout,TResult Function( _SendTimeout value)?  sendTimeout,TResult Function( _UnprocessableEntity value)?  unprocessableEntity,TResult Function( _Conflict value)?  conflict,TResult Function( _InternalServerError value)?  internalServerError,TResult Function( _NotImplemented value)?  notImplemented,TResult Function( _ServiceUnavailable value)?  serviceUnavailable,TResult Function( _NoInternetConnection value)?  noInternetConnection,TResult Function( _FormatException value)?  formatException,TResult Function( _UnableToProcess value)?  unableToProcess,TResult Function( _DefaultError value)?  defaultError,TResult Function( _UnexpectedError value)?  unexpectedError,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _RequestCancelled() when requestCancelled != null:
return requestCancelled(_that);case _UnauthorizedRequest() when unauthorizedRequest != null:
return unauthorizedRequest(_that);case _BadRequest() when badRequest != null:
return badRequest(_that);case _NotFound() when notFound != null:
return notFound(_that);case _MethodNotAllowed() when methodNotAllowed != null:
return methodNotAllowed(_that);case _NotAcceptable() when notAcceptable != null:
return notAcceptable(_that);case _RequestTimeout() when requestTimeout != null:
return requestTimeout(_that);case _SendTimeout() when sendTimeout != null:
return sendTimeout(_that);case _UnprocessableEntity() when unprocessableEntity != null:
return unprocessableEntity(_that);case _Conflict() when conflict != null:
return conflict(_that);case _InternalServerError() when internalServerError != null:
return internalServerError(_that);case _NotImplemented() when notImplemented != null:
return notImplemented(_that);case _ServiceUnavailable() when serviceUnavailable != null:
return serviceUnavailable(_that);case _NoInternetConnection() when noInternetConnection != null:
return noInternetConnection(_that);case _FormatException() when formatException != null:
return formatException(_that);case _UnableToProcess() when unableToProcess != null:
return unableToProcess(_that);case _DefaultError() when defaultError != null:
return defaultError(_that);case _UnexpectedError() when unexpectedError != null:
return unexpectedError(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _RequestCancelled value)  requestCancelled,required TResult Function( _UnauthorizedRequest value)  unauthorizedRequest,required TResult Function( _BadRequest value)  badRequest,required TResult Function( _NotFound value)  notFound,required TResult Function( _MethodNotAllowed value)  methodNotAllowed,required TResult Function( _NotAcceptable value)  notAcceptable,required TResult Function( _RequestTimeout value)  requestTimeout,required TResult Function( _SendTimeout value)  sendTimeout,required TResult Function( _UnprocessableEntity value)  unprocessableEntity,required TResult Function( _Conflict value)  conflict,required TResult Function( _InternalServerError value)  internalServerError,required TResult Function( _NotImplemented value)  notImplemented,required TResult Function( _ServiceUnavailable value)  serviceUnavailable,required TResult Function( _NoInternetConnection value)  noInternetConnection,required TResult Function( _FormatException value)  formatException,required TResult Function( _UnableToProcess value)  unableToProcess,required TResult Function( _DefaultError value)  defaultError,required TResult Function( _UnexpectedError value)  unexpectedError,}){
final _that = this;
switch (_that) {
case _RequestCancelled():
return requestCancelled(_that);case _UnauthorizedRequest():
return unauthorizedRequest(_that);case _BadRequest():
return badRequest(_that);case _NotFound():
return notFound(_that);case _MethodNotAllowed():
return methodNotAllowed(_that);case _NotAcceptable():
return notAcceptable(_that);case _RequestTimeout():
return requestTimeout(_that);case _SendTimeout():
return sendTimeout(_that);case _UnprocessableEntity():
return unprocessableEntity(_that);case _Conflict():
return conflict(_that);case _InternalServerError():
return internalServerError(_that);case _NotImplemented():
return notImplemented(_that);case _ServiceUnavailable():
return serviceUnavailable(_that);case _NoInternetConnection():
return noInternetConnection(_that);case _FormatException():
return formatException(_that);case _UnableToProcess():
return unableToProcess(_that);case _DefaultError():
return defaultError(_that);case _UnexpectedError():
return unexpectedError(_that);case _:
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _RequestCancelled value)?  requestCancelled,TResult? Function( _UnauthorizedRequest value)?  unauthorizedRequest,TResult? Function( _BadRequest value)?  badRequest,TResult? Function( _NotFound value)?  notFound,TResult? Function( _MethodNotAllowed value)?  methodNotAllowed,TResult? Function( _NotAcceptable value)?  notAcceptable,TResult? Function( _RequestTimeout value)?  requestTimeout,TResult? Function( _SendTimeout value)?  sendTimeout,TResult? Function( _UnprocessableEntity value)?  unprocessableEntity,TResult? Function( _Conflict value)?  conflict,TResult? Function( _InternalServerError value)?  internalServerError,TResult? Function( _NotImplemented value)?  notImplemented,TResult? Function( _ServiceUnavailable value)?  serviceUnavailable,TResult? Function( _NoInternetConnection value)?  noInternetConnection,TResult? Function( _FormatException value)?  formatException,TResult? Function( _UnableToProcess value)?  unableToProcess,TResult? Function( _DefaultError value)?  defaultError,TResult? Function( _UnexpectedError value)?  unexpectedError,}){
final _that = this;
switch (_that) {
case _RequestCancelled() when requestCancelled != null:
return requestCancelled(_that);case _UnauthorizedRequest() when unauthorizedRequest != null:
return unauthorizedRequest(_that);case _BadRequest() when badRequest != null:
return badRequest(_that);case _NotFound() when notFound != null:
return notFound(_that);case _MethodNotAllowed() when methodNotAllowed != null:
return methodNotAllowed(_that);case _NotAcceptable() when notAcceptable != null:
return notAcceptable(_that);case _RequestTimeout() when requestTimeout != null:
return requestTimeout(_that);case _SendTimeout() when sendTimeout != null:
return sendTimeout(_that);case _UnprocessableEntity() when unprocessableEntity != null:
return unprocessableEntity(_that);case _Conflict() when conflict != null:
return conflict(_that);case _InternalServerError() when internalServerError != null:
return internalServerError(_that);case _NotImplemented() when notImplemented != null:
return notImplemented(_that);case _ServiceUnavailable() when serviceUnavailable != null:
return serviceUnavailable(_that);case _NoInternetConnection() when noInternetConnection != null:
return noInternetConnection(_that);case _FormatException() when formatException != null:
return formatException(_that);case _UnableToProcess() when unableToProcess != null:
return unableToProcess(_that);case _DefaultError() when defaultError != null:
return defaultError(_that);case _UnexpectedError() when unexpectedError != null:
return unexpectedError(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  requestCancelled,TResult Function( String reason)?  unauthorizedRequest,TResult Function()?  badRequest,TResult Function( String reason)?  notFound,TResult Function()?  methodNotAllowed,TResult Function()?  notAcceptable,TResult Function()?  requestTimeout,TResult Function()?  sendTimeout,TResult Function( String reason)?  unprocessableEntity,TResult Function()?  conflict,TResult Function()?  internalServerError,TResult Function()?  notImplemented,TResult Function()?  serviceUnavailable,TResult Function()?  noInternetConnection,TResult Function()?  formatException,TResult Function()?  unableToProcess,TResult Function( String error)?  defaultError,TResult Function()?  unexpectedError,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _RequestCancelled() when requestCancelled != null:
return requestCancelled();case _UnauthorizedRequest() when unauthorizedRequest != null:
return unauthorizedRequest(_that.reason);case _BadRequest() when badRequest != null:
return badRequest();case _NotFound() when notFound != null:
return notFound(_that.reason);case _MethodNotAllowed() when methodNotAllowed != null:
return methodNotAllowed();case _NotAcceptable() when notAcceptable != null:
return notAcceptable();case _RequestTimeout() when requestTimeout != null:
return requestTimeout();case _SendTimeout() when sendTimeout != null:
return sendTimeout();case _UnprocessableEntity() when unprocessableEntity != null:
return unprocessableEntity(_that.reason);case _Conflict() when conflict != null:
return conflict();case _InternalServerError() when internalServerError != null:
return internalServerError();case _NotImplemented() when notImplemented != null:
return notImplemented();case _ServiceUnavailable() when serviceUnavailable != null:
return serviceUnavailable();case _NoInternetConnection() when noInternetConnection != null:
return noInternetConnection();case _FormatException() when formatException != null:
return formatException();case _UnableToProcess() when unableToProcess != null:
return unableToProcess();case _DefaultError() when defaultError != null:
return defaultError(_that.error);case _UnexpectedError() when unexpectedError != null:
return unexpectedError();case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  requestCancelled,required TResult Function( String reason)  unauthorizedRequest,required TResult Function()  badRequest,required TResult Function( String reason)  notFound,required TResult Function()  methodNotAllowed,required TResult Function()  notAcceptable,required TResult Function()  requestTimeout,required TResult Function()  sendTimeout,required TResult Function( String reason)  unprocessableEntity,required TResult Function()  conflict,required TResult Function()  internalServerError,required TResult Function()  notImplemented,required TResult Function()  serviceUnavailable,required TResult Function()  noInternetConnection,required TResult Function()  formatException,required TResult Function()  unableToProcess,required TResult Function( String error)  defaultError,required TResult Function()  unexpectedError,}) {final _that = this;
switch (_that) {
case _RequestCancelled():
return requestCancelled();case _UnauthorizedRequest():
return unauthorizedRequest(_that.reason);case _BadRequest():
return badRequest();case _NotFound():
return notFound(_that.reason);case _MethodNotAllowed():
return methodNotAllowed();case _NotAcceptable():
return notAcceptable();case _RequestTimeout():
return requestTimeout();case _SendTimeout():
return sendTimeout();case _UnprocessableEntity():
return unprocessableEntity(_that.reason);case _Conflict():
return conflict();case _InternalServerError():
return internalServerError();case _NotImplemented():
return notImplemented();case _ServiceUnavailable():
return serviceUnavailable();case _NoInternetConnection():
return noInternetConnection();case _FormatException():
return formatException();case _UnableToProcess():
return unableToProcess();case _DefaultError():
return defaultError(_that.error);case _UnexpectedError():
return unexpectedError();case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  requestCancelled,TResult? Function( String reason)?  unauthorizedRequest,TResult? Function()?  badRequest,TResult? Function( String reason)?  notFound,TResult? Function()?  methodNotAllowed,TResult? Function()?  notAcceptable,TResult? Function()?  requestTimeout,TResult? Function()?  sendTimeout,TResult? Function( String reason)?  unprocessableEntity,TResult? Function()?  conflict,TResult? Function()?  internalServerError,TResult? Function()?  notImplemented,TResult? Function()?  serviceUnavailable,TResult? Function()?  noInternetConnection,TResult? Function()?  formatException,TResult? Function()?  unableToProcess,TResult? Function( String error)?  defaultError,TResult? Function()?  unexpectedError,}) {final _that = this;
switch (_that) {
case _RequestCancelled() when requestCancelled != null:
return requestCancelled();case _UnauthorizedRequest() when unauthorizedRequest != null:
return unauthorizedRequest(_that.reason);case _BadRequest() when badRequest != null:
return badRequest();case _NotFound() when notFound != null:
return notFound(_that.reason);case _MethodNotAllowed() when methodNotAllowed != null:
return methodNotAllowed();case _NotAcceptable() when notAcceptable != null:
return notAcceptable();case _RequestTimeout() when requestTimeout != null:
return requestTimeout();case _SendTimeout() when sendTimeout != null:
return sendTimeout();case _UnprocessableEntity() when unprocessableEntity != null:
return unprocessableEntity(_that.reason);case _Conflict() when conflict != null:
return conflict();case _InternalServerError() when internalServerError != null:
return internalServerError();case _NotImplemented() when notImplemented != null:
return notImplemented();case _ServiceUnavailable() when serviceUnavailable != null:
return serviceUnavailable();case _NoInternetConnection() when noInternetConnection != null:
return noInternetConnection();case _FormatException() when formatException != null:
return formatException();case _UnableToProcess() when unableToProcess != null:
return unableToProcess();case _DefaultError() when defaultError != null:
return defaultError(_that.error);case _UnexpectedError() when unexpectedError != null:
return unexpectedError();case _:
  return null;

}
}

}

/// @nodoc


class _RequestCancelled implements NetworkException {
  const _RequestCancelled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestCancelled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkException.requestCancelled()';
}


}




/// @nodoc


class _UnauthorizedRequest implements NetworkException {
  const _UnauthorizedRequest(this.reason);
  

 final  String reason;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnauthorizedRequestCopyWith<_UnauthorizedRequest> get copyWith => __$UnauthorizedRequestCopyWithImpl<_UnauthorizedRequest>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnauthorizedRequest&&(identical(other.reason, reason) || other.reason == reason));
}


@override
int get hashCode => Object.hash(runtimeType,reason);

@override
String toString() {
  return 'NetworkException.unauthorizedRequest(reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$UnauthorizedRequestCopyWith<$Res> implements $NetworkExceptionCopyWith<$Res> {
  factory _$UnauthorizedRequestCopyWith(_UnauthorizedRequest value, $Res Function(_UnauthorizedRequest) _then) = __$UnauthorizedRequestCopyWithImpl;
@useResult
$Res call({
 String reason
});




}
/// @nodoc
class __$UnauthorizedRequestCopyWithImpl<$Res>
    implements _$UnauthorizedRequestCopyWith<$Res> {
  __$UnauthorizedRequestCopyWithImpl(this._self, this._then);

  final _UnauthorizedRequest _self;
  final $Res Function(_UnauthorizedRequest) _then;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reason = null,}) {
  return _then(_UnauthorizedRequest(
null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _BadRequest implements NetworkException {
  const _BadRequest();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BadRequest);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkException.badRequest()';
}


}




/// @nodoc


class _NotFound implements NetworkException {
  const _NotFound(this.reason);
  

 final  String reason;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$NotFoundCopyWith<_NotFound> get copyWith => __$NotFoundCopyWithImpl<_NotFound>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotFound&&(identical(other.reason, reason) || other.reason == reason));
}


@override
int get hashCode => Object.hash(runtimeType,reason);

@override
String toString() {
  return 'NetworkException.notFound(reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$NotFoundCopyWith<$Res> implements $NetworkExceptionCopyWith<$Res> {
  factory _$NotFoundCopyWith(_NotFound value, $Res Function(_NotFound) _then) = __$NotFoundCopyWithImpl;
@useResult
$Res call({
 String reason
});




}
/// @nodoc
class __$NotFoundCopyWithImpl<$Res>
    implements _$NotFoundCopyWith<$Res> {
  __$NotFoundCopyWithImpl(this._self, this._then);

  final _NotFound _self;
  final $Res Function(_NotFound) _then;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reason = null,}) {
  return _then(_NotFound(
null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _MethodNotAllowed implements NetworkException {
  const _MethodNotAllowed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MethodNotAllowed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkException.methodNotAllowed()';
}


}




/// @nodoc


class _NotAcceptable implements NetworkException {
  const _NotAcceptable();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotAcceptable);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkException.notAcceptable()';
}


}




/// @nodoc


class _RequestTimeout implements NetworkException {
  const _RequestTimeout();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _RequestTimeout);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkException.requestTimeout()';
}


}




/// @nodoc


class _SendTimeout implements NetworkException {
  const _SendTimeout();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SendTimeout);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkException.sendTimeout()';
}


}




/// @nodoc


class _UnprocessableEntity implements NetworkException {
  const _UnprocessableEntity(this.reason);
  

 final  String reason;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UnprocessableEntityCopyWith<_UnprocessableEntity> get copyWith => __$UnprocessableEntityCopyWithImpl<_UnprocessableEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnprocessableEntity&&(identical(other.reason, reason) || other.reason == reason));
}


@override
int get hashCode => Object.hash(runtimeType,reason);

@override
String toString() {
  return 'NetworkException.unprocessableEntity(reason: $reason)';
}


}

/// @nodoc
abstract mixin class _$UnprocessableEntityCopyWith<$Res> implements $NetworkExceptionCopyWith<$Res> {
  factory _$UnprocessableEntityCopyWith(_UnprocessableEntity value, $Res Function(_UnprocessableEntity) _then) = __$UnprocessableEntityCopyWithImpl;
@useResult
$Res call({
 String reason
});




}
/// @nodoc
class __$UnprocessableEntityCopyWithImpl<$Res>
    implements _$UnprocessableEntityCopyWith<$Res> {
  __$UnprocessableEntityCopyWithImpl(this._self, this._then);

  final _UnprocessableEntity _self;
  final $Res Function(_UnprocessableEntity) _then;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? reason = null,}) {
  return _then(_UnprocessableEntity(
null == reason ? _self.reason : reason // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _Conflict implements NetworkException {
  const _Conflict();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Conflict);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkException.conflict()';
}


}




/// @nodoc


class _InternalServerError implements NetworkException {
  const _InternalServerError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _InternalServerError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkException.internalServerError()';
}


}




/// @nodoc


class _NotImplemented implements NetworkException {
  const _NotImplemented();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NotImplemented);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkException.notImplemented()';
}


}




/// @nodoc


class _ServiceUnavailable implements NetworkException {
  const _ServiceUnavailable();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServiceUnavailable);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkException.serviceUnavailable()';
}


}




/// @nodoc


class _NoInternetConnection implements NetworkException {
  const _NoInternetConnection();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _NoInternetConnection);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkException.noInternetConnection()';
}


}




/// @nodoc


class _FormatException implements NetworkException {
  const _FormatException();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FormatException);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkException.formatException()';
}


}




/// @nodoc


class _UnableToProcess implements NetworkException {
  const _UnableToProcess();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnableToProcess);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkException.unableToProcess()';
}


}




/// @nodoc


class _DefaultError implements NetworkException {
  const _DefaultError(this.error);
  

 final  String error;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DefaultErrorCopyWith<_DefaultError> get copyWith => __$DefaultErrorCopyWithImpl<_DefaultError>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DefaultError&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,error);

@override
String toString() {
  return 'NetworkException.defaultError(error: $error)';
}


}

/// @nodoc
abstract mixin class _$DefaultErrorCopyWith<$Res> implements $NetworkExceptionCopyWith<$Res> {
  factory _$DefaultErrorCopyWith(_DefaultError value, $Res Function(_DefaultError) _then) = __$DefaultErrorCopyWithImpl;
@useResult
$Res call({
 String error
});




}
/// @nodoc
class __$DefaultErrorCopyWithImpl<$Res>
    implements _$DefaultErrorCopyWith<$Res> {
  __$DefaultErrorCopyWithImpl(this._self, this._then);

  final _DefaultError _self;
  final $Res Function(_DefaultError) _then;

/// Create a copy of NetworkException
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? error = null,}) {
  return _then(_DefaultError(
null == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class _UnexpectedError implements NetworkException {
  const _UnexpectedError();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UnexpectedError);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'NetworkException.unexpectedError()';
}


}




// dart format on
