import 'package:chitpur/data/controller/auth/auth.controller.dart';
import 'package:chitpur/resource/app_string.dart';
import 'package:chitpur/resource/app_typography.dart';
import 'package:chitpur/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../resource/app_color.dart';
import '../widgets/appbar.dart';
import '../widgets/drawer.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarC(title: AppBarTitle.profilePage),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        child: Column(
          children: [
            Expanded(
              child: Obx(
                () => Column(
                  spacing: 30,
                  children: [
                    Center(
                      child: Image.asset(
                        _authController.user.value.photoUrl != ""
                            ? _authController.user.value.photoUrl
                            : ImageStrings.profileImage,
                        height: 200,
                        width: 200,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name : ${_authController.user.value.name != "" ? _authController.user.value.name : "Not defined"}",
                          style: TextStyle(
                            fontSize: AppTypo.primaryFontSize,
                            color: AppColor.primaryColor,
                          ),
                        ),
                        Text(
                          "Email : ${_authController.user.value.email}",
                          style: TextStyle(
                            fontSize: AppTypo.primaryFontSize,
                            color: AppColor.primaryColor,
                          ),
                        ),
                        Text(
                          "Created At : ${_authController.user.value.createdAt.toLocal().toString().substring(0, 10)}",
                          style: TextStyle(
                            fontSize: AppTypo.primaryFontSize,
                            color: AppColor.primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                _authController.signOut();
                Get.offAllNamed(RouteNames.authScreen);
              },
              child: Text(
                "Sign Out",
                style: TextStyle(
                  fontSize: AppTypo.primaryFontSize,
                  color: AppColor.errorTextColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
      drawer: DrawerC(),
    );
  }
}
