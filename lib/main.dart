import 'package:flutter/material.dart';
import 'package:vitafit/screens/auth/select_type.dart';
import 'package:vitafit/screens/auth/sign_up.dart';

void main() {
  runApp(const vitafit());
}

class vitafit extends StatelessWidget {
  const vitafit({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ChoseLogin(),
    );
  }
}
