import 'package:flutter/material.dart';
import 'package:fruits/core/widgets/custom_text_form_field.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    super.key,
    this.onSaved, this.Controller, 
  });
  final void Function(String?)? onSaved;
    final TextEditingController? Controller ;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      Controller:widget.Controller,
        obscureText: obscureText,
         onSaved:widget.onSaved, // (value) {},
        suffixIcon: GestureDetector(
          onTap: () {
            obscureText = !obscureText;
            setState(() {
              
            });
          },
          child: obscureText? const Icon(
            Icons.visibility_off,
            color: Color(0xFF949D9E),
          )
          : const Icon(
            Icons.remove_red_eye,
            color: Color(0xFF949D9E),
          )
        ),
        hintText: "كلمة المرور",
        textInputType: TextInputType.visiblePassword);
  }
}
