import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:package_info_plus/package_info_plus.dart';

import '../../utils/get_app_version.dart';
import '../../routes/routes.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();
    GetAppVersion().checkForUpdates(myCallback);
  }

  void myCallback()async {
    // Do something when the callback is called
    print('Callback executed!');
    await Future.delayed(Duration(seconds: 3), () {});
    Get.offNamedUntil(Routes.LoginView,
             (route) => false);
  }

  _navigateToHome() async {
    await Future.delayed(Duration(seconds: 1), () {});
   // Get.offNamedUntil(Routes.LoginView,
     //          (route) => false); //(DashboardView() as Route, (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Image.asset('assets/images/splash.png'), // Replace with your splash image asset
      ),
    );
  }
}