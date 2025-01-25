import "package:chitpur/view/widgets/appbar.dart";
import "package:chitpur/view/widgets/drawer.dart";
import "package:flutter/material.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarC(title: "Home Page"),
      drawer: DrawerC(),
      body: Center(
        child: Text("Home page"),
      ),
    );
  }
}
