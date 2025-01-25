import 'package:chitpur/data/controller/auth/auth.controller.dart';
import 'package:chitpur/resource/app_color.dart';
import 'package:chitpur/resource/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/route_name.dart';

class AppBarC extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;
  final AuthController _authController = Get.find();

  AppBarC({super.key, this.height = kToolbarHeight, required this.title});

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return AppBar(
      title: Text(
        title,
      ),
      centerTitle: true,
      elevation: 0,
      iconTheme: IconThemeData(
        color: AppColor.primaryColor,
      ),
      actions: <Widget>[
        _authController.isSignedIn
            ? _IconButton(
                icon: Icons.account_circle,
                routeName: RouteNames.profileScreen,
              )
            : _IconButton(
                icon: Icons.login_outlined,
                routeName: RouteNames.authScreen,
              )
      ],
    );
  }
}

class _IconButton extends StatelessWidget {
  final IconData icon;
  final String routeName;

  const _IconButton({required this.icon, required this.routeName});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.toNamed(routeName);
      },
      icon: Icon(
        icon,
        size: AppTypo.actionIconSize,
      ),
    );
  }
}
