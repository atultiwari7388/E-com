import 'package:get/get.dart';
import 'package:portfolio_app/view/Auth/signup_screen.view.dart';
import 'package:portfolio_app/view/Home/home_screen.home.view.dart';
import 'package:portfolio_app/view/Splash/splash_screen.view.dart';
import '../view/Auth/login_screen.view.dart';

class AppRouterHelper {
  static const String splashScreen = "/";
  static const String homeScreen = "/home-screen";
  static const String loginScreen = "/login-screen";
  static const String registerScreen = "/register-screen";

  //create function to pass parameter to the screen

  static String getSplashScreen() => "$splashScreen";
  static String getHomeScreen() => "$homeScreen";
  static String getLoginScreen() => "$loginScreen";
  static String getRegisterScreen() => "$registerScreen";

  //for pages
  static List<GetPage> routes = [
    GetPage(
      name: splashScreen,
      page: () => SplashScreen(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: loginScreen,
      page: () => LoginUserScreen(),
      transition: Transition.fade,
    ),
    GetPage(
      name: registerScreen,
      page: () => RegisterUser(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: homeScreen,
      page: () => HomeScreen(),
      transition: Transition.fadeIn,
    ),
  ];
}
