// ignore: file_names
import 'package:app_prototipo/view/tela_login.dart';
import 'package:flutter/material.dart';

import '../components/TextBox.dart';
import '../controller/login_controller.dart';

class RecuperarSenha extends StatefulWidget {
  const RecuperarSenha({super.key});

  @override
  State<RecuperarSenha> createState() => _RecuperarSenhaState();
}

class _RecuperarSenhaState extends State<RecuperarSenha> {
  var txtEmailEsqueceuSenha = TextEditingController();

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
                       Navigator.pushNamed(context, 'telaLogin');
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
            TextBox(
              CustomController: txtEmailEsqueceuSenha,
              context: context,
              labelText: 'Email',
              labelIcon: Icons.email_rounded,
            ),
            const SizedBox(
              height: 35,
            ),
            SizedBox(
              width: 180,
              height: 39,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF96E4F4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                onPressed: () {
                  LoginController().esqueceuSenha(
                        context,
                        txtEmailEsqueceuSenha.text,
                      );
                },
                child: const Text(
                  'Enviar',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(255, 39, 39, 39),
                    fontSize: 20,
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
