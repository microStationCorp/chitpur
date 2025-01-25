import 'package:flutter/material.dart';

import '../appbar.dart';
import '../drawer.dart';
import 'bottom_app_bar.microprocessor.dart';
import 'floating_action.microprocessor.dart';

class CoverMP extends StatelessWidget {
  final Widget bodyMP;

  const CoverMP({super.key, required this.bodyMP});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarC(title: "Microprocessor"),
      drawer: DrawerC(),
      body: bodyMP,
      floatingActionButton: FloatingActionMP(),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      bottomNavigationBar: BottomAppbarCMP(),
    );
  }
}
