import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:store_app/helpers/consts.dart';
import 'package:store_app/pages/home_page.dart';
import 'package:store_app/pages/login.dart';
import 'package:store_app/pages/onboarding_pages.dart';
import 'package:store_app/pages/register.dart';

import 'helpers/observer.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver() ;
  runApp(const ShopApp());
}

class ShopApp extends StatelessWidget {
  const ShopApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
          headlineMedium: TextStyle(
            color: maincolor,
          ),
          headlineLarge: const TextStyle(
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
      routes: {
        OnBoardingPages.id: (context) => const OnBoardingPages(),
        LogInPage.id: (context) => const LogInPage(),
        RegisterPage.id: (context) => const RegisterPage(),
        HomePage.id: (context) => const HomePage(),
      },
      initialRoute: OnBoardingPages.id,
    );
  }
}
