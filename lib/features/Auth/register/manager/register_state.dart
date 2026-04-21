abstract class RegisterState {}

class RegisterInitial extends RegisterState {}

class RegisterLoading extends RegisterState {}

class RegisterSuccess extends RegisterState {
  final String message;
  RegisterSuccess(this.message);
}

class RegisterError extends RegisterState {
  final String error;
  RegisterError(this.error);
}

class RegisterChangePassVisibility extends RegisterState {}

class RegisterChangeConfirmPassVisibility extends RegisterState {}

class RegisterChangeTerms extends RegisterState {}