import 'package:flutter/material.dart';
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

                    TextField(
                      controller: txtEmail,
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(2),
                        labelText: 'Email',
                        labelStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold
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

              // ignore: prefer_const_constructors
              SizedBox(
                height: 10,

              ),
                TextField(
                  controller: txtSenha,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(2),
                    labelText: 'Senha',
                    labelStyle: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      ),
                    prefixIcon: const Icon(Icons.key_sharp),
                    enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0),
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.black,
                          ),
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
                                fontWeight: FontWeight.bold,
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
                      if(txtEmail.text.isEmpty && txtSenha.text.isEmpty){
                        mensagem('Por favor preencha os campos para entrar.');
                      }else{

                      }
                      
                    },
                    child: const Text('Entrar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 39, 39, 39),
                    ),
                    ),
                  ),
                ),

                ],
                ),
              ),

          const SizedBox(
            height: 310,
          ),
          Row(
            children: [
            const SizedBox(
              width: 320,
            ),
              Column(
                children: [
                  IconButton(
                    onPressed: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const TelaSobre(),
                        ),
                      );
                    }, 
                  icon: const Icon(Icons.help_rounded),
                  iconSize: 50,
                  color: const Color.fromARGB(255, 90, 194, 94),
                  ),
                  const Text('Sobre',
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
      )
    );
  }
mensagem(msg){
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
