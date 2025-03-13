import 'package:chitpur/data/controller/auth/auth.controller.dart';
import 'package:chitpur/data/controller/auth/user.controller.dart';
import 'package:chitpur/data/models/user/user.model.dart';
import 'package:chitpur/resource/app_icons.dart';
import 'package:chitpur/resource/app_string.dart';
import 'package:chitpur/resource/theme/app_color.dart';
import 'package:chitpur/utils/timestamp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/controller/ui/theme.controller.dart';
import '../../widgets/common/drawer.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final AuthController _authController = Get.find();
  final UserController _userController = Get.find();
  final ThemeController _themeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: Get.height,
        width: Get.width,
        child: Stack(
          children: [
            Wavy(),
            Obx(
              () => BuildProfileImage(
                  photoUrl: _userController.user.value.photoUrl),
            ),
            Obx(() => BuildTitleProfile(user: _userController.user.value)),
            BuildNavigation(
              themeController: _themeController,
              authController: _authController,
            ),
            _buildDataField(context)
          ],
        ),
      ),
      drawer: DrawerC(),
    );
  }

  Positioned _buildDataField(BuildContext context) {
    Widget buildText(IconData icon, dynamic value) {
      return Card(
        elevation: 0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Card(
                color: Theme.of(context).colorScheme.surfaceDim,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(icon),
                ),
              ),
              Text(
                " ${value ?? "Not Provided"}",
                style: TextStyle().copyWith(
                  fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return Positioned(
      top: Get.height * 0.35,
      left: Get.width * 0.05,
      right: Get.width * 0.05,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 10,
        children: [
          buildText(AppIcons.atSign, _userController.user.value.email),
          buildText(AppIcons.tag, _userController.user.value.designation),
          buildText(AppIcons.hash, _userController.user.value.phoneNumber),
          buildText(AppIcons.calender,
              formatTimestamp(_userController.user.value.createdAt).toString()),
        ],
      ),
    );
  }
}

class BuildProfileImage extends StatelessWidget {
  const BuildProfileImage({
    super.key,
    required this.photoUrl,
  });

  final String photoUrl;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: Get.height * .15 - 20,
      left: Get.width * .1,
      child: SizedBox(
        height: 150,
        width: 150,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: Theme.of(context).colorScheme.onTertiary,
              width: 4,
            ),
          ),
          child: ClipOval(
            child: Image.network(
              photoUrl,
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
            ),
          ),
        ),
      ),
    );
  }
}

class BuildNavigation extends StatelessWidget {
  const BuildNavigation({
    super.key,
    required this.themeController,
    required this.authController,
  });

  final AuthController authController;
  final ThemeController themeController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 30,
      left: 10,
      right: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _navButton(AppIcons.back, Get.back),
          Row(
            children: [
              _navButton(
                themeController.isDark.value ? AppIcons.sun : AppIcons.moon,
                () =>
                    themeController.changeTheme(!themeController.isDark.value),
              ),
              _navButton(AppIcons.userPen, () {}),
              _navButton(AppIcons.logout, authController.signOut),
            ],
          ),
        ],
      ),
    );
  }

  Widget _navButton(IconData icon, VoidCallback onPressed) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(icon, color: AppColors.light.onTertiary),
    );
  }
}

class BuildTitleProfile extends StatelessWidget {
  const BuildTitleProfile({
    super.key,
    required this.user,
  });

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: Get.width * .05,
      top: Get.height * .15 + 5,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Text(
            user.name,
            style: TextStyle().copyWith(
              fontSize: Theme.of(context).textTheme.headlineMedium?.fontSize,
              color: AppColors.light.onTertiary,
            ),
          ),
          Text(
            user.role.toString().toUpperCase(),
            style: TextStyle().copyWith(
              fontSize: Theme.of(context).textTheme.titleLarge?.fontSize,
              color: AppColors.warmBeige,
            ),
          ),
        ],
      ),
    );
  }
}

class Wavy extends StatelessWidget {
  const Wavy({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: WavyClipper(),
      child: Container(
        height: Get.height * .3,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AppColors.slateGrey,
              AppColors.charcoalGrey,
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ),
    );
  }
}

class WavyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    const roundness = 50.0;

    path.lineTo(0, size.height);
    path.quadraticBezierTo(
        0, size.height - roundness, roundness, size.height - roundness);

    path.lineTo(size.width - roundness, size.height - roundness);
    path.quadraticBezierTo(
        size.width, size.height - roundness, size.width, size.height);

    path.lineTo(size.width, 0);

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
