import 'package:bloc_statemanagement/features/Auth/register/manager/register_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/repo/register_repo.dart';
class RegisterCubit extends Cubit<RegisterState> {
  final RegisterRepo repo;
  final formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  bool isPasswordVisible = true;
  bool isConfirmPasswordVisible = true;
  bool isTermsAccepted = false;



  RegisterCubit(this.repo) : super(RegisterInitial());

  void changePassVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(RegisterChangePassVisibility());
  }
  void changeConfirmPassVisibility() {
    isConfirmPasswordVisible = !isConfirmPasswordVisible;
    emit(RegisterChangeConfirmPassVisibility());
  }
  void acceptTerms() {
    isTermsAccepted = !isTermsAccepted;
    emit(RegisterChangeTerms());
  }


  Future register({
    required String name,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    if (!formKey.currentState!.validate()) return;
    if (!isTermsAccepted){
      emit(RegisterError("يجب الموافقة على الشروط والأحكام"));
      return;
    }
    emit(RegisterLoading());
    final result = await repo.register(
      name: name,
      email: email,
      password: password,
      confirmPassword: confirmPassword,
    );

    result.fold(
          (error) => emit(RegisterError(error)),
          (model) => emit(RegisterSuccess(model.message)),
    );
  }

  clear(){
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    confirmPasswordController.clear();
    isPasswordVisible = true;
    isConfirmPasswordVisible = true;
    isTermsAccepted = false;
  }

  }

