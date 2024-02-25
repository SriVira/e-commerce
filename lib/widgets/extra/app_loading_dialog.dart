import 'package:ecommerce/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class AppLoadingDialog {
  static final AppLoadingDialog _instance = AppLoadingDialog._internal();

  factory AppLoadingDialog() {
    return _instance;
  }

  AppLoadingDialog._internal();

  static void show() {
    Get.dialog(
      const Center(
        child: SpinKitThreeBounce(
          color: appPrimaryColor,
          size: 26,
        ),
      ),
      barrierDismissible: false,
    );
  }

  static void hide() {
    if (Get.isDialogOpen!) {
      Get.back();
    }
  }
}