import 'package:flutter/material.dart';
import 'package:store_app/models/home_model.dart';
import 'package:store_app/widgets/banners_slider.dart';
import 'package:store_app/widgets/product_builder.dart';

class ProductsLayout extends StatelessWidget {
  const ProductsLayout({super.key, required this.model});
  final HomeDataModel model;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          BannersSlider(
            model: model,
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              childAspectRatio: 1 / 1.5,
            ),
            itemCount: model.products.length,
            itemBuilder: (context, index) => ProductBuilder(
              model: model.products[index],
            ),
          ),
        ],
      ),
    );
  }
}
