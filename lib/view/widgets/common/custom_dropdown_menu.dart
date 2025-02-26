import 'package:flutter/material.dart';

import '../../../resource/app_string.dart';

class CDropDownMenu extends StatefulWidget {
  final List<String> items;
  final String hintText;
  final void Function(String?)? onSavedCallback;

  const CDropDownMenu(
      {super.key,
      required this.items,
      required this.hintText,
      this.onSavedCallback});

  @override
  State<CDropDownMenu> createState() => _CDropDownMenuState();
}

class _CDropDownMenuState extends State<CDropDownMenu> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      dropdownColor: Theme.of(context).colorScheme.surfaceContainerLow,
      isExpanded: true,
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
        widget.hintText,
        style: TextStyle().copyWith(
          fontWeight: FontWeight.normal,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      validator: (value) {
        if (value == null) {
          return AppString.selectAnOption;
        }
        return null;
      },
      onSaved: widget.onSavedCallback,
    );
  }
}
