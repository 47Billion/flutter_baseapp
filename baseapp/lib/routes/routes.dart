import 'package:get/get_navigation/src/routes/get_route.dart';
import '../ui/login/login_view.dart';
import '../ui/spalsh/splash_view.dart';



/// Routes name to directly navigate the route by its name
class Routes {
  static String SplashView = '/SplashView';
  static String LoginView = '/LoginView';


}

/// Add this list variable into your GetMaterialApp as the value of getPages parameter.
/// You can get the reference to the above GetMaterialApp code.
final getPages = [
  GetPage(name: Routes.LoginView, page: () => LoginView()),
  GetPage(name: Routes.SplashView, page: () => SplashView()),
];