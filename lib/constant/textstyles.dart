import 'package:flutter/material.dart';
import 'package:sipp_mobile/constant/colors.dart';

class AppTextStyle {
  static TextStyle bold24 = const TextStyle(
    fontSize: 24,
    fontFamily: 'Poppins',
    fontWeight: FontWeight.bold
  );

  static TextStyle bold18 = const TextStyle(
      fontSize: 18,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold
  );

  static TextStyle regular14 = const TextStyle(
      fontSize: 14,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.normal
  );

  static TextStyle bold14 = const TextStyle(
      fontSize: 14,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold
  );

  static TextStyle regular12 = const TextStyle(
      fontSize: 12,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.normal
  );

  static TextStyle bold12 = const TextStyle(
      fontSize: 12,
      fontFamily: 'Poppins',
      fontWeight: FontWeight.bold
  );

  static TextStyle bold24Black = AppTextStyle.bold24.copyWith(color: Colors.black);
  static TextStyle bold18Black = AppTextStyle.bold18.copyWith(color: Colors.black);
  static TextStyle regular14Black = AppTextStyle.regular14.copyWith(color: Colors.black);
  static TextStyle regular14White = AppTextStyle.regular14.copyWith(color: Colors.white);
  static TextStyle bold14Primary = AppTextStyle.bold14.copyWith(color: AppColor.primaryColor);
  static TextStyle regular12Red = AppTextStyle.regular12.copyWith(color: Colors.red);
  static TextStyle regular12Black = AppTextStyle.regular12.copyWith(color: Colors.black26);
  static TextStyle bold12White = AppTextStyle.bold12.copyWith(color: Colors.white);

}