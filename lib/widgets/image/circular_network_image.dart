import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class CircularNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final Alignment? alignment;
  const CircularNetworkImage(
      {super.key,
      required this.imageUrl,
      this.width,
      this.height,
      this.alignment});

  @override
  Widget build(BuildContext context) {
    return ClipOval(
      child: CachedNetworkImage(
        width: width ?? 80,
        height: height ?? 80,
        fit: BoxFit.cover,
        alignment: alignment ?? Alignment.center,
        imageUrl: imageUrl,
        placeholder: (context, url) => const Center(
          child: SpinKitThreeBounce(
            color: appPrimaryColor,
            size: 18.0,
          ),
        ),
        errorWidget: (context, url, error) => const Icon(
          Icons.error_outline,
          size: 40,
          color: appPrimaryColor,
        ),
      ),
    );
  }
}
