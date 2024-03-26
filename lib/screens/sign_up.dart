import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vitafit/custom_widgets/CustomTextFormField.dart';
import 'package:vitafit/custom_widgets/custom_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  String _password = '';
  String _email = '';
  String _phoneNumber = '';
  String _fullName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Create an Account',
          style: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 249, 251, 252),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios, color: Colors.black),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Fill your information below or register with your social account',
                style: TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: Color.fromARGB(255, 100, 99, 99),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextFormField(
                    hintText: 'Full Name',
                    prefixIcon: Icons.person,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your full name';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {});
                      _fullName = value;
                    },
                    onSaved: (value) {
                      setState(() {
                        _fullName = value!;
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  //pohne number
                  CustomTextFormField(
                    hintText: 'Phone Number',
                    prefixIcon: Icons.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your phone number';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _phoneNumber = value;
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        _phoneNumber = value!;
                      });
                    },
                  ),
                  SizedBox(height: 10),

                  CustomTextFormField(
                    hintText: 'Email',
                    prefixIcon: Icons.email,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your email';
                      }
                      return null;
                    },
                    onChanged: (value) {
                      setState(() {
                        _email = value; // Provide a default value
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        _email = value!; // Provide a default value
                      });
                    },
                  ),
                  const SizedBox(height: 10),
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      CustomTextFormField(
                        hintText: 'Enter your password',
                        prefixIcon: Icons.lock,
                        obscureText: _obscureText,
                        errorBorderSize: 1.0,
                        validator: (value) {
                          if (value!.isEmpty || value.length < 7) {
                            return 'Password must be at least 7 characters long.';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          _password = value;
                        },
                        onSaved: (value) {
                          _password = value!;
                        },
                      ),
                      IconButton(
                        icon: Icon(_obscureText
                            ? Icons.visibility_off
                            : Icons.visibility),
                        color: Colors.grey[400],
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (value) {
                    setState(() {
                      // Provide a default value
                    });
                  },
                ),
                RichText(
                  text: TextSpan(
                    text: 'Agree with the ',
                    style: TextStyle(
                      color: Color.fromARGB(255, 14, 13, 13),
                      fontSize: 12.sp,
                    ),
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Terms & Conditions',
                        style: TextStyle(
                          color: Color(0xFF35A072),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            CastomButtonWidget(
                fontSize: 20,
                title: "Sign Up",
                backgroundColor: const Color(0xff35a072),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    print('Full Name: $_fullName');
                    print('Phone Number: $_phoneNumber');
                    print('Email: $_email');
                    print('Password: $_password');
                  }
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Divider(
                    color: Colors.grey[400],
                    height: 50,
                  ),
                ),
                Text("Or sign up with",
                    style: TextStyle(
                      color: Colors.grey[400],
                    )),
                Expanded(
                  child: Divider(
                    color: Colors.grey[400],
                    height: 50,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(30)),
                    child: Image.asset("assets/google_logo.png")),
                const SizedBox(
                  width: 20,
                ),
                Container(
                    width: 60,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(30)),
                    child: Image.asset("assets/apple_logo.png")),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Already have an account?',
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Color.fromARGB(255, 10, 10, 10),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Color(0xFF35A072),
                      decoration: TextDecoration.underline,
                      decorationColor: Color(0xFF35A072),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
