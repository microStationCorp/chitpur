import 'package:chitpur/data/controller/auth/auth.controller.dart';
import 'package:chitpur/data/controller/common/network_controller.dart';
import 'package:chitpur/data/controller/microprocessor/category.controller.dart';
import 'package:chitpur/data/controller/microprocessor/controller.microprocessor.dart';
import 'package:get/get.dart';

class DependencyInjection {
  void init() {
    Get.lazyPut<NetworkController>(() => NetworkController(), fenix: true);
    Get.lazyPut<MicroprocessorController>(() => MicroprocessorController(),
        fenix: true);
    Get.lazyPut<CategoryController>(() => CategoryController(), fenix: true);
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}
