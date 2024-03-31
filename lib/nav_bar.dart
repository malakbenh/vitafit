import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:vitafit/screens/pages/favorite.dart';
import 'package:vitafit/screens/pages/home_screen.dart';
import 'package:vitafit/screens/pages/orders.dart';
import 'package:vitafit/screens/pages/program.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  late PageController controller;
  int curentScreen = 0;
  List<Widget> screens = [
    const HomeScreen(),
    const program(),
    const Favorite(),
    const Orders(),
    const program()
  ];
  @override
  void initState() {
    controller = PageController(initialPage: curentScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            curentScreen = index;
          });
        },
        controller: controller,
        children: screens,
      ),
      bottomNavigationBar: NavigationBar(
          backgroundColor: Colors.white,
          indicatorColor: Colors.white,
          selectedIndex: curentScreen,
          onDestinationSelected: (index) {
            setState(() {
              curentScreen = index;
            });
            controller.jumpToPage(curentScreen);
          },
          destinations: const [
            NavigationDestination(
              icon: Icon(Icons.home_outlined),
              label: "Home",
              selectedIcon: Icon(Icons.home),
            ),
            NavigationDestination(
              icon: Icon(Icons.notes_rounded),
              label: "Progeram",
            ),
            NavigationDestination(
                icon: Icon(IconlyBold.heart), label: "favorite"),
            NavigationDestination(
                icon: Icon(Icons.card_travel), label: "orders"),
            NavigationDestination(
                icon: Icon(Icons.person_outline_rounded), label: "Profile"),
          ]),
    );
  }
}

class Program {
  const Program();
}
