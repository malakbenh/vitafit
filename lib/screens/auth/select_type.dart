import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:vitafit/screens/auth/hello_screen.dart';
import 'package:vitafit/widget/custom_button.dart';

class ChoseLogin extends StatelessWidget {
  const ChoseLogin({super.key});

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Scaffold(
      body:
       Stack(
        children: <Widget>[
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("asset/images/home.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
              child: Container(
                color: Colors.white.withOpacity(0.1),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "asset/images/Capture_d_e╠ücran_2024-02-14_143937-removebg-preview.png",
                ),
                const SizedBox(
                  height: 300,
                ),
                CastomButtonWidget(
                  title: "I'm a coach",
                  backgroundColor: const Color(0xff35a072),
                  onPressed: () {},
                ),
                CastomButtonWidget(
                    title: "I'm a client",
                    backgroundColor: Colors.white,
                    textColor: Colors.black,
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return HelloScreen();
                      }));
                    }),
              ],
            ),
          )
        ],
      ),
    );
  }
}
