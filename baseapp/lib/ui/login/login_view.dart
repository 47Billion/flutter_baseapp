import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../utils/get_app_version.dart';

// class LoginView extends StatefulWidget {
//   @override
//   _LoginViewState createState() => _LoginViewState();
// }
//
// class _LoginViewState extends State<LoginView> {
//   @override
//   void initState() {
//     super.initState();
//   }
//
//
//   @override
//   Widget build(BuildContext context) {
//     print("object");
//     return Scaffold(
//       body: Center(
//         child: Container(width: 40,height: 40,child: Text("Login")), // Replace with your splash image asset
//       ),
//     );
//   }
// }
class LoginView extends StatelessWidget {
  // const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("object");
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Text(
              'greeting'.tr,
              style: TextStyle(fontSize: 16),
            ),
            TextButton(
              onPressed: () {
                Locale locale = new Locale("hi");
                Get.updateLocale(locale);
              } ,
              child: Text("Change"),
            )
          ],
        ),
      ),
    );
  }
}
