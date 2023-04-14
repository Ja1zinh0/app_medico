import 'package:flutter/material.dart';

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