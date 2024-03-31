import 'package:flutter/material.dart';
import 'package:vitafit/nav_bar.dart';

void main() {
  runApp(const vitafit());
}

class vitafit extends StatelessWidget {
  const vitafit({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavBar(),
    );
  }
}