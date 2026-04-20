import 'package:bloc_statemanagement/features/onboarding/views/widgets/page_widget.dart';
import 'package:flutter/material.dart';
import '../../../../core/constants/asset_constants.dart';
class Page1View extends StatelessWidget {
  const Page1View({super.key});
  @override
  Widget build(BuildContext context) {
    return PageWidget(
        image: Assets.assetsImagesOnBoarding1,
        title1: "الاول في",
        title2: "كل جامعات مصر",
        title3: " في جيبك",
        description: "قارن بين المصاريف، المواقع، والتصنيفات العالمية لكل الجامعات بسهولة وذكاء مع مساعدك الشخصي.",
        flag:Assets.assetsImagesEgy,

    );
  }
}
