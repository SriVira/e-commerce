import 'package:ecommerce/bloc/products_bloc.dart';
import 'package:ecommerce/screens/product_details_page.dart';
import 'package:ecommerce/screens/widgets/product_grid_item.dart';
import 'package:ecommerce/utils/app_colors.dart';
import 'package:ecommerce/widgets/shimmers/GridShimmerWidget.dart';
import 'package:ecommerce/widgets/text/primary_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:nb_utils/nb_utils.dart';

class ProductHomePage extends StatefulWidget {
  const ProductHomePage({super.key});

  @override
  State<ProductHomePage> createState() => _ProductHomePageState();
}

class _ProductHomePageState extends State<ProductHomePage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ProductItemsBloc>(context).add(GetProductItems());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBackgroundColor,
      appBar: AppBar(
        title: const PrimaryText(
          text: "Products",
          color: white,
          fontSize: 18,
        ),
        backgroundColor: Colors.black,
      ),
      body: Column(
        children: [
          BlocBuilder<ProductItemsBloc, ProductItemsState>(
            builder: (context, state) {
              if (state is ProductItemsLoaded) {
                return GridView.builder(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 8, vertical: 8),
                        itemCount: state.data.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 8.0,
                          mainAxisSpacing: 8.0,
                          childAspectRatio: 0.75,
                        ),
                        itemBuilder: (context, index) => GestureDetector(
                            onTap: () => Get.to(ProductDetailsPage(
                                  product: state.data[index],
                                )),
                            child: ProductGridItem(product: state.data[index])))
                    .expand();
              }

              if (state is ProductItemsEmpty) {
                return Center(
                    child: PrimaryText(
                  text: state.message,
                  color: appDangerColor,
                ));
              }

              if (state is ProductItemsError) {
                return Center(
                    child: PrimaryText(
                  text: state.message,
                  color: appDangerColor,
                ));
              }

              return GridShimmerWidget(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                itemCount: 12,
              );
            },
          )
        ],
      ),
    );
  }
}
