import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:webledger_interview/ApiService/api_service.dart';
import 'package:webledger_interview/AppRouting/app_routing.dart';
import 'package:webledger_interview/Widget/common_snackbar.dart';

class LoginScreenController extends GetxController{
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  RxBool isShowLoader = false.obs;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  postLogin({required String userName, required String password}) async {
   isShowLoader.value = true;
   Map<String,dynamic> map = await ApiService().postLoginApi(userName: userName, password: password);

   if(map['error'] == false){
     Get.offAllNamed(AppRouting.homeScreen);
     CommonSnackBar().showSnackBar(title: "Success", message: map['msg']);
     isShowLoader.value = false;
   } else{
     CommonSnackBar().showSnackBar(title: "Error", message: map['msg']);
     isShowLoader.value = false;
   }
  }
}