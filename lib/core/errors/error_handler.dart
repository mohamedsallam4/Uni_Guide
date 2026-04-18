import 'app_exception.dart';

class ErrorHandler {
  static String handleError(dynamic error) {
    if (error is AppException) {
      return error.message;
    } else if (error is Exception) {
      return 'An unexpected error occurred: ${error.toString()}';
    } else {
      return 'Unknown error';
    }
  }

  static AppException mapToAppException(dynamic error) {
    if (error is AppException) {
      return error;
    } else {
      return AppException('Unknown error: $error');
    }
  }
}