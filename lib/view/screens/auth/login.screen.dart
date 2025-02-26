import 'package:flutter/material.dart';

import '../../../data/controller/auth/auth.controller.dart';
import '../../../resource/app_icons.dart';
import '../../widgets/common/custom_text_field.dart';

class LoginScreen extends StatefulWidget {
  final AuthController authController;

  const LoginScreen({super.key, required this.authController});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isObscure = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.35,
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                spacing: 20,
                children: [
                  Text(
                    "Login",
                    style: Theme.of(context).textTheme.headlineSmall,
                  ),
                  CTextField(
                    hintText: "Email",
                    textEditingController: _emailController,
                  ),
                  CTextField(
                    hintText: "Password",
                    textEditingController: _passwordController,
                    isObscure: isObscure,
                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(
                          () {
                            isObscure = !isObscure;
                          },
                        );
                      },
                      icon: Icon(
                          isObscure ? AppIcons.eyeClose : AppIcons.eyeOpen),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 10,
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        child: Text("Login"),
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
