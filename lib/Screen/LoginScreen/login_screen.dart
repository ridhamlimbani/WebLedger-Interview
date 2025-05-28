import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webledger_interview/Const/app_color.dart';
import 'package:webledger_interview/Const/app_image.dart';
import 'package:webledger_interview/Screen/LoginScreen/login_screen_controller.dart';
import 'package:webledger_interview/Widget/animation_loader.dart';
import 'package:webledger_interview/Widget/common_textfiled.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  LoginScreenController loginScreenController = Get.put(LoginScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: loginScreenController.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          image:  AssetImage(
                              AppImage.logoImage
                          )
                      )
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              CommonTextFormField(
                controller: loginScreenController.userNameController,
                labelText: "User Name",
                hintText: "User Name",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Username is required';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              CommonTextFormField(
                controller: loginScreenController.passwordController,
                labelText: "Password",
                hintText: "Password",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Password is required';
                  } else if (value.length < 6) {
                    return 'Password must be at least 6 characters';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 30,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: GestureDetector(
                  onTap: (){
                    if (loginScreenController.formKey.currentState!.validate()) {
                      loginScreenController.postLogin(
                        userName: loginScreenController.userNameController.text.toString().trim(),
                        password: loginScreenController.passwordController.text.toString().trim(),
                      );
                    }
                  },
                  child: Container(
                    height: 45,
                    decoration: BoxDecoration(
                        color: AppColor.primaryColor,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Obx(() =>
                    loginScreenController.isShowLoader.value == true ?
                      animationLoaderWhite :
                      Center(
                      child: Text(
                        "Login",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                            fontSize: 17
                        ),
                      ),
                    )
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
