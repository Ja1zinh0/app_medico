// ignore: file_names
import 'package:app_prototipo/view/tela_login.dart';
import 'package:flutter/material.dart';

import 'funcoes.dart';

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
                    onPressed: () {
                      Navigator.pushNamed(context, 'telaLogin',
                          arguments: null);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_outlined)),
                const SizedBox(
                  width: 370,
                ),
              ],
            ),
            const SizedBox(
              height: 100,
            ),
            const SizedBox(
              child: Icon(
                Icons.lock_open,
                size: 200,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 25,
              child: const Text(
                'Informe seu endereço de email para receber um link de alteração de senha.',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            InserirTexto(
                context: context,
                labelText: 'Email',
                labelIcon: Icons.email_rounded,
              ),
            const SizedBox(
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
                onPressed: () {},
                child: const Text(
                  'Enviar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 39, 39, 39),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    ));
  }
}
