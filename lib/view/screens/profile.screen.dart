import 'package:chitpur/data/controller/auth/auth.controller.dart';
import 'package:chitpur/resource/app_icons.dart';
import 'package:chitpur/resource/app_string.dart';
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
                      child: _networkImage(_authController.user.value.photoUrl),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Name : ${_authController.user.value.name != "" ? _authController.user.value.name : "Not defined"}",
                          style: TextStyle(),
                        ),
                        Text(
                          "Email : ${_authController.user.value.email}",
                          style: TextStyle(),
                        ),
                        Text(
                          "Created At : ${_authController.user.value.createdAt.toLocal().toString().substring(0, 10)}",
                          style: TextStyle(),
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
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Sign Out",
                    style: TextStyle(),
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

Widget _networkImage(String url) {
  return ClipOval(
    child: Image.network(
      url,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                    (loadingProgress.expectedTotalBytes ?? 1)
                : null,
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Image.asset(
          ImageStrings.profileImage,
        );
      },
      fit: BoxFit.cover,
      height: 200,
      width: 200,
    ),
  );
}
