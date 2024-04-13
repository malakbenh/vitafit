import 'package:flutter/material.dart';

navigateTo({
  required BuildContext context,
  required Widget widget,
}) =>
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => widget,
      ),
    );



Widget myTextField({
  required BuildContext context,
  IconData? prefixIcon,
  required Function onTap,
  // required Function validator ,
  required String validateText,
  required Function onChanged,
  required TextEditingController controller,
  required String label,
  IconData? suffixIcon,
  Function? SuffixPressed,
  TextInputType? type,
  bool readonly = false,
  bool isPassword = false,
  double suffixSize = 15,
  double prefixSize = 15,
}) =>
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        child: TextFormField(

          onTap: () {
            onTap();
          },
          decoration: InputDecoration(
            label: Text(
              label,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(fontSize: 12),
            ),
            prefixIcon: Icon(
              prefixIcon,
              size: prefixSize,
            ),
            suffixIcon: IconButton(
              onPressed: () {
                SuffixPressed!();
              },
              icon: Icon(
                suffixIcon,
                size: suffixSize,
              ),
            ),

            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
              borderSide:BorderSide(color: Theme.of(context).primaryColor)  ,

            ),
          ),
          readOnly: readonly,
          validator: (value) {
            if (value!.isEmpty) {
              return (validateText);
            }
            return null;
          },
          obscureText: isPassword,
          onChanged: onChanged(),
          controller: controller,
          keyboardType: type,



        ),
      ),
    );
