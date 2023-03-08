import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/app_cubit/whole_app_cubit.dart';
import 'package:store_app/cubits/app_cubit/whole_app_state.dart';
import 'package:store_app/helpers/cache_helper.dart';
import 'package:store_app/pages/home_page.dart';
import 'package:store_app/pages/login.dart';
import 'package:store_app/pages/onboarding_pages.dart';
import 'package:store_app/pages/register.dart';
import 'package:store_app/themes/themes.dart';
import 'helpers/observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  String startWidget;
  await CacheHelper.init();
  bool? theme = CacheHelper.getData(key: 'theme');
  bool? firsttime = CacheHelper.getData(key: 'firsttime');
  String? token = CacheHelper.getData(key: 'token');
  if (firsttime != null) {
    if (token != null) {
      startWidget = HomePage.id;
    } else {
      startWidget = LogInPage.id;
    }
  } else {
    startWidget = OnBoardingPages.id;
  }

  runApp(
    ShopApp(
      theme: theme,
      startPage: startWidget,
    ),
  );
}

class ShopApp extends StatelessWidget {
  const ShopApp({super.key, required this.theme, required this.startPage});
  final bool? theme;
  final String startPage;

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
        ),
      child: BlocBuilder<WholeAppCubit, WholeAppStates>(
        builder: (context, state) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            themeMode: BlocProvider.of<WholeAppCubit>(context).isdark
                ? ThemeMode.dark
                : ThemeMode.light,
            theme: lightThemeData(),
            darkTheme: darkThemeData(),
            routes: {
              OnBoardingPages.id: (context) => const OnBoardingPages(),
              LogInPage.id: (context) => const LogInPage(),
              RegisterPage.id: (context) => const RegisterPage(),
              HomePage.id: (context) => const HomePage(),
            },
            initialRoute: startPage,
          );
        },
      ),
    );
  }
}
