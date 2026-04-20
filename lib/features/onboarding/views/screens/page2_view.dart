import 'package:flutter/material.dart';
import '../../../../core/constants/asset_constants.dart';
import '../widgets/page_widget.dart';
class Page2View extends StatelessWidget {
  const Page2View({super.key});
  @override
  Widget build(BuildContext context) {
    return PageWidget(
      image: Assets.assetsImagesOnBoarding2,
      title1: "اداه AI في خدمتك",
      title2: "أختيار اسهل مع",
      title3: "فهيم",
      description: "دردش مع فهيم عن مهاراتك وقدراتك ومواهبك وهيساعدك تصل للتخصص المناسب ليك",
    );
  }
}
