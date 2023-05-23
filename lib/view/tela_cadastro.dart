import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/TextBox.dart';
import '../controller/login_controller.dart';

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
                height: 20,
              ),
              TextBox(
                CustomController: txtNome,
                context: context,
                labelText: 'Nome',
                labelIcon: Icons.person_2,
              ),
              const SizedBox(
                height: 20,
              ),
              TextBox(
                CustomController: txtEmail,
                context: context,
                labelText: 'Email',
                labelIcon: Icons.email_rounded,
              ),
              const SizedBox(
                height: 20,
              ),
              TextBox(
                CustomController: txtSenha,
                context: context,
                labelText: 'Senha',
                labelIcon: Icons.key,
                obscureTextEnabled: true,
              ),
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                width: 180,
                height: 40,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF96E4F4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () {
                    LoginController().criarConta(
                      context,
                      txtNome.text,
                      txtEmail.text,
                      txtSenha.text,
                    );
                  },
                  child: const Text(
                    'Cadastrar',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 39, 39, 39),
                      fontSize: 20,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 70,),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      
                    },
                    child: const FaIcon(
                      FontAwesomeIcons.google,
                      color: Colors.black,
                      size: 50.0,
                    ),
                  ),

                  SizedBox(width: 50,),

                  InkWell(
                    onTap: () {
                      
                    },
                    child: const FaIcon(
                      FontAwesomeIcons.facebook,
                      color: Colors.black,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
