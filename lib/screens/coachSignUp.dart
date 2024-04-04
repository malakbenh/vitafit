import 'package:flutter/material.dart';
import 'package:vitafit/custom_widgets/CustomTextFormField.dart';
import 'package:vitafit/custom_widgets/custom_button.dart';
import 'package:vitafit/custom_widgets/DropdownButtonFormField.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:file_picker/file_picker.dart';

import 'package:vitafit/custom_widgets/dots.dart';

class TwoFormScreens extends StatefulWidget {
  @override
  _TwoFormScreensState createState() => _TwoFormScreensState();
}

class _TwoFormScreensState extends State<TwoFormScreens> {
  final PageController _pageController = PageController();
  final _formKey1 = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  XFile? _image;
  String _fullName = '';
  String _phoneNumber = '';
  String _email = '';
  String _password = '';
  bool _obscureText = true;
  String _price = '';
  String _availability = '';
  String? _fileName;
  String _description = '';

  String? _selectedLocation;
  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      var result = await FlutterImageCompress.compressAndGetFile(
        image.path,
        Directory.systemTemp.path + "/temp.jpg",
        minWidth: 80,
        minHeight: 80,
        quality: 88,
      );

      setState(() {
        _image = XFile(result!.path);
      });
    }
  }

  void _submitForm() {
    if (_image == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please upload a photo.')),
      );
      return;
    }
    void validateAndSaveForm1() {
      if (_formKey1.currentState!.validate()) {
        _formKey1.currentState!.save();

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Form 1 submitted successfully')),
        );
      } else {
        // Show an error message if form validation failed
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Form 1 validation failed')),
        );
      }
    }

    if (_formKey2.currentState!.validate()) {
      _formKey2.currentState!.save();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form 2 submitted successfully')),
      );
    } else {
      // Show an error message if form validation failed
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Form 2 validation failed')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create An Account'),
        centerTitle: true,
        leading: Icon(Icons.arrow_back_ios),
      ),
      body: PageView(
        controller: _pageController,
        children: <Widget>[
          Form(
            key: _formKey1,
            child: Padding(
              padding: const EdgeInsets.all(9.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: ListView(
                      children: <Widget>[
                        SizedBox(height: 35),
                        Center(
                          child: Container(
                            width: 80.0,
                            height: 80.0,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Color(0xFF35A072),
                                width: 2.0,
                              ),
                            ),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.camera_alt,
                                      color: Color(0xFF35A072), size: 60.0),
                                  onPressed: _pickImage,
                                ),
                                if (_image != null)
                                  ClipOval(
                                    child: Image.file(
                                      File(_image!.path),
                                      width: 80.0,
                                      height: 80.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                        const SizedBox(height: 20),
                        CustomTextFormField(
                          hintText: 'Full Name',
                          prefixIcon: Icons.person,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your full name.';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _fullName = value;
                            });
                          },
                          onSaved: (value) {
                            _fullName = value!;
                          },
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          hintText: 'Phone Number',
                          prefixIcon: Icons.phone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please enter your phone number.';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _phoneNumber = value;
                            });
                          },
                          onSaved: (value) {
                            _phoneNumber = value!;
                          },
                        ),
                        const SizedBox(height: 10),
                        CustomTextFormField(
                          hintText: 'Enter your email ',
                          prefixIcon: Icons.email,
                          errorBorderSize: 1.0,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            } else if (!value.contains('@')) {
                              return 'Please enter a valid email';
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
                        const SizedBox(height: 10),
                        //location
                        CustomDropdownButtonFormField(
                          hintText: 'Select your location',
                          prefixIcon: Icons.location_on,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please select your location.';
                            }
                            return null;
                          },
                          onChanged: (value) {
                            setState(() {
                              _selectedLocation = value;
                            });
                          },
                          onSaved: (value) {
                            _selectedLocation = value!;
                          },
                          items: ['Batna', 'Algiers', 'Oran'],
                        ),
                      ],
                    ),
                  ),
                  Dots(pageController: _pageController),
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
          ),
          Form(
            key: _formKey2,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.all(9.0),
                        child: Column(
                          children: [
                            CustomTextFormField(
                              hintText: 'Your program price',
                              prefixIcon: Icons.attach_money,
                              errorBorderSize: 1.0,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your program price.';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                _price = value;
                              },
                              onSaved: (value) {
                                _price = value!;
                              },
                            ),
                            SizedBox(height: 10),
                            CustomTextFormField(
                              hintText: 'Your availability',
                              prefixIcon: Icons.calendar_today,
                              errorBorderSize: 1.0,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your availability.';
                                }
                                return null;
                              },
                              onChanged: (value) {
                                _availability = value;
                              },
                              onSaved: (value) {
                                _availability = value!;
                              },
                            ),
                            SizedBox(height: 10),
                            Container(
                              height: 150,
                              width: 400,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Color(0xFFF8F8F8),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: CustomTextFormField(
                                hintText: 'Describe yourself',
                                prefixIcon: Icons.description,
                                errorBorderSize: 1.0,
                                maxLines: 6,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please describe yourself.';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  _description = value;
                                },
                                onSaved: (value) {
                                  _description = value!;
                                },
                              ),
                            ),
                            SizedBox(height: 10),
                            Container(
                              width: 400,
                              height: 200,
                              padding: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Color(0xFFF8F8F8),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    icon: Icon(Icons.upload_file,
                                        color: Colors.grey[400]),
                                    onPressed: () async {
                                      FilePickerResult? result =
                                          await FilePicker.platform.pickFiles();

                                      if (result != null) {
                                        PlatformFile file = result.files.first;

                                        if (file.extension == 'pdf') {
                                          setState(() {
                                            _fileName = file.name;
                                          });
                                        } else {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(
                                            SnackBar(
                                                content: Text(
                                                    'Invalid file type. Please select a PDF file.')),
                                          );
                                        }
                                      } else {
                                        ScaffoldMessenger.of(context)
                                            .showSnackBar(
                                          SnackBar(
                                              content: Text(
                                                  'No file selected. Please select a file.')),
                                        );
                                      }
                                    },
                                  ),
                                  Text('Upload your attestation',
                                      style: TextStyle(
                                          color: Colors.grey[400],
                                          fontSize: 16)),
                                  if (_fileName != null)
                                    Text(
                                      'Selected file: $_fileName',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Dots(pageController: _pageController),
                  Padding(
                    padding: EdgeInsets.only(bottom: 30.0),
                    child: CastomButtonWidget(
                      fontSize: 20,
                      title: "Sign Up",
                      backgroundColor: const Color(0xff35a072),
                      onPressed: () {
                        if (_formKey1.currentState != null &&
                                _formKey2.currentState != null &&
                                _formKey1.currentState!.validate() ||
                            _formKey2.currentState!.validate()) {
                          setState(() {
                            _formKey1.currentState!.save();
                            _formKey2.currentState!.save();
                            print('Full Name: $_fullName');
                            print('Phone Number: $_phoneNumber');
                            print('Email: $_email');
                            print('Password: $_password');
                            print('Location: $_selectedLocation');
                            print('Price: $_price');
                            print('Availability: $_availability');
                            print('Description: $_description');
                            print('File Name: $_fileName');
                            _submitForm();
                          });
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
