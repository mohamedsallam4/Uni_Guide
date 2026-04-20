import 'package:bloc_statemanagement/core/widgets/app_button.dart';
import 'package:bloc_statemanagement/features/Auth/Login/views/widgets/header_login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/app_text_field.dart';
class LoginView extends StatelessWidget {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onBackground,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 25.w),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HeaderLogin(),
              SizedBox(height: 40.h),
              CustomTextField(
                label: 'البريد الإلكتروني',
                hintText: 'name@example.com',
                controller: TextEditingController(),
                prefix: Icon(
                  Icons.email_outlined,
                  color: AppColors.primaryDark.withOpacity(0.4),
                ),
              ),
              SizedBox(height: 20.h),
              CustomTextField(
                label: 'كلمة المرور',
                hintText: '••••••',
                controller: TextEditingController(),
                obscureText: true,
                icon: Icon(
                  Icons.visibility_outlined,
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
                  onPressed: () {},
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
                  onPressed: (){}),
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
      )
      );
  }
}
