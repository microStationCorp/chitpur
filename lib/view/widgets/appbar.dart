import 'package:chitpur/data/controller/auth/auth.controller.dart';
import 'package:chitpur/data/controller/ui/theme.controller.dart';
import 'package:chitpur/resource/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routes/route_name.dart';

class AppBarC extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final String title;
  final AuthController _authController = Get.find();
  final ThemeController _themeController = Get.find();

  AppBarC({super.key, this.height = kToolbarHeight, required this.title});

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    String? currentPage = ModalRoute.of(context)?.settings.name;

    // TODO: implement build
    return AppBar(
      title: GestureDetector(
        onHorizontalDragEnd: (details) {
          _themeController.changeTheme(!_themeController.isDark.value);
        },
        child: Text(
          title,
        ),
      ),
      elevation: 0,
      actions: <Widget>[
        _authController.isSignedIn
            ? _IconButton(
                icon: AppIcons.user,
                routeName: RouteNames.profileScreen,
              )
            : currentPage == RouteNames.authScreen
                ? _IconButton(
                    icon: AppIcons.home, routeName: RouteNames.homeScreen)
                : _IconButton(
                    icon: AppIcons.login,
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
        if (routeName == RouteNames.homeScreen ||
            routeName == RouteNames.authScreen) {
          Get.offAllNamed(routeName);
        } else {
          Get.toNamed(routeName);
        }
      },
      icon: Icon(
        icon,
      ),
    );
  }
}
