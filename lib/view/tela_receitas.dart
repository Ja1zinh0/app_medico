import 'package:app_prototipo/model/receitas.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../components/bottomBar.dart';
import '../components/customAppBar.dart';
import '../controller/login_controller.dart';
import '../controller/receitas_controller.dart';

class TelaReceitas extends StatefulWidget {
  const TelaReceitas({super.key});

  @override
  State<TelaReceitas> createState() => _TelaReceitasState();
}

class _TelaReceitasState extends State<TelaReceitas> {
  var txtDescricao = TextEditingController();
  var txtNomeReceitas = TextEditingController();
  String formattedDate = '';
  bool orderByDate = false;

  @override
  void initState() {
    super.initState();
    DateTime now = DateTime.now();
    formattedDate = DateFormat('dd-MM-yyyy').format(now);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: MyAppBar(),
      drawer: buildDrawer(context),
      endDrawer: buildEndDrawer(context),
      bottomNavigationBar: CustomBottom(context),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              IconButton(
                    onPressed: () {
                      setState(() {
                        orderByDate = !orderByDate;
                      });
                    },
                    icon: Icon(
                      orderByDate ? Icons.arrow_downward : Icons.arrow_upward,
                    ),
                  ),
            ],
          ),
          Expanded(
            child: listarContatos(),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FloatingActionButton(
                onPressed: () {
                  salvarTarefa(context);
                },
                child: Icon(Icons.add),
                backgroundColor: const Color.fromARGB(255, 51, 51, 51),
              ),
              SizedBox(
                width: 16,
              ),
            ],
          ),
        ],
      ),
    );
  }

  listarContatos() {
    Query query = ReceitasController().listar();

    if (orderByDate) {
      query = query.orderBy('data');
    }

    return StreamBuilder<QuerySnapshot>(
      stream: query.snapshots(),
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
                  return TextButton(
                    onPressed: () {
                      txtNomeReceitas.text = item['nomeReceita'];
                      txtDescricao.text = item['descricao'];
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  const Text(
                                    'Deletar',
                                    style: TextStyle(fontSize: 40),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.only(bottom: 20.0),
                                    child: IconButton(
                                      onPressed: () {
                                        ReceitasController()
                                            .excluir(context, id);
                                        Navigator.pop(context);
                                      },
                                      icon: const Icon(
                                        Icons.medical_services,
                                        size: 50,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: [],
                          );
                        },
                      );
                    },
                    child: ListTile(
                      leading: const Icon(
                        Icons.sick,
                        size: 42,
                        color: Colors.black,
                      ),
                      title: Text(
                        item['nomeReceita'],
                      ),
                      subtitle: Text(item['data']),
                    ),
                  );
                },
              );
            } else {
              return const Center(
                child: Text('Nenhuma receita registrada.'),
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
          title: const Text("Adicionar favoritos"),
          content: SizedBox(
            height: 500,
            width: 300,
            child: Column(
              children: [
                TextField(
                  controller: txtNomeReceitas,
                  decoration: const InputDecoration(
                    labelText: 'Nome da receita',
                    prefixIcon: Icon(Icons.description),
                    border: OutlineInputBorder(),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  controller: txtDescricao,
                  maxLines: 10,
                  decoration: const InputDecoration(
                    labelText: 'Descrição da receita',
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
              child: const Text(
                "fechar",
                style: TextStyle(
                  color: Color.fromARGB(255, 51, 51, 51),
                ),
              ),
              onPressed: () {
                txtNomeReceitas.clear();
                txtDescricao.clear();
                Navigator.of(context).pop();
              },
            ),
            ElevatedButton(
              child: const Text("adicionar"),
              onPressed: () {
                var t = Receitas(LoginController().idUsuario(),
                    txtNomeReceitas.text, txtDescricao.text, formattedDate);
                txtNomeReceitas.clear();
                txtDescricao.clear();
                if (docId == null) {
                  //
                  // ADICIONAR TAREFA
                  //
                  ReceitasController().adicionar(context, t);
                } else {
                  //
                  // ATUALIZAR TAREFA
                  //
                  ReceitasController().atualizar(context, docId, t);
                }
              },
            ),
          ],
        );
      },
    );
  }
}
