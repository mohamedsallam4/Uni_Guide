import 'package:bloc_statemanagement/core/theme/app_colors.dart';
import 'package:bloc_statemanagement/core/widgets/custom_svg.dart';
import 'package:bloc_statemanagement/features/onboarding/views/screens/page1_view.dart';
import 'package:bloc_statemanagement/features/onboarding/views/screens/page2_view.dart';
import 'package:bloc_statemanagement/features/onboarding/views/screens/page3_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/asset_constants.dart';
import '../../manager/on_bordung_cubit.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => OnboardingCubit(),
      child: Scaffold(
        backgroundColor: AppColors.onBackground,
        body: BlocBuilder<OnboardingCubit, int>(
          builder: (context, index) {
            final onbordingcubit = context.read<OnboardingCubit>();
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.w),
              child: Column(
                children: [
                  Expanded(
                    child: PageView(
                      controller: onbordingcubit.controller,
                      onPageChanged: (i) => onbordingcubit.changePage(i),
                      children: const [Page1View(), Page2View(), Page3View()],
                    ),
                  ),

                  SizedBox(height: 20.h),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w),
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              onbordingcubit.controller.jumpToPage(2);
                              onbordingcubit.changePage(2);
                            },
                            child: Text(
                              "تخطي",
                              style: TextStyle(
                                fontSize: 14.sp,
                                color: const Color(0xFF124D1E),
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),

                          Row(
                            children: List.generate(3, (i) {
                              return AnimatedContainer(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.fastOutSlowIn,
                                margin: EdgeInsets.symmetric(horizontal: 4.w),
                                width: index == i ? 32.w : 10.w,
                                height: 10.h,
                                decoration: BoxDecoration(
                                  color: index == i
                                      ?  AppColors.primaryDark
                                      : AppColors.onSubTextTab,
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              );
                            }),
                          ),
                          GestureDetector(
                            onTap: () {
                              if (index < 2) {
                                onbordingcubit.controller.nextPage(
                                  duration: const Duration(milliseconds: 300),
                                  curve: Curves.fastOutSlowIn,
                                );
                              } else {
                                // هنا تروح للـ Home
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.only(
                                top: 16.h,
                                right: 24.w,
                                left: 32.w,
                                bottom: 16.h,
                              ),
                              decoration: BoxDecoration(
                                color: const Color(0xFFAFEC70),
                                borderRadius: BorderRadius.circular(30.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: const Color(
                                      0xFFAFEC70,
                                    ).withOpacity(0.4),
                                    blurRadius: 20,
                                    spreadRadius: -5,
                                    offset: const Offset(0, 8),
                                  ),
                                ],
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    'التالي',
                                    style: GoogleFonts.ibmPlexSansArabic(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                    ),
                              ),
                                  SizedBox(width: 12.w),
                                   CustomSvg(path: Assets.assetsIconsBackArrowIcon,width: 18.w,height: 18.h),
                                ],
                              ),
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 106.h),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
