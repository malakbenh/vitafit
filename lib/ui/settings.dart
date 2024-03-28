import 'package:flutter/material.dart';

import 'edit.dart';

class Settings_Screen extends StatefulWidget {
  const Settings_Screen({super.key});

  @override
  State<Settings_Screen> createState() => _Settings_ScreenState();
}

class _Settings_ScreenState extends State<Settings_Screen> {
  bool isNotificationActive = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings '),
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back_ios)),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Icon(Icons.person),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Account',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              color: Color(0xffFCFCFC),
              child: Column(
                children: [
                  profile_widget(
                      text: 'Edit Profile',
                      image: 'assets/icons/edit.png',
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Edit_Screen(),
                            ));
                      }),
                  profile_widget(
                      text: 'Change password',
                      image: 'assets/icons/change.png',
                      onTap: () {}),
                  profile_widget(
                      text: 'Delete account',
                      image: 'assets/icons/dele.png',
                      onTap: () {}),
                  profile_widget(
                      text: 'Logout',
                      image: 'assets/icons/log.png',
                      color: Colors.red,
                      onTap: () {}),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                children: [
                  Icon(Icons.notifications),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Notofictions',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              color: Color(0xffFCFCFC),
              child: Column(
                children: [
                  setting_widget(
                      text: 'Active Notification',
                      if_active: true,
                      image: 'assets/icons/edit.png',
                      onTap: () {}),
                  setting_widget(
                      text: 'Language',
                      if_active: false,
                      image: 'assets/icons/lan.png',
                      onTap: () {}),
                ],
              ),
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
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Center(
                          child: Image.asset(
                        image,
                        color: color ?? Colors.black,
                      ))),
                  SizedBox(
                    width: 10,
                  ),
                  Text(text)
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
  Widget setting_widget({
    text,
    onTap,
    image,
    if_active,
    Color? color,
  }) =>
      InkWell(
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
                  if (!if_active)
                    Container(
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        child: Center(
                            child: Image.asset(
                          image,
                          color: Colors.black,
                        ))),
                  if (if_active)
                    SizedBox(
                      width: 10,
                    ),
                  Text(text, style: TextStyle(color: color ?? Colors.black))
                ],
              ),
              if (if_active)
                Switch(
                  value: isNotificationActive,
                  onChanged: (v) {
                    setState(() {
                      isNotificationActive = v;
                    });
                  },
                  activeColor: Colors.white,
                  activeTrackColor: Colors.lightGreenAccent,
                ),
              if (!if_active)
                Row(
                  children: [
                    Text(
                      'English',
                      style: TextStyle(color: Colors.grey),
                    ),
                    Icon(
                      Icons.arrow_drop_down,
                      color: Colors.grey,
                    )
                  ],
                )
            ],
          ),
        ),
      );
}
