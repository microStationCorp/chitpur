import 'package:flutter/material.dart';

class CTextField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hintText;
  final bool? isObscure;
  final TextEditingController? textEditingController;

  const CTextField(
      {super.key,
      this.prefixIcon,
      this.suffixIcon,
      required this.hintText,
      this.isObscure,
      this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      obscureText: isObscure ?? false,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}

class CTextFormField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String hintText;
  final bool? isObscure;
  final FormFieldValidator<String>? validatorCallback;
  final Function(String?)? onSavedCallback;

  const CTextFormField(
      {super.key,
      this.prefixIcon,
      this.suffixIcon,
      required this.hintText,
      this.isObscure,
      this.validatorCallback,
      this.onSavedCallback});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isObscure ?? false,
      validator: validatorCallback,
      onSaved: onSavedCallback,
      decoration: InputDecoration(
        hintText: hintText,
        prefixIcon: prefixIcon,
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
      ),
    );
  }
}
