
import 'package:ecommerce/utils/app_colors.dart';
import 'package:flutter/material.dart';

class PrimaryPasswordFormFeild extends StatefulWidget {
  final String? hintText;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Color? fillColor;
  final Color? textColor;
  final Color? suffixIconColor;
  const PrimaryPasswordFormFeild(
      {super.key,
      this.hintText,
      this.textColor,
      this.validator,
      this.controller,
      this.suffixIconColor,
      this.fillColor});

  @override
  State<PrimaryPasswordFormFeild> createState() =>
      _PrimaryPasswordFormFeildState();
}

class _PrimaryPasswordFormFeildState extends State<PrimaryPasswordFormFeild> {
  bool isPassword = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      style: TextStyle(
          color: widget.textColor ?? appBlackColor,
          fontSize: 16,
          decoration: TextDecoration.none,
          decorationThickness: 0),
      obscureText: isPassword,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
        suffixIcon: IconButton(
          icon: Icon(
            isPassword ? Icons.visibility : Icons.visibility_off,
            color: widget.suffixIconColor ?? appPrimaryColor,
            size: 24,
          ),
          onPressed: () {
            setState(() {
              isPassword = !isPassword;
            });
          },
        ),
        hintText: widget.hintText ?? '',
        hintStyle:
            const TextStyle(color: Colors.grey, fontWeight: FontWeight.w400),
        filled: true,
        contentPadding: const EdgeInsets.symmetric(horizontal: 8, vertical: 14),
        fillColor: widget.fillColor ?? appBlackColor.withOpacity(0.05),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          gapPadding: 1.0,
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
