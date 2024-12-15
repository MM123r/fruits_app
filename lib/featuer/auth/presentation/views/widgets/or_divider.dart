import 'package:flutter/material.dart';
import 'package:fruits/core/utils/text_styles.dart';
import 'package:gap/gap.dart';

class or_divider extends StatelessWidget {
  const or_divider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
     children: [
       const Expanded(child: Divider(color: Color(0xFFDCDEDE),)),
       const Gap(16),
       Text("او",style: getFont16TextStyle(context,fontWeight: FontWeight.w600),),
      const  Gap(16),
       const Expanded(child: Divider(color: Color(0xFFDCDEDE),)),
     ],
              );
  }
}