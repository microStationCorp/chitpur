import 'package:chitpur/resource/app_icons.dart';
import 'package:chitpur/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomAppbarCMP extends StatelessWidget {
  const BottomAppbarCMP({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      notchMargin: 8,
      shape: CircularNotchedRectangle(),
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          _IconButton(
            routeName: RouteNames.microprocessorScreen,
            icon: AppIcons.home,
          ),
          _IconButton(
            routeName: RouteNames.dataListMPScreen,
            icon: AppIcons.list,
          ),
          _IconButton(
            routeName: RouteNames.dataSearchMPScreen,
            icon: AppIcons.search,
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
      ),
    );
  }
}
