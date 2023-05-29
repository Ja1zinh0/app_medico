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
            return const Center(
              child: Text('Não foi possível conectar.'),
            );
          case ConnectionState.waiting:
            return const Center(
              child: CircularProgressIndicator(),
            );
          default:
            final dados = snapshot.requireData;
            if (dados.size > 0) {
              return ListView.builder(
                itemCount: dados.size,
                itemBuilder: (context, index) {
                  String id = dados.docs[index].id;
                  dynamic item = dados.docs[index].data();
                  return Card(
                    child: ListTile(
                      leading: const Icon(
                        Icons.account_circle_outlined,
                        size: 40,
                        color: Color.fromARGB(255, 90, 90, 90),
                      ),
                      title: Text(item['nome']),
                      subtitle: Text(item['espec']),
                      onTap: () {
                        txtNome.text = item['nome'];
                        txtEspecializacao.text = item['espec'];
                        salvarTarefa(context, docId: id);
                      },
                      onLongPress: () {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: SizedBox(
                                  width: 15,
                                  height: 50,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [
                                      const Text('Deletar', style: TextStyle(fontSize: 40),),
                                      Padding(
                                        padding: const EdgeInsets.only(bottom: 20.0),
                                        child: IconButton(
                                          onPressed: () {
                                            ProfissionalController().excluir(context, id);
                                             Navigator.pop(context);
                                          },
                                          icon: const Icon(Icons.delete, size: 50,),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                actions: [],
                              );
                            });
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
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: const Text("Adicionar favoritos", textAlign: TextAlign.center,),
          content: SizedBox(
            height: 250,
            width: 300,
            child: Column(
              children: [
                TextField(
                  controller: txtNome,
                  decoration: const InputDecoration(
                    labelText: 'Nome',
                    prefixIcon: Icon(Icons.person_2_outlined),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: txtEspecializacao,
                  maxLines: 5,
                  decoration: const InputDecoration(
                    labelText: 'Especialização',
                    alignLabelWithHint: true,
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actionsPadding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          actions: [
            TextButton(
              child: const Text("fechar"),
              onPressed: () {
                txtNome.clear();
                txtEspecializacao.clear();
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text("salvar"),
              onPressed: () {
                var t = Profissional(
                  LoginController().idUsuario(),
                  txtNome.text,
                  txtEspecializacao.text,
                );
                txtNome.clear();
                txtEspecializacao.clear();
                if (docId == null) {
                  //
                  // ADICIONAR TAREFA
                  //
                  ProfissionalController().adicionar(context, t);
                } else {
                  //
                  // ATUALIZAR TAREFA
                  //
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
