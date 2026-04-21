abstract class ResetPassState {}

class ResetPassInitial extends ResetPassState {}

class ResetPassLoading extends ResetPassState {}

class ResetPassSuccess extends ResetPassState {
  final String message;

  ResetPassSuccess(this.message);
}

class ResetPassError extends ResetPassState {
  final String error;

  ResetPassError(this.error);
}

class Chanagepassvisiabilty extends ResetPassState{}

class ChanageConfirmpassvisiabilty extends ResetPassState{}
