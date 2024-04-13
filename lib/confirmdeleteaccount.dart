import 'package:vitafit/first_delete_account.dart';
import 'package:flutter/material.dart';

import 'components.dart';
import 'placeHolder_dialog.dart';

class ConfirmDeleteAccount extends StatefulWidget {
  const ConfirmDeleteAccount({Key? key}) : super(key: key);

  @override
  State<ConfirmDeleteAccount> createState() => _ConfirmDeleteAccountState();
}

class _ConfirmDeleteAccountState extends State<ConfirmDeleteAccount> {
  bool hidePassword = true; // Variable to show/hide password
  final formKey = GlobalKey<FormState>();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'Delete Account',
            style: TextStyle(
                fontSize: 24, fontFamily: 'Poppins', color: Colors.black),
          ),
          centerTitle: true,
          elevation: 1.0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              MyCustomBackIcon.iconData,
              color: Colors.black,
            ),
            onPressed: () {
              setState(() {
                navigateTo(context: context, widget: FirstDeleteAccount());
              });
            },
          ),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children: [
                SizedBox(height: 40),
                // Space between text and app bar
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Log in to confirm',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                      letterSpacing: -0.44965860247612,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                // Space between text and text field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Text(
                    'Enter the login information for your account to confirm deletion',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                      letterSpacing: -0.44965860247612,
                      color: Colors.grey[400],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10),
                // Space between text and text field
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return ('this field is required');
                        }
                        return null;
                      },
                      onChanged: (value) {
                        print(value);
                      },
                      obscureText: hidePassword,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: hidePassword
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                          onPressed: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 4),
                // Space between text field and "Forgot Password?" button
                Padding(
                  padding: const EdgeInsets.only(right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: () {
                          // Add functionality for "Forgot Password?" button
                        },
                        child: Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.w500,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(height: 350),
                // Space between divider and buttons
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.42,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14,
                          ),
                        ),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Colors.grey[200]!,
                          ),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.42,
                      child: ElevatedButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return PlaceholderDialog(
                                  title: 'Success!',
                                  message:
                                      'your account has been\n successfuly deleted',
                                  actions: [
                                    Container(
                                      width: 110,
                                      height: 55,
                                      decoration: BoxDecoration(
                                        color: Colors.black,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'OK',
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              },
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                            Color.fromARGB(255, 253, 0, 0),
                          ),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                        child: Text(
                          'Delete Account',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MyCustomBackIcon {
  static IconData iconData = Icons.arrow_back_ios;
}
