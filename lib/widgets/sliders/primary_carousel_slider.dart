import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class PrimaryCarouselSlider extends StatelessWidget {
  final List<Widget> sliderItem;
  final double? height;
  final double? viewportFraction;

  const PrimaryCarouselSlider(
      {super.key, required this.sliderItem, this.height, this.viewportFraction});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
        options: CarouselOptions(
          height: height ?? 150,
          aspectRatio: 16 / 9,
          viewportFraction: viewportFraction ?? 0.90,
          initialPage: 0,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: 3),
          autoPlayAnimationDuration: const Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: false,
          enlargeFactor: 0.3,
          scrollDirection: Axis.horizontal,
        ),
        itemCount: sliderItem.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            sliderItem[itemIndex]);
  }
}
