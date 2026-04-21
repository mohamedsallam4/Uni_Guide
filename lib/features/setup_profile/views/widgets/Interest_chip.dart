import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/theme/app_colors.dart';
class InterestChip extends StatelessWidget {
  final String title;
  final bool selected;
  final VoidCallback onTap;

  const InterestChip({
    super.key,
    required this.title,
    required this.selected,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
        decoration: BoxDecoration(
          color: selected ? AppColors.primaryDark : AppColors.onBackground,
          borderRadius: BorderRadius.circular(30.r),
          border: Border.all(
            color: AppColors.primaryDark.withOpacity(0.2),
          ),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (selected)
              Icon(Icons.check, size: 14, color: AppColors.onBackground),
            if (selected) SizedBox(width: 6.w),
            Text(
              title,
              style: GoogleFonts.ibmPlexSansArabic(
                color: selected ? Colors.white : AppColors.primaryDark,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}