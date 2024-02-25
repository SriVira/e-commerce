import 'package:ecommerce/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final ShapeBorder? shapeBorder;
  final EdgeInsetsGeometry? margin;

  const ShimmerWidget.rectangular(
      {super.key,
      this.width = double.infinity,
      required this.height,
      this.shapeBorder,
      this.margin});

  const ShimmerWidget.circular(
      {super.key,
      this.width,
      this.height,
      this.margin,
      this.shapeBorder = const CircleBorder()});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[400]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        decoration: ShapeDecoration(
            shape: shapeBorder ?? const RoundedRectangleBorder(),
            color: appGreyColor.withOpacity(0.5)),
      ),
    );
  }
}
