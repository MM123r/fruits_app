import 'package:flutter/material.dart';
import 'package:fruits/core/constants/app_assets.dart';
import 'package:fruits/core/utils/colors.dart';
import 'package:fruits/core/utils/text_styles.dart';
import 'package:gap/gap.dart';

class FruitItem extends StatelessWidget {
  const FruitItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
          color: const Color(0xFFf3f5f7),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(4))),
      child: Stack(
        children: [
          Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                  onPressed: () {}, icon: const Icon(Icons.favorite_outline))),
          Positioned.fill(
            child: Column(
              children: [
                const Gap(20),
                Image.asset(
                  AppAssets.watermelonTest,
                ),
               //const Gap(5),
                ListTile(
                  title: Text(
                    "بطيخ",
                    textAlign: TextAlign.right,
                    style: getFont14TextStyle(context,
                        fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                            text: '20جنية ',
                            style: getFont14TextStyle(context,
                                fontWeight: FontWeight.w700,
                                color: AppColors.secondaryColor),
                                  ),
                              
                        TextSpan(
                            text: '/',
                            style: getFont14TextStyle(context,
                                fontWeight: FontWeight.w600,
                                color: AppColors.lightSecondaryColor)),
                       
                        TextSpan(
                            text: ' ',
                            style: getFont14TextStyle(context,
                                fontWeight: FontWeight.w600,
                                color: AppColors.secondaryColor)),
                        TextSpan(
                            text: 'كيلو',
                            style: getFont14TextStyle(context,
                                fontWeight: FontWeight.w600,
                                color: AppColors.lightSecondaryColor)), 
                      ],
                    ),

                    /////////////////////
                    textAlign: TextAlign.right,
                    
                    // softWrap: true,
                  ),
                  
                  trailing: GestureDetector(
                    onTap: () {
                      // context.read<CartCubit>().addProduct(productEntity);
                    },
                    child: const CircleAvatar(
                      backgroundColor: AppColors.primaryColor,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
