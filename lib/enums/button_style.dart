import 'package:flutter/material.dart';
import 'package:sipp_mobile/constant/colors.dart';
import 'package:sipp_mobile/constant/textstyles.dart';

enum AppButtonStyle {
  filled
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
      minimumSize: MaterialStateProperty.resolveWith<Size>((states) => const Size(double.infinity, 40)),
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
    }
  }
}