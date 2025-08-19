import 'package:movies_app/core/error/exceptions/network_exception.dart';
import 'package:movies_app/core/error/failure.dart';

class FailureMapper {
  static Failure mapExceptionToFailure(NetworkException exception) {
    final message = NetworkException.getErrorMessage(exception);

    return exception.when(
      requestCancelled: () => ServerFailure(message),
      unauthorizedRequest: (_) => ServerFailure(message),
      badRequest: () => ServerFailure(message),
      notFound: (_) => ServerFailure(message),
      methodNotAllowed: () => ServerFailure(message),
      notAcceptable: () => ServerFailure(message),
      requestTimeout: () => ServerFailure(message),
      sendTimeout: () => ServerFailure(message),
      unprocessableEntity: (_) => ServerFailure(message),
      conflict: () => ServerFailure(message),
      internalServerError: () => ServerFailure(message),
      notImplemented: () => ServerFailure(message),
      serviceUnavailable: () => ServerFailure(message),
      noInternetConnection: () => ServerFailure("No Internet Connection"),
      formatException: () => CacheFailure("Data format exception"),
      unableToProcess: () => DatabaseFailure("Unable to process"),
      defaultError: (_) => UnknownFailure(message),
      unexpectedError: () => UnknownFailure(message),
    );
  }
}
