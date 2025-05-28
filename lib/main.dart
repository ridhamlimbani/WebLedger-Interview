import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:webledger_interview/AppRouting/app_page.dart';
import 'package:webledger_interview/AppRouting/app_routing.dart';
import 'package:webledger_interview/Const/app_color.dart';
import 'package:webledger_interview/Utils/LocalStorage/get_storage.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  GetLocalStorage().getLoginData();
  GetLocalStorage().getTokenData();
  runApp(
    MyApp()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
          statusBarColor: AppColor.primaryColor
      ),
      child: GetMaterialApp(
        title: "WebLedger Interview",
        debugShowCheckedModeBanner: false,
        getPages: AppPage().getPages,
        initialRoute: AppRouting.splashScreen,
      ),
    );
  }
}
