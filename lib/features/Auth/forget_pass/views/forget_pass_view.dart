import 'package:bloc_statemanagement/core/api/dio_consumer.dart';
import 'package:bloc_statemanagement/core/functions/custom_navigation.dart';
import 'package:bloc_statemanagement/core/widgets/custom_svg.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/asset_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/utils/app_validators.dart';
import '../../../../core/widgets/app_button.dart';
import '../../../../core/widgets/app_text_field.dart';
import '../../otp/views/otp_views.dart';
import '../data/repo/foreget_repo.dart';
import '../manager/forget_cubit.dart';
import '../manager/forget_state.dart';

class ForgetPassView extends StatelessWidget {
  const ForgetPassView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgetPasswordCubit(
        ForgetPassRepo(DioConsumer(
          dio: Dio(),
        )),
      ),
      child: Scaffold(
        backgroundColor: AppColors.onBackground,
        appBar: AppBar(
            backgroundColor: AppColors.onBackground,
            elevation: 0,
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                icon: Icon(Icons.arrow_forward, color: AppColors.primaryDark),
                onPressed: () => Navigator.pop(context),
              ),
            ]
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 25.w),
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
              listener: (context, state) {
                final cubit = context.read<ForgetPasswordCubit>();
                if (state is ForgetPasswordError) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.error),
                        backgroundColor: AppColors.cancelText,
                      ));
                  cubit.emailController.clear();
                }
                if (state is ForgetPasswordSuccess) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(state.model.message),
                        backgroundColor: AppColors.primaryDark,
                      ));
                  customPush(context, OtpViews(
                    otp:state.model.otp,
                    email:cubit.emailController.text,
                  ));
                }

              },
              builder: (context, state) {
                final cubit = context.read<ForgetPasswordCubit>();
                return Form(
                  key: cubit.formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 100.h),
                        Container(
                            width: 100.w,
                            height: 100.w,
                            decoration: BoxDecoration(
                              color: AppColors.primaryDark,
                              borderRadius: BorderRadius.circular(28.r),
                            ),
                            child: Transform.rotate(
                              angle: -3 * 3.1416 / 180,
                              child: Container(
                                  width: 96.w,
                                  height: 96.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: AppColors.primaryDark,
                                    borderRadius: BorderRadius.circular(32.r),
                    
                                    border: Border.all(
                                      color: AppColors.primaryDark.withOpacity(0.1),
                                      width: 1,
                                    ),
                    
                                    boxShadow: [
                                      BoxShadow(
                                        color: AppColors.primaryDark.withOpacity(
                                            0.05),
                                        offset: const Offset(0, 4),
                                        blurRadius: 6,
                                        spreadRadius: -4,
                                      ),
                                    ],
                                  ),
                                  child: CustomSvg(path: Assets
                                      .assetsImagesForgetPassword)
                              ),
                            )
                        ),
                    
                        SizedBox(height: 38.h),
                    
                        Text(
                          'نسيت كلمة المرور؟',
                          style: GoogleFonts.ibmPlexSansArabic(
                            fontSize: 30.sp,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryDark,
                          ),
                        ),
                    
                        SizedBox(height: 12.h),
                    
                        Text(
                          'متقلقش، دخل بريدك الإلكتروني وهيبعتلك\nرمز لإعادة التعيين.',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.ibmPlexSansArabic(
                            fontSize: 18.sp,
                            color: AppColors.primaryDark.withOpacity(0.6),
                          ),
                        ),
                    
                        SizedBox(height: 41.h),
                    
                        CustomTextField(
                          label: 'البريد الإلكتروني',
                          hintText: 'name@example.com',
                          controller:cubit.emailController,
                          prefix: Icon(
                            Icons.email_outlined,
                            color: AppColors.primaryDark.withOpacity(0.4),
                          ),
                          validator: AppValidator.emailValidator,
                    
                        ),
                    
                        SizedBox(height: 24.h),
                       state is ForgetPasswordLoading ? Center(child: CircularProgressIndicator()):
                       CustomButton(
                          text: "إرسال الرمز",
                          color: AppColors.primary,
                          textColor: AppColors.primaryDark,
                          icon: Icon(
                              Icons.arrow_forward, color: AppColors.primaryDark),
                          onPressed: () {
                            cubit.sendOtp();
                          },
                        ),
                      ],
                    ),
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
