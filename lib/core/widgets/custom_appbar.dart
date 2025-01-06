 import 'package:flutter/material.dart';
import 'package:fruits/core/utils/colors.dart';
import 'package:fruits/core/utils/text_styles.dart';
import 'package:fruits/core/widgets/notification_widget.dart';

AppBar buildAppBar(context,{required String title}) {
    return AppBar(
      actions: const [
        Padding(
          padding: EdgeInsets.only(left: 16),
          child: NotificationWidget(),
        ),
      ],
      backgroundColor: AppColors.whiteColor,
      leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          
          child: const Icon(Icons.arrow_back_ios_new)),
      centerTitle: true,
      title: Text(
        title,
        style: get20TextStyle(fontWeight: FontWeight.w700),
      ),
    );
  }