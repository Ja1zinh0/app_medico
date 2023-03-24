import 'package:app_prototipo/view/tela_recSenha.dart';
import 'package:flutter/material.dart';

class TelaLogin extends StatefulWidget {
  const TelaLogin({super.key});

  @override
  State<TelaLogin> createState() => _TelaLoginState();
}

class _TelaLoginState extends State<TelaLogin> {
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
                height: 230,

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

                    TextField(
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

              // ignore: prefer_const_constructors
              SizedBox(
                height: 10,

              ),
                TextField(
                      decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(2),
                      labelText: 'Senha',
                      labelStyle: const TextStyle(fontSize: 18),
                      prefixIcon: const Icon(Icons.key_sharp),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                ),

                // ignore: prefer_const_constructors
                SizedBox(
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
                          onPressed: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const RecuperarSenha(),
                              ),
                            );
                          },
                            child: 
                              const Text('Esqueceu a senha?',
                              style: TextStyle(
                                color: Colors.black,
                                decoration: TextDecoration.underline,
                              ),
                              )
                         ),
                      ]
                    ),
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
                    onPressed: (){
                
                    },
                    child: const Text('Entrar'),
                  ),
                ),

                ],
                )
              )
          ],
          ),
        ],
      )
    );
  }
}