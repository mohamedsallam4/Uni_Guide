import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/api/api_key.dart';
import '../../../../core/helper/cache/cache_helper.dart';
import '../data/repo/otp_repo.dart';
import 'otp_states.dart';

class OtpCubit extends Cubit<OtpState> {
  final OtpRepo repo;

  OtpCubit(this.repo) : super(OtpInitial());

  static OtpCubit get(context) => BlocProvider.of(context);

  List<String> values = ["", "", "", "","",""];
  int currentIndex = 0;

  int seconds = 30;
  Timer? timer;

  String get code => values.join();

  void addNumber(String number) {
    if (currentIndex < 6) {
      values[currentIndex] = number;
      currentIndex++;
      emit(OtpUpdated());
    }
  }
  void fillOtp(String otp) {
    values = otp.split("");
    currentIndex = values.length;
    emit(OtpUpdated());
  }

  void deleteNumber() {
    if (currentIndex > 0) {
      currentIndex--;
      values[currentIndex] = "";
      emit(OtpUpdated());
    }
  }

  void startTimer() {
    timer?.cancel();
    seconds = 30;

    timer = Timer.periodic(const Duration(seconds: 1), (t) {
      if (seconds == 0) {
        t.cancel();
      } else {
        seconds--;
        emit(OtpTimerUpdated());
      }
    });
  }

  Future verify(String email) async {
    if (code.length < 6) {
      emit(OtpError("أدخل الكود كامل"));
      return;
    }

    emit(OtpLoading());

    final result = await repo.verifyOtp(
      email: email,
      otp: code,
    );

    result.fold(
          (error) => emit(OtpError(error)),
          (model)async {
            emit(OtpSuccess(model.message));
            await CacheHelper().setData(
              key: ApiKeys.token,
              value: model.data.accessToken,
            );
          },
    );
  }
  Future resend(String email) async {
    emit(OtpResendLoading());

    final result = await repo.resendOtp(email: email);

    result.fold(
          (error) => emit(OtpResendError(error)),
          (otp) {
        startTimer();
        values = ["", "", "", "", "", ""];
        currentIndex = 0;

        fillOtp(otp);

        emit(OtpResendSuccess("تم إعادة إرسال الرمز"));
      },
    );
  }

  @override
  Future<void> close() {
    timer?.cancel();
    return super.close();
  }
}