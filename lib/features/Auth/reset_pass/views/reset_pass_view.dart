import 'package:bloc_statemanagement/core/api/dio_consumer.dart';
import 'package:bloc_statemanagement/core/constants/asset_constants.dart';
import 'package:bloc_statemanagement/core/functions/custom_navigation.dart';
import 'package:bloc_statemanagement/core/functions/custom_snack_bar.dart';
import 'package:bloc_statemanagement/core/theme/app_colors.dart';
import 'package:bloc_statemanagement/core/utils/app_validators.dart';
import 'package:bloc_statemanagement/core/widgets/app_button.dart';
import 'package:bloc_statemanagement/core/widgets/app_text_field.dart';
import 'package:bloc_statemanagement/core/widgets/custom_svg.dart';
import 'package:bloc_statemanagement/features/Auth/Login/views/login_view.dart';
import 'package:bloc_statemanagement/features/Auth/reset_pass/data/repo/reset_repo.dart';
import 'package:bloc_statemanagement/features/Auth/reset_pass/manager/reset_cubit.dart';
import 'package:bloc_statemanagement/features/Auth/reset_pass/manager/reset_states.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class ResetPassView extends StatelessWidget {
  const ResetPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          ResetPassCubit(ResetPassRepo(DioConsumer(dio: Dio()))),
      child: Scaffold(
        backgroundColor: AppColors.onBackground,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: BlocConsumer<ResetPassCubit, ResetPassState>(
              listener: (context, state) {
                if (state is ResetPassSuccess) {
                  customSnackBar(
                    context: context,
                    message: state.message,
                    color: AppColors.primaryDark,
                  );

                  customPushReplacement(context, const LoginView());
                }

                if (state is ResetPassError) {
                  customSnackBar(
                    context: context,
                    message: state.error,
                    color: Colors.red,
                  );
                }
              },
              builder: (context, state) {
                final cubit = ResetPassCubit.get(context);

                return Form(
                  key: cubit.formKey,
                  child: Column(
                    children: [
                      SizedBox(height: 150.h),

                      CustomSvg(path: Assets.resetpPassword),

                      SizedBox(height: 20.h),

                      Text(
                        "كلمة المرور الجديدة 🔒",
                        style: GoogleFonts.ibmPlexSansArabic(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),

                      SizedBox(height: 15.h),

                      Text(
                        "قم بإنشاء كلمة مرور قوية لتأمين حسابك",
                        style: GoogleFonts.ibmPlexSansArabic(
                          fontSize: 18.sp,
                          color: AppColors.primaryDark.withOpacity(0.6),
                        ),
                      ),

                      SizedBox(height: 40.h),
                      CustomTextField(
                        label: "كلمة المرور الجديدة",
                        hintText: "••••••",
                        controller: cubit.passwordController,
                        obscureText: cubit.isPasswordVisible,
                        validator: AppValidator.passwordValidator,
                        icon: IconButton(
                          icon: Icon(
                            cubit.isPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: cubit.changePassVisibility,
                        ),
                        prefix: const Icon(Icons.lock_outline),
                      ),
                      CustomTextField(
                        label: "تأكيد كلمة المرور",
                        hintText: "••••••",
                        controller: cubit.confirmController,
                        obscureText: cubit.isConfirmPasswordVisible,
                        validator: (value) {
                          return AppValidator
                              .confirmPasswordValidator(
                            value,
                            cubit.passwordController.text,
                          );
                        },
                        icon: IconButton(
                          icon: Icon(
                            cubit.isConfirmPasswordVisible
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: cubit.changeConfirmPassVisibility,
                        ),
                        prefix: const Icon(Icons.lock_outline),
                      ),

                      SizedBox(height: 30.h),

                      state is ResetPassLoading
                          ? const CircularProgressIndicator()
                          : CustomButton(
                              text: "تغيير كلمة المرور",
                              textColor: AppColors.primaryDark,
                              onPressed: () {
                                if (cubit.formKey.currentState!.validate()) {
                                  cubit.resetPassword();
                                }
                              },
                            ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
