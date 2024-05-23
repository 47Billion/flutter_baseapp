import 'package:baseapp/routes/routes.dart';
import 'package:baseapp/ui/spalsh/splash_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:package_info_plus/package_info_plus.dart';

import 'language/app_translation.dart';
import 'utils/get_app_version.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translationsKeys: AppTranslation.translationsKeys,
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en' ,'US'),
      debugShowCheckedModeBanner: false,
      initialRoute:  Routes.SplashView,
      getPages: getPages,
    );
  }
}
