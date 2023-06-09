import 'package:app_prototipo/controller/login_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:app_prototipo/components/bottomBar.dart';
import '../components/customAppBar.dart';
import '../components/TextBox.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EditarPerfil extends StatefulWidget {
  const EditarPerfil({super.key});

  @override
  State<EditarPerfil> createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {
  var txtNome = TextEditingController();


  @override
  Widget build(BuildContext context) {
    User? id = FirebaseAuth.instance.currentUser;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(),
      drawer: buildDrawer(context),
      endDrawer: buildEndDrawer(context),
      bottomNavigationBar: CustomBottom(context),
      body: Column(
        children: [
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30.0, left: 6),
                child: Icon(
                  Icons.account_circle_outlined,
                  size: 100,
                  color: Color.fromARGB(255, 46, 46, 46),
                ),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 30.0, top: 5),
                    child: Text(
                      'Nome completo: ',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.only(left: 94.0, top: 5),
                    child: SizedBox(
                      width: 74,
                      height: 19,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF96E4F4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () {
                          
                        },
                        child: const Text(
                          'Editar',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 39, 39, 39),
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 70.0, top: 15),
                child: TextBox(
                  CustomController: txtNome,
                  context: context,
                  labelText: '',
                  labelIcon: Icons.person,
                ),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 30.0, top: 12),
                    child: Text(
                      'E-mail: ',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.only(left: 164.0, top: 12),
                    child: SizedBox(
                      width: 74,
                      height: 19,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF96E4F4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Editar',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 39, 39, 39),
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 70.0, top: 15),
                child: TextBox(
                  context: context,
                  labelText: '',
                  labelIcon: Icons.email_rounded,
                ),
              ),
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(left: 30.0, top: 12),
                    child: Text(
                      'Telefone: ',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 148.0, top: 12),
                    child: SizedBox(
                      width: 74,
                      height: 19,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF96E4F4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Editar',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color.fromARGB(255, 39, 39, 39),
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(right: 70.0, top: 15),
                child: TextBox(
                  context: context,
                  labelText: '',
                  labelIcon: Icons.phone_android,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, right: 200),
                child: SizedBox(
                  width: 180,
                  height: 35,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF96E4F4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Editar endereço',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 39, 39, 39),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 120),
                child: SizedBox(
                  width: 200,
                  height: 35,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF96E4F4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                    ),
                    onPressed: () {
                      atualizarUsuario(context, id, txtNome.text);
                      mensagem('Perfil salvo com sucesso');
                    },
                    child: const Text(
                      'Confirmar edição',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 39, 39, 39),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
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
            fontSize: 22,
          ),
        ),
        backgroundColor: const Color(0xFF96E4F4),
      ),
    );
  }

  Future atualizarUsuario(context, uid, nome) async {
    String docId = '';
    await FirebaseFirestore.instance
    .collection('usuarios')
    .where('uid', isEqualTo: LoginController().idUsuario())
    .get()
    .then((resultado) {
      docId = resultado.docs[0].id.toString();
    },);

    FirebaseFirestore.instance.
    collection('usuarios')
    .doc(docId)
    .update({'nome': nome,}
    );
  }
}
