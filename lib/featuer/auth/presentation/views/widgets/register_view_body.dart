import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fruits/core/utils/colors.dart';
import 'package:fruits/core/utils/text_styles.dart';
import 'package:fruits/core/widgets/custom_button.dart';
import 'package:fruits/core/widgets/custom_text_form_field.dart';
import 'package:fruits/featuer/auth/presentation/views/widgets/terms_and_conditions.dart';
import 'package:gap/gap.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
            const Gap(24),
            const CustomTextFormField(
                hintText: "الاسم كامل", textInputType: TextInputType.name),
            const Gap(16),
            const CustomTextFormField(
                hintText: "البريد الإلكتروني",
                textInputType: TextInputType.emailAddress),
            const Gap(16),
            const CustomTextFormField(
                suffixIcon: Icon(
                  Icons.remove_red_eye,
                  color: Color(0xFF949D9E),
                ),
                hintText: "كلمة المرور",
                textInputType: TextInputType.visiblePassword),
            const Gap(20),
            TermsAndConditionsWidget(
              onChanged: (value) {},
            ),
            const Gap(30),
            CustomButton(text: "إنشاء حساب جديد", onPressed: () {}),
            const Gap(30),
            Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                      text: 'تمتلك حساب بالفعل ؟',
                      style: getFont16TextStyle(context,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF949D9E))),
                  TextSpan(
                      text: ' ',
                      style: getFont16TextStyle(context,
                          fontWeight: FontWeight.w400,
                          color:const Color(0xFF616A6B))),
                  TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pop(context);
                        },
                      text: 'تسجيل الدخول',
                      style: getFont16TextStyle(context,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryColor)),
                ],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
