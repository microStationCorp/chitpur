import 'package:chitpur/data/services/shared_pref_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  final RxBool isDark = false.obs;

  @override
  void onInit() {
    super.onInit();
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    isDark.value = SharedPrefService().getBool("isDark") ?? false;
    update();
  }

  ThemeMode getThemeMode() => isDark.value ? ThemeMode.dark : ThemeMode.light;

  void changeTheme(bool val) {
    isDark.value = val;
    SharedPrefService().saveBool("isDark", val);
    update();
  }
}
