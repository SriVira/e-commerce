
import 'package:ecommerce/utils/app_colors.dart';
import 'package:flutter/material.dart';

class PrimaryTextFormFeild extends StatelessWidget {
  final String? hintText;
  final String? Function(String?)? validator;
  final Color? fillColor;
  final Color? textColor;
  final int? maxLength;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  const PrimaryTextFormFeild(
      {super.key,
      this.hintText,
      this.validator,
      this.controller,
      this.maxLength,
      this.fillColor,
      this.onChanged,
      this.keyboardType,
      this.textColor});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      maxLength: maxLength,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      keyboardType: keyboardType,
      onChanged: onChanged,
      enableSuggestions: false,
      autocorrect: false,
      style: TextStyle(
          color: textColor ?? appBlackColor,
          fontSize: 16,
          decoration: TextDecoration.none,
          decorationThickness: 0),
      decoration: InputDecoration(
        hintText: hintText ?? '',
        counterText: '',
        hintStyle:
            const TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
        fillColor: fillColor ?? appBlackColor.withOpacity(0.05),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          gapPadding: 1.0,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
