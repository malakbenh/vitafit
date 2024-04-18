import 'package:flutter/material.dart';
import 'package:vitafit/view/screens/coaching/settings/settings.dart';

class Profile_Screen extends StatefulWidget {
  @override
  _Profile_ScreenState createState() => _Profile_ScreenState();
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
            Center(child: Image.asset('assets/images/other/image.png')),
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
                ProfileWidget(
                    text: 'Notifications',
                    image: "assets/icons/not.png",
                    onTap: () {}),
                ProfileWidget(
                    text: 'Statistics',
                    image: "assets/icons/stat.png",
                    onTap: () {}),
                ProfileWidget(
                    text: 'Settings',
                    image: 'assets/icons/set.png',
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Settings_Screen(),
                          ));
                    }),
                ProfileWidget(
                    text: 'About',
                    image: 'assets/icons/i.png',
                    pad: 15.0,
                    onTap: () {}),
                ProfileWidget(
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
}

class ProfileWidget extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final String image;
  final Color color;
  final double pad;

  ProfileWidget({
    required this.text,
    required this.onTap,
    required this.image,
    this.color = Colors.black,
    this.pad = 8.0,
  });

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
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
                    padding: EdgeInsets.all(widget.pad),
                    decoration: BoxDecoration(
                        color: widget.color, shape: BoxShape.circle),
                    child: Center(child: Image.asset(widget.image))),
                SizedBox(
                  width: 10,
                ),
                Text(widget.text, style: TextStyle(color: widget.color))
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: widget.color,
            )
          ],
        ),
      ),
    );
  }
}
