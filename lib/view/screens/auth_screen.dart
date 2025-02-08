import 'package:chitpur/data/controller/auth/auth.controller.dart';
import 'package:chitpur/resource/app_icons.dart';
import 'package:chitpur/view/widgets/appbar.dart';
import 'package:chitpur/view/widgets/common/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  int _selectedIndex = 0;
  final AuthController authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarC(title: "Auth Page"),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10.0, 20, 10, 0),
        child: Center(
          child: _selectedIndex == 0
              ? _RegisterScreen()
              : _LoginScreen(
                  authController: authController,
                ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(AppIcons.register),
            label: "Register",
          ),
          BottomNavigationBarItem(
            icon: Icon(AppIcons.lock),
            label: "Log In",
          ),
        ],
      ),
    );
  }
}

class _RegisterScreen extends StatelessWidget {
  const _RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Center(
        child: Text("Register Screen"),
      ),
    );
  }
}

class _LoginScreen extends StatefulWidget {
  final AuthController authController;

  const _LoginScreen({super.key, required this.authController});

  @override
  State<_LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<_LoginScreen> {
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
                          onPressed: () {
                            widget.authController.email = _emailController.text;
                            widget.authController.password =
                                _passwordController.text;
                            widget.authController.signIn();
                          },
                          child: Text("Login")),
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

// import "package:chitpur/data/controller/auth/auth.controller.dart";
// import "package:chitpur/resource/app_color.dart";
// import "package:chitpur/resource/app_icons.dart";
// import "package:chitpur/view/widgets/appbar.dart";
// import "package:chitpur/view/widgets/microprocessor/card.microprocessor.dart";
// import "package:flutter/material.dart";
// import 'package:get/get.dart';
//
// class AuthScreen extends StatefulWidget {
//   const AuthScreen({super.key});
//
//   @override
//   State<AuthScreen> createState() => _AuthScreenState();
// }
//
// class _AuthScreenState extends State<AuthScreen> {
//   bool isObscure = true;
//   final AuthController authController = Get.find();
//
//   final emailController = TextEditingController();
//
//   final passwordController = TextEditingController();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBarC(title: "Auth Page"),
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 20.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               cardHeader("Authentication"), // need to rectify
//               SizedBox(
//                 height: 20,
//               ),
//               TextField(
//                 controller: emailController,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide(
//                       color: AppColor.primaryColor,
//                     ),
//                   ),
//                   labelText: 'Email',
//                 ),
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               TextField(
//                 controller: passwordController,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10),
//                     borderSide: BorderSide(
//                       color: AppColor.primaryColor,
//                     ),
//                   ),
//                   labelText: 'Password',
//                   suffixIcon: IconButton(
//                     onPressed: () {
//                       setState(
//                         () {
//                           isObscure = !isObscure;
//                         },
//                       );
//                     },
//                     icon: Icon(
//                         isObscure ? AppIcons.eyeClose : AppIcons.eyeOpen),
//                   ),
//                 ),
//                 obscureText: isObscure,
//               ),
//               SizedBox(
//                 height: 20,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   ElevatedButton(
//                     style: ButtonStyle(
//                       elevation: WidgetStateProperty.all(0),
//                     ),
//                     onPressed: () {
//                       authController.email = emailController.text;
//                       authController.password = passwordController.text;
//                       authController.signUp();
//                     },
//                     child: Text(
//                       "Register",
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     width: 25,
//                   ),
//                   ElevatedButton(
//                     style: ButtonStyle(
//                       elevation: WidgetStateProperty.all(0),
//                       backgroundColor:
//                           WidgetStateProperty.all(AppColor.outlineColor),
//                     ),
//                     onPressed: () {
//                       authController.email = emailController.text;
//                       authController.password = passwordController.text;
//                       authController.signIn();
//                     },
//                     child: Text(
//                       "Log In",
//                       style: TextStyle(
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                         color: AppColor.cardBackgroundColor,
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
