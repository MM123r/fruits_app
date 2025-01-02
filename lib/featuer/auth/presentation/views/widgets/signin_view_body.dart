import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/constants/app_assets.dart';
import 'package:fruits/core/functions/navigation.dart';
import 'package:fruits/core/helper_functions/build_Errors_Bar.dart';
import 'package:fruits/core/utils/colors.dart';
import 'package:fruits/core/utils/text_styles.dart';
import 'package:fruits/core/widgets/custom_button.dart';
import 'package:fruits/core/widgets/custom_text_form_field.dart';
import 'package:fruits/core/widgets/password_field.dart';
import 'package:fruits/featuer/auth/presentation/cubits/signin_cubit/signin_cubit.dart';
import 'package:fruits/featuer/auth/presentation/views/register_view.dart';
import 'package:fruits/featuer/auth/presentation/views/widgets/or_divider.dart';
import 'package:fruits/featuer/auth/presentation/views/widgets/social_login_button.dart';
import 'package:gap/gap.dart';

class SigninViewBody extends StatefulWidget {
  const SigninViewBody({super.key});

  @override
  State<SigninViewBody> createState() => _SigninViewBodyState();
}

class _SigninViewBodyState extends State<SigninViewBody> {
  final AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool isTermsAccepted = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Form(
          key: formkey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const Gap(24),
              CustomTextFormField(
                Controller: emailController,
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              const Gap(16),
              PasswordField(
                Controller: passwordController,
              ),
              const Gap(16),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "نسيت كلمة المرور؟",
                    style: getFont14TextStyle(context,
                        fontWeight: FontWeight.w600,
                        color: AppColors.lightPrimaryColor),
                  ),
                ],
              ),
              const Gap(32),
              CustomButton(
                  text: "تسجيل دخول",
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      // controllers
                      String email = emailController.text.trim();
                      String password = passwordController.text.trim();

                      // التأكد من عدم وجود قيم فارغة أو null

                      if (email.isEmpty) {
                        buildErrorsBar(
                            context, 'يرجى إدخال البريد الإلكتروني.');
                        return;
                      }
                      if (password.isEmpty) {
                        buildErrorsBar(context, 'يرجى إدخال كلمة المرور.');
                        return;
                      }

                      context.read<SigninCubit>().signin(
                            email,
                            password,
                          );
                    }
                  }),
              const Gap(32),
              Text.rich(
                TextSpan(children: [
                  TextSpan(
                    text: "لا تمتلك حساب؟",
                    style: getFont16TextStyle(context,
                        fontWeight: FontWeight.w600,
                        color: const Color(0xFF616A6B)),
                  ),
                  TextSpan(
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        pushTo(context, const RegisterView());
                      },
                    text: "قم بانشاء حساب",
                    style: getFont16TextStyle(context,
                        fontWeight: FontWeight.w600,
                        color: AppColors.primaryColor),
                  ),
                ]),
              ),
              const Gap(32),
              const or_divider(),
              const Gap(16),
              SocialLoginButton(
                    onPressed: () {
                      context.read<SigninCubit>().signinWithGoogel();
                    },
                    title: "تسجيل بواسطة جوجل",
                    image: AppAssets.googleSvg,
                  ),
                  const Gap(16),
             Platform.isIOS? Column(
                children: [
                  SocialLoginButton(
                    onPressed: () {
                      context.read<SigninCubit>().signInWithApple();
                    },
                    title: "تسجيل بواسطة أبل",
                    image: AppAssets.appleSvg,
                  ),
                  const Gap(16),
                ],
              ): const SizedBox(),

              SocialLoginButton(
                onPressed: () {
                  context.read<SigninCubit>().signInWithFacebook();
                },
                title: "تسجيل بواسطة فيسبوك",
                image: AppAssets.facebookeSvg,
              ),
              const Gap(30),
            ],
          ),
        ),
      ),
    );
  }
}
