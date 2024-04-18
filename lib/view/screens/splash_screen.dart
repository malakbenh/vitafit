import 'package:flutter/material.dart';
import 'dart:async';
import 'auth/onboarding.dart';

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
          .pushReplacement(MaterialPageRoute(builder: (_) => Onboarding())),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Image(
          image: AssetImage('assets/images/other/logo.png'),
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
