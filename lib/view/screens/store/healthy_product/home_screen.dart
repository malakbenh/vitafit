import 'package:flutter/material.dart';
import 'package:vitafit/const/app_const.dart';
import 'package:vitafit/screens/pages/SubPages/healthy_product.dart';
import 'package:vitafit/widget/main_product.dart';
import 'package:card_swiper/card_swiper.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(
                  child: Image.asset(
                    "asset/images/Ellipse 27.png",
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            top: 50, left: 30, right: 30, bottom: 90),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  prefix: const SizedBox(
                                    width: 15,
                                  ),
                                  contentPadding: const EdgeInsets.all(1),
                                  suffixIcon: const Icon(Icons.search),
                                  hintText: "Search",
                                  fillColor: Colors.white,
                                  filled: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 10),
                            IconButton(
                              icon: const Icon(
                                Icons.notifications_active,
                                color: Colors.white,
                                size: 26,
                              ),
                              onPressed: () {},
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomProductWidget(
                              onTap: () {},
                              imagePath: "asset/images/home/pngwing 2.png",
                              title: "    Healthy \n Products"),
                          CustomProductWidget(
                              onTap: () {},
                              imagePath: "asset/images/home/pngwing 4.png",
                              title: " Sport\n Materials"),
                          CustomProductWidget(
                              onTap: () {},
                              imagePath: "asset/images/home/imagesh.png",
                              title: "  Sport \n swear"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 150,
              child: Swiper(
                autoplay: true,
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(Banners.banners[index]);
                },
                itemCount: Banners.banners.length,
              ),
            ),
            Column(
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "SALES DISCOUNT",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          "View All",
                          style: TextStyle(
                            color: Color(0xffEE7A53),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Banners.salesDiscount.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, childAspectRatio: 8 / 7.4),
                    itemBuilder: (BuildContext context, int index) {
                      return Banners.salesDiscount[index];
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Popular Products",
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HealthyProduct(),
                              ));
                        },
                        child: const Text(
                          "View All",
                          style: TextStyle(
                            color: Color(0xffEE7A53),
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 200,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Banners.salesDiscount.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1, childAspectRatio: 8 / 7.4),
                    itemBuilder: (BuildContext context, int index) {
                      return Banners.salesDiscount[index];
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.25,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
