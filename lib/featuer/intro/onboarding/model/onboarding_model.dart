import 'package:flutter/material.dart';
import 'package:fruits/core/constants/app_assets.dart';
import 'package:fruits/core/utils/colors.dart';
import 'package:fruits/core/utils/text_styles.dart';


class OnboardingModel {
  final String bgImage;
  final String image;
  final Widget title;
  final String subTitle;

  OnboardingModel(
      {required this.bgImage,
      required this.image,
      required this.title,
      required this.subTitle});
}

List<OnboardingModel> onboardingPage = [
  OnboardingModel(
    bgImage:AppAssets.imagebg1Svg,
    image: AppAssets.fruitbasketSvg,
    title: Row(
      children: [
        Text("مرحبًا بك في",style: get20TextStyle(fontSize: 23),),
        Text(" HUB",style: get20TextStyle(fontSize: 23,color:AppColors.lightSecondaryColor,fontWeight: FontWeight.w700 )),
        Text("Fruit",style: get20TextStyle(fontSize: 23,color: AppColors.lightPrimaryColor,fontWeight: FontWeight.w700))
      ],
    ),
    subTitle: "اكتشف تجربة تسوق فريدة مع FruitHUB. استكشف مجموعتنا الواسعة من الفواكه الطازجة الممتازة واحصل على أفضل العروض والجودة العالية.",
     ),
  
   OnboardingModel(
    bgImage:AppAssets.imagebg2Svg,
    image: AppAssets.pineappleSvg,
    title:  Row(
      children: [
        Text("ابحث وتسوق",style: get20TextStyle(fontSize: 23))
      ],
    ),
    subTitle: "نقدم لك أفضل الفواكه المختارة بعناية. اطلع على التفاصيل والصور والتقييمات لتتأكد من اختيار الفاكهة المثالية",
    
     ),
];
