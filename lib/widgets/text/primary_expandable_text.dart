import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/utils/app_fonts.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';

class PrimaryExpandableText extends StatelessWidget {
  final String text;
  final Color? color;
  final double? fontSize;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  const PrimaryExpandableText(
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
    return ExpandableText(
      text,
      textAlign: textAlign,
      expandText: ' Show more',
      collapseText: ' Show less',
      animation: true,
      maxLines: maxLines ?? 2,
      linkColor: appPrimaryColor,
      style: TextStyle(
          color: color ?? appWhiteColor,
          fontFamily: fontPlusJakarta,
          fontSize: fontSize ?? 16,
          fontWeight: fontWeight ?? FontWeight.w400),
    );
  }
}
