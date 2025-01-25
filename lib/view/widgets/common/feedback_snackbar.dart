import 'package:chitpur/resource/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void errorSnackBar(String title, String message) {
  Get.snackbar(
    title,
    message,
    backgroundColor: AppColor.errorSurfaceColor,
    animationDuration: Duration(milliseconds: 400),
    colorText: AppColor.errorTextColor,
    icon: const Icon(
      Icons.error,
      color: AppColor.errorTextColor,
    ),
  );
}

void successSnackBar(String title, String message) {
  Get.snackbar(
    title,
    message,
    backgroundColor: AppColor.successSurfaceColor,
    colorText: AppColor.successTextColor,
    animationDuration: Duration(milliseconds: 400),
    icon: const Icon(
      Icons.thumb_up,
      color: AppColor.successTextColor,
    ),
  );
}

void generalSnackBar(String title, String message) {
  Get.snackbar(
    title,
    message,
    backgroundColor: AppColor.cardBackgroundColor,
    colorText: AppColor.outlineColor,
    animationDuration: Duration(milliseconds: 400),
    icon: const Icon(Icons.warning_amber),
  );
}
