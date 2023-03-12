import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store_app/helpers/api.dart';
import 'package:store_app/helpers/consts.dart';
import 'package:store_app/models/home_model.dart';
import 'package:store_app/pages/nav_pagess/categories_page.dart';
import 'package:store_app/pages/nav_pagess/favorites_page.dart';
import 'package:store_app/pages/nav_pagess/products_page.dart';
import 'package:store_app/pages/nav_pagess/settings_page.dart';
import 'homepage_state.dart';

class HomepageCubit extends Cubit<HomepageStates> {
  HomepageCubit() : super(HomepageInitial());

  HomeModel? homeResponseModel;
  int currentindex = 0;
  Color favColor = Colors.grey;
  bool favPress = false;
  List<Widget> screens = [
    const ProductsPage(),
    const CategoriesPage(),
    const FavoritesPage(),
    const SettingsPage(),
  ];

  void changeFavColor() {
    if (favPress == true) {
      favColor = Colors.red;
      favPress = false;
    } else {
      favColor = Colors.grey;
      favPress = true;
    }
    emit(FavColorChangeState());
  }

  void getCurrentIndex(int index) {
    currentindex = index;
    emit(HomepageNavBarState());
  }

  void getProducts() async {
    emit(HomepageLoading());
    await Api()
        .get(
      url: 'home',
      token: token,
    )
        .then((value) {
      homeResponseModel = HomeModel.fromjson(value);
      emit(HomepageSuccess());
    }).catchError((error) {
      emit(HomepageError(error: error.toString()));
    });
  }
}
