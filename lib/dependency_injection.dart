import 'package:chitpur/data/controller/auth/auth.controller.dart';
import 'package:chitpur/data/controller/auth/user.controller.dart';
import 'package:chitpur/data/controller/common/network_controller.dart';
import 'package:chitpur/data/controller/microprocessor/category.controller.dart';
import 'package:chitpur/data/controller/microprocessor/controller.microprocessor.dart';
import 'package:get/get.dart';

import 'data/controller/ui/theme.controller.dart';

class DependencyInjection {
  void init() {
    Get.put<NetworkController>(NetworkController(), permanent: true);
    Get.lazyPut<MicroprocessorController>(() => MicroprocessorController(),
        fenix: true);
    Get.put<CategoryController>(CategoryController(), permanent: true);
    Get.put<UserController>(UserController(), permanent: true);
    Get.put<AuthController>(AuthController(), permanent: true);
    Get.put<ThemeController>(ThemeController(), permanent: true);
  }
}
