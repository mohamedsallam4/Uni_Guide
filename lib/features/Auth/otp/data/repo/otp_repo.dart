import 'package:dartz/dartz.dart';

import '../../../../../core/api/api_consumer.dart';
import '../../../../../core/errors/exception.dart';
import '../model/otp_model.dart';

class OtpRepo {
  final ApiConsumer api;

  OtpRepo(this.api);

  Future<Either<String, VerifyOtpModel>> verifyOtp({
    required String email,
    required String otp,
  }) async {
    try {
      final response = await api.post(
        "/api/verify-Otp",
        data: {
          "email": email,
          "otp": otp,
        },
        isFromData: true,
      );

      return right(VerifyOtpModel.fromJson(response));
    } on ServerException catch (e) {
      return left(e.errModel.message ?? "حدث خطأ");
    }
  }
  Future<Either<String, String>> resendOtp({
    required String email,
  }) async {
    try {
      final response = await api.post(
        "/api/resendOtp",
        data: {
          "email": email,
        },
        isFromData: true,
      );

      return right(response['data']['otp'].toString());
    } on ServerException catch (e) {
      return left(e.errModel.message ?? "حدث خطأ");
    }
  }
}