import 'package:chitpur/resource/app_color.dart';
import 'package:chitpur/resource/app_typography.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:chitpur/routes/route_name.dart';

class BottomAppbarCMP extends StatelessWidget {
  const BottomAppbarCMP({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      height: 60,
      child: Row(
        children: <Widget>[
          _IconButton(
            routeName: RouteNames.microprocessorScreen,
            icon: Icons.home_outlined,
          ),
          _IconButton(
            routeName: RouteNames.dataListMPScreen,
            icon: Icons.format_list_bulleted,
          ),
          _IconButton(
            routeName: RouteNames.dataSearchMPScreen,
            icon: Icons.search,
          ),
        ],
      ),
    );
  }
}

class _IconButton extends StatelessWidget {
  final String routeName;
  final IconData icon;

  const _IconButton({required this.routeName, required this.icon});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.toNamed(routeName);
      },
      icon: Icon(
        icon,
        size: AppTypo.actionIconSize,
        color: AppColor.primaryColor,
      ),
    );
  }
}
