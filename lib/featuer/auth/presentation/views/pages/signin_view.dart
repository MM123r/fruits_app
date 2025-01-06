import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/services/get_it_service.dart';
import 'package:fruits/core/utils/colors.dart';
import 'package:fruits/core/widgets/buildAppBar.dart';
import 'package:fruits/featuer/auth/domain/repos/auth_repo.dart';
import 'package:fruits/featuer/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:fruits/featuer/auth/presentation/views/widgets/signin_view_body_bloc_consumer.dart';


class SigninView extends StatelessWidget {
  const SigninView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SigninCubit(getIt.get<AuthRepo>()),
      child: Scaffold(
          backgroundColor: AppColors.whiteColor,
          appBar: buildAppBar(context,title: "تسجيل دخول"),
          body:const SigninViewBodyBlocConsumer()),
    );
  }

 
}
