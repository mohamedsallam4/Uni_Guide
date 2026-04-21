import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/custom_svg.dart';
class SelectionCard extends StatelessWidget {
  final String title;
  final String icon;
  final bool selected;
  final VoidCallback onTap;

  const SelectionCard({
    super.key,
    required this.title,
    required this.icon,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 160.w,
        height: 160.h,
        decoration: BoxDecoration(
          color: selected ? AppColors.primary : Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          border: Border.all(
            color: selected
                ? Colors.transparent
                : AppColors.primaryDark.withOpacity(0.2),
          ),

          boxShadow: selected
              ? [
            BoxShadow(
              color: AppColors.primaryDark.withOpacity(0.1),
              blurRadius: 20,
              offset: const Offset(0, 10),
            )
          ]
              : [],
        ),

        child: Stack(
          children: [
            if (selected)
              Positioned(
                top: 10.h,
                right: 10.w,
                child: Container(
                  width: 28.w,
                  height: 28.w,
                  decoration: const BoxDecoration(
                    color: Color(0xFF154618),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    Icons.check,
                    color: Colors.white,
                    size: 16.sp,
                  ),
                ),
              ),

            Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 70.w,
                    height: 70.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: selected
                          ? Colors.white.withOpacity(0.3)
                          : Colors.grey.withOpacity(0.1),
                    ),
                    child: Center(
                      child: CustomSvg(
                        path: icon,
                        width: 30.w,
                        height: 30.h,
                        color: selected
                            ? AppColors.primaryDark
                            : AppColors.primaryDark.withOpacity(0.6),
                      ),
                    ),
                  ),

                  SizedBox(height: 12.h),

                  Text(
                    title,
                    style: GoogleFonts.ibmPlexSansArabic(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w700,
                      color: selected
                          ? AppColors.primaryDark
                          : AppColors.primaryDark.withOpacity(0.6),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}