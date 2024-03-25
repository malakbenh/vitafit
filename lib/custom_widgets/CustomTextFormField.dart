import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final FormFieldValidator<String> validator;
  final ValueChanged<String> onChanged;
  final FormFieldSetter<String> onSaved;
  final bool obscureText;
  final InputDecoration decoration;
  final double? errorBorderSize;

  CustomTextFormField({
    super.key,
    required this.hintText,
    required this.prefixIcon,
    required this.validator,
    required this.onChanged,
    required this.onSaved,
    this.obscureText = false,
    this.errorBorderSize,
  }) : decoration = InputDecoration(
          hintText: hintText,
          hintStyle: const TextStyle(color: Color.fromARGB(255, 201, 199, 199)),
          prefixIcon: Icon(prefixIcon, color: Colors.grey[400]),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFF8F8F8)),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 1.0),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFF8F8F8)),
            borderRadius: BorderRadius.circular(20),
          ),
          fillColor: const Color(0xFFF8F8F8),
          filled: true,
          errorStyle: const TextStyle(height: 0.5),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: const Color.fromARGB(255, 250, 57, 43),
              width: errorBorderSize ?? 1.0,
            ),
          ),
        );

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58,
      width: 361,
      child: TextFormField(
        decoration: decoration,
        validator: validator,
        onChanged: onChanged,
        onSaved: onSaved,
        obscureText: obscureText,
      ),
    );
  }
}