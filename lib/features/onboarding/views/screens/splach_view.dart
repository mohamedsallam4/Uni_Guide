import 'package:bloc_statemanagement/core/functions/custom_navigation.dart';
import 'package:bloc_statemanagement/core/theme/app_colors.dart';
import 'package:bloc_statemanagement/core/widgets/custom_svg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/asset_constants.dart';
import 'on_boarding.dart';
class SplachView extends StatelessWidget {
  const SplachView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onBackground,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 273.h),
            Container(
              padding: EdgeInsets.only(
                top: 19.h,
                right: 52.w,
                left: 52.w,
                bottom: 20.h,
              ),
              decoration: BoxDecoration(
                color: AppColors.primaryDark,
                borderRadius: BorderRadius.circular(36.r),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withOpacity(0.8),
                    blurRadius: 100.r,
                    spreadRadius: 0,
                    offset: const Offset(0, 0),
                  ),
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomSvg(
                    path: Assets.assetsImagesLogo,
                    width: 75.w,
                    height: 102.h,
                  ),
                  SizedBox(height: 10.h),
                  CustomSvg(path: Assets.assetsImageswordsplash),
                ],
              ),
            ),

            SizedBox(height: 63.h),
            RichText(
              text: TextSpan(
                style: GoogleFonts.ibmPlexSansArabic(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w700,
                  height: 43.2 / 32,
                  letterSpacing: -0.3,
                ),
                children: [
                  TextSpan(
                    text: 'كل جامعات مصر',
                    style: TextStyle(color: AppColors.primaryDark),
                  ),
                  TextSpan(
                    text: ' في جيبك',
                    style: TextStyle(color: Color(0xff6BBF26)),
                  ),
                ],
              ),
            ),

            SizedBox(height: 148.h),

            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 40.w),
                child: InkWell(
                  onTap: (){
                    customPush(context, OnboardingView());
                  },
                  child: Container(
                    alignment: Alignment.center,
                    width: 68.w,
                    height: 68.w,
                    decoration: BoxDecoration(
                      color: Colors.lightGreen,
                      borderRadius: BorderRadius.circular(27.r),
                    ),
                    child: CustomSvg(path: Assets.assetsIconsBackArrowIcon),
                  ),
                ),
              ),
            ),

            SizedBox(height: 50.h),
            Text(
              'v.1.1',
              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
