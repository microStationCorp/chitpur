import 'dart:async';

import 'package:chitpur/data/controller/common/network_controller.dart';
import 'package:chitpur/resource/app_fonts.dart';
import 'package:chitpur/resource/app_string.dart';
import 'package:chitpur/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// The splash screen which is displayed when the app starts.
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

/// The state of the splash screen.
class _SplashScreenState extends State<SplashScreen> {
  final NetworkController _networkController = Get.find();

  @override
  void initState() {
    super.initState();

    // After 3 seconds, navigate to the home screen.
    Timer(
      const Duration(seconds: 3),
      () {
        if (_networkController.isOnline) {
          Get.offAndToNamed(RouteNames.homeScreen);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Display the railway logo.
            Image.asset(
              "assets/images/railway_logo.png",
              fit: BoxFit.contain,
              height: 200,
              color: Colors.blueGrey.shade200,
            ),
            // Display the welcome message.
            Text(
              AppString.splashScreenText,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: AppFonts.satisfy,
                fontSize: 50,
                color: Colors.blueGrey.shade200,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
