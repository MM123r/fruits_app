import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fruits/core/constants/app_assets.dart';

class NotificationWidget extends StatelessWidget {
  const NotificationWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
     // padding: const EdgeInsets.all(6),
      // width: 34,
      // height: 34,
      decoration:const ShapeDecoration(
        color: Color(0xFFEEF8ED),
        shape: OvalBorder()),
        child: SvgPicture.asset(AppAssets.notification),
    );
  }
}
