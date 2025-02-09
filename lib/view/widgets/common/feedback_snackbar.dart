import 'package:chitpur/resource/theme/app_color.dart';
import 'package:chitpur/resource/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void errorSnackBar(String title, String message) {
  Get.snackbar(
    title,
    message,
    backgroundColor: AppColors.dark.error,
    animationDuration: Duration(milliseconds: 400),
    colorText: AppColors.dark.onError,
    icon: Icon(
      AppIcons.error,
      color: AppColors.dark.onError,
    ),
  );
}

void successSnackBar(String title, String message) {
  Get.snackbar(
    title,
    message,
    backgroundColor: AppColors.checkColor,
    colorText: Colors.white,
    animationDuration: Duration(milliseconds: 400),
    icon: const Icon(
      AppIcons.thumbsUp,
      color: Colors.white,
    ),
  );
}

void generalSnackBar(String title, String message) {
  Get.snackbar(
    title,
    message,
    animationDuration: Duration(milliseconds: 400),
    icon: const Icon(AppIcons.triangleAlert),
  );
}
