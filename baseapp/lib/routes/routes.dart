import 'package:get/get.dart';
import 'package:getx_mvvm_arc/routes/routes_name.dart';
import 'package:getx_mvvm_arc/ui/home/home_view.dart';
import 'package:getx_mvvm_arc/ui/login/view/login_view.dart';
import 'package:getx_mvvm_arc/ui/splash_view/splash_view.dart';

class AppRoutes {

  static appRoutes() => [
    GetPage(
      name: Routes.splashScreen,
      page: () => SplashView() ,
      transitionDuration: Duration(milliseconds: 250),
      transition: Transition.leftToRightWithFade ,
    ) ,
    GetPage(
      name: Routes.loginView,
      page: () => LoginView() ,
      transitionDuration: Duration(milliseconds: 250),
    ) ,
    GetPage(
      name: Routes.homeView,
      page: () => HomeView() ,
      transitionDuration: Duration(milliseconds: 250),
    ) ,
  ];

}