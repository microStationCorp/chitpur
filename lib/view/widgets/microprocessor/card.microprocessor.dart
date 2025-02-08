import 'package:flutter/material.dart';

class CardMP extends StatelessWidget {
  final Widget child;

  const CardMP({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: child
      ),
    );
  }
}

Text cardHeader(String title) {
  return Text(
    title,
    style: TextStyle(
      fontSize: 24,
    ),
  );
}
