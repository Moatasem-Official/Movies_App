import 'package:movies_app/core/errors/exceptions/network_exception.dart';
import 'package:movies_app/core/errors/failure.dart';

class FailureMapper {
  static Failure mapExceptionToFailure(NetworkException exception) {
    final message = NetworkException.getErrorMessage(exception);

    return exception.when(
      requestCancelled: () => NetworkFailure(message),
      unauthorizedRequest: (_) => NetworkFailure(message),
      badRequest: () => NetworkFailure(message),
      notFound: (_) => NetworkFailure(message),
      methodNotAllowed: () => NetworkFailure(message),
      notAcceptable: () => NetworkFailure(message),
      requestTimeout: () => NetworkFailure(message),
      sendTimeout: () => NetworkFailure(message),
      unprocessableEntity: (_) => NetworkFailure(message),
      conflict: () => NetworkFailure(message),
      internalServerError: () => NetworkFailure(message),
      notImplemented: () => NetworkFailure(message),
      serviceUnavailable: () => NetworkFailure(message),
      noInternetConnection: () => NetworkFailure("No Internet Connection"),
      formatException: () => CacheFailure("Data format exception"),
      unableToProcess: () => DatabaseFailure("Unable to process"),
      defaultError: (_) => UnknownFailure(message),
      unexpectedError: () => UnknownFailure(message),
    );
  }
}
