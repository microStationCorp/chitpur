import 'package:chitpur/resource/theme/app_color.dart';
import 'package:chitpur/resource/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void errorSnackBar(String title, String message) {
  _showSnackBar(
    title,
    message,
    AppColors.dark.error,
    AppColors.dark.onError,
    AppIcons.error,
  );
}

void successSnackBar(String title, String message) {
  _showSnackBar(
    title,
    message,
    AppColors.checkColor,
    Colors.white,
    AppIcons.thumbsUp,
  );
}

void generalSnackBar(String title, String message) {
  _showSnackBar(
    title,
    message,
    null,
    null,
    AppIcons.triangleAlert,
  );
}

void _showSnackBar(
  String title,
  String message,
  Color? backgroundColor,
  Color? textColor,
  IconData iconData,
) {
  Get.snackbar(
    title,
    message,
    backgroundColor: backgroundColor,
    colorText: textColor,
    animationDuration: const Duration(milliseconds: 400),
    icon: Icon(
      iconData,
      color: textColor,
    ),
  );
}
