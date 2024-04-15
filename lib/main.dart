import 'package:flutter/material.dart';
import 'package:graduation_djz/ui/profile.dart';


import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'screens/splash_screen.dart';


void main() {
  runApp(const vitafit());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      builder: (context, child) => MaterialApp(
        home: SplashScreen(),
      ),

    );
  }
}

