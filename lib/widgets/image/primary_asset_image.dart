import 'package:flutter/material.dart';

class PrimaryAssetImage extends StatelessWidget {
  final String imageAsset;
  final double? width;
  final double? height;
  final Alignment? alignment;
  final BoxFit? fit;
  const PrimaryAssetImage(
      {super.key,
      required this.imageAsset,
      this.width,
      this.height,
      this.alignment,
      this.fit});

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageAsset,
      width: width ?? 80,
      height: height ?? 80,
      fit: fit ?? BoxFit.cover,
      alignment: alignment ?? Alignment.center,
    );
  }
}
