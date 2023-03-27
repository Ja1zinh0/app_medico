// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class ImportarFoto extends StatelessWidget {
  //Atributos
  final String foto;

  const ImportarFoto(this.foto, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: EdgeInsets.all(15),
      margin: EdgeInsets.fromLTRB(20, 20, 20, 10),
      padding: EdgeInsets.all(20),
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        border: Border.all(),
        borderRadius: BorderRadius.circular(12),
        color: Colors.blueGrey.shade50,
      ),
      child: Column(
        children: [
          Image.asset(
            foto,
            scale: 1.0,
          ),
        ],
      ),
    );
  }
}