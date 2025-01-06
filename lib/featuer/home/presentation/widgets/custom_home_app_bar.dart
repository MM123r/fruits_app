import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits/core/constants/app_assets.dart';
import 'package:fruits/core/utils/text_styles.dart';
import 'package:fruits/core/widgets/notification_widget.dart';

class CustomHomeAppBar extends StatelessWidget {
  const CustomHomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: const NotificationWidget(),
      leading: Image.asset(AppAssets.profileImage),
      title: Text(
        "صباح الخير !..",
        textAlign: TextAlign.right,
        style: getFont16TextStyle(context,color:const Color(0xFF949D9E)),
      ),

      //

      subtitle: Text(
        "محمد مصطفي",
        textAlign: TextAlign.right,
        style: getFont16TextStyle(context,fontWeight: FontWeight.w700),
      ),
    );
  }
}
