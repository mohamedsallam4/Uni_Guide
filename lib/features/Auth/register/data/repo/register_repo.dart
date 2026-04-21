import 'package:dartz/dartz.dart';
import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/api/api_key.dart';
import '../../../../../core/errors/exception.dart';
import '../model/register_model.dart';
class RegisterRepo {
  final ApiConsumer api;

  RegisterRepo(this.api);

  Future<Either<String, RegisterModel>> register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await api.post(
        EndPoint.register,
        data: {
          "name": name,
          "email": email,
          "password": password,
          "password_confirmation": confirmPassword,
        },
      );

      return right(RegisterModel.fromJson(response));

    } on ServerException catch (e) {
      return left(e.errModel.message ?? "Something went wrong");
    }
  }
}
