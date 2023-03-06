import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/app_cubit/whole_app_cubit.dart';
import 'package:store_app/cubits/app_cubit/whole_app_state.dart';
import 'package:store_app/helpers/cache_helper.dart';
import 'package:store_app/helpers/consts.dart';
import 'package:store_app/pages/home_page.dart';
import 'package:store_app/pages/login.dart';
import 'package:store_app/pages/onboarding_pages.dart';
import 'package:store_app/pages/register.dart';
import 'helpers/observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await CacheHelper.init();
  bool? theme = CacheHelper.getBool(
    key: 'theme',
  );
  bool? firsttime = CacheHelper.getBool(
    key: 'firsttime',
  );

  runApp(
    ShopApp(
      theme: theme,
      firsttime: firsttime,
    ),
  );
}

class ShopApp extends StatelessWidget {
  const ShopApp({super.key, required this.theme, required this.firsttime});
  final bool? theme;
  final bool? firsttime;

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
      ),
    );
    return BlocProvider(
      create: (context) => WholeAppCubit()
        ..changeAppTheme(
          shared: theme,
        )
        ..notFirstTime(
          shared: firsttime,
        ),
      child: BlocBuilder<WholeAppCubit, WholeAppStates>(
        builder: (context, state) {
          
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: BlocProvider.of<WholeAppCubit>(context).isdark
                ? ThemeMode.dark
                : ThemeMode.light,
            theme: ThemeData(
              textTheme: TextTheme(
                headlineMedium: TextStyle(
                  color: maincolor,
                ),
                headlineLarge: const TextStyle(
                  color: Colors.black,
                ),
                bodyLarge: const TextStyle(
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
            darkTheme: ThemeData(
              textTheme: TextTheme(
                headlineMedium: TextStyle(
                  color: maincolor,
                ),
                headlineLarge: const TextStyle(
                  color: Colors.white,
                ),
                bodyLarge: const TextStyle(
                  color: Colors.white,
                ),
              ),
              scaffoldBackgroundColor: dark,
              appBarTheme: AppBarTheme(
                elevation: 0,
                backgroundColor: dark,
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
            initialRoute: BlocProvider.of<WholeAppCubit>(context).firsttime
                ? OnBoardingPages.id
                : LogInPage.id,
          );
        },
      ),
    );
  }
}
