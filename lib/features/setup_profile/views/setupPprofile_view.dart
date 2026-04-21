import 'package:bloc_statemanagement/features/setup_profile/data/profile%20data.dart';
import 'package:bloc_statemanagement/features/setup_profile/views/widgets/Interest_chip.dart';
import 'package:bloc_statemanagement/features/setup_profile/views/widgets/dropdown_widget.dart';
import 'package:bloc_statemanagement/features/setup_profile/views/widgets/profile_header.dart';
import 'package:bloc_statemanagement/features/setup_profile/views/widgets/selection_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../core/api/api_key.dart';
import '../../../core/constants/asset_constants.dart';
import '../../../core/functions/custom_navigation.dart';
import '../../../core/helper/cache/cache_helper.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/app_button.dart';
import '../../home/views/home_view.dart';

class SetupProfileView extends StatefulWidget {
  const SetupProfileView({super.key});

  @override
  State<SetupProfileView> createState() => _SetupProfileViewState();
}

class _SetupProfileViewState extends State<SetupProfileView> {
  String selectedType = 'science';
  List<String> selectedInterests = [];
  String? selectedGovernorate;
  List<String> get interests =>
      ProfileData.interests[selectedType]!;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.onBackground,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 25.w,
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 100.h),
              ProfileHeader(),
              SizedBox(height: 24.h),
              Text('الشعبة الدراسية',style: GoogleFonts.ibmPlexSansArabic(
                color: AppColors.primaryDark,
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
              ),),
              SizedBox(height: 16.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SelectionCard(
                    title: 'أدبي',
                    icon: Assets.assetsIconsLiteraryIcon,
                    selected: selectedType == 'arts',
                    onTap: () {
                      setState(() => selectedType = 'arts');
                    },
                  ),
                  SizedBox(width: 16.w),
                  SelectionCard(
                    title: 'علمي',
                    icon: Assets.assetsIconsScienceIcon,
                    selected: selectedType == 'science',
                    onTap: () {
                      setState(() => selectedType = 'science');
                    },
                  ),
                ],
              ),

              SizedBox(height: 20.h),

              Text('المحافظة',style: GoogleFonts.ibmPlexSansArabic(
                color: AppColors.primaryDark,
                fontWeight: FontWeight.w500,
                fontSize: 18.sp,
              ),),
              SizedBox(height: 10.h),
              CustomDropdown(
                value: selectedGovernorate,
                onChanged: (val) {
                  setState(() => selectedGovernorate = val);
                },
              ),
              SizedBox(height: 32.h),
              Directionality(
                textDirection: TextDirection.rtl,
                child: Row(
                  children: [
                    Text(
                      'مجالات الاهتمام',
                      style: GoogleFonts.ibmPlexSansArabic(
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w700,
                        color: AppColors.primaryDark,
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Text(
                      '(اختر 3 على الأقل)',
                      style: GoogleFonts.ibmPlexSansArabic(
                        fontSize: 14.sp,
                        color: const Color(0xFF9BAE9E),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              Wrap(
                spacing: 10,
                runSpacing: 10,
                children: interests.map((e) {
                  return InterestChip(
                    title: e,
                    selected: selectedInterests.contains(e),
                    onTap: () {
                      setState(() {
                        selectedInterests.contains(e)
                            ? selectedInterests.remove(e)
                            : selectedInterests.add(e);
                      });
                    },
                  );
                }).toList(),
              ),
              Spacer(),
              CustomButton(
                text: 'التالي',
                color: AppColors.primary,
                textColor: AppColors.primaryDark,
                icon:Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.primaryDark,
                  size: 20.sp,
                ),
                onPressed: () async {
                  final userId = CacheHelper().getData(key: ApiKeys.userId);
                  await CacheHelper().setData(
                    key: "profile_completed_$userId",
                    value: true,
                  );

                  await CacheHelper().setData(
                    key: "type_$userId",
                    value: selectedType,
                  );

                  await CacheHelper().setData(
                    key: "interests_$userId",
                    value: selectedInterests.join(","),
                  );

                  await CacheHelper().setData(
                    key: "governorate_$userId",
                    value: selectedGovernorate,
                  );
                  if (!context.mounted) return;
                  customPushReplacement(context, const HomeView());
                },
              ),
              SizedBox(height: 45.h),
            ],
          ),
        ),
      ),
    );
  }
}