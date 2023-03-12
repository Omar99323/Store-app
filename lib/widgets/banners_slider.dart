import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:store_app/models/home_model.dart';

class BannersSlider extends StatelessWidget {
  const BannersSlider({
    super.key,
    required this.model,
  });

  final HomeDataModel model;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: model.banners
          .map((e) => Image(
                image: NetworkImage(e.image),
                width: double.infinity,
                fit: BoxFit.cover,
              ))
          .toList(),
      options: CarouselOptions(
        height: 200,
        initialPage: 0,
        viewportFraction: 1,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: false,
        autoPlayInterval: const Duration(seconds: 3),
        autoPlayAnimationDuration: const Duration(seconds: 1),
        autoPlayCurve: Curves.fastOutSlowIn,
      ),
    );
  }
}
