import 'package:flutter/material.dart';

import '../../../component/button/base_button.dart';
import '../../../component/other/responsive_layout.dart';
import '../../../constant/textstyles.dart';
import '../../../enums/button_style.dart';

class MenuWidget extends StatelessWidget {
  final String title;
  final TextStyle titleStyle;
  final String subtitle;
  final String buttonText;
  final Function() buttonAction;
  final Color backgroundColor;
  final AppButtonStyle buttonColor;
  const MenuWidget({
    super.key,
    required this.title,
    required this.titleStyle,
    required this.subtitle,
    required this.buttonText,
    required this.buttonAction,
    required this.backgroundColor,
    required this.buttonColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(20)
      ),
      child: SizedBox(
        width: ResponsiveLayout.isDesktop(context) || ResponsiveLayout.isTablet(context) ? 250 : null,
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title, style: titleStyle),
                  const SizedBox(height: 8,),
                  Text(subtitle, style: AppTextStyle.regular12Black,),
                  const SizedBox(height: 14,),
                  BaseButton(
                      buttonStyle: buttonColor,
                      onPressed: buttonAction,
                      child: Text(buttonText, style: AppTextStyle.regular12White,)
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
