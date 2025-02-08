import "package:chitpur/data/controller/auth/auth.controller.dart";
import "package:chitpur/view/widgets/appbar.dart";
import "package:chitpur/view/widgets/drawer.dart";
import "package:flutter/material.dart";
import "package:get/get.dart";

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final AuthController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarC(title: "Home Page"),
      drawer: _authController.isSignedIn ? DrawerC() : null,
      body: Center(
        child: Text("Home page"),
      ),
    );
  }
}
