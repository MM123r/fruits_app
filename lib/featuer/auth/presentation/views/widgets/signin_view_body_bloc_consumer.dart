import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/functions/navigation.dart';
import 'package:fruits/core/helper_functions/build_Errors_Bar.dart';
import 'package:fruits/core/widgets/custom_progress_hud.dart';
import 'package:fruits/featuer/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:fruits/featuer/auth/presentation/cubits/signin_cubit/signin_state.dart';
import 'package:fruits/featuer/auth/presentation/views/widgets/signin_view_body.dart';
import 'package:fruits/featuer/home/nav_bar/nav_bar_screen.dart';


class SigninViewBodyBlocConsumer extends StatelessWidget {
  const SigninViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SigninCubit, SigninState>(
      listener: (context, state) {
        if (state is SigninSuccess) {
          log("SigninSuccess");
          pushTo(context, const NavBarScreen()); //homeview
        }
        if (state is SigninFailuer) {
          buildErrorsBar(context, state.message);
        }
      },
      builder: (context, state) {
        return CustomProgressHud(
            isLoading: state is SigninLoading ? true : false,
            child: const SigninViewBody());
      },
    );
  }
}
