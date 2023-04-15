import '../components/bottomBar.dart';
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
    lista.add(Profissional('Especialista1', 'especialidade1'));
    lista.add(Profissional('Especialista2', 'especialidade2'));
    lista.add(Profissional('Especialista3', 'especialidade3'));
    lista.add(Profissional('Especialista4', 'especialidade4'));
    lista.add(Profissional('Especialista5', 'especialidade5'));
    lista.add(Profissional('Especialista6', 'especialidade6'));
    lista.add(Profissional('Especialista7', 'especialidade7'));
    lista.add(Profissional('Especialista8', 'especialidade8'));
    lista.add(Profissional('Especialista9', 'especialidade9'));
    lista.add(Profissional('Especialista10', 'especialidade10'));

    index = -1;
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
          children: const [
            Text(
              'Favoritos',
              style: TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
            
            Padding(
              
              padding: EdgeInsets.only(left: 5, top: 3),
              child: Icon(
                
                Icons.star,
                color: Colors.black,
              ),
            ),
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
    return ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return Column(
            children: [
              InkWell(
                onTap: () {},
                child: Card(
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
                            fontSize: 23,
                          ),
                        )),
                    subtitle: Text(
                      ' • ${lista[index].especializacao}',
                      style: const TextStyle(
                        fontSize: 15,
                        color: Colors.black,
                      ),
                    ),
                    //Remover
                    trailing: Padding(
                      padding: const EdgeInsets.only(
                        top: 14.0,
                        right: 25,
                      ),
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            lista.removeAt(index);
                          });
                        },
                        icon: const Icon(
                          Icons.star,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        });
  }
}
