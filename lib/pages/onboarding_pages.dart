import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:store_app/cubits/app_cubit/whole_app_cubit.dart';
import 'package:store_app/helpers/consts.dart';
import 'package:store_app/models/onboard_model.dart';
import 'package:store_app/pages/login.dart';
import 'package:store_app/pages/onboard_page.dart';

class OnBoardingPages extends StatefulWidget {
  const OnBoardingPages({super.key});
  static String id = 'OnBoardingPages';

  @override
  State<OnBoardingPages> createState() => _OnBoardingPagesState();
}

class _OnBoardingPagesState extends State<OnBoardingPages> {
  bool lastpage = false;
  PageController control = PageController();
  List<OnBoardModel> onboardlist = [
    OnBoardModel(
      image: 'assets/images/shop_kachier.png',
      title: 'Service speed, efficiency',
      body: 'Don\'t worry about queues or any lose of your orders.',
    ),
    OnBoardModel(
      image: 'assets/images/husband_wife_shop.png',
      title: 'Family Needs',
      body: 'Search for your family needs you will find it.',
    ),
    OnBoardModel(
      image: 'assets/images/shop_confuse.png',
      title: 'Don\'t Be Confused',
      body: 'You will find everything you want from a to z.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          TextButton(
            onPressed: () {
              BlocProvider.of<WholeAppCubit>(context).notFirstTime();
              Navigator.pushNamedAndRemoveUntil(
                  context, LogInPage.id, (route) => false);
            },
            child: const Text(
              'SKIP',
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (value) {
                  if (value == (onboardlist.length - 1)) {
                    setState(() {
                      lastpage = true;
                    });
                  } else {
                    setState(() {
                      lastpage = false;
                    });
                  }
                },
                physics: const BouncingScrollPhysics(),
                controller: control,
                itemBuilder: (context, index) => OnBoardPage(
                  model: onboardlist[index],
                ),
                itemCount: onboardlist.length,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Row(
              children: [
                Expanded(
                  child: Center(
                    child: SmoothPageIndicator(
                      controller: control,
                      count: onboardlist.length,
                      onDotClicked: (index) => control.jumpToPage(index),
                      effect: ExpandingDotsEffect(
                        expansionFactor: 4,
                        activeDotColor: maincolor,
                        dotWidth: 20,
                        dotHeight: 20,
                        spacing: 10,
                      ),
                    ),
                  ),
                ),
                FloatingActionButton(
                  onPressed: () {
                    if (lastpage) {
                      BlocProvider.of<WholeAppCubit>(context).notFirstTime();
                      Navigator.pushNamedAndRemoveUntil(
                          context, LogInPage.id, (route) => false);
                    } else {
                      control.nextPage(
                        duration: const Duration(seconds: 1),
                        curve: Curves.fastLinearToSlowEaseIn,
                      );
                    }
                  },
                  child: Icon(
                    Icons.arrow_forward,
                    color: white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
