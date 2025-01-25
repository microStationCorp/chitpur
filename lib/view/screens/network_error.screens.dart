import 'package:chitpur/data/controller/common/network_controller.dart';
import 'package:chitpur/resource/app_color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NetworkErrorScreen extends StatelessWidget {
  NetworkErrorScreen({super.key});

  final NetworkController _networkController = Get.find();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: _networkController.isOnline ? true : false,
      child: Scaffold(
        body: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.cloud_off,
                size: 50,
                color: AppColor.lightGrey,
              ),
              Text(
                "No Internet Connection",
                style: TextStyle(fontSize: 20, color: AppColor.lightGrey),
              )
            ],
          ),
        ),
      ),
    );
  }
}
