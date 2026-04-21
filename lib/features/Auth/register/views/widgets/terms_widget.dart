import 'package:bloc_statemanagement/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../manager/register_cubit.dart';

class TermsWidget extends StatefulWidget {
  const TermsWidget({super.key, required this.cubit});
  final RegisterCubit cubit ;

  @override
  State<TermsWidget> createState() => _TermsWidgetState();
}

class _TermsWidgetState extends State<TermsWidget> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.cubit.acceptTerms();
      },
      child: Row(
        children: [
          Container(
            width: 20.w,
            height: 20.h,
            decoration: BoxDecoration(
              color: widget.cubit.isTermsAccepted
                  ?  AppColors.primaryDark
                  : Colors.transparent,
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                color: AppColors.onSubText,
                width: 1,
              ),
            ),
            child: widget.cubit.isTermsAccepted
                ?  Icon(
              Icons.check,
              size: 16.sp,
              color:AppColors.onBackground,
            )
                : null,
          ),
          SizedBox(width: 12.w),
          RichText(
            text: TextSpan(
              style: GoogleFonts.ibmPlexSansArabic(
                fontSize: 14.sp,
                color: AppColors.primaryDark.withOpacity(0.7),
              ),
              children: [
                const TextSpan(text: 'أوافق على '),
                WidgetSpan(
                  child: GestureDetector(
                    onTap: () {

                    },
                    child: Text(
                      'الشروط والأحكام',
                      style: GoogleFonts.ibmPlexSansArabic(
                        fontSize: 14.sp,
                        color: AppColors.primaryDark,
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}