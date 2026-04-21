import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repo/foreget_repo.dart';
import 'forget_state.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordState> {
  final ForgetPassRepo repo;

  ForgetPasswordCubit(this.repo) : super(ForgetPasswordInitial());

  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  Future sendOtp() async {
    if (!formKey.currentState!.validate()) return;

    emit(ForgetPasswordLoading());

    final result = await repo.forgetPassword(
      email: emailController.text,
    );

    result.fold(
          (error) => emit(ForgetPasswordError(error)),
          (model) => emit(ForgetPasswordSuccess(model)),
    );
  }
}