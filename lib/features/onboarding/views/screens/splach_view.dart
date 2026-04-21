import 'package:bloc_statemanagement/core/theme/app_colors.dart';
import 'package:bloc_statemanagement/core/widgets/custom_svg.dart';
import 'package:bloc_statemanagement/features/onboarding/views/screens/on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/api/api_key.dart';
import '../../../../core/constants/asset_constants.dart';
import '../../../../core/functions/custom_navigation.dart';
import '../../../../core/helper/cache/cache_helper.dart';
import '../../../home/views/home_view.dart';
class SplachView extends StatefulWidget {
  const SplachView({super.key});

  @override
  State<SplachView> createState() => _SplachViewState();
}

class _SplachViewState extends State<SplachView> {

  @override
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3), () {
      if (!mounted) return;


      final isLogged =
          CacheHelper().getData(key: ApiKeys.isLogged) ?? false;

      if (isLogged) {
        customPushReplacement(context, const HomeView());
      } else {
        customPushReplacement(context, const OnboardingView());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onBackground,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          children: [
            SizedBox(height: 273.h),
            Center(
              child: Container(
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
                    ),
                  ],
                ),
                child: Column(
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
            ),

            SizedBox(height: 63.h),

            RichText(
              text: TextSpan(
                style: GoogleFonts.ibmPlexSansArabic(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w700,
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

            const Spacer(),

            Text(
              'v.1.1',
              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
            ),

            SizedBox(height: 20.h),
          ],
        ),
      ),
    );
  }
}