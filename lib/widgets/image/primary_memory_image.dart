import 'dart:convert';
import 'package:flutter/material.dart';

class PrimaryMemoryImage extends StatelessWidget {
  final String imageString;
  final double? width;
  final double? height;
  final Alignment? alignment;
  final double? borderRadius;
  final BoxFit? fit;
  const PrimaryMemoryImage(
      {super.key,
      required this.imageString,
      this.width,
      this.borderRadius,
      this.height,
      this.alignment,
      this.fit});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      child: Image.memory(
        base64Decode(imageString.split(',').last),
        width: width ?? 80,
        height: height ?? 80,
        fit: fit ?? BoxFit.cover,
        alignment: alignment ?? Alignment.center,
      ),
    );
  }
}
