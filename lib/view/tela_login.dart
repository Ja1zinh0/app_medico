import 'package:flutter/material.dart';
import '../components/TextBox.dart';

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
        backgroundColor: Colors.white,
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                // ignore: prefer_const_constructors
                SizedBox(
                  height: 70,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  child: Column(
                    children: [
                      Image.asset(
                        'assets/images/logo.png',
                        scale: 5.5,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextBox(
                        controller: txtEmail,
                        context: context,
                        labelText: 'Email',
                        labelIcon: Icons.email_rounded,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextBox(
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
                          Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {
                                      Navigator.pushNamed(
                                          context, 'telaRecSenha',
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
                            Navigator.pushNamed(
                              context,
                              'telaPrincipal',
                              arguments: null,
                            );
                          },
                          child: const Text(
                            'Entrar',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 39, 39, 39),
                              fontSize: 20,
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
                  children: const [
                    SizedBox(
                      width: 320,
                    ),
                  ],
                )
              ],
            ),
          ],
        ));
  }
}
