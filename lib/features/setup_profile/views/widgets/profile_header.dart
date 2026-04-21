import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('🎓', style: TextStyle(fontSize: 28.sp)),
            SizedBox(width: 8.w),
            Text(
              'جهّز ملفك الشخصي',
              style: GoogleFonts.ibmPlexSansArabic(
                fontSize: 30.sp,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryDark,
              ),
            ),
          ],
        ),
        SizedBox(height: 8.h),
        Text(
          'ساعدنا نخصص تجربتك بناءً على اهتماماتك',
          style: GoogleFonts.ibmPlexSansArabic(
            fontSize: 18.sp,
            fontWeight: FontWeight.w400,
            color: AppColors.primaryDark.withOpacity(0.6),
          ),
        ),
      ],
    );
  }
}