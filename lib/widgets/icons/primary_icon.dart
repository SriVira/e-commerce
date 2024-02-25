import 'package:ecommerce/utils/app_colors.dart';
import 'package:flutter/material.dart';


class PrimaryIcon extends StatelessWidget {
  final IconData? icon;
  final double? size;
  final Color? color;
  const PrimaryIcon({super.key, this.icon, this.size, this.color});

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size ?? 24,
      color: color ?? appWhiteColor,
    );
  }
}
