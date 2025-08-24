import 'dart:io';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:movies_app/core/network/error_model.dart';

part 'network_exception.freezed.dart';

@freezed
abstract class NetworkException with _$NetworkException {
  const factory NetworkException.requestCancelled() = _RequestCancelled;

  const factory NetworkException.unauthorizedRequest(String reason) =
      _UnauthorizedRequest;

  const factory NetworkException.badRequest() = _BadRequest;

  const factory NetworkException.notFound(String reason) = _NotFound;
  const factory NetworkException.methodNotAllowed() = _MethodNotAllowed;
  const factory NetworkException.notAcceptable() = _NotAcceptable;
  const factory NetworkException.requestTimeout() = _RequestTimeout;
  const factory NetworkException.sendTimeout() = _SendTimeout;
  const factory NetworkException.unprocessableEntity(String reason) =
      _UnprocessableEntity;
  const factory NetworkException.conflict() = _Conflict;
  const factory NetworkException.internalServerError() = _InternalServerError;
  const factory NetworkException.notImplemented() = _NotImplemented;
  const factory NetworkException.serviceUnavailable() = _ServiceUnavailable;
  const factory NetworkException.noInternetConnection() = _NoInternetConnection;
  const factory NetworkException.formatException() = _FormatException;
  const factory NetworkException.unableToProcess() = _UnableToProcess;
  const factory NetworkException.defaultError(String error) = _DefaultError;
  const factory NetworkException.unexpectedError() = _UnexpectedError;

  static NetworkException handleResponse(Response? response) {
    final data = response?.data;
    String allErrors = '';
    if (data is Map<String, dynamic>) {
      try {
        final one = ErrorModel.fromJson(data);
        allErrors = one.statusMessage;
      } catch (_) {
        allErrors = data.toString();
      }
    }

    final statusCode = response?.statusCode ?? 0;
    switch (statusCode) {
      case 400:
      case 401:
      case 403:
        return NetworkException.unauthorizedRequest(allErrors);
      case 404:
        return NetworkException.notFound(allErrors);
      case 409:
        return const NetworkException.conflict();
      case 408:
        return const NetworkException.requestTimeout();
      case 422:
        return NetworkException.unprocessableEntity(allErrors);
      case 500:
        return const NetworkException.internalServerError();
      case 503:
        return const NetworkException.serviceUnavailable();
      default:
        var responseCode = statusCode;
        return NetworkException.defaultError(
          "Received invalid status code: $responseCode",
        );
    }
  }

  static NetworkException getDioException(error) {
    if (error is Exception) {
      try {
        NetworkException networkExceptions;
        if (error is DioException) {
          switch (error.type) {
            case DioExceptionType.cancel:
              networkExceptions = const NetworkException.requestCancelled();
              break;
            case DioExceptionType.connectionTimeout:
              networkExceptions = const NetworkException.requestTimeout();
              break;
            case DioExceptionType.unknown:
              networkExceptions = const NetworkException.noInternetConnection();
              break;
            case DioExceptionType.receiveTimeout:
              networkExceptions = const NetworkException.sendTimeout();
              break;
            case DioExceptionType.badResponse:
              networkExceptions = NetworkException.handleResponse(
                error.response,
              );
              break;
            case DioExceptionType.sendTimeout:
              networkExceptions = const NetworkException.sendTimeout();
              break;
            case DioExceptionType.badCertificate:
              networkExceptions = const NetworkException.unexpectedError();
              break;
            case DioExceptionType.connectionError:
              networkExceptions = const NetworkException.noInternetConnection();
              break;
          }
        } else if (error is SocketException) {
          networkExceptions = const NetworkException.noInternetConnection();
        } else {
          networkExceptions = const NetworkException.unexpectedError();
        }
        return networkExceptions;
      } on FormatException {
        return const NetworkException.formatException();
      } catch (_) {
        return const NetworkException.unexpectedError();
      }
    } else {
      if (error.toString().contains("is not a subtype of")) {
        return const NetworkException.unableToProcess();
      } else {
        return const NetworkException.unexpectedError();
      }
    }
  }

  static String getErrorMessage(NetworkException networkException) {
    var errorMessage = "";
    networkException.when(
      notImplemented: () {
        errorMessage = "This feature is not available right now.";
      },
      requestCancelled: () {
        errorMessage = "The request was cancelled.";
      },
      internalServerError: () {
        errorMessage =
            "Something went wrong on our side. Please try again later.";
      },
      notFound: (String reason) {
        errorMessage = reason.isNotEmpty
            ? reason
            : "The requested resource was not found.";
      },
      serviceUnavailable: () {
        errorMessage = "The service is currently unavailable.";
      },
      methodNotAllowed: () {
        errorMessage = "This request is not allowed.";
      },
      badRequest: () {
        errorMessage = "Invalid request. Please check and try again.";
      },
      unauthorizedRequest: (String error) {
        errorMessage = error.isNotEmpty
            ? error
            : "You are not authorized to perform this action.";
      },
      unprocessableEntity: (String error) {
        errorMessage = error.isNotEmpty
            ? error
            : "We couldn't process your request.";
      },
      unexpectedError: () {
        errorMessage = "An unexpected error occurred. Please try again.";
      },
      requestTimeout: () {
        errorMessage = "The connection timed out. Please try again.";
      },
      noInternetConnection: () {
        errorMessage = "Please check your internet connection.";
      },
      conflict: () {
        errorMessage = "A conflict occurred while processing your request.";
      },
      sendTimeout: () {
        errorMessage = "Sending data took too long. Please try again.";
      },
      unableToProcess: () {
        errorMessage = "We couldn't process the data.";
      },
      defaultError: (String error) {
        errorMessage = error.isNotEmpty
            ? error
            : "An error occurred. Please try again.";
      },
      formatException: () {
        errorMessage = "The data format is invalid.";
      },
      notAcceptable: () {
        errorMessage = "The request is not acceptable.";
      },
    );
    return errorMessage;
  }
}
