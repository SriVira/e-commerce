
import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/utils/app_fonts.dart';
import 'package:flutter/material.dart';

class PrimaryText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  const PrimaryText(
      {super.key,
      required this.text,
      this.fontSize,
      this.fontWeight,
      this.textAlign,
      this.overflow,
      this.maxLines,
      this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow,
      style: TextStyle(
          color: color ?? appBlackColor,
          fontFamily: fontPlusJakarta,
          fontSize: fontSize ?? 16,
          fontWeight: fontWeight ?? FontWeight.w400),
    );
  }
}
