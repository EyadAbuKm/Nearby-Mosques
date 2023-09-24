import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

class CommonWidget {

  static void toast(String error) async {
    await Fluttertoast.showToast(
        msg: error,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        backgroundColor: Colors.red,
        textColor: Colors.black,
        fontSize: 16.0);
  }


  static void snackBar(String error) async {
     Get.showSnackbar(
      GetSnackBar(title:"error".tr ,  duration: Duration(seconds: 3),message: error,      backgroundColor: Colors.red,
      )
);
  }
}
