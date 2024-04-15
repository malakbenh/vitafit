import 'package:flutter/material.dart';
import 'package:vitafit/widget/custom_button.dart';

class LoginOrSignUP extends StatelessWidget {
  const LoginOrSignUP({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      
      Stack(
        alignment: Alignment.topLeft,
        children: [
          Image.asset(
            "asset/images/Ellipse 3.png",
          ),
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
            ),
            child: Image.asset(
              "asset/images/Ellipse 3-1.png",
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 100,
                  ),
                  Image.asset("asset/images/tablet-login/pana.png"),
                  const Text(
                    "Get the best service in our\n platforme!",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  CastomButtonWidget(
                      title: "Sign Up",
                      backgroundColor: const Color(0xff35a072),
                      onPressed: () {}),
                  CastomButtonWidget(
                    title: "Login",
                    backgroundColor: Colors.white,
                    onPressed: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (context) {
                        return const LogInScreen();
                      }));
                    },
                    textColor: Colors.black,
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Center(
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(fontSize: 16, color: Colors.black),
                        children: <TextSpan>[
                          TextSpan(
                            text: "By using this app, you agree to our ",
                          ),
                          TextSpan(
                            text: "business or end user terms",
                            style: TextStyle(color: Colors.amber),
                          ),
                          TextSpan(
                            text: " and ",
                          ),
                          TextSpan(
                            text: "privacy policy",
                            style: TextStyle(color: Colors.amber),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
