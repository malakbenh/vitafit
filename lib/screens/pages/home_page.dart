import 'package:flutter/material.dart';
import 'package:test/widget/custom_text_feild.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset("asset/images/Ellipse 27.png"),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 30),
          child: Row(
            children: [
              CustomTextField(
                  hintText: "search", prefixIcon: Icon(Icons.search)),
                  
            ],
          ),
        )
      ],
    );
  }
}
