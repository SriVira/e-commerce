import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PrimaryNetworkImage extends StatelessWidget {
  final String imageUrl;
  final double? width;
  final double? height;
  final BoxFit? fit;
  final double? borderRadius;
  final Alignment? alignment;
  const PrimaryNetworkImage(
      {super.key,
      required this.imageUrl,
      this.width,
      this.height,
      this.fit,
      this.borderRadius,
      this.alignment});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius ?? 0),
      child: CachedNetworkImage(
        width: width ?? 80,
        height: height ?? 80,
        fit: fit ?? BoxFit.cover,
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
