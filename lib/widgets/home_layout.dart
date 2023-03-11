import 'package:flutter/material.dart';
import 'package:store_app/models/home_model.dart';
import 'package:store_app/widgets/banners_slider.dart';
import 'package:store_app/widgets/product_builder.dart';

class HomeLayout extends StatelessWidget {
  const HomeLayout({super.key, required this.model});
  final HomeDataModel model;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BannersSlider(
          model: model,
        ),
        GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemBuilder: (context, index) => ProductBuilder(
            model: model,
          ),
        )
      ],
    );
  }
}
