import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app/cubits/app_cubit/whole_app_cubit.dart';
import 'package:store_app/cubits/app_cubit/whole_app_state.dart';
import 'package:store_app/helpers/cache_helper.dart';
import 'package:store_app/helpers/consts.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  static String id = 'HomePage';

  @override
  Widget build(BuildContext context) {
    var appCbt = BlocProvider.of<WholeAppCubit>(context);
    return BlocBuilder<WholeAppCubit, WholeAppStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: () {
                  appCbt.changeAppTheme();
                  CacheHelper.setData(key: 'theme', value: appCbt.isdark);
                },
                icon: Icon(
                  Icons.brightness_4_outlined,
                  color: appCbt.isdark ? white : dark,
                ),
              ),
            ],
          ),
          body: Container(),
        );
      },
    );
  }
}
