import 'package:flutter/material.dart';
import 'package:store_app/helpers/consts.dart';
import 'package:store_app/pages/onboarding_pages.dart';

void main() {
  runApp(const ShopApp());
}

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primarySwatch: maincolor,
      ),
      home: const OnBoardingPages(),
    );
  }
}
