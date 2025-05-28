import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webledger_interview/Const/app_image.dart';
import 'package:webledger_interview/Screen/SplashScreen/splash_screen_controller.dart';
import 'package:webledger_interview/Widget/animation_loader.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({super.key});

  SplashScreenController splashScreenController = Get.put(SplashScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
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
          SizedBox(height: 50,),
          animationLoader,
        ],
      ),
    );
  }
}
