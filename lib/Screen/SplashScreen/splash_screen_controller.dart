import 'package:get/get.dart';
import 'package:webledger_interview/ApiService/api_service.dart';
import 'package:webledger_interview/AppRouting/app_routing.dart';
import 'package:webledger_interview/Const/app_string.dart';
import 'package:webledger_interview/Utils/LocalStorage/get_storage.dart';

class SplashScreenController extends GetxController{

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    goToNextScreen();
  }

  goToNextScreen(){

    Future.delayed(
      Duration(
        seconds: 3
      ),(){;
        if(loginId.value != 0){
          Get.offAllNamed(AppRouting.homeScreen);
        } else{
          Get.offAllNamed(AppRouting.loginScreen);
        }
      }
    );
  }
}