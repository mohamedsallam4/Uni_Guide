import 'package:dartz/dartz.dart';
import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/api/api_key.dart';
import '../../../../../core/errors/exception.dart';
import '../model/forget_model.dart';

class ForgetPassRepo {
  final ApiConsumer api;

  ForgetPassRepo(this.api);

  Future<Either<String, ForgetPasswordModel>> forgetPassword({
    required String email,
  }) async {
    try {
      final response = await api.post(
        EndPoint.forgetPassword,
        data: {
          "email": email,
        },
      );

      return right(ForgetPasswordModel.fromJson(response));
    } on ServerException catch (e) {
      return left(e.errModel.message ?? "حدث خطأ");
    }
  }
}