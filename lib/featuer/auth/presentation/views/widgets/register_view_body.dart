
// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:fruits/core/helper_functions/build_Errors_Bar.dart';
// import 'package:fruits/core/utils/colors.dart';
// import 'package:fruits/core/utils/text_styles.dart';
// import 'package:fruits/core/widgets/custom_button.dart';
// import 'package:fruits/core/widgets/custom_text_form_field.dart';
// import 'package:fruits/core/widgets/password_field.dart';
// import 'package:fruits/featuer/auth/presentation/cubits/signup_cubits/signup_cubit.dart';
// import 'package:fruits/featuer/auth/presentation/views/widgets/terms_and_conditions.dart';

// class SignupViewBody extends StatefulWidget {
//   const SignupViewBody({super.key});

//   @override
//   State<SignupViewBody> createState() => _SignupViewBodyState();
// }

// class _SignupViewBodyState extends State<SignupViewBody> {
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();

//   AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

//   String? email, userName, password;
//   bool isTermsAccepted = false;

//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       child: Padding(
//         padding: const EdgeInsets.symmetric(horizontal: 16),
//         child: Form(
//           key: formKey,
//           autovalidateMode: autovalidateMode,
//           child: Column(
//             children: [
//               const SizedBox(height: 24),
//               CustomTextFormField(
//                 onSaved: (value) {
//                   userName = value?.trim();
//                 },
//                 hintText: 'الاسم كامل',
//                 textInputType: TextInputType.name,
//               ),
//               const SizedBox(height: 16),
//               CustomTextFormField(
//                 onSaved: (value) {
//                   email = value?.trim();
//                 },
//                 hintText: 'البريد الإلكتروني',
//                 textInputType: TextInputType.emailAddress,
//               ),
//               const SizedBox(height: 16),
//               PasswordField(
//                 onSaved: (value) {
//                   password = value?.trim();
//                 },
//               ),
//               const SizedBox(height: 16),
//               TermsAndConditionsWidget(
//                 onChanged: (value) {
//                   setState(() {
//                     isTermsAccepted = value;
//                   });
//                 },
//               ),
//               const SizedBox(height: 30),
//               CustomButton(
//                 onPressed: () {
//                   if (formKey.currentState!.validate()) {
//                     formKey.currentState!.save();

//                     // التأكد من عدم وجود قيم فارغة أو null
//                     if (userName == null || userName!.isEmpty) {
//                       buildErrorsBar(context, 'يرجى إدخال الاسم كامل.');
//                       return;
//                     }
//                     if (email == null || email!.isEmpty) {
//                       buildErrorsBar(context, 'يرجى إدخال البريد الإلكتروني.');
//                       return;
//                     }
//                     if (password == null || password!.isEmpty) {
//                       buildErrorsBar(context, 'يرجى إدخال كلمة المرور.');
//                       return;
//                     }
//                     if (!isTermsAccepted) {
//                       buildErrorsBar(context, 'يجب عليك الموافقة على الشروط والإحكام');
//                       return;
//                     }

//                     context.read<SignupCubit>().createUserWithEmailAndPassword(
//                           email!,
//                           password!,
//                           userName!,
//                         );
//                   } else {
//                     setState(() {
//                       autovalidateMode = AutovalidateMode.always;
//                     });
//                   }
//                 },
//                 text: 'إنشاء حساب جديد',
//               ),
//               const SizedBox(height: 26),
//               Text.rich(
//                 TextSpan(
//                   children: [
//                     TextSpan(
//                       text: 'تمتلك حساب بالفعل ؟',
//                       style: getFont16TextStyle(context,
//                           fontWeight: FontWeight.w400,
//                           color: const Color(0xFF949D9E)),
//                     ),
//                     TextSpan(
//                       text: ' ',
//                       style: getFont16TextStyle(context,
//                           fontWeight: FontWeight.w400,
//                           color: const Color(0xFF616A6B)),
//                     ),
//                     TextSpan(
//                       recognizer: TapGestureRecognizer()
//                         ..onTap = () {
//                           Navigator.pop(context);
//                         },
//                       text: 'تسجيل الدخول',
//                       style: getFont16TextStyle(context,
//                           fontWeight: FontWeight.w400,
//                           color: AppColors.primaryColor),
//                     ),
//                   ],
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }



///////////////////////////////////

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fruits/core/helper_functions/build_Errors_Bar.dart';
import 'package:fruits/core/utils/colors.dart';
import 'package:fruits/core/utils/text_styles.dart';
import 'package:fruits/core/widgets/custom_button.dart';
import 'package:fruits/core/widgets/custom_text_form_field.dart';
import 'package:fruits/core/widgets/password_field.dart';
import 'package:fruits/featuer/auth/presentation/cubits/signup_cubits/signup_cubit.dart';
import 'package:fruits/featuer/auth/presentation/views/widgets/terms_and_conditions.dart';

class SignupViewBody extends StatefulWidget {
  const SignupViewBody({super.key});

  @override
  State<SignupViewBody> createState() => _SignupViewBodyState();
}

class _SignupViewBodyState extends State<SignupViewBody> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;

  final TextEditingController emailController = TextEditingController();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  
  bool isTermsAccepted = false;

  @override
  void dispose() {
    emailController.dispose();
    userNameController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: formKey,
          autovalidateMode: autovalidateMode,
          child: Column(
            children: [
              const SizedBox(height: 24),
              CustomTextFormField(
                Controller: userNameController,
                hintText: 'الاسم كامل',
                textInputType: TextInputType.name,
              ),
              const SizedBox(height: 16),
              CustomTextFormField(
                Controller: emailController,
                hintText: 'البريد الإلكتروني',
                textInputType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 16),
              PasswordField(
                Controller: passwordController,
                
              ),
              const SizedBox(height: 16),
              TermsAndConditionsWidget(
                onChanged: (value) {
                  setState(() {
                    isTermsAccepted = value;
                  });
                },
              ),
              const SizedBox(height: 30),
              CustomButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    // controllers
                    String userName = userNameController.text.trim();
                    String email = emailController.text.trim();
                    String password = passwordController.text.trim();
                
                    // التأكد من عدم وجود قيم فارغة أو null
                    if (userName.isEmpty) {
                      buildErrorsBar(context, 'يرجى إدخال الاسم كامل.');
                      return;
                    }
                    if (email.isEmpty) {
                      buildErrorsBar(context, 'يرجى إدخال البريد الإلكتروني.');
                      return;
                    }
                    if (password.isEmpty) {
                      buildErrorsBar(context, 'يرجى إدخال كلمة المرور.');
                      return;
                    }
                    if (!isTermsAccepted) {
                      buildErrorsBar(context, 'يجب عليك الموافقة على الشروط والإحكام');
                      return;
                    }

                    context.read<SignupCubit>().createUserWithEmailAndPassword(
                          email,
                          password,
                          userName,
                        );
                  } else {
                    setState(() {
                      autovalidateMode = AutovalidateMode.always;
                    });
                  }
                },
                text: 'إنشاء حساب جديد',
              ),
              const SizedBox(height: 26),
              Text.rich(
                TextSpan(
                  children: [
                    TextSpan(
                      text: 'تمتلك حساب بالفعل ؟',
                      style: getFont16TextStyle(context,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF949D9E)),
                    ),
                    TextSpan(
                      text: ' ',
                      style: getFont16TextStyle(context,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF616A6B)),
                    ),
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.pop(context);
                        },
                      text: 'تسجيل الدخول',
                      style: getFont16TextStyle(context,
                          fontWeight: FontWeight.w400,
                          color: AppColors.primaryColor),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
