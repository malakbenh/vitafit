import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:vitafit/view/screens/auth/login_or_signup_screen.dart';

class HelloScreen extends StatelessWidget {
  const HelloScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void navigateToNextScreen() {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const LoginOrSignUP(),
        ),
      );
    }

    void startTimer() {
      Timer(const Duration(seconds: 3), navigateToNextScreen);
    }

    startTimer();

    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.topLeft,
          children: [
            Image.asset(
              "assets/images/other/Ellipse 3.png",
            ),
            ClipRRect(
              borderRadius:
                  const BorderRadius.only(topLeft: Radius.circular(20)),
              child: Image.asset(
                "assets/images/other/Ellipse 3-1.png",
              ),
            ),
            Positioned(
              bottom: 0,
              left: 250,
              child: Transform.rotate(
                angle: -pi / 1,
                child: Image.asset(
                  "assets/images/other/Ellipse 3.png",
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 335,
              child: Transform.rotate(
                angle: pi / -1.1,
                child: ClipRRect(
                  borderRadius:
                      const BorderRadius.only(topLeft: Radius.circular(30)),
                  child: Image.asset(
                    "assets/images/other/Ellipse 3-1.png",
                  ),
                ),
              ),
            ),
            const Center(
              child: Text(
                "Hello\nDear\nClient",
                style: TextStyle(fontSize: 70, fontFamily: "Satisfy"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
