import 'package:flutter/material.dart';
import 'funcoes.dart';
import 'tela_recSenha.dart';
import 'tela_sobre.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(
          children: [
            // ignore: prefer_const_constructors
            SizedBox(
              height: 100,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 100,
              child: Column(
                children: [
                  const SizedBox(
                    child: Icon(
                      Icons.account_circle,
                      size: 200,
                    ),
                  ),
                  InserirTexto(
                    controller: txtEmail,
                    context: context,
                    labelText: 'Email',
                    labelIcon: Icons.email_rounded,
                  ),
                  
                  const SizedBox(
                    height: 10,
                  ),

                  InserirTexto(
                    controller: txtSenha,
                    context: context,
                    labelText: 'Senha',
                    labelIcon: Icons.key,
                  ),

                  const SizedBox(
                    height: 5,
                  ),

                  Column(
                    children: [
                      const SizedBox(
                        width: 20,
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, 'telaRecSenha',
                                  arguments: null);
                            },
                            child: const Text(
                              'Esqueceu a senha?',
                              style: TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                      ]),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: 160,
                    height: 32,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 90, 194, 94),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                      ),
                      onPressed: () {
                        if (txtEmail.text.isEmpty && txtSenha.text.isEmpty) {
                          mensagem('Por favor preencha os campos para entrar.');
                        } else {}
                      },
                      child: const Text(
                        'Entrar',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color.fromARGB(255, 39, 39, 39),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 25),
                  Row(
                    children: [
                      const Text('Não possui uma conta? ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          )),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                            context,
                            'telaCadastro',
                            arguments: null,
                          );
                        },
                        child: const Text(
                          'Cadastre-se!',
                          style: TextStyle(
                            color: Colors.black,
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(
              height: 200,
            ),
            Row(
              children: [
                const SizedBox(
                  width: 320,
                ),
                Column(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'telaSobre',
                            arguments: null);
                      },
                      icon: const Icon(Icons.help_rounded),
                      iconSize: 50,
                      color: const Color.fromARGB(255, 90, 194, 94),
                    ),
                    const Text(
                      'Sobre',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 61, 61, 61),
                      ),
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
      ],
    ));
  }

  mensagem(msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 2),
        content: Text(
          msg,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Color.fromARGB(255, 39, 39, 39),
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 90, 194, 94),
      ),
    );
  }
}
