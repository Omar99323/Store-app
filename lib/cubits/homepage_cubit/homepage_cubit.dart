import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:store_app/helpers/api.dart';
import 'package:store_app/helpers/consts.dart';
import 'package:store_app/helpers/help_methods/show_snackbar.dart';
import 'package:store_app/models/categories_model.dart';
import 'package:store_app/models/favorite_model.dart';
import 'package:store_app/models/home_model.dart';
import 'package:store_app/models/login_model.dart';
import 'package:store_app/pages/nav_pagess/categories_page.dart';
import 'package:store_app/pages/nav_pagess/favorites_page.dart';
import 'package:store_app/pages/nav_pagess/products_page.dart';
import 'package:store_app/pages/nav_pagess/settings_page.dart';
import 'homepage_state.dart';

class HomepageCubit extends Cubit<HomepageStates> {
  HomepageCubit() : super(HomepageInitial());

  HomeModel? homeResponseModel;
  LoginResponseModel? profilemodel;
  LoginResponseModel? updateProfilemodel;
  CategoriesResponseModel? categoriesResponseModel;
  FavoritesResponseModel? favoritesResponseModel;
  int currentindex = 0;
  Map<int, bool> allProductsFavorites = {};
  List<FavoriteModel> favoriteProducts = [];

  List<Widget> screens = [
    const ProductsPage(),
    const CategoriesPage(),
    const FavoritesPage(),
    const SettingsPage(),
  ];

  void getCurrentIndex(int index) {
    currentindex = index;
    emit(HomepageNavBarState());
  }

  void getProducts() {
    emit(HomepageLoading());
    Api()
        .get(
      url: 'home',
      token: token,
    )
        .then((value) {
      homeResponseModel = HomeModel.fromjson(value);
      for (var element in homeResponseModel!.data.products) {
        allProductsFavorites.addAll({
          element.id: element.infavorites,
        });
      }

      emit(HomepageSuccess());
    }).catchError((error) {
      emit(HomepageError(error: error.toString()));
    });
  }

  void getCategories() {
    Api()
        .get(
      url: 'categories',
      token: token,
    )
        .then((value) {
      categoriesResponseModel = CategoriesResponseModel.fromjson(value);
      emit(GetCategoriesSuccess());
    }).catchError((error) {
      emit(GetCategoriesError(error: error.toString()));
    });
  }

  void addOrDeleteFavorite(int id, context) {
    allProductsFavorites[id] = !allProductsFavorites[id]!;
    Api()
        .post(
      url: 'favorites',
      body: {
        'product_id': id,
      },
      token: token,
    )
        .then((value) {
      if (!value['status']) {
        allProductsFavorites[id] = !allProductsFavorites[id]!;
        ScaffoldMessenger.of(context).showSnackBar(
          snackmessage(
            value['message'],
            Colors.red,
          ),
        );
        emit(EditFavoritesError(error: value['message']));
      } else {
        emit(EditFavoritesSuccess());
        getFavorites();
      }
    }).catchError((error) {
      allProductsFavorites[id] = !allProductsFavorites[id]!;
      emit(EditFavoritesError(error: error.toString()));
    });
  }

  void getFavorites() {
    emit(GetFavoritesLoading());
    favoriteProducts.clear();
    Api()
        .get(
      url: 'favorites',
      token: token,
    )
        .then((value) {
      favoritesResponseModel = FavoritesResponseModel.fromjson(value);
      for (var element in favoritesResponseModel!.data.favorites) {
        favoriteProducts.add(element);
      }
      emit(GetFavoritesSuccess());
    }).catchError((error) {
      emit(GetFavoritesError(error: error.toString()));
    });
  }

  void getProfile() {
    Api()
        .get(
      url: 'profile',
      token: token,
    )
        .then((value) {
      profilemodel = LoginResponseModel.fromjson(value);
      emit(GetProfileSuccess());
    }).catchError((error) {
      emit(GetProfileError(error: error.toString()));
    });
  }

  void updateProfile({
    required String name,
    required String email,
    required String phone,
  }) {
    emit(UpdateProfileLoading());
    Api().put(
      url: 'update-profile',
      token: token,
      body: {
        'name': name,
        'email': email,
        'phone': phone,
      },
    ).then((value) {
      updateProfilemodel = LoginResponseModel.fromjson(value);
      emit(UpdateProfileSuccess(updateProfilemodel!));
    }).catchError((error) {
      emit(UpdateProfileError(error: error.toString()));
    });
  }
}
