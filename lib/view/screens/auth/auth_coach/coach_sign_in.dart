import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:ui';
import 'package:vitafit/view/custom_widgets/CustomTextFormField.dart';
import 'package:vitafit/view/custom_widgets/custom_button.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final _formKey = GlobalKey<FormState>();
  bool _obscureText = true;
  String _password = '';
  String _email = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Image.asset(
                  'assets/secure-login/pana.png',
                  fit: BoxFit.fitWidth,
                  width: 400.w,
                  height: 200.h,
                ),
              ),
              Divider(
                color: Color.fromARGB(255, 129, 127, 127),
                thickness: 1,
              ),
              const SizedBox(height: 10),
              Text(
                'Hello Again!',
                style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              const SizedBox(height: 10),
              Center(
                child: Text(
                  "Hi! Welcome back, you've been missed!",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: Color(0xFF6B6B6B),
                  ),
                ),
              ),
              const SizedBox(height: 25),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    CustomTextFormField(
                      hintText: 'Enter your email ',
                      prefixIcon: Icons.email,
                      errorBorderSize: 1.0,
                      validator: (value) {
                        if (value!.isEmpty || !value.contains('@')) {
                          return 'Please enter a valid email address.';
                        }
                        return null;
                      },
                      onChanged: (value) {
                        _email = value;
                      },
                      onSaved: (value) {
                        _email = value!;
                      },
                    ),
                    const SizedBox(height: 10),
                    Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        CustomTextFormField(
                          hintText: 'Enter your password',
                          prefixIcon: Icons.lock,
                          obscureText: true,
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
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              CastomButtonWidget(
                  fontSize: 20,
                  title: "Sign In",
                  backgroundColor: const Color(0xff35a072),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      print('Email: $_email, Password: $_password');
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
                  Text("Or sign in with",
                      style: TextStyle(
                        color: Color(0xFFAFADAD),
                      )),
                  Expanded(
                    child: Divider(
                      color: Colors.grey[400],
                      height: 50,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                      width: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30)),
                      child: Image.asset("assets/icons/google_logo.png")),
                  const SizedBox(
                    width: 20,
                  ),
                  Container(
                      width: 60,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey),
                          borderRadius: BorderRadius.circular(30)),
                      child: Image.asset("assets/icons/apple_logo.png")),
                ],
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Don\'t have an account?'),
                  TextButton(
                      onPressed: () {},
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Color(0xFF35A072),
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFF35A072),
                        ),
                      )),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
