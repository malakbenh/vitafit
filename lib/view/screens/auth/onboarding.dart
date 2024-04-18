import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:google_fonts/google_fonts.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final pageController = PageController();
  int currentPage = 0;

  @override
  void initState() {
    pageController.addListener(() {
      setState(() {
        currentPage = pageController.page!.toInt();
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        children: [
          PageView(controller: pageController, children: myViews),
          Dots(pageController: pageController),
          Buttons(currentPage: currentPage, pageController: pageController)
        ],
      ),
    );
  }
}

class Buttons extends StatelessWidget {
  const Buttons({
    super.key,
    required this.pageController,
    required this.currentPage,
  });

  final PageController pageController;
  final int currentPage;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 846.h,
      left: 0.w,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.5.w),
          child: currentPage == 2
              ? const Option2()
              : Option1(pageController: pageController),
        ),
      ),
    );
  }
}

class Option1 extends StatelessWidget {
  const Option1({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        TextButton(
            onPressed: () {
              print('Skip ...');
            },
            child: Text(
              'Skip',
              style: TextStyle(
                color: Colors.black,
                fontSize: 19.sp,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
              ),
            )),
        Container(
          width: 55.w,
          height: 55.h,
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 238, 122, 83), shape: BoxShape.circle),
          child: IconButton(
              onPressed: () {
                int currentPage = pageController.page!.toInt();
                currentPage++;
                pageController.jumpToPage(currentPage);
              },
              icon: const Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.white,
              )),
        )
      ],
    );
  }
}

class Option2 extends StatelessWidget {
  const Option2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      children: [
        GestureDetector(
          onTap: () {
            print('get started ...');
          },
          child: Container(
            width: 162.w,
            height: 51.w,
            decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    blurRadius: 9.1,
                    offset: Offset(0, 4),
                    color: Color.fromRGBO(0, 0, 0, 0.15))
              ],
              borderRadius: BorderRadius.all(Radius.circular(24.w)),
              color: const Color.fromARGB(255, 238, 122, 83),
            ),
            child: Center(
              child: Text('Get Started!',
                  style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: Colors.white,
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w700),
                  )),
            ),
          ),
        )
      ],
    );
  }
}

class Dots extends StatelessWidget {
  const Dots({
    super.key,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 610.h,
        left: 0.w,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              SmoothPageIndicator(
                controller: pageController,
                count: 3,
                effect: const ExpandingDotsEffect(
                    dotColor: Color.fromARGB(255, 217, 217, 217),
                    activeDotColor: Color.fromARGB(255, 238, 122, 83)),
              )
            ],
          ),
        ));
  }
}

List<Widget> myViews = [
  const View(
      img: Page1Consts.img,
      txt1: Page1Consts.txt1,
      txt2: Page1Consts.txt2,
      txt3: Page1Consts.txt3),
  const View(
      img: Page2Consts.img,
      txt1: Page2Consts.txt1,
      txt2: Page2Consts.txt2,
      txt3: Page2Consts.txt3),
  const View(
      img: Page3Consts.img,
      txt1: Page3Consts.txt1,
      txt2: Page3Consts.txt2,
      txt3: Page3Consts.txt3),
];

class View extends StatelessWidget {
  const View({
    super.key,
    required this.img,
    required this.txt1,
    required this.txt2,
    required this.txt3,
  });

  final String img;
  final String txt1;
  final String txt2;
  final String txt3;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const MyBackGround(),
        MyImage(img: img),
        MyHeadLine(txt1: txt1, txt2: txt2),
        MyParagraph(txt3: txt3),
      ],
    );
  }
}

class MyBackGround extends StatelessWidget {
  const MyBackGround({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(MediaQuery.of(context).size.width, 582.h),
      painter: MyCustomPainter(),
    );
  }
}

class MyParagraph extends StatelessWidget {
  const MyParagraph({
    super.key,
    required this.txt3,
  });

  final String txt3;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: 711.h,
        left: 23.w,
        child: SizedBox(
          height: 102.h,
          width: 381.w,
          child: Text(txt3,
              textAlign: TextAlign.justify,
              style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      height: 1.1.h,
                      color: Colors.black,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400))),
        ));
  }
}

class MyHeadLine extends StatelessWidget {
  const MyHeadLine({
    super.key,
    required this.txt1,
    required this.txt2,
  });

  final String txt1;
  final String txt2;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 23.w,
      top: 631.h,
      child: SizedBox(
        width: 379.w,
        height: 81.h,
        child: Row(
          children: [
            Text(txt1,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                      color: const Color.fromARGB(255, 130, 130, 130),
                      fontSize: 25.sp,
                      fontWeight: FontWeight.w700),
                )),
            Text(txt2,
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(
                        color: const Color.fromARGB(255, 238, 122, 83),
                        fontSize: 25.sp,
                        fontWeight: FontWeight.w700))),
          ],
        ),
      ),
    );
  }
}

class MyImage extends StatelessWidget {
  const MyImage({
    required this.img,
    super.key,
  });

  final String img;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 117.h,
      left: 19.w,
      child: SizedBox(
        height: 349.h,
        width: 393.w,
        child: Image.asset(img),
      ),
    );
  }
}

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    double height = size.height;
    double width = size.width;

    Offset p1 = Offset(0, height * 0.85);
    Offset p2 = Offset(width, height * 0.85);
    Offset p3 = Offset(width, 0);

    Offset center = Offset(width * 0.5, height * 1.15);

    Path path = Path();

    path.lineTo(p1.dx, p1.dy);
    path.quadraticBezierTo(center.dx, center.dy, p2.dx, p2.dy);
    path.lineTo(p2.dx, p2.dy);
    path.lineTo(p3.dx, p3.dy);

    Paint paint = Paint();
    paint.color = const Color.fromARGB(255, 245, 245, 245);
    paint.style = PaintingStyle.fill;

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class Page1Consts {
  static const String img = 'assets/images/eating-disorder/cuate.png';
  static const String txt1 = 'You Have A ';
  static const String txt2 = 'Personal Coach!';
  static const String txt3 =
      'Welcome to our application! Start your journey to a healthier lifestyle with personalized coaching and diet plans tailored just for you.';
}

class Page2Consts {
  static const String img = 'assets/images/coaches/pana.png';
  static const String txt1 = 'Join As A ';
  static const String txt2 = 'Coach!';
  static const String txt3 =
      'Welcome to VitaFit! Create your profile to start connecting with clients, managing their diets, and guiding them towards their fitness goals.';
}

class Page3Consts {
  static const String img = 'assets/images/mobile-payments/pana.png';
  static const String txt1 = 'Explore ';
  static const String txt2 = 'The Shop’s Products!';
  static const String txt3 =
      'Discover a wide range of high-quality nutritional and sports products to support your fitness journey.';
}
