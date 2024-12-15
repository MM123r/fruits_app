 import 'package:flutter/material.dart';
import 'package:fruits/core/utils/colors.dart';
import 'package:fruits/core/utils/text_styles.dart';

AppBar buildAppBar(context,{required String title}) {
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios_new)),
      centerTitle: true,
      title: Text(
        title,
        style: get20TextStyle(fontWeight: FontWeight.bold),
      ),
    );
  }