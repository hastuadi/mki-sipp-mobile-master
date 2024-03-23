import 'package:flutter/material.dart';
import 'package:sipp_mobile/enums/button_style.dart';

class BaseButton extends StatelessWidget {

  final Function()? onPressed;
  final Widget child;
  final AppButtonStyle buttonStyle;

  const BaseButton({
    Key? key,
    this.onPressed,
    required this.buttonStyle,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: onPressed, style: buttonStyle.renderStyle, child: child,);
  }
}
