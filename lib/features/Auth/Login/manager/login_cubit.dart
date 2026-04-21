import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/api/api_key.dart';
import '../../../../core/helper/cache/cache_helper.dart';
import '../data/model/login_model.dart';
import '../data/repo/login_repo.dart';
import 'login states.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginRepo repo;

  LoginCubit(this.repo) : super(LoginInitial());

  static LoginCubit get(context) => BlocProvider.of(context);

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  bool isPasswordVisible = true;

  void changePasswordVisibility() {
    isPasswordVisible = !isPasswordVisible;
    emit(LoginChangePasswordVisibility());
  }

  Future<void> login() async {
    if (!formKey.currentState!.validate()) return;

    emit(LoginLoading());

    final result = await repo.login(
      email: emailController.text,
      password: passwordController.text,
    );

    result.fold(
          (error) {
        emit(LoginError(error.message ?? "حدث خطأ"));
      },
          (LoginModel model) async {
        await CacheHelper().setData(
          key: ApiKeys.token,
          value: model.data.accessToken,
        );

        await CacheHelper().setData(
          key: "refresh_token",
          value: model.data.refreshToken,
        );

        await CacheHelper().setData(
          key: ApiKeys.isLogged,
          value: true,
        );

        await CacheHelper().setData(
          key: "user_id",
          value: model.data.user.id,
        );

        await CacheHelper().setData(
          key: "user_name",
          value: model.data.user.name,
        );

        await CacheHelper().setData(
          key: "user_email",
          value: model.data.user.email,
        );
        await CacheHelper().setData(
          key: ApiKeys.userId,
          value: model.data.user.id,
        );
        emit(LoginSuccess(model.message));
      },
    );
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
  clean(){
    emailController.clear();
    passwordController.clear();
  }

}