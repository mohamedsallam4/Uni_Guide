import 'package:bloc_statemanagement/features/Auth/reset_pass/data/repo/reset_repo.dart';
import 'package:bloc_statemanagement/features/Auth/reset_pass/manager/reset_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPassCubit extends Cubit<ResetPassState> {
  final ResetPassRepo repo;
  ResetPassCubit(this.repo) : super(ResetPassInitial());
  static ResetPassCubit get(context) => BlocProvider.of(context);
  final passwordController = TextEditingController();
  final confirmController = TextEditingController();
  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;
  final formKey = GlobalKey<FormState>();
  Future resetPassword() async {
    if (!formKey.currentState!.validate()) return;
    emit(ResetPassLoading());
    final result = await repo.resetPassword(
      password: passwordController.text,
      confirmPassword: confirmController.text,
    );
    result.fold(
          (error) => emit(ResetPassError(error)),
          (message) => emit(ResetPassSuccess(message)),
    );
  }
  void changePassVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(Chanagepassvisiabilty());
  }
  void changeConfirmPassVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    emit(ChanageConfirmpassvisiabilty());
  }
}