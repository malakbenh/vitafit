import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class Edit_Screen extends StatefulWidget {
  const Edit_Screen({Key? key}) : super(key: key);

  @override
  State<Edit_Screen> createState() => _Edit_ScreenState();
}

class _Edit_ScreenState extends State<Edit_Screen> {
  File? _image;
  final picker = ImagePicker();
  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCFCFC),
      appBar: AppBar(
        title: Text('Edit Profile '),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          children: [
            ProfileWidget(
                text: 'Edit Profile',
                text1: "assets/icons/edit.png",
                color: Colors.black,
                if_image: true),
            ProfileWidget(
                text: 'User Name',
                text1: 'Coach Wafaa',
                color: Colors.grey,
                if_image: false),
            ProfileWidget(
                text: 'Price',
                text1: '3000 DA',
                color: Colors.green,
                if_image: false),
            ProfileWidget(
                text: 'Availability',
                text1: '8:00 AM - 21:00 PM',
                color: Colors.green,
                if_image: false),
            ProfileWidget(
                text: 'About',
                text1: 'Fitness personal ...',
                color: Colors.green,
                if_image: false),
            ProfileWidget(
                text: 'Copy Link',
                text1: 'lnk.coachWafaa/...',
                color: Colors.grey,
                if_image: false),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xffEAEAEA))),
                    onPressed: () {},
                    child: Text(
                      'Cancel',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    )),
                ElevatedButton(
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Color(0xff35A072))),
                    onPressed: () {},
                    child: Text(
                      'Save',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ProfileWidget extends StatefulWidget {
  final String text;
  final String text1;
  final bool if_image;
  final Color? color;

  ProfileWidget({
    required this.text,
    required this.text1,
    required this.if_image,
    this.color,
  });

  @override
  _ProfileWidgetState createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  File? _image;
  final picker = ImagePicker();

  Future getImage() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      padding: EdgeInsets.all(8),
      width: double.infinity,
      height: 60,
      color: Colors.white,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.text,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          if (widget.if_image)
            GestureDetector(
              onTap: getImage,
              child: _image == null
                  ? Image.asset('assets/images/profile.png')
                  : Image.file(_image!),
            ),
          if (!widget.if_image)
            Text(
              widget.text1,
              style: TextStyle(
                color: widget.color ?? Colors.black54,
              ),
            )
        ],
      ),
    );
  }
}
