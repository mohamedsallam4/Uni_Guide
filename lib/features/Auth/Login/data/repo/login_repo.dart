import 'package:dartz/dartz.dart';
import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/api/api_key.dart';
import '../../../../../core/errors/error_model.dart';
import '../../../../../core/errors/exception.dart';
import '../model/login_model.dart';

class LoginRepo {
  final ApiConsumer api;

  LoginRepo(this.api);

  Future<Either<ErrorModel, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await api.post(
        EndPoint.login,
        data: {
          ApiKeys.email: email,
          ApiKeys.password: password,
        },
      );

      final model = LoginModel.fromJson(response);

      return right(model);

    } on ServerException catch (e) {
      return left(e.errModel);
    } catch (e) {
      return left(
        ErrorModel(message: "Unexpected error"),
      );
    }
  }
}