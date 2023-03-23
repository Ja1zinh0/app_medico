
import 'package:flutter/material.dart';
import 'view/tela_login.dart';

void main() {
  runApp(
    // ignore: prefer_const_constructors
    MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contatos',
      home: const TelaLogin(),
    ),
  );
}
