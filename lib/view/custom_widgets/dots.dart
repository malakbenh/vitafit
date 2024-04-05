import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class Dots extends StatelessWidget {
  const Dots({
    Key? key,
    required this.pageController,
  }) : super(key: key);

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(bottom: 55.h),
        child: SmoothPageIndicator(
          controller: pageController,
          count: 2,
          effect: ExpandingDotsEffect(
              expansionFactor: 4,
              spacing: 8,
              radius: 12,
              dotWidth: 12,
              dotHeight: 12,
              dotColor: Color.fromARGB(255, 217, 217, 217),
              activeDotColor: Color(0xFF35A072)),
        ));
  }
}
