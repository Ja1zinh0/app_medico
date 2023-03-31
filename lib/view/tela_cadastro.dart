import 'package:flutter/material.dart';
import 'funcoes.dart';

class TelaCadastrar extends StatefulWidget {
  const TelaCadastrar({super.key});

  @override
  State<TelaCadastrar> createState() => TelaCadastrarState();
}

class TelaCadastrarState extends State<TelaCadastrar> {
  var txtEmail = TextEditingController();
  var txtSenha = TextEditingController();
  var txtNome = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, 'telaLogin', arguments: null);
                  },
                  icon: const Icon(Icons.arrow_back_ios_new_outlined)),
            ],
          ),
          const SizedBox(
            height: 100,
          ),
          Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width - 50,
                child: const Text(
                  'Preencha os campos abaixo para criar sua conta',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              InserirTexto(
                controller: txtNome,
                context: context,
                labelText: 'Nome',
                labelIcon: Icons.person_2,
              ),
              const SizedBox(
                height: 10,
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
                height: 50,
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
                  onPressed: () {},
                  child: const Text(
                    'Cadastrar',
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
      ),
    );
  }
}
