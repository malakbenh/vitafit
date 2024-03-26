import 'package:flutter/material.dart';
import 'dart:async';
import 'sign_in.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      Duration(seconds: 3),
      () => Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => const SignIn())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(
          image: AssetImage('assets/logo.png'),
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
