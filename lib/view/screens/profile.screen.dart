import 'package:chitpur/data/controller/auth/auth.controller.dart';
import 'package:chitpur/resource/app_icons.dart';
import 'package:chitpur/resource/app_string.dart';
import 'package:chitpur/resource/theme/app_typography.dart';
import 'package:chitpur/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
                          ),
                        ),
                        Text(
                          "Email : ${_authController.user.value.email}",
                          style: TextStyle(
                          ),
                        ),
                        Text(
                          "Created At : ${_authController.user.value.createdAt.toLocal().toString().substring(0, 10)}",
                          style: TextStyle(
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
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign Out",
                    style: TextStyle(
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    AppIcons.logout,
                    weight: 2,
                  )
                ],
              ),
            )
          ],
        ),
      ),
      drawer: DrawerC(),
    );
  }
}
