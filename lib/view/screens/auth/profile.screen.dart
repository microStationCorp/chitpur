import 'package:chitpur/data/controller/auth/auth.controller.dart';
import 'package:chitpur/data/controller/auth/user.controller.dart';
import 'package:chitpur/data/models/user/user.model.dart';
import 'package:chitpur/resource/app_icons.dart';
import 'package:chitpur/resource/app_string.dart';
import 'package:chitpur/resource/theme/app_color.dart';
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
            BuildNavigation(themeController: _themeController),
          ],
        ),
      ),
      drawer: DrawerC(),
    );
  }

  // Extracted widget for user info
  Widget _buildUserInfo(UserModel user) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildInfoRow("Name", user.name.isNotEmpty ? user.name : "Not defined"),
        _buildInfoRow("Email", user.email),
        _buildInfoRow(
            "Created At", user.createdAt.toLocal().toString().substring(0, 10)),
      ],
    );
  }

  // Extracted widget for info row
  Widget _buildInfoRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Text("$label : $value"),
    );
  }

  // Extracted widget for sign out button
  Widget _buildSignOutButton() {
    return TextButton(
      onPressed: () {
        _authController.signOut();
      },
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Sign Out",
            style: TextStyle(fontSize: 16),
          ),
          const SizedBox(width: 10),
          Icon(
            AppIcons.logout,
            weight: 2,
          ),
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
      top: Get.height * .1 - 20,
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
    required ThemeController themeController,
  }) : _themeController = themeController;

  final ThemeController _themeController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 25,
      left: 10,
      right: 10,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              AppIcons.back,
              color: AppColors.light.onTertiary,
            ),
          ),
          IconButton(
            onPressed: () {
              _themeController.changeTheme(!_themeController.isDark.value);
            },
            icon: Icon(
              _themeController.isDark.value ? AppIcons.sun : AppIcons.moon,
              color: AppColors.light.onTertiary,
            ),
          )
        ],
      ),
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
      top: Get.height * .1 + 5,
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
            user.designation ?? "Not defined",
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
        height: Get.height * .25,
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
