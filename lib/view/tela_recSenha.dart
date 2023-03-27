// ignore_for_file: prefer_const_constructors

import 'package:app_prototipo/view/tela_login.dart';
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
            
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const TelaLogin(),
                      ),
                    );
                }, 
                icon: Icon(Icons.arrow_back_ios_new_outlined)
                ),
                SizedBox(
                  width: 370,
                ),
              ],
            ),

            SizedBox(
              height: 100,
            ),
            const SizedBox(
              child: Icon(
                Icons.lock_open, 
                size: 200,
              ),
            ),

            SizedBox(
              height: 20,
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
                  labelStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      ),
                  prefixIcon: const Icon(Icons.email_rounded),
                  enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.black,
                          ),
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
                child: Text('Enviar',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 39, 39, 39),
                ),
                ),
            ),
            ),
          ],
        ), 
      ],
    )
  );
}
}