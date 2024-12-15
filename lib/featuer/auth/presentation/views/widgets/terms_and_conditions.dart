import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruits/core/utils/colors.dart';
import 'package:fruits/core/utils/text_styles.dart';
import 'package:fruits/featuer/auth/presentation/views/widgets/custom_check_box.dart';


class TermsAndConditionsWidget extends StatefulWidget {
  const TermsAndConditionsWidget({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;
  @override
  State<TermsAndConditionsWidget> createState() =>
      _TermsAndConditionsWidgetState();
}

class _TermsAndConditionsWidgetState extends State<TermsAndConditionsWidget> {
  bool isTermsAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomCheckBox(
          onChecked: (value) {
            isTermsAccepted = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: isTermsAccepted,
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              children: [
                TextSpan(
                  text: 'من خلال إنشاء حساب ، فإنك توافق على ',
                  style: getFont14TextStyle(context,color: Color(0xFF949D9E),fontWeight: FontWeight.w600),
                ),
                TextSpan(
                  text: ' الشروط والأحكام',
                  style: getFont14TextStyle(context,color: AppColors.lightPrimaryColor,fontWeight: FontWeight.w600),
                ),
                 TextSpan(
                  text: ' ',
                  style: getFont14TextStyle(context,color: AppColors.lightPrimaryColor,fontWeight: FontWeight.w400),
                ),
                TextSpan(
                  text: 'الخاصة',
                  style: getFont14TextStyle(context,color: AppColors.lightPrimaryColor,fontWeight: FontWeight.w400),
                ),
                 TextSpan(
                  text: ' ',
                  style: getFont14TextStyle(context,color: AppColors.lightPrimaryColor,fontWeight: FontWeight.w400),
                ),
                TextSpan(
                  text: 'بنا',
                  style: getFont14TextStyle(context,color: AppColors.lightPrimaryColor,fontWeight: FontWeight.w400),
                ),
              ],
            ),
            textAlign: TextAlign.right,
          ),
        )
      ],
    );
  }
}