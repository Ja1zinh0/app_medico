import 'package:flutter/material.dart';

// ignore: use_key_in_widget_constructors
class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF96E4F4),
      automaticallyImplyLeading: false,
      actions: [
        Column(
          children: [
            IconButton(
              icon: const Icon(
                Icons.menu,
                size: 40,
                color: Colors.black,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
            ),
            const SizedBox(height: 1),
          ],
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width - 90,
        ),
        Column(
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.settings,
                    size: 35,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    Scaffold.of(context).openEndDrawer();
                  },
                ),
                const SizedBox(width: 9),
              ],
            ),
            const SizedBox(height: 16),
          ],
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

Widget buildDrawer(BuildContext context) {
  return Drawer(
    backgroundColor: const Color.fromARGB(255, 226, 255, 254),
    child: ListView(
      children: [
        SizedBox(
          height: 60,
          child: DrawerHeader(
            padding: EdgeInsets.zero,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 2, color: Colors.black),
              ),
            ),
            child: Container(
              color: const Color.fromARGB(255, 226, 255, 254),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                          onTap: () {
                            Scaffold.of(context).openDrawer();
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
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        ListTile(
          title: criarTexto('Calendário de consultas'),
          onTap: () {
            Navigator.pushNamed(context, 'telaCalendario', arguments: null);
          },
          shape: const Border(
            bottom: BorderSide(width: 2, color: Colors.black),
          ),
        ),
        ListTile(
          title: criarTexto('Receitas'),
          onTap: () {
           Navigator.pushNamed(context, 'telaReceitas', arguments: null);
          },
          shape: const Border(
            bottom: BorderSide(width: 2, color: Colors.black),
          ),
        ),
        ListTile(
          title: criarTexto('Pesquisar instituição'),
          onTap: () {
            // Faça algo ao pressionar o item "Pesquisar instituição"
          },
          shape: const Border(
            bottom: BorderSide(width: 2, color: Colors.black),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 620.0),
          child: ListTile(
            title: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: Text('Usuário', style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ),),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, 'telaVerPerfil', arguments: null);
                      },
                      icon: const Icon(
                        Icons.account_circle_outlined,
                        size: 60,
                        color: Color.fromARGB(255, 53, 53, 53),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          ),
        )
      ],
    ),
  );
}

Widget buildEndDrawer(BuildContext context) {
  return Drawer(
    backgroundColor: const Color.fromARGB(255, 226, 255, 254),
    child: ListView(
      children: [
        SizedBox(
          height: 70,
          child: DrawerHeader(
            padding: EdgeInsets.zero,
            decoration: const BoxDecoration(
              border: Border(
                bottom: BorderSide(width: 2, color: Colors.black),
              ),
            ),
            child: Container(
              color: const Color.fromARGB(255, 226, 255, 254),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        const SizedBox(
                          width: 5,
                        ),
                        const Text(
                          'Configurações',
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                        Row(
                          children: const [
                            SizedBox(
                              width: 85,
                            ),
                            Icon(
                              Icons.settings,
                              size: 50,
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
          title: criarTexto('Conta e privacidade'),
          onTap: () {
            // Faça algo ao pressionar o item "Editar perfil"
          },
          shape: const Border(
            bottom: BorderSide(width: 2, color: Colors.black),
          ),
        ),
        ListTile(
          title: criarTexto('Idioma'),
          onTap: () {
            // Faça algo ao pressionar o item "Calendário de consultas"
          },
          shape: const Border(
            bottom: BorderSide(width: 2, color: Colors.black),
          ),
        ),
        ListTile(
          title: criarTexto('Segurança'),
          onTap: () {
            // Faça algo ao pressionar o item "Receitas"
          },
          shape: const Border(
            bottom: BorderSide(width: 2, color: Colors.black),
          ),
        ),
        ListTile(
          title: criarTexto('Acessibilidade'),
          onTap: () {
            // Faça algo ao pressionar o item "Pesquisar instituição"
          },
          shape: const Border(
            bottom: BorderSide(width: 2, color: Colors.black),
          ),
        ),
        ListTile(
          title: criarTexto('Sobre'),
          onTap: () {
            Navigator.pushNamed(context, 'telaSobre', arguments: null);
          },
          shape: const Border(
            bottom: BorderSide(width: 2, color: Colors.black),
          ),
        ),
        ListTile(
          title: criarTexto('Log out'),
          onTap: () {
            Navigator.pushNamed(context, 'telaLogin', arguments: null);
          },
          shape: const Border(
            bottom: BorderSide(width: 2, color: Colors.black),
          ),
        ),
      ],
    ),
  );
}

Widget criarTexto(String texto) {
  return Text(
    texto,
    style: const TextStyle(
      fontSize: 20,
      fontFamily: 'Arial',
      fontWeight: FontWeight.bold,
    ),
  );
}
