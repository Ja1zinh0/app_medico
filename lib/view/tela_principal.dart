import 'package:flutter/material.dart';
import 'funcoes.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({Key? key}) : super(key: key);

  @override
  State<TelaPrincipal> createState() => _TelaPrincipalState();
}

class _TelaPrincipalState extends State<TelaPrincipal> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Drawer(
        child: Container(
          color: const Color.fromARGB(255, 236, 252, 237),
          child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              SizedBox(
                height: 85,
                child: DrawerHeader(
                  decoration: const BoxDecoration(
                    border: Border(bottom: BorderSide(width: 0)),
                  ),
                  padding: EdgeInsets.zero,
                  child: Container(
                    color: const Color.fromARGB(255, 236, 252, 237),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              InkWell(
                                onTap: () {
                                  _scaffoldKey.currentState!.openDrawer();
                                },
                                child: const Icon(
                                  Icons.menu,
                                  size: 50,
                                ),
                              ),
                              const SizedBox(width: 15),
                              const Text(
                                'Índice',
                                style: TextStyle(
                                  fontSize: 25,
                                ),
                              ),
                              Row(
                                children: [
                                  SizedBox(
                                    width: 100,
                                  ),
                                  Icon(
                                    Icons.account_circle_outlined,
                                    size: 60,
                                  )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              ListTile(
                title: criarTexto('Editar perfil'),
                onTap: () {
                   Navigator.pushNamed(context, 'editarPerfil', arguments: null);
                },
              ),
              const Divider(
                thickness: 1,
                color: Colors.black,
              ),
              ListTile(
                title: criarTexto('Calendário de consultas'),
                onTap: () {
                  // Faça algo ao pressionar o item "Teste"
                },
              ),
              const Divider(
                thickness: 1,
                color: Colors.black,
              ),
              ListTile(
                title: criarTexto('Receitas'),
                onTap: () {
                  // Faça algo ao pressionar o item "Teste"
                },
              ),
              const Divider(
                thickness: 1,
                color: Colors.black,
              ),
              ListTile(
                title: criarTexto('Pesquisar instituição'),
                onTap: () {
                  // Faça algo ao pressionar o item "Teste"
                },
              ),
              const Divider(
                thickness: 1,
                color: Colors.black,
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  _scaffoldKey.currentState!.openDrawer();
                },
                child: const Icon(
                  Icons.menu,
                  size: 55,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 117,
              ),
              Column(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.settings,
                      size: 55,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 50,
          ),
          Container(
            width: MediaQuery.of(context).size.width - 60,
            height: MediaQuery.of(context).size.height - 160,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 179, 179, 179),
              border: Border.all(
                color: Colors.white,
                width: 2,
              ),
            ),
            child: const Text(
              'Caixa representando futura API do google maps',
              style: TextStyle(
                fontSize: 50,
              ),
            ),
          )
        ],
      ),
    );
  }
}
