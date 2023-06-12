import '../components/bottomBar.dart';
import '../controller/profissional_controller.dart';
import '../model/profissional.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../controller/login_controller.dart';

class TelaFavoritos extends StatefulWidget {
  const TelaFavoritos({super.key});

  @override
  State<TelaFavoritos> createState() => _TelaFavoritosState();
}

class _TelaFavoritosState extends State<TelaFavoritos> {
  List<Profissional> lista = [];

  // ignore: prefer_typing_uninitialized_variables
  var index;

  var txtNome = TextEditingController();
  var txtEspecializacao = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xFF96E4F4),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Favoritos',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 5, top: 3),
              child: Icon(
                Icons.star,
                color: Colors.black,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 200, top: 3),
              child: IconButton(
                onPressed: () {
                  salvarTarefa(context);
                },
                icon: const Icon(Icons.add),
                color: Colors.black,
                iconSize: 30,
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: listarContatos(),
          ),
        ],
      ),
      bottomNavigationBar: CustomBottom(context),
    );
  }

listarContatos() {
  return StreamBuilder<QuerySnapshot>(
    stream: ProfissionalController().listar().snapshots(),
    builder: (context, snapshot) {
      switch (snapshot.connectionState) {
        case ConnectionState.none:
          return const Center();
        case ConnectionState.waiting:
          return const Center(
            child: CircularProgressIndicator(),
          );
        default:
          final dados = snapshot.data!.docs;
          List<QueryDocumentSnapshot> sortedDados = List.from(dados);
          sortedDados.sort((a, b) => (a.get('nome') as String).compareTo(b.get('nome') as String));
          if (sortedDados.length > 0) {
            return ListView.builder(
              itemCount: sortedDados.length,
              itemBuilder: (context, index) {
                String id = sortedDados[index].id;
                Map<String, dynamic> item = sortedDados[index].data() as Map<String, dynamic>;
                return Card(
                  child: ListTile(
                    leading: const Icon(
                      Icons.account_circle_outlined,
                      size: 40,
                      color: Color.fromARGB(255, 90, 90, 90),
                    ),
                    title: Text(item['nome'] as String),
                    subtitle: Text(item['espec'] as String),
                    trailing: IconButton(
                      onPressed: () {
                        ProfissionalController().excluir(context, id);
                      },
                      icon: const Stack(
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                          ),
                          Icon(
                            Icons.star_border,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                    onTap: () {
                      txtNome.text = item['nome'] as String;
                      txtEspecializacao.text = item['espec'] as String;
                      salvarTarefa(context, docId: id);
                    },
                  ),
                );
              },
            );
          } else {
            return const Center(
              child: Text('Nenhuma tarefa encontrada.'),
            );
          }
      }
    },
  );
}


  void salvarTarefa(context, {docId}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text(
            "Adicionar favoritos",
            textAlign: TextAlign.center,
          ),
          content: SizedBox(
            height: 250,
            width: 300,
            child: Column(
              children: [
                TextField(
                  controller: txtNome,
                  decoration: InputDecoration(
                    labelText: 'Nome',
                    prefixIcon: const Icon(Icons.person_2_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: txtEspecializacao,
                  decoration: InputDecoration(
                    labelText: 'Especialização',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(40.0),
                    ),
                  ),
                ),
              ],
            ),
          ),
          actionsPadding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          actions: [
            TextButton(
              child: const Text(
                "fechar",
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                txtNome.clear();
                txtEspecializacao.clear();
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              child: const Text(
                "salvar",
                style: TextStyle(color: Colors.black),
              ),
              onPressed: () {
                var t = Profissional(
                  LoginController().idUsuario(),
                  txtNome.text,
                  txtEspecializacao.text,
                );
                txtNome.clear();
                txtEspecializacao.clear();
                if (docId == null) {
                  ProfissionalController().adicionar(context, t);
                } else {
                  ProfissionalController().atualizar(context, docId, t);
                }
              },
            ),
          ],
        );
      },
    );
  }
}
