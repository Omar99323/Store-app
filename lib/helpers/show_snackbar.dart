import 'package:flutter/material.dart';

SnackBar snackmessage(String msg, Color backgroundcolor) {
  return SnackBar(
    margin: const EdgeInsets.all(50),
    content: Center(
        child: Text(
      msg,
      textAlign: TextAlign.center,
    )),
    duration: const Duration(seconds: 2),
    backgroundColor: backgroundcolor,
    behavior: SnackBarBehavior.floating,
    dismissDirection: DismissDirection.down,
  );
}
