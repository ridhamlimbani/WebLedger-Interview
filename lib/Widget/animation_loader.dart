import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:webledger_interview/Const/app_color.dart';

Widget animationLoader = SpinKitFadingCircle(
  color: AppColor.primaryColor,
  size: 35.0,
);

Widget animationLoaderWhite = SpinKitFadingCircle(
  color: Colors.white,
  size: 35.0,
);