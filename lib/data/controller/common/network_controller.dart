import 'dart:async';

import 'package:chitpur/routes/route_name.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get/get.dart';

class NetworkController extends GetxController {
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<List<ConnectivityResult>> _connectivitySubscription;

  bool isOnline = false;

  @override
  void onInit() {
    super.onInit();
    _connectivitySubscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  void _updateConnectionStatus(List<ConnectivityResult> connectivityResult) {
    if (connectivityResult.isNotEmpty) {
      if (connectivityResult[0] == ConnectivityResult.none) {
        isOnline = false;
        if (Get.currentRoute != RouteNames.networkError) {
          Get.toNamed(RouteNames.networkError);
        }
      } else {
        isOnline = true;
        if (Get.currentRoute == RouteNames.networkError) {
          Get.back();
        }
      }
    }
  }

  @override
  void onClose() {
    // Always cancel the stream subscription when the controller is disposed
    _connectivitySubscription.cancel();
    super.onClose();
  }
}
