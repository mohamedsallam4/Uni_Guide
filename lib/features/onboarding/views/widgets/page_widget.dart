import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/asset_constants.dart';
import '../../../../core/theme/app_colors.dart';

class PageWidget extends StatelessWidget {
  const PageWidget({
    super.key,
    required this.image,
     this.flag,
    required this.title1,
    required this.title2,
    required this.title3,

    required this.description,
  });
  final String image;
  final String? flag;
  final String title1;
  final String title2;
  final String title3;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 63.h),
          Container(
            height: 414.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(image),
              ),
            ),
          ),
          SizedBox(height: 40.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 6.h),
            decoration: BoxDecoration(
              color: const Color(0xFFAFEC70).withOpacity(0.2),
              borderRadius: BorderRadius.circular(33554400.r),
              border: Border.all(
                color: const Color(0xFFAFEC70).withOpacity(0.3),
                width: 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 8.w,
                  height: 8.w,
                  decoration: const BoxDecoration(
                    color: Color(0xFF1B5E20),
                    shape: BoxShape.circle,
                  ),
                ),
                SizedBox(width: 6.w),
                Text(
                  title1,
                  style: GoogleFonts.ibmPlexSansArabic(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryDark,
                  ),
                ),
                SizedBox(width: 6.w),
               flag != null? Transform.rotate(
                  angle: -pi / 4,
                  alignment: Alignment.center,
                  child: Image.asset(
                    Assets.assetsImagesEgy,
                    width: 18.w,
                    height: 14.h,
                    fit: BoxFit.contain,
                  ),
                ): SizedBox.shrink(),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          RichText(
            textAlign: TextAlign.right,
            text: TextSpan(
              style: GoogleFonts.ibmPlexSansArabic(
                fontSize: 36.sp,
                fontWeight: FontWeight.w700,
                height: 1.35,
                letterSpacing: -0.9,
              ),
              children: [
                TextSpan(
                  text: "$title2\n",
                  style: TextStyle(color: AppColors.primaryDark), // أخضر غامق
                ),
                TextSpan(
                  text: title3,
                  style: TextStyle(color: Color(0xFF6BBF26)),
                ),
              ],
            ),
          ),
          SizedBox(height: 10.h),
          Text(
           description,
            textAlign: TextAlign.right,
            style: GoogleFonts.ibmPlexSansArabic(
              fontSize: 18.sp,
              fontWeight: FontWeight.w400,
              height: 1.6,
              color: Color(0xFF154618).withOpacity(0.7),
            ),
          ),
        ],
      ),
    );
  }
}
