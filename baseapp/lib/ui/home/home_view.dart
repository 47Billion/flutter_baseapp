import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_arc/ui/home/home_view_mobile.dart';
import 'package:getx_mvvm_arc/ui/home/home_view_model.dart';
import 'package:getx_mvvm_arc/ui/home/home_view_web.dart';

class HomeView extends StatelessWidget {
  final homeVM = Get.put(HomeViewModel());

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return GetBuilder<HomeViewModel>(builder: (controller) {
      if (width > 530) {
        return HomeViewWeb(homeVM);
      } else {
        return HomeViewMobile(homeVM);
      }
    });
  }
}
