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
