import 'package:flutter/material.dart';
import 'package:fruits/core/functions/navigation.dart';
import 'package:fruits/core/utils/text_styles.dart';
import 'package:fruits/featuer/best_selling_fruits/presentation/views/best_selling_view.dart';

class BestSellingHeader extends StatelessWidget {
  const BestSellingHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        pushTo(context, const BestSellingView());
      },
      child: Row(
        children: [
          Text(
            "الأكثر مبيعًا",
            style: getFont16TextStyle(context, fontWeight: FontWeight.w700),
          ),
          const Spacer(),
          Text(
            "المزيد",
            style: getFont14TextStyle(context,
                fontWeight: FontWeight.w400, color: const Color(0xFF949D9E)),
          )
        ],
      ),
    );
  }
}
