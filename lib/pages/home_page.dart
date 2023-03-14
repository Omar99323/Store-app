import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/app_cubit/whole_app_cubit.dart';
import 'package:store_app/cubits/app_cubit/whole_app_state.dart';
import 'package:store_app/cubits/homepage_cubit/homepage_cubit.dart';
import 'package:store_app/cubits/homepage_cubit/homepage_state.dart';
import 'package:store_app/helpers/help_methods/logout.dart';
import 'package:store_app/pages/search_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    var hpCbt = BlocProvider.of<HomepageCubit>(context);
    var appCbt = BlocProvider.of<WholeAppCubit>(context);
    return BlocBuilder<WholeAppCubit, WholeAppStates>(
      builder: (context, state) {
        return BlocBuilder<HomepageCubit, HomepageStates>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, SearchPage.id);
                    },
                    icon: const Icon(Icons.search),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () {
                      appCbt.changeAppTheme();
                    },
                    icon: const Icon(Icons.brightness_2_outlined),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  IconButton(
                    onPressed: () {
                      logOut(context);
                    },
                    icon: const Icon(Icons.logout_outlined),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                ],
                title: Text(
                  'Salla',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
              ),
              body: BlocProvider.of<HomepageCubit>(context).homeResponseModel ==
                          null ||
                      BlocProvider.of<HomepageCubit>(context)
                              .categoriesResponseModel ==
                          null
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : hpCbt.screens[hpCbt.currentindex],
              bottomNavigationBar: BottomNavigationBar(
                iconSize: 30,
                currentIndex: hpCbt.currentindex,
                onTap: (value) {
                  hpCbt.getCurrentIndex(value);
                },
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'Products',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.apps),
                    label: 'Categories',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                    label: 'Favorites',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.settings),
                    label: 'Settings',
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
