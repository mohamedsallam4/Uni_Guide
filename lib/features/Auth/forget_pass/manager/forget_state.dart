import '../data/model/forget_model.dart';

abstract class ForgetPasswordState {}

class ForgetPasswordInitial extends ForgetPasswordState {}

class ForgetPasswordLoading extends ForgetPasswordState {}

class ForgetPasswordSuccess extends ForgetPasswordState {
  final ForgetPasswordModel model;
  ForgetPasswordSuccess(this.model);
}

class ForgetPasswordError extends ForgetPasswordState {
  final String error;
  ForgetPasswordError(this.error);
}