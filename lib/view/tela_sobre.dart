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
                    onPressed: () {
                      Navigator.pushNamed(context, 'telaLogin',
                          arguments: null);
                    },
                    icon: const Icon(Icons.arrow_back_ios_new_outlined)),
                const SizedBox(width: 370),
              ],
            ),
            Column(
              children: [
                const SizedBox(height: 50),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 25,
                  child: const Text(
                    'O tema escolhido para este projeto foi um sistema de busca de especialistas em uma determinada região.',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 25,
                  child: const Text(
                    'O objetivo desse aplicativo é ajudar o usuário na busca por especialistas da saúde, sejam eles veterinários, médicos ou odontologistas',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 25,
                  child: const Text(
                    'Desenvolvedores: ',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Column(
                  children: [
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Image.asset(
                          'assets/images/joao.png',
                          scale: 5.5,
                        ),
                        const SizedBox(width: 10),
                        Image.asset(
                          'assets/images/camila.png',
                          scale: 6.8,
                        ),
                      ],
                    ),
                    Row(
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                        const SizedBox(
                          child: Text(
                            'João do pog',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 80,
                        ),
                        const SizedBox(
                          child: Text(
                            'Camila das cor',
                            style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    ));
  }
}
