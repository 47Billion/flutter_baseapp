import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_arc/ui/login/model/logged_in_user.dart';

class LoginViewModel extends GetxController {


  final emailController = TextEditingController().obs ;
  final passwordController = TextEditingController().obs ;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  final pageMobile = 'mobile page';
  final pageWeb = 'web page';

  var user = LoggedInUser().obs;
}