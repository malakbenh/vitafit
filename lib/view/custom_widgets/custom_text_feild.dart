import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  const CustomTextField({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  final String hintText;
  final Icon prefixIcon;
  final Icon? suffixIcon;

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscureText: widget.hintText.toLowerCase().contains('password')
          ? !_isPasswordVisible
          : false,
      decoration: InputDecoration(
        fillColor: Colors.grey[200],
        filled: true,
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.hintText.toLowerCase().contains('password')
            ? IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              )
            : widget.suffixIcon,
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.grey),
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
