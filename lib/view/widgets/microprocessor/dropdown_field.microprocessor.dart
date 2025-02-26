import 'package:chitpur/view/widgets/common/custom_dropdown_menu.dart';
import 'package:flutter/material.dart';

import '../../../resource/app_string.dart';

class DropDownField extends StatefulWidget {
  final String label;
  final void Function(String?)? onSavedCallback;
  final List<String> items;

  const DropDownField(
      {super.key,
      required this.label,
      this.onSavedCallback,
      required this.items});

  @override
  State<DropDownField> createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          flex: 2,
          child: Text(
            widget.label,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          flex: 3,
          child: CDropDownMenu(
            items: widget.items,
            hintText: AppString.selectAnOption,
            onSavedCallback: widget.onSavedCallback,
          ),
        )
      ],
    );
  }
}
