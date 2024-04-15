import 'package:flutter/material.dart';

class CastomButtonWidget extends StatelessWidget {
  const CastomButtonWidget({
    Key? key,
    required this.title,
    required this.backgroundColor,
    this.textColor = Colors.white,
    required this.onPressed,
    this.fontSize,
  }) : super(key: key);

  final String title;
  final Color backgroundColor, textColor;
  final VoidCallback onPressed;
  final double? fontSize; // Make it nullable

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.symmetric(
          horizontal: 50,
        ),
        backgroundColor: backgroundColor,
      ),
      onPressed: onPressed,
      child: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize ??
              16, // Use fontSize if provided, otherwise use a default value (16)
        ),
      ),
    );
  }
}
