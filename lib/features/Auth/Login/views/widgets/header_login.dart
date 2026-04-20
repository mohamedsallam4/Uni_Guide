import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../core/constants/asset_constants.dart';
import '../../../../../core/theme/app_colors.dart';
import '../../../../../core/widgets/custom_svg.dart';

class HeaderLogin extends StatelessWidget {
  const HeaderLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 119.h),
        Transform.rotate(
          angle: -8.92 * pi / 180,
          child: Container(
            width: 57.w,
            height: 54.h,
            decoration: BoxDecoration(
              color: AppColors.primaryDark,
              borderRadius: BorderRadius.circular(11.r),
              border: Border.all(color: AppColors.onBackground, width: 1),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  blurRadius: 17.6,
                  spreadRadius: 0,
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 3.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomSvg(
                    path: Assets.assetsImagesLogo,
                    width: 21.w,
                    height: 25.h,
                  ),
                  SizedBox(height: 4.h),
                  CustomSvg(
                    path: Assets.assetsImageswordsplash,
                    width: 28.w,
                    height: 13.h,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 22.h),
        Text(
          'أهلاً برجوعك 👋',
          style: GoogleFonts.ibmPlexSansArabic(
            fontSize: 30.sp,
            fontWeight: FontWeight.bold,
            color: AppColors.primaryDark,
          ),
        ),
        SizedBox(height: 8.h),
        Text(
          'سجل الدخول وابدأ رحلتك الجامعية',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 16.sp,
            color: AppColors.primaryDark.withOpacity(0.7),
          ),
        ),
      ],
    );
  }
}
