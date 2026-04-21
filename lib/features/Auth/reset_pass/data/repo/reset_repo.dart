import 'package:dartz/dartz.dart';
import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/errors/exception.dart';

class ResetPassRepo {
  final ApiConsumer api;

  ResetPassRepo(this.api);

  Future<Either<String, String>> resetPassword({
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await api.post(
        "/api/auth/reset-Password",
        data: {
          "password": password,
          "password_confirmation": confirmPassword,
        },
        isFromData: true,
      );

      return right(response['message']);
    } on ServerException catch (e) {
      return left(e.errModel.message ?? "حدث خطأ");
    }
  }
}