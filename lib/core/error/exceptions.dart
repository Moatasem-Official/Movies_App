import 'package:movies_app/core/network/error_model.dart';

class NetworkExceptions implements Exception {
  final ErrorModel errorModel;

  NetworkExceptions(this.errorModel);
}

class CacheException implements Exception {
  String message;

  CacheException(this.message);
}
