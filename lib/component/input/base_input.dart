import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sipp_mobile/constant/textstyles.dart';

class BaseInput extends StatelessWidget {

  final bool? enabled;
  final String? hint;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatter;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? keyboardType;
  final int? maxLength;
  final TextInputAction? textInputAction;
  final Function(String?)? onSaved;
  final bool? obscureText;


  const BaseInput({
    Key? key,
    required this.controller,
    required this.hint,
    this.enabled,
    this.inputFormatter,
    this.onChanged,
    this.validator,
    this.autovalidateMode,
    this.keyboardType,
    this.maxLength,
    this.textInputAction,
    this.onSaved,
    this.obscureText
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      enabled: enabled,
      inputFormatters: inputFormatter,
      onChanged: onChanged,
      validator: validator,
      autovalidateMode: autovalidateMode,
      keyboardType: keyboardType,
      maxLength: maxLength,
      textInputAction: textInputAction,
      onSaved: onSaved,
      obscureText: obscureText ?? false,
      decoration: InputDecoration(
        filled: false,
        errorMaxLines: 2,
        isDense: true,
        hintText: hint,
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
            style: BorderStyle.solid,
            width: 1,
            color: Colors.red
          ),
        ),
        errorStyle: AppTextStyle.regular12Red,
        enabledBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
              style: BorderStyle.solid,
              width: 1,
              color: Colors.black26
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(8)),
          borderSide: BorderSide(
              style: BorderStyle.solid,
              width: 1,
              color: Colors.black26
          ),
        ),
        hintStyle: AppTextStyle.regular12Black
      ),
    );
  }
}
