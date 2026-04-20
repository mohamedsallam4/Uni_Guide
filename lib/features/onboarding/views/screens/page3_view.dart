import 'package:flutter/material.dart';
import '../../../../core/constants/asset_constants.dart';
import '../widgets/page_widget.dart';
class Page3View extends StatelessWidget {
  const Page3View({super.key});
  @override
  Widget build(BuildContext context) {
    return PageWidget(
      image: Assets.assetsImagesOnBoarding3,
      title1: "مقارنة اسهل",
      title2: "تقديم اسهل علي ",
      title3: "الجامعات",
      description: "اختار الجامعه الي مناسبه ليك وهقدم من خلالنا وهنوفر عليك المشاوير",
    );
  }
}
