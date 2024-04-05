import 'package:flutter/material.dart';

class CustomDropdownButtonFormField extends StatelessWidget {
  final String hintText;
  final IconData prefixIcon;
  final FormFieldValidator<String> validator;
  final ValueChanged<String?> onChanged;
  final FormFieldSetter<String?> onSaved;
  final List<String> items;

  CustomDropdownButtonFormField({
    Key? key,
    required this.hintText,
    required this.prefixIcon,
    required this.validator,
    required this.onChanged,
    required this.onSaved,
    required this.items,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      decoration: InputDecoration(
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
            width: 1.0,
          ),
        ),
      ),
      items: items.map((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
      validator: validator,
      onChanged: onChanged,
      onSaved: onSaved,
    );
  }
}
