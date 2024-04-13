import 'package:flutter/material.dart';

import 'first_delete_account.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    //  home: PersonlizeScreen(),
       home: FirstDeleteAccount(),
    );
  }

}