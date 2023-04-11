import 'package:flutter/material.dart';
import 'tela_principal.dart';

Widget InserirTexto({
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
        prefixIcon: Icon(labelIcon),
        enabledBorder: OutlineInputBorder(
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

Widget criarTexto(String texto){
  return Text(
    texto,
    style: const TextStyle(
      fontSize: 20,
      fontFamily: 'Arial',
      fontWeight: FontWeight.bold,
    ),
  );
}
