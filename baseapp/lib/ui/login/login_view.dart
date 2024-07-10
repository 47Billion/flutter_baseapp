import 'package:baseapp/ui/login/login_view_model.dart';
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
// class LoginView extends StatelessWidget {
//   // const LoginView({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     print("object");
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Text(
//               'greeting'.tr,
//               style: TextStyle(fontSize: 16),
//             ),
//             TextButton(
//               onPressed: () {
//                 Locale locale = new Locale("hi");
//                 Get.updateLocale(locale);
//               } ,
//               child: Text("Change"),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

class LoginView extends StatelessWidget {
  final controller = Get.put(LoginViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("counter")),
      body: GetBuilder<LoginViewModel>(
        builder: (context) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("clicks value : ${controller.count}"),
                GetX<LoginViewModel>(
                    builder: (_) => Text(
                      'clicks: ${controller.count}',
                    )),
                ElevatedButton(
                  child: Text('Next Route'),
                  onPressed: () {
                    Get.to(Second());
                  },
                ),
              ],
            ),
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:(){ controller.increment();
        controller.refreshV();}
      ),
    );
  }
}



class Second extends StatelessWidget {
  final LoginViewModel ctrl = Get.find();
  final controller2 = Get.put(SecondViewModel());

  @override
  Widget build(context){
    return Scaffold(body: GetBuilder<SecondViewModel>(
      builder: (context) {
        return Center(child: Column(
          children: [
            GetX<LoginViewModel>(
                builder: (_) => Text(
                  'clicks: ${ctrl.count}',
                )),

            GetX<LoginViewModel>(
                builder: (_) => Text(
                  'clicks: ${ctrl.count}',
                )),

            GetX<LoginViewModel>(
                builder: (_) => Text(
                  'clicks: ${ctrl.count}',
                )),
            Text("${ctrl.count}"),

            ElevatedButton(
              child: Text('update count value'),
              onPressed: () {
                ctrl.increment();
                controller2.refreshV();
              },
            ),
          ],
        ));
      }
    ));
  }
}

class SecondViewModel extends GetxController {

  void refreshV() {
    update();
  }
}