import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  final RxBool isDark = false.obs;

  ThemeMode getThemeMode() => isDark.value ? ThemeMode.dark : ThemeMode.light;

  void changeTheme(bool val) {
    isDark.value = val;
    update();
  }
}
