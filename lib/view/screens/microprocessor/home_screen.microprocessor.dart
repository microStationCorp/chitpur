import 'package:chitpur/view/widgets/microprocessor/cover.microprocessor.dart';
import 'package:flutter/material.dart';

class HomeScreenMP extends StatelessWidget {
  const HomeScreenMP({super.key});

  @override
  Widget build(BuildContext context) {
    return CoverMP(
      bodyMP: Center(
        child: Text("Microprocessor Home"),
      ),
    );
  }
}
