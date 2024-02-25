// ignore_for_file: file_names, must_be_immutable
import 'package:ecommerce/widgets/shimmers/shimmer.dart';
import 'package:flutter/material.dart';


class ListShimmerWidget extends StatelessWidget {
  double? itemheight;
  double? itemwidth;
  bool? circular = false;
  Axis? scrollDirection;
  bool? shrinkWrap = false;
  EdgeInsetsGeometry? margin;
  ListShimmerWidget(
      {super.key,
      this.itemheight,
      this.itemwidth,
      this.margin,
      this.shrinkWrap,
      this.scrollDirection,
      this.circular});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      shrinkWrap: shrinkWrap ?? false,
      itemCount: 15,
      scrollDirection: scrollDirection ?? Axis.vertical,
      itemBuilder: (context, index) {
        if (circular == true) {
          return ShimmerWidget.circular(
            height: itemheight ?? 60,
            width: itemwidth,
            margin: margin,
          );
        } else {
          return ShimmerWidget.rectangular(
            height: itemheight ?? 60,
            width: itemwidth,
            margin: margin,
            shapeBorder: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
          );
        }
      },
    );
  }
}
