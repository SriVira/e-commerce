import 'package:ecommerce/model/product/product_model.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/widgets/image/primary_network_image.dart';
import 'package:ecommerce/widgets/sliders/primary_carousel_slider.dart';
import 'package:ecommerce/widgets/text/primary_expandable_text.dart';
import 'package:ecommerce/widgets/text/primary_text.dart';
import 'package:ecommerce/widgets/text/secondary_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:nb_utils/nb_utils.dart';

class ProductDetailsPage extends StatelessWidget {
  final ProductModel product;
  const ProductDetailsPage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: appWhiteColor, //change your color here
        ),
        title: PrimaryText(
          text: product.title,
          color: appWhiteColor,
          fontSize: 18,
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PrimaryCarouselSlider(
              height: context.width() / 2,
              viewportFraction: 1,
              sliderItem: product.images
                  .map((image) => PrimaryNetworkImage(
                        imageUrl: image,
                        width: context.width(),
                        fit: BoxFit.cover,
                        height: context.width() / 2,
                      ))
                  .toList()),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              12.height,
              PrimaryText(
                text: product.title,
                fontWeight: FontWeight.bold,
                maxLines: 1,
                fontSize: 20,
              ),
              12.height,
              PrimaryExpandableText(
                text: product.description,
                color: blackColor,
                maxLines: 3,
                fontSize: 14,
              ),
              12.height,
              RatingBar.builder(
                initialRating: product.rating,
                minRating: 1,
                direction: Axis.horizontal,
                allowHalfRating: true,
                itemCount: 5,
                itemSize: 25,
                itemPadding: const EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => const Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {},
              ),
              12.height,
              SecondaryText(
                text: "Rs ${product.price.toStringAsFixed(2)}",
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ],
          ).paddingAll(8),
        ],
      ),
    );
  }
}
