import 'package:get/get.dart';

class CommonSnackBar{
  showSnackBar({required String title,required String message}){
    Get.snackbar(
        title,
        message,
    );
  }
}