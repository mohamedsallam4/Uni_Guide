import 'package:bloc_statemanagement/core/api/dio_consumer.dart';
import 'package:bloc_statemanagement/core/functions/custom_navigation.dart';
import 'package:bloc_statemanagement/core/utils/app_validators.dart';
import 'package:bloc_statemanagement/core/widgets/app_button.dart';
import 'package:bloc_statemanagement/features/Auth/Login/manager/login_cubit.dart';
import 'package:bloc_statemanagement/features/Auth/Login/views/widgets/header_login.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/api/api_key.dart';
import '../../../../core/functions/custom_snack_bar.dart';
import '../../../../core/helper/cache/cache_helper.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../layout_view/views/layout_view.dart';
import '../../../setup_profile/views/setupPprofile_view.dart';
import '../../forget_pass/views/forget_pass_view.dart';
import '../../register/views/register_view.dart';
import '../data/repo/login_repo.dart';
import '../manager/login states.dart';
class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          LoginCubit(LoginRepo(
            DioConsumer(dio: Dio()),
          )),
      child: Scaffold(
          backgroundColor: AppColors.onBackground,
          body: BlocConsumer<LoginCubit, LoginState>(
            listener: (context, state) {
              if (state is LoginSuccess) {

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: AppColors.primaryDark,
                    duration: const Duration(milliseconds:1500),
                    content: Text(
                      state.message,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    )
                  ));
                Future.delayed(const Duration(milliseconds: 300), () {
                  if (!context.mounted) return;

                  final userId = CacheHelper().getData(key: ApiKeys.userId);

                  final isProfileCompleted =
                      CacheHelper().getData(key: "profile_completed_$userId") ?? false;

                  if (isProfileCompleted) {
                    customPushReplacement(context, const LayoutView());
                  } else {
                    customPushReplacement(context, const SetupProfileView());
                  }
                });
                context.read<LoginCubit>().clean();
              }
              if(state is LoginError) {
                customSnackBar(
                  context: context,
                  message: state.error,
                  color: AppColors.cancelText,
                );
              }
            },
            builder: (context, state) {
              final cubit= LoginCubit.get(context);
              return Form(
                key: cubit.formKey,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 25.w),
                  child: Directionality(
                    textDirection: TextDirection.rtl,
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          HeaderLogin(),
                          SizedBox(height: 40.h),
                          CustomTextField(
                            label: 'البريد الإلكتروني',
                            hintText: 'name@example.com',
                            controller: cubit.emailController,
                            validator: AppValidator.emailValidator,
                            prefix: Icon(
                              Icons.email_outlined,
                              color: AppColors.primaryDark.withOpacity(0.4),
                            ),
                          ),
                          SizedBox(height: 20.h),
                          CustomTextField(
                            validator: AppValidator.passwordValidator,
                            label: 'كلمة المرور',
                            hintText: '••••••',
                            controller: cubit.passwordController,
                            obscureText: cubit.isPasswordVisible,
                            icon: IconButton(
                              onPressed: (){
                                cubit.changePasswordVisibility();
                              },
                             icon:Icon(
                               cubit.isPasswordVisible
                                   ? Icons.visibility_off
                                   : Icons.visibility,
                             ),
                              color: AppColors.primaryDark.withOpacity(0.4),
                            ),
                            prefix: Icon(
                              Icons.lock_outline,
                              color: AppColors.primaryDark.withOpacity(0.4),
                            ),
                          ),
                      
                          SizedBox(height: 15.h),
                      
                          Align(
                            alignment: Alignment.centerLeft,
                            child: TextButton(
                              onPressed: () {
                                customPush(context, const ForgetPassView());
                              },
                              child: Text(
                                'نسيت كلمة المرور؟',
                                style: GoogleFonts.ibmPlexSansArabic(
                                  fontSize: 14.sp,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.primaryDark.withOpacity(0.9),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 24.h),
                          CustomButton(
                            color: AppColors.primary,
                            textColor: AppColors.primaryDark,
                            text: "تسجيل الدخول",
                            onPressed: () {
                              cubit.login();
                            },
                            icon: state is LoginLoading
                                ? SizedBox(
                              width: 20.w,
                              height: 20.h,
                              child: const CircularProgressIndicator(
                                strokeWidth: 2,
                              ),
                            )
                                : null,
                          ),
                          SizedBox(height: 80.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'ليس لديك حساب؟',
                                style: GoogleFonts.ibmPlexSansArabic(
                                  fontSize: 16.sp,
                                  color: AppColors.secondary.withOpacity(0.6),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                      
                              SizedBox(width: 6.w),
                      
                              GestureDetector(
                                onTap: () {
                                  customPushReplacement(
                                      context, const RegisterView());
                                },
                                child: Text(
                                  'إنشاء حساب جديد',
                                  style: GoogleFonts.ibmPlexSansArabic(
                                    fontSize: 16.sp,
                                    color: AppColors.secondary,
                                    fontWeight: FontWeight.w400,
                                    decoration: TextDecoration.underline,
                                    decorationColor: AppColors.primary,
                                    decorationThickness: 1,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            },
          )
      ),
    );
  }
}
