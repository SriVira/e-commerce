import 'package:ecommerce/model/product/product_model.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/widgets/cards/primary_card.dart';
import 'package:ecommerce/widgets/image/primary_network_image.dart';
import 'package:ecommerce/widgets/text/primary_text.dart';
import 'package:ecommerce/widgets/text/secondary_text.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';

class ProductGridItem extends StatelessWidget {
  final ProductModel product;
  const ProductGridItem({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return PrimaryCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: PrimaryNetworkImage(
              imageUrl: product.thumbnail,
              width: context.width() / 2.5,
              borderRadius: 10,
              height: context.width() / 3,
            ),
          ),
          8.height,
          PrimaryText(
            text: product.title,
            fontWeight: FontWeight.bold,
            maxLines: 1,
            fontSize: 16,
          ),
          4.height,
          SecondaryText(
            text: "Rs ${product.price.toStringAsFixed(2)}",
            fontSize: 14,
          ),
          4.height,
          PrimaryCard(
            margin: const EdgeInsets.all(0),
            color: appPrimaryColor,
            child: PrimaryText(
              text: product.brand,
              maxLines: 1,
              fontSize: 12,
              color: appWhiteColor,
            ).paddingAll(4),
          ),
          4.height,
        ],
      ).paddingSymmetric(horizontal: 12),
    );
  }
}
