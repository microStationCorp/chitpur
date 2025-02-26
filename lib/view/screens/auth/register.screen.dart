import 'package:chitpur/resource/app_icons.dart';
import 'package:chitpur/resource/app_string.dart';
import 'package:chitpur/utils/form_validators.dart';
import 'package:chitpur/view/widgets/common/custom_dropdown_menu.dart';
import 'package:flutter/material.dart';

import '../../widgets/common/custom_date_picker.dart';
import '../../widgets/common/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                spacing: 20,
                children: [
                  Text(
                    "Register",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    spacing: 20,
                    children: [
                      Expanded(
                        child: CTextFormField(
                          hintText: "First Name",
                          validatorCallback: isEmptyValidator,
                        ),
                      ),
                      Expanded(
                        child: CTextFormField(
                          hintText: "Last Name",
                          validatorCallback: isEmptyValidator,
                        ),
                      ),
                    ],
                  ),
                  CTextFormField(
                    hintText: "Email",
                    validatorCallback: isEmptyValidator,
                    prefixIcon: Icon(AppIcons.atSign),
                  ),
                  CTextFormField(
                    hintText: "Phone Number",
                    validatorCallback: isEmptyValidator,
                    prefixIcon: Icon(AppIcons.phone),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    spacing: 20,
                    children: [
                      Expanded(
                        child: CDropDownMenu(
                          items: [Gender.male, Gender.female, Gender.others],
                          hintText: "Select Gender",
                        ),
                      ),
                      Expanded(child: CDatePicker()),
                    ],
                  ),
                  CTextFormField(
                    hintText: "Password",
                    validatorCallback: isEmptyValidator,
                    prefixIcon: Icon(AppIcons.keyRound),
                    isObscure: true,
                  ),
                  CTextFormField(
                    hintText: "Confirm Password",
                    isObscure: true,
                    validatorCallback: isEmptyValidator,
                    prefixIcon: Icon(AppIcons.keyRound),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        child: Text("Register"),
                      ),
                      FilledButton(onPressed: () {}, child: Text("Clear"))
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
