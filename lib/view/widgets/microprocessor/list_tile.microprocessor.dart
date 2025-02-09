import 'package:chitpur/data/models/microprocessor/microprocessor.model.dart';
import 'package:chitpur/resource/theme/app_typography.dart';
import 'package:flutter/material.dart';

class ListTileCustom extends ListTile {
  final Microprocessor microprocessor;
  final void Function()? onTapCallback;
  final void Function()? onTrailingPressCallback;

  const ListTileCustom(
      {super.key,
      required this.microprocessor,
      this.onTapCallback,
      this.onTrailingPressCallback});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 5.0),
      child: ListTile(
        title: Text(
          textAlign: TextAlign.center,
          "${microprocessor.coachNumber} - ${microprocessor.coachType.toUpperCase()}",
          style: TextStyle(
          ),
        ),
        onTap: onTapCallback,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        minTileHeight: 20,
      ),
    );
  }
}
