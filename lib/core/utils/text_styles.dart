

import 'package:flutter/material.dart';
import 'package:fruits/core/utils/colors.dart';

TextStyle getFont30TextStyle(BuildContext context,
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontSize: fontSize ?? 30,
    fontWeight:fontWeight?? FontWeight.w500,
    color: color ??Theme.of(context).colorScheme.onSurface,
    fontFamily: "Cairo",
  );
}

TextStyle getFont24TextStyle(BuildContext context,
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontSize: fontSize ?? 24,
    fontWeight:fontWeight?? FontWeight.w500,
    color: color ??Theme.of(context).colorScheme.onSurface,
    fontFamily: "Cairo",
  );
}

TextStyle getFont20TextStyle(BuildContext context,
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontSize: fontSize ?? 20,
    fontWeight:fontWeight?? FontWeight.w500,
    color: color ?? AppColors.darkColor,
    fontFamily: "Cairo",
  );
}

TextStyle getFont18TextStyle(BuildContext context,
  {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontSize: fontSize ?? 18,
    fontWeight:fontWeight?? FontWeight.w500,
    color: color ??Theme.of(context).colorScheme.onSurface,
    fontFamily: "Cairo",
  );
}

TextStyle getFontBook16TextStyle(BuildContext context,{double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontSize: fontSize ?? 16,
    fontWeight:fontWeight?? FontWeight.w500,
    color: color ??AppColors.darkColor,
    fontFamily: "Cairo",

  );
}

TextStyle getFont14TextStyle(BuildContext context,{double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontSize: fontSize ?? 14,
    fontWeight:fontWeight?? FontWeight.w500,
    color: color ??Theme.of(context).colorScheme.onSurface,
    fontFamily: "Cairo",
  );
}



TextStyle getFont16TextStyle(BuildContext context,{double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontSize: fontSize ?? 16,
    fontWeight:fontWeight?? FontWeight.w500,
    color: color ??Theme.of(context).colorScheme.onSurface,
    fontFamily: "Cairo",
  );
}



TextStyle get20TextStyle(
    {double? fontSize, Color? color, FontWeight? fontWeight}) {
  return TextStyle(
    fontSize: fontSize ?? 20,
    color: color ?? AppColors.darkColor,
    fontFamily: "Cairo",
  );
}