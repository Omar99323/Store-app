import 'package:flutter/material.dart';
import '../../pages/login.dart';
import '../cache_helper.dart';

void logOut(BuildContext context) async {
    return await CacheHelper.deleteData(key: 'token').then(
      (value) {
        if (value) {
          Navigator.pushNamedAndRemoveUntil(
              context, LogInPage.id, (route) => false);
        }
      },
    );
  }