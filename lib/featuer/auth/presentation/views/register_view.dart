import 'package:flutter/material.dart';
import 'package:fruits/core/utils/colors.dart';
import 'package:fruits/core/widgets/custom_appbar.dart';
import 'package:fruits/featuer/auth/presentation/views/widgets/register_view_body.dart';

class RegisterView extends StatelessWidget{
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: buildAppBar(context, title: "حساب جديد"),
      body: const RegisterViewBody(),
    );
  }
}