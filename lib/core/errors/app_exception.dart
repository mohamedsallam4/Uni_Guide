class AppException implements Exception {
  final String message;
  final int? statusCode;

  AppException(this.message, {this.statusCode});

  @override
  String toString() => message;
}

class NetworkException extends AppException {
  NetworkException(String message) : super(message);
}

class ServerException extends AppException {
  ServerException(String message, int statusCode) : super(message, statusCode: statusCode);
}

class CacheException extends AppException {
  CacheException(String message) : super(message);
}