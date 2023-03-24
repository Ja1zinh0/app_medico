// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class RecuperarSenha extends StatefulWidget {
  const RecuperarSenha({super.key});

  @override
  State<RecuperarSenha> createState() => _RecuperarSenhaState();
}

class _RecuperarSenhaState extends State<RecuperarSenha> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Column(
          children: [
            const SizedBox(
              child: Icon(
                Icons.lock_open, 
                size: 200,
              ),
            ),

            SizedBox(
              height: 50,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 25,
              child: Text('Informe seu endereço de email para receber um link de alteração de senha.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 25,
              child: TextFormField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(2),
                  labelText: 'Email',
                  labelStyle: const TextStyle(fontSize: 18),
                  prefixIcon: const Icon(Icons.email_sharp),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
              ),
            ),

            SizedBox(
              height: 35,
            ),

            SizedBox(
              width: 200,
              height: 30,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 90, 194, 94),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),

                onPressed: (){
                },
                child: Text('Enviar')
            ),
            ),
          ],
        ), 
      ],
    )
  );
}
}