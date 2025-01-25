import 'package:flutter/material.dart';

class TextFormFieldMP extends StatelessWidget {
  final String labelText;
  final FormFieldValidator<String>? validatorCallback;
  final Function(String?)? onSavedCallback;

  const TextFormFieldMP(
      {super.key,
      required this.labelText,
      this.validatorCallback,
      this.onSavedCallback});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
      ),
      validator: validatorCallback,
      onSaved: onSavedCallback,
    );
  }
}
