import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../resource/theme/app_typography.dart';
import '../../screens/microprocessor/coach_detail/coach_detail.microprocessor.dart';
import 'list_tile.microprocessor.dart';

Widget streamListBuilder(context, snapshot) {
  List microprocessors = snapshot.data?.docs ?? [];
  if (microprocessors.isEmpty) {
    return const Center(
      child: Text(
        "No Data",
      ),
    );
  }
  return ListView.builder(
    itemCount: microprocessors.length,
    itemBuilder: (context, index) {
      return ListTileCustom(
        microprocessor: microprocessors[index].data(),
        onTapCallback: () {
          Get.to(
            () => CoachDetailMP(
              microprocessor: microprocessors[index].data(),
            ),
          );
        },
        onTrailingPressCallback: () {},
      );
    },
  );
}
