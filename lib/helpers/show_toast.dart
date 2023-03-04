import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

toastmessage(String msg, Color backgroundcolor) {
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: backgroundcolor,
      textColor: Colors.white,
      fontSize: 16.0);
}
