import 'package:chitpur/resource/app_color.dart';
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
            style: TextStyle(
                fontSize: Theme.of(context).textTheme.bodyLarge!.fontSize),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Flexible(
          flex: 3,
          child: DropdownButtonFormField(
            dropdownColor: AppColor.tileSurfaceColor,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
            ),
            items: widget.items
                .map(
                  (e) => DropdownMenuItem(
                    value: e,
                    child: Text(
                      e,
                      style: TextStyle(
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                )
                .toList(),
            onChanged: (String? value) {
              selectedValue = value;
            },
            value: selectedValue,
            hint: Text(
              AppString.selectAnOption,
            ),
            validator: (value) {
              if (value == null) {
                return AppString.selectAnOption;
              }
              return null;
            },
            onSaved: widget.onSavedCallback,
          ),
        )
      ],
    );
  }
}
