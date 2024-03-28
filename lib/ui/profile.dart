import 'package:flutter/material.dart';
import 'package:graduation_djz/ui/settings.dart';

class Profile_Screen extends StatefulWidget {
  const Profile_Screen({super.key});

  @override
  State<Profile_Screen> createState() => _Profile_ScreenState();
}

class _Profile_ScreenState extends State<Profile_Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Center(child: Image.asset('assets/images/image.png')),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60,
                ),
                Text('Coach Name',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                Text('coachemail@example.com', style: TextStyle(fontSize: 16)),
                SizedBox(
                  height: 20,
                ),
                Container(
                    width: 300,
                    child: Divider(color: Color.fromARGB(255, 206, 200, 200))),
                profile_widget(
                    text: 'Notifications',
                    image: 'assets/icons/not.png',
                    onTap: () {}),
                profile_widget(
                    text: 'Statistics',
                    image: 'assets/icons/stat.png',
                    onTap: () {}),
                profile_widget(
                    text: 'Settings',
                    image: 'assets/icons/set.png',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Settings_Screen(),
                          ));
                    }),
                profile_widget(
                    text: 'About',
                    image: 'assets/icons/i.png',
                    onTap: () {},
                    pad: 15.0),
                profile_widget(
                    text: 'Logout',
                    image: 'assets/icons/log.png',
                    color: Colors.red,
                    onTap: () {}),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget profile_widget({text, onTap, image, color, pad}) => InkWell(
        onTap: onTap,
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: 30,
          ),
          padding: EdgeInsets.all(8),
          width: double.infinity,
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                      padding: EdgeInsets.all(pad ?? 8),
                      decoration: BoxDecoration(
                          color: color ?? Colors.black, shape: BoxShape.circle),
                      child: Center(child: Image.asset(image))),
                  SizedBox(
                    width: 10,
                  ),
                  Text(text, style: TextStyle(color: color ?? Colors.black))
                ],
              ),
              Icon(
                Icons.arrow_forward_ios,
                color: color ?? Colors.black,
              )
            ],
          ),
        ),
      );
}
