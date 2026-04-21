abstract class OtpState {}

class OtpInitial extends OtpState {}

class OtpUpdated extends OtpState {}

class OtpTimerUpdated extends OtpState {}

class OtpLoading extends OtpState {}

class OtpSuccess extends OtpState {
  final String message;
  OtpSuccess(this.message);
}

class OtpError extends OtpState {
  final String message;
  OtpError(this.message);
}
class OtpResendLoading extends OtpState {}

class OtpResendSuccess extends OtpState {
  final String message;
  OtpResendSuccess(this.message);
}

class OtpResendError extends OtpState {
  final String error;
  OtpResendError(this.error);
}