import 'package:flutter/material.dart';

import 'edit.dart';

class Settings_Screen extends StatefulWidget {
  const Settings_Screen({Key? key}) : super(key: key);

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
                  ProfileWidget(
                      text: 'Edit Profile',
                      image: "assets/icons/edit.png",
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Edit_Screen(),
                            ));
                      }),
                  ProfileWidget(
                      text: 'Change password',
                      image: "assets/icons/change.png",
                      onTap: () {}),
                  ProfileWidget(
                      text: 'Delete account',
                      image: 'assets/icons/dele.png',
                      onTap: () {}),
                  ProfileWidget(
                      text: 'Logout',
                      image: 'assets/icons/log.png',
                      color: Colors.red,
                      onTap: () {}),
                ],
              ),
            ),
            // ... rest of your code

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
                  SettingWidget(
                      text: 'Active Notification',
                      ifActive: true, // Change this line
                      image: 'assets/icons/edit.png',
                      onTap: () {}),
                  SettingWidget(
                      text: 'Language',
                      ifActive: false, // And this line
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
}

class ProfileWidget extends StatefulWidget {
  final String text;
  final Function? onTap;
  final String? image;
  final Color? color;
  final double? pad;
  final bool if_active;

  ProfileWidget(
      {this.text = '',
      this.onTap,
      this.image,
      this.color,
      this.pad,
      this.if_active = false});

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap as void Function()?,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        padding: EdgeInsets.all(widget.pad ?? 8),
        width: double.infinity,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                    padding: EdgeInsets.all(widget.pad ?? 8),
                    decoration: BoxDecoration(shape: BoxShape.circle),
                    child: Center(
                        child: widget.image != null
                            ? Image.asset(
                                widget.image!,
                                color: widget.color ?? Colors.black,
                              )
                            : Container())),
                SizedBox(
                  width: 10,
                ),
                Text(widget.text)
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: widget.color ?? Colors.black,
            )
          ],
        ),
      ),
    );
  }
}

class SettingWidget extends StatefulWidget {
  final String text;
  final bool ifActive;
  final Function? onTap;
  final String? image;
  final Color? color;
  final double? pad;

  SettingWidget({
    required this.text,
    this.ifActive = false,
    this.onTap,
    this.image,
    this.color,
    this.pad,
  });

  @override
  _SettingWidgetState createState() => _SettingWidgetState();
}

class _SettingWidgetState extends State<SettingWidget> {
  bool isNotificationActive = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap as void Function()?,
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        padding: EdgeInsets.all(widget.pad ?? 8),
        width: double.infinity,
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (!widget.ifActive)
                  Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(shape: BoxShape.circle),
                      child: Center(
                          child: widget.image != null
                              ? Image.asset(
                                  widget.image!,
                                  color: widget.color ?? Colors.black,
                                )
                              : Container())),
                if (widget.ifActive)
                  SizedBox(
                    width: 10,
                  ),
                Text(widget.text)
              ],
            ),
            if (widget.ifActive)
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
            if (!widget.ifActive)
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
}
