import 'package:chitpur/data/controller/auth/auth.controller.dart';
import 'package:chitpur/resource/app_string.dart';
import 'package:chitpur/resource/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/route_name.dart';

class DrawerC extends StatelessWidget {
  DrawerC({super.key});

  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        children: [
          _DrawerHeader(authController: authController),
          ListTile(
            title: Text(
              "Home",
              style: TextStyle(fontSize: AppTypo.primaryFontSize),
            ),
            onTap: () {
              Navigator.pop(context);
              Get.toNamed(RouteNames.homeScreen);
            },
          ),
          ListTile(
            title: Text(
              "Microprocessors",
              style: TextStyle(fontSize: AppTypo.primaryFontSize),
            ),
            onTap: () {
              Navigator.pop(context);
              Get.toNamed(RouteNames.microprocessorScreen);
            },
          )
        ],
      ),
    );
  }
}

class _DrawerHeader extends StatelessWidget {
  final AuthController authController;

  const _DrawerHeader({required this.authController});

  @override
  Widget build(BuildContext context) {
    return DrawerHeader(
      child: Center(
          child: Text(
        AppString.appName,
        style: TextStyle(fontSize: AppTypo.drawerHeader),
      )),
    );
  }
}
