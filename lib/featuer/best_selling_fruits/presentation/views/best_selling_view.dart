import 'package:flutter/material.dart';
import 'package:fruits/core/utils/colors.dart';
import 'package:fruits/core/widgets/custom_appbar.dart';
import 'package:fruits/featuer/best_selling_fruits/presentation/widgets/best_seling_view_body.dart';

class BestSellingView extends StatelessWidget {
  const BestSellingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: buildAppBar(context, title: 'الأكثر مبيعًا'),
    body: BestSelingViewBody(),
    );
  }

 
}
