
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_arc/ui/login/view/login_view_mobile.dart';
import 'package:getx_mvvm_arc/ui/login/view/login_view_web.dart';

import '../view_model/login_view_model.dart';

class LoginView extends StatelessWidget {

  final loginVM = Get.put(LoginViewModel()) ;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return GetBuilder<LoginViewModel>(
      builder: (controller) {
        if (width > 550) {
          return LoginViewWeb(loginVM);
        } else {
          return LoginViewMobile(loginVM);
        }
      }
      );
  }
}