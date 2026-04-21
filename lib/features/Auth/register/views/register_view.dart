import 'package:bloc_statemanagement/core/utils/app_validators.dart';
import 'package:bloc_statemanagement/features/Auth/Login/views/login_view.dart';
import 'package:bloc_statemanagement/features/Auth/register/views/widgets/header_register.dart';
import 'package:bloc_statemanagement/features/Auth/register/views/widgets/terms_widget.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/api/dio_consumer.dart';
import '../../../../core/functions/custom_navigation.dart';
import '../../../../core/functions/custom_snack_bar.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../../setup_profile/views/setupPprofile_view.dart';
import '../data/repo/register_repo.dart';
import '../manager/register_cubit.dart';
import '../manager/register_state.dart';
class RegisterView extends StatelessWidget {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RegisterCubit(RegisterRepo(DioConsumer(dio: Dio()))),
      child: Scaffold(
        backgroundColor: AppColors.onBackground,
        body: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccess) {
              customSnackBar(
                context: context,
                message: "تم انشاء حساب بنجاح ",
                color: AppColors.primaryDark,
              );

              Future.delayed(const Duration(milliseconds: 300), () {
                if (!context.mounted)return;
                customPush(context, const LoginView());
              });

              context.read<RegisterCubit>().clear();

            }

            if (state is RegisterError) {
              customSnackBar(
                context: context,
                message: state.error,
                color: AppColors.cancelText,
              );
            }
          },

          builder: (context, state) {
            final cubit = context.watch<RegisterCubit>();

            return Directionality(
              textDirection: TextDirection.rtl,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25.w),

                child: Form(
                  key: cubit.formKey,
                
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const HeaderRegister(),
                                    
                        SizedBox(height: 32.h),
                                    
                        CustomTextField(
                          label: 'الاسم بالكامل',
                          validator: AppValidator.requiredValidator,
                          hintText: 'محمد أحمد',
                          controller: cubit.nameController,
                          prefix: Icon(
                            Icons.person_outline,
                            color: AppColors.primaryDark.withOpacity(0.4),
                          ),
                        ),
                                    
                        CustomTextField(
                          validator: AppValidator.emailValidator,
                          label: 'البريد الإلكتروني',
                          hintText: 'name@example.com',
                          controller: cubit.emailController,
                          prefix: Icon(
                            Icons.email_outlined,
                            color: AppColors.primaryDark.withOpacity(0.4),
                          ),
                        ),
                                    
                        CustomTextField(
                          validator: AppValidator.passwordValidator,
                          label: 'كلمة المرور',
                          hintText: '••••••',
                          controller: cubit.passwordController,
                          obscureText: cubit.isPasswordVisible,
                          icon: IconButton(
                            onPressed: cubit.changePassVisibility,
                            icon: Icon(
                              cubit.isPasswordVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                            ),
                            color:
                            AppColors.primaryDark.withOpacity(0.4),
                          ),
                          prefix: Icon(
                            Icons.lock_outline,
                            color:
                            AppColors.primaryDark.withOpacity(0.4),
                          ),
                        ),
                                    
                        CustomTextField(
                          validator: (value) {
                            return AppValidator
                                .confirmPasswordValidator(
                              value,
                              cubit.passwordController.text,
                            );
                          },
                          label: 'تأكيد كلمة المرور',
                          hintText: '••••••',
                          controller:
                          cubit.confirmPasswordController,
                          obscureText:
                          cubit.isConfirmPasswordVisible,
                          icon: IconButton(
                            onPressed:
                            cubit.changeConfirmPassVisibility,
                            icon: Icon(
                              cubit.isConfirmPasswordVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined,
                            ),
                            color:
                            AppColors.primaryDark.withOpacity(0.4),
                          ),
                          prefix: Icon(
                            Icons.check_circle_outline,
                            color:
                            AppColors.primaryDark.withOpacity(0.4),
                          ),
                        ),
                                    
                        SizedBox(height: 16.h),
                                    
                        TermsWidget(cubit: cubit),
                                    
                        SizedBox(height: 24.h),
                                    
                        CustomButton(
                          text: "إنشاء حساب",
                          isLoading: state is RegisterLoading,
                          onPressed: (state is RegisterLoading || !cubit.isTermsAccepted)
                              ? null
                              : () {
                            cubit.register(
                              name: cubit.nameController.text,
                              email: cubit.emailController.text,
                              password: cubit.passwordController.text,
                              confirmPassword:
                              cubit.confirmPasswordController.text,
                            );
                          },
                        ),
                        SizedBox(height: 24.h),
                                    
                        Row(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          children: [
                            Text(
                              'لديك حساب بالفعل؟',
                              style: GoogleFonts.ibmPlexSansArabic(
                                fontSize: 16.sp,
                                color: AppColors.secondary
                                    .withOpacity(0.6),
                              ),
                            ),
                            SizedBox(width: 6.w),
                            GestureDetector(
                              onTap: () {
                                customPushReplacement(
                                  context,
                                  const LoginView(),
                                );
                              },
                              child: Text(
                                'تسجيل الدخول',
                                style:
                                GoogleFonts.ibmPlexSansArabic(
                                  fontSize: 16.sp,
                                  color: AppColors.secondary,
                                  decoration:
                                  TextDecoration.underline,
                                ),
                              ),
                            ),
                          ],
                        ),
                                    
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}