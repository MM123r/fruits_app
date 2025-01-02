import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/helper_functions/build_Errors_Bar.dart';
import 'package:fruits/featuer/auth/presentation/cubits/signup_cubits/signup_cubit.dart';
import 'package:fruits/featuer/auth/presentation/cubits/signup_cubits/signup_state.dart';
import 'package:fruits/featuer/auth/presentation/views/widgets/register_view_body.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SignupViewBodyBlocConsumer extends StatelessWidget {
  const SignupViewBodyBlocConsumer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignupCubit, SignupState>(
      listener: (context, state) {
        //
        if (state is SignupSuccess) {}
        if (state is SignupFailuer) {
          buildErrorsBar(context, state.message);
        }
      },
      builder: (context, state) {
        return ModalProgressHUD(
            inAsyncCall: state is SignupLoading ? true : false,
            child: const SignupViewBody());
      },
    );
  }


}
