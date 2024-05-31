

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_arc/ui/home/home_view_model.dart';

class HomeViewMobile extends StatelessWidget {
  final HomeViewModel homeVM;

  HomeViewMobile(this.homeVM);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Center(
        child: Text(
          '${homeVM.hello}',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
