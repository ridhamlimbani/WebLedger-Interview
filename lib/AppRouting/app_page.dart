import 'package:get/get.dart';
import 'package:webledger_interview/AppRouting/app_routing.dart';
import 'package:webledger_interview/Screen/HomeScreen/home_screen.dart';
import 'package:webledger_interview/Screen/LoginScreen/login_screen.dart';
import 'package:webledger_interview/Screen/SplashScreen/splash_screen.dart';

class AppPage{
  List<GetPage<dynamic>> getPages = [

    /// ----- Splash Screen ---- ///
    GetPage(
      name: AppRouting.splashScreen,
      page: () => SplashScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => SplashScreen());
      }),
    ),

    /// ----- Login Screen ---- ///
    GetPage(
      name: AppRouting.loginScreen,
      page: () => LoginScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => LoginScreen());
      }),
    ),

    /// ----- Home Screen ---- ///
    GetPage(
      name: AppRouting.homeScreen,
      page: () => HomeScreen(),
      binding: BindingsBuilder(() {
        Get.lazyPut(() => HomeScreen());
      }),
    ),
  ];
}