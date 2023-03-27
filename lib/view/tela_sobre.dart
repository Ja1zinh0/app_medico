import 'package:app_prototipo/view/tela_login.dart';
import 'package:flutter/material.dart';

class TelaSobre extends StatefulWidget {
  const TelaSobre({super.key});

  @override
  State<TelaSobre> createState() => _TelaSobreState();
}

class _TelaSobreState extends State<TelaSobre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Column(
            children: [
              Row(
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
                        icon: const Icon(Icons.arrow_back_ios_new_outlined)
                        ),
                  SizedBox(width: 370),
                ],
              ),

          Column(
            children: [
              const SizedBox(height: 100),
              SizedBox(
                  width: MediaQuery.of(context).size.width - 25,
                  child: const Text('O tema escolhido para este projeto foi um sistema de busca de especialistas em uma determinada região.',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              const SizedBox(height: 30),
              SizedBox(
                  width: MediaQuery.of(context).size.width - 25,
                  child: const Text('O objetivo desse aplicativo é ajudar o usuário na busca por especialistas da saúde, sejam eles veterinários, médicos ou odontologistas',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ), 
              SizedBox(height: 30),
              SizedBox(
                  width: MediaQuery.of(context).size.width - 25,
                  child: const Text('Desenvolvedores: ',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
            ],
          ),
            ],
          
          ),
        ],
      )
    );
  }
}