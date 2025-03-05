import 'package:chitpur/data/controller/auth/auth.controller.dart';
import 'package:chitpur/view/widgets/common/appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarC(title: "Auth Page"),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 20, 10, 0),
        child: Obx(
          () => Center(
            child: _authController.isLoading.value
                ? CircularProgressIndicator()
                : loginButton(context, _authController),
          ),
        ),
      ),
    );
  }
}

Widget loginButton(BuildContext context, AuthController authController) {
  return OutlinedButton.icon(
    style: ButtonStyle().copyWith(
      elevation: WidgetStateProperty.all(0),
      side: WidgetStateProperty.all(
        BorderSide(
          width: 1,
          color: Theme.of(context).colorScheme.tertiary,
        ),
      ),
    ),
    onPressed: () {
      authController.signIn();
    },
    label: Text("Sign in with Google"),
    icon: Image.asset(
      'assets/images/google.png',
      width: 24,
      height: 24,
    ),
  );
}
