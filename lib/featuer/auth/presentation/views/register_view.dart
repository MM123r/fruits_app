import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/services/get_it_service.dart';
import 'package:fruits/core/utils/colors.dart';
import 'package:fruits/core/widgets/custom_appbar.dart';
import 'package:fruits/featuer/auth/domain/repos/auth_repo.dart';
import 'package:fruits/featuer/auth/presentation/cubits/signup_cubits/signup_cubit.dart';
import 'package:fruits/featuer/auth/presentation/views/widgets/signup_view_body_bloc_consumer.dart';

class RegisterView extends StatelessWidget{
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:(context) => SignupCubit(
        getIt<AuthRepo>(),
      ) ,
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        appBar: buildAppBar(context, title: "حساب جديد"),
        
        body:const SignupViewBodyBlocConsumer()
     
      ),
    );
  }
}
