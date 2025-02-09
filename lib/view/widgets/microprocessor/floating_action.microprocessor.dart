import 'package:chitpur/resource/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/route_name.dart';

class FloatingActionMP extends StatelessWidget {
  const FloatingActionMP({super.key});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        Get.toNamed(RouteNames.dataAddMPScreen);
      },
      shape: CircleBorder(),
      child: Icon(AppIcons.plus),
    );
  }
}
