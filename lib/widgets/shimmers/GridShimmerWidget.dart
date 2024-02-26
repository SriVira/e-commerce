// ignore_for_file: prefer_const_constructors, must_be_immutable, file_names
import 'package:ecommerce/widgets/shimmers/shimmer.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class GridShimmerWidget extends StatelessWidget {
  int? crossAxisCount;
  double? childAspectRatio;
  int? itemCount;
  GridShimmerWidget(
      {super.key, this.crossAxisCount, this.childAspectRatio, this.itemCount});

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: crossAxisCount ?? 2, // Number of columns
                crossAxisSpacing: 8.0,
                mainAxisSpacing: 8.0,
                childAspectRatio: childAspectRatio ?? 1),
            itemCount: itemCount ?? 6, // Number of grid items you want to show
            itemBuilder: (context, index) => ShimmerWidget.circular(
                  height: 100,
                  width: 100,
                  shapeBorder: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10))),
                )).paddingAll(8));
  }
}
