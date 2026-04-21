import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/theme/app_colors.dart';
class HeaderRegister extends StatelessWidget {
  const HeaderRegister({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 125.h,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'إنشاء حساب جديد',
              style: GoogleFonts.ibmPlexSansArabic(
                fontSize: 30.sp,
                fontWeight: FontWeight.w400,
                color: AppColors.primaryDark,
              ),
            ),
            SizedBox(width: 8.w),
            Text(
              '🚀',
              style: GoogleFonts.ibmPlexSansArabic(fontSize: 28.sp),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Text(
          'املأ بياناتك لتبدأ رحلتك التعليمية معنا',
          style: GoogleFonts.ibmPlexSansArabic(
            fontSize: 18.sp,
            color: AppColors.primaryDark.withOpacity(0.6),
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
