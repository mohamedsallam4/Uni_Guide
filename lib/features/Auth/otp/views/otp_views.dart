import 'package:bloc_statemanagement/core/api/dio_consumer.dart';
import 'package:bloc_statemanagement/core/functions/custom_navigation.dart';
import 'package:bloc_statemanagement/core/widgets/app_button.dart';
import 'package:bloc_statemanagement/features/Auth/otp/data/repo/otp_repo.dart';
import 'package:bloc_statemanagement/features/Auth/otp/manager/otp_cubit.dart';
import 'package:bloc_statemanagement/features/Auth/otp/manager/otp_states.dart';
import 'package:bloc_statemanagement/features/Auth/otp/views/widgets/kayboard_widget.dart';
import 'package:bloc_statemanagement/features/Auth/otp/views/widgets/mask_email.dart';
import 'package:bloc_statemanagement/features/Auth/reset_pass/views/reset_pass_view.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/functions/custom_snack_bar.dart';
import '../../../../core/theme/app_colors.dart';

class OtpViews extends StatelessWidget {
  const OtpViews({super.key, required this.otp, required this.email});

  final String otp;
  final String email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = OtpCubit(
          OtpRepo(DioConsumer(dio: Dio())),
        );

        cubit.startTimer();
        cubit.fillOtp(otp);

        return cubit;
      },
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
            SizedBox(width: 15.w,)
          ],
        ),
        body: BlocConsumer<OtpCubit,OtpState>(
          listener: (context, state) {
            if (state is OtpSuccess) {
              customSnackBar(
                context:context,
                message: state.message,
                color: AppColors.primaryDark,
              );
              customPush(context, ResetPassView());
            }

            if (state is OtpError) {
              customSnackBar(
                context:context,
                message: state.message,
                color: Colors.red,
              );
            }

            if (state is OtpResendSuccess) {
              customSnackBar(
                context: context,
                message: state.message,
                color: AppColors.primaryDark,
              );
            }

            if (state is OtpResendError) {
              customSnackBar(
                context: context,
                message: state.error,
                color: Colors.red,
              );
            }
          },
          builder: (context, state) {
            final cubit = OtpCubit.get(context);
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.w),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(height: 16.h),
                      Text(
                        "🔐 التأكد من الرمز",
                        style: GoogleFonts.ibmPlexSansArabic(
                          fontSize: 30.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryDark,
                        ),
                      ),

                      SizedBox(height: 12.h),

                      Text(
                        "تم إرسال رمز التحقق المكون من 4 أرقام\nإلى",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.ibmPlexSansArabic(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryDark.withOpacity(0.6),
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        maskEmail(email),
                        style: GoogleFonts.ibmPlexSansArabic(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.w600,
                          color: AppColors.primaryDark,
                        ),
                      ),
                      SizedBox(height: 40.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: List.generate(6, (index) {
                          final isActive = index == cubit.currentIndex;                          return Container(
                            width: 45.w,
                            height: 55.h,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(16.r),
                              border: Border.all(
                                color: isActive
                                    ? AppColors.primary
                                    : Colors.grey.shade300,
                                width: 2,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black.withOpacity(0.05),
                                  blurRadius: 5,
                                )
                              ],
                            ),
                            child: Text(
                              cubit.values[index] ,
                              style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(height:32.h,),
                      SizedBox(height: 24.h),

                      GestureDetector(
                        onTap: cubit.seconds == 0
                            ? () {
                          cubit.resend(email);
                        }
                            : null,
                        child: Text(
                          cubit.seconds > 0
                              ? "تقدر تبعت تاني خلال 00:${cubit.seconds.toString().padLeft(2, '0')}"
                              : "إعادة إرسال الرمز",
                          style: GoogleFonts.ibmPlexSansArabic(
                            color: cubit.seconds == 0
                                ? AppColors.primary
                                : AppColors.primaryDark.withOpacity(0.5),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      SizedBox(height: 24.h,),
                      CustomButton(text: "تحقق", onPressed: (){
                        cubit.verify(email);
                      }),
                      Spacer(),
                      buildKeyboard(
                        onNumberTap: cubit.addNumber,
                        onDelete: cubit.deleteNumber,
                      ),
                      SizedBox(height: 20.h,)


                    ],
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
