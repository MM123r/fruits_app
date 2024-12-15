import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits/core/constants/app_assets.dart';
import 'package:fruits/core/functions/navigation.dart';
import 'package:fruits/core/utils/colors.dart';
import 'package:fruits/core/utils/text_styles.dart';
import 'package:fruits/core/widgets/custom_button.dart';
import 'package:fruits/core/widgets/custom_text_form_field.dart';
import 'package:fruits/featuer/auth/presentation/views/register_view.dart';
import 'package:fruits/featuer/auth/presentation/views/widgets/or_divider.dart';
import 'package:fruits/featuer/auth/presentation/views/widgets/social_login_button.dart';
import 'package:gap/gap.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            const Gap(24),
            const CustomTextFormField(
              hintText: "البريد الإلكتروني",
              textInputType: TextInputType.emailAddress,
            ),
            const Gap(16),
            const CustomTextFormField(
              suffixIcon: Icon(
                Icons.remove_red_eye,
                color: Color(0xFFC9CECF),
              ),
              hintText: "كلمة المرور",
              textInputType: TextInputType.visiblePassword,
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
            CustomButton(text: "تسجيل دخول", onPressed: () {}),
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
              onPressed: () {},
              title: "تسجيل بواسطة جوجل",
              image: AppAssets.googleSvg,
            ),
            const Gap(16),
            SocialLoginButton(
              onPressed: () {},
              title: "تسجيل بواسطة أبل",
              image: AppAssets.appleSvg,
            ),
            const Gap(16),
            SocialLoginButton(
              onPressed: () {},
              title: "تسجيل بواسطة فيسبوك",
              image: AppAssets.facebookeSvg,
            ),
            const Gap(30),
          ],
        ),
      ),
    );
  }
}
