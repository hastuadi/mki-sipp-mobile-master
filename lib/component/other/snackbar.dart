import 'package:flutter/material.dart';
import 'package:sipp_mobile/constant/textstyles.dart';
import 'package:sipp_mobile/util/app_navigation.dart';

class AppSnackBar {
  AppSnackBar._private();
  
  static AppSnackBar instance = AppSnackBar._private();
  
  factory AppSnackBar() {
    return instance;
  }
  
  show(String? message) {
    ScaffoldMessenger.of(AppNavigation.instance.getContext()!).showSnackBar(
      SnackBar(
        content: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Icon(Icons.warning_rounded, color: Colors.white,),
            const SizedBox(width: 10,),
            Expanded(child: Text(message ?? "", style: AppTextStyle.regular12White,)),
          ],
        ),
        backgroundColor: Colors.orange,
        margin: const EdgeInsets.all(16),
        behavior: SnackBarBehavior.floating,
      ),
    );
  }
  
}