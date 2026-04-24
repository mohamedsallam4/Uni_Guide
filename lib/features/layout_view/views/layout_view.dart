import 'package:bloc_statemanagement/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../manager/nav_cubit.dart';
class LayoutView extends StatelessWidget {
  const LayoutView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NavCubit(),
      child: BlocBuilder<NavCubit,int>(
        builder: (context,state){
          final cubit = NavCubit.get(context);
          return Scaffold(
            backgroundColor: AppColors.onBackground,
            body: cubit.Screens[state],
            bottomNavigationBar: Directionality(
              textDirection: TextDirection.rtl,
              child: BottomNavigationBar(
                currentIndex: state,
                onTap: (index) => cubit.changeNav(index),
                selectedItemColor: AppColors.primaryDark,
                showUnselectedLabels: true,
                unselectedItemColor: AppColors.onSubTextTab,
                type: BottomNavigationBarType.fixed,
                selectedLabelStyle: GoogleFonts.ibmPlexSansArabic(
                  fontWeight: FontWeight.bold,
                  fontSize:10.sp,
                ),
                unselectedLabelStyle: GoogleFonts.ibmPlexSansArabic(
                  fontWeight: FontWeight.bold,
                  fontSize:10.sp,
                ),
                backgroundColor: AppColors.onBackground,
                elevation: 0,
                items: [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.grid_view_rounded,size: 24.sp,color: AppColors.onSubTextTab,),
                    activeIcon:Icon(Icons.grid_view_rounded,size: 24.sp,color: AppColors.primaryDark,),
                    label: "الرئيسية",
                  ),

                  BottomNavigationBarItem(
                    icon: Icon(Icons.feed,size: 24.sp,color: AppColors.onSubTextTab,),
                    activeIcon: Icon(Icons.feed,size: 24.sp,color: AppColors.primaryDark,),
                    label: "اهم الاخبار",
                  ),

                  BottomNavigationBarItem(
                    icon: Icon(Icons.bookmark,size: 24.sp,color: AppColors.onSubTextTab,),
                    activeIcon: Icon(Icons.bookmark,size: 24.sp,color: AppColors.primaryDark,),
                    label:"المفضلة",
                  ),

                  BottomNavigationBarItem(
                    icon:Icon(Icons.person,size: 24.sp,color: AppColors.onSubTextTab,),
                    activeIcon: Icon(Icons.person,size: 24.sp,color: AppColors.primaryDark,),
                    label:"حسابي",
                  ),
                ],
              )
            ),
          );
        },
      ),
    );
  }
}