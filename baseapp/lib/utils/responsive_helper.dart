import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ResponsiveHelper {
  static const double baseWidth = 375.0;
  static const double baseHeight = 667.0;

  static double responsiveFontSize(double size,BuildContext context) {
    final screenWidth =  MediaQuery.of(context).size.width;//Get.width;
    final screenHeight = MediaQuery.of(context).size.height; //Get.height;
    print("screen width ${screenWidth}");
    print("screen width ${screenHeight}");
    double widthRatio = screenWidth / baseWidth;
    double heightRatio = screenHeight / baseHeight;
    double aspectRatio = (widthRatio + heightRatio) / 2;

    return size * aspectRatio;
  }
}

//*******   Call using below format **********
/*
  *
  *
  ResponsiveHelper.responsiveFontSize(16),
  *
  *
 */
