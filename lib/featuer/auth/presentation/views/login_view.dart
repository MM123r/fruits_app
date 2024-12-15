import 'package:flutter/material.dart';
import 'package:fruits/core/utils/colors.dart';
import 'package:fruits/core/widgets/custom_appbar.dart';
import 'package:fruits/featuer/auth/presentation/views/widgets/login_view_body.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: buildAppBar(context,title: "تسجيل دخول"),
        body: const LoginViewBody());
  }

 
}
