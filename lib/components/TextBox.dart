import 'package:flutter/material.dart';

Widget TextBox({
  required BuildContext context,
  String labelText = '',
  IconData labelIcon = Icons.person,
  Color enabledBorderColor = Colors.black,
  controller = '',
}) {
  return SizedBox(
    width: MediaQuery.of(context).size.width - 100,
    child: TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(2),
        labelText: labelText,
        labelStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        prefixIcon: Icon(labelIcon, color: Colors.black),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            width: 2,
            color: enabledBorderColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0),
          borderSide: BorderSide(
            width: 2,
            color: enabledBorderColor,
          ),
        ),
      ),
    ),
  );
}
