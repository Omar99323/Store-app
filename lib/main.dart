import 'package:flutter/material.dart';
import 'package:store_app/helpers/consts.dart';
import 'package:store_app/pages/onboarding_pages.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ShopApp());
}

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            color: Colors.black,
          ),
          headlineLarge: TextStyle(
            color: Colors.black,
          ),
        ),
        scaffoldBackgroundColor: white,
        appBarTheme: AppBarTheme(
          elevation: 0,
          backgroundColor: white,
        ),
        fontFamily: 'Poppins',
        primarySwatch: maincolor,
      ),
      home: const OnBoardingPages(),
    );
  }
}
