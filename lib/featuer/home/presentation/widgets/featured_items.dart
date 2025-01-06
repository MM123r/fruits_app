import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits/core/constants/app_assets.dart';
import 'package:fruits/core/utils/colors.dart';
import 'package:fruits/core/utils/text_styles.dart';
import 'package:fruits/core/widgets/custom_button.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart' as svg;
import 'package:gap/gap.dart';

class FeaturedItems extends StatelessWidget {
  const FeaturedItems({super.key});

  @override
  Widget build(BuildContext context) {
    var itemWidth = MediaQuery.sizeOf(context).width;
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: SizedBox(
        width: itemWidth,
        child: AspectRatio(
          aspectRatio: 342/158,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                bottom: 0,
                top: 0,
                right: itemWidth * 0.4,
                child: SvgPicture.asset(AppAssets.pineappleSvg,
                fit: BoxFit.fill,
                )),
              Container(
                width: itemWidth * 0.5,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: svg.Svg(AppAssets.featuredItem), fit: BoxFit.fill),
                ),
                /////
                child: Padding(
                  padding: const EdgeInsets.only(right: 10,left: 19),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Gap(18),
                      Text(
                        "عرض العيد",
                        style:
                            getFont14TextStyle(context, color: AppColors.whiteColor),
                      ),
                      ////////
                      
                       const Spacer(),
                      Text(
                        "خصم 25%",
                        style:
                            getFont20TextStyle(context, color: AppColors.whiteColor),
                      ),
                      //////
                      const Gap(2),
                      CustomButton(
                        text: "تسوق الان",
                        height: 32,
                        onPressed: () {},
                        bgColor: AppColors.whiteColor,
                        textColor: AppColors.lightPrimaryColor,
                        fontWeight: FontWeight.w700,
                        radius: 4,
                        
                      ),
                    const  Gap(25),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
