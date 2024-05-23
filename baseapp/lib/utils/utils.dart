import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Utils {
  static var mockupHeight = 844;
  static var mockupWidth = 390;
  static var deviceHeight;
  static var deviceWidth;

  static double getHeight(var height) {
    var percent = ((height / mockupHeight) * 100);
    return ((deviceHeight * percent) / 100);
  }

  static double getWidth(var width) {
    var percent = ((width / mockupWidth) * 100);
    return ((deviceWidth * percent) / 100);
  }

  static double getSp(var sp) {
    var percent = (((sp + 2) / mockupHeight) * 100);
    return ((deviceHeight * percent) / 100);
  }

  // Future<String> getLoggedInUserNm () async {
  //   var objPref = await SharedPreferences.getInstance();
  //   String val = objPref.getString("user_name") ?? "";
  //   print(val);
  //   return val;
  // }

  static showDialog(String title, String message,String dismissTitle,VoidCallback callback) {
    Get.dialog(
      AlertDialog(
        title:  Text(title),
        content:  Text(message),
        actions: [
          TextButton(
            child:  Text(dismissTitle),
            onPressed: () {
              Get.back();
              callback();
            } ,
          ),
        ],
      ),
    );
  }
}


extension SizeExt on num {
  double get Sw => Utils.getWidth(this);

  double get Sh => Utils.getHeight(this);

  double get Sp => Utils.getSp(this);
}