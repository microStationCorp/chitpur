import "package:chitpur/data/controller/auth/auth.controller.dart";
import "package:chitpur/resource/app_color.dart";
import "package:chitpur/view/widgets/appbar.dart";
import "package:chitpur/view/widgets/drawer.dart";
import "package:chitpur/view/widgets/microprocessor/card.microprocessor.dart";
import "package:flutter/material.dart";
import 'package:get/get.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  bool isObscure = true;
  final AuthController authController = Get.find();

  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarC(title: "Auth Page"),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              cardHeader("Authentication"), // need to rectify
              SizedBox(
                height: 20,
              ),
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppColor.primaryColor,
                    ),
                  ),
                  labelText: 'Email',
                ),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      color: AppColor.primaryColor,
                    ),
                  ),
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(
                        () {
                          isObscure = !isObscure;
                        },
                      );
                    },
                    icon: Icon(
                        isObscure ? Icons.visibility_off : Icons.visibility),
                  ),
                ),
                obscureText: isObscure,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: WidgetStateProperty.all(0),
                    ),
                    onPressed: () {
                      authController.email = emailController.text;
                      authController.password = passwordController.text;
                      authController.signUp();
                    },
                    child: Text(
                      "Register",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 25,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      elevation: WidgetStateProperty.all(0),
                      backgroundColor:
                          WidgetStateProperty.all(AppColor.outlineColor),
                    ),
                    onPressed: () {
                      authController.email = emailController.text;
                      authController.password = passwordController.text;
                      authController.signIn();
                    },
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColor.cardBackgroundColor,
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      drawer: DrawerC(),
    );
  }
}
