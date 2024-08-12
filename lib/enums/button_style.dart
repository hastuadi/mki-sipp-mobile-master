import 'package:flutter/material.dart';
import 'package:sipp_mobile/constant/colors.dart';
import 'package:sipp_mobile/constant/textstyles.dart';

enum AppButtonStyle {
  filled,
  purpleFilled,
  redFilled,
  deepBlueFilled,
  orangeFilled,
  greenFilled
}

extension AppButtonStyleExt on AppButtonStyle {
  ButtonStyle setFilledStyle({
    Color? bgColor,
    Color? pressedColor,
    Color? disabledColor,
    TextStyle? textStyle,
    Color? foregroundColor,
    MaterialStateProperty<double?>? elevation
  }) {
    return ButtonStyle(
      minimumSize: MaterialStateProperty.resolveWith<Size>((states) => const Size(double.infinity, 42)),
      shape: MaterialStateProperty.resolveWith<OutlinedBorder>((states) => RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
      elevation: elevation,
      backgroundColor: MaterialStateProperty.resolveWith<Color>(
          (Set<MaterialState> states) {
        if(states.contains(MaterialState.pressed)) {
          return pressedColor ?? AppColor.primaryColor;
        } else if (states.contains(MaterialState.disabled)) {
          return disabledColor ?? Colors.grey.shade400;
        }
        return bgColor ?? AppColor.primaryColor;
      }),
      textStyle: MaterialStateProperty.resolveWith<TextStyle>((states) => textStyle ?? AppTextStyle.bold12White),
      foregroundColor: MaterialStateProperty.resolveWith<Color>((states) => Colors.white)
    );
  }

  ButtonStyle get renderStyle {
    switch(this) {
      case AppButtonStyle.filled:
        return setFilledStyle();
      case AppButtonStyle.purpleFilled:
        return setFilledStyle(bgColor: AppColor.purple, pressedColor: AppColor.purple.withOpacity(0.9));
      case AppButtonStyle.redFilled:
        return setFilledStyle(bgColor: AppColor.red, pressedColor: AppColor.red.withOpacity(0.9));
      case AppButtonStyle.deepBlueFilled:
        return setFilledStyle(bgColor: AppColor.deepBlue, pressedColor: AppColor.deepBlue.withOpacity(0.9));
      case AppButtonStyle.orangeFilled:
        return setFilledStyle(bgColor: AppColor.orange, pressedColor: AppColor.orange.withOpacity(0.9));
      case AppButtonStyle.greenFilled:
        return setFilledStyle(bgColor: AppColor.greenColor, pressedColor: AppColor.greenColor.withOpacity(0.9));
    }
  }
}