import '../model/profissional.dart';
import 'package:flutter/material.dart';

class TelaFavoritos extends StatefulWidget {
  const TelaFavoritos({super.key});

  @override
  State<TelaFavoritos> createState() => _TelaFavoritosState();
}

class _TelaFavoritosState extends State<TelaFavoritos> {
  List<Profissional> lista = [];

  var index;

  var txtNome = TextEditingController();
  var txtEspecializacao = TextEditingController();

  @override
  void initState() {
    lista.add(Profissional('João', 'especialista em corgis'));
    index = -1;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('Favoritos')),
      body: Column(children: [Expanded(child: listarContatos())]),
    );
  }

  listarContatos() {
    return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Card(
                color: Colors.white,
                elevation: 0,
                child: ListTile(
                    leading: Container(
                        padding: const EdgeInsets.only(bottom: 20, left: 10),
                        child: const Icon(
                          Icons.account_circle_outlined,
                          size: 80,
                          color: Color.fromARGB(255, 90, 90, 90),
                        )),
                    title: Container(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          lista[index].nome,
                          style: const TextStyle(
                              fontSize: 23),
                        )
                      ),
                    subtitle: Text(
                      lista[index].especializacao,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    //Remover
                    trailing: Container(
                      padding: const EdgeInsets.only(right: 40, top: 16),
                      child: IconButton(
                        icon: const Icon(
                          Icons.delete_outline_rounded,
                          color: Colors.black,
                        ),
                        onPressed: () {
                          setState() {
                            lista.removeAt(index);
                          }
                        },
                      ),
                    )),
              ),
            ],
          );
        });
  }
}
