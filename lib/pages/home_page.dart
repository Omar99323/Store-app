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
    var cbt = BlocProvider.of<WholeAppCubit>(context);
    return BlocBuilder<WholeAppCubit, WholeAppStates>(
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            actions: [
              IconButton(
                onPressed: () {
                  cbt.changeAppTheme();
                  CacheHelper.putData(key: 'theme', value: cbt.isdark);
                },
                icon: Icon(
                  Icons.brightness_4_outlined,
                  color: cbt.isdark ? white : dark,
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
