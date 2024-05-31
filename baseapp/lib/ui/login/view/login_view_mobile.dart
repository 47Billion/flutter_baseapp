
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm_arc/ui/login/view_model/login_view_model.dart';
import '../../../routes/routes_name.dart';


class LoginViewMobile extends StatelessWidget {
  final LoginViewModel loginVM;

  LoginViewMobile(this.loginVM);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Count is: ${loginVM.pageMobile}',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Get.toNamed(Routes.homeView);
            },
            child: Text('Login'),
          ),
        ],
      ),
    );
  }
}
