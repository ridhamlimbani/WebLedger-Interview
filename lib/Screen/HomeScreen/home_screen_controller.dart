import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webledger_interview/ApiService/api_service.dart';
import 'package:webledger_interview/AppRouting/app_routing.dart';
import 'package:webledger_interview/Model/recipes_model.dart';
import 'package:webledger_interview/Utils/LocalStorage/remove_storage.dart';
import 'package:webledger_interview/Widget/common_snackbar.dart';

class HomeScreenController extends GetxController{
  Future<RecipesModel> fetchRecipesDetails() async {
    Map<String, dynamic> map = await ApiService().getRecipesApi();

    if(map['error'] == false){
      RecipesModel recipesModel = map['data'];
      return recipesModel;
    } else{
      CommonSnackBar().showSnackBar(title: "Error", message: map['msg']);
      return RecipesModel();
    }
  }

  void showLogoutDialog({required BuildContext context}) {
    Get.defaultDialog(
      title: "Logout",
      middleText: "Are you sure you want to log out?",
      textConfirm: "Yes",
      textCancel: "No",
      confirmTextColor: Colors.white,
      buttonColor: Colors.red,
      onConfirm: () {
        Navigator.pop(context); // Close dialog
        _handleLogout();
      },
      onCancel: () {
        Get.back();
      },
    );
  }

  void _handleLogout() {
    RemoveLocalStorage().loginData();
    RemoveLocalStorage().tokenData();
    Get.offAllNamed(AppRouting.loginScreen);
  }
}