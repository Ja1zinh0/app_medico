import 'package:flutter/material.dart';

class TelaPrincipal extends StatefulWidget {
  const TelaPrincipal({super.key});

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
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu Lateral'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Teste'),
              onTap: () {
                // Faça algo ao pressionar o item "Teste"
              },
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Row(
  children: [
    InkWell(
      onTap: () {
         _scaffoldKey.currentState!.openDrawer();// Abre o menu lateral
      },
        child: Icon(
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
          onPressed: () {
          },
          icon: const Icon(
            Icons.settings,
            size: 55,
          ),
        ),

        SizedBox(height: 20,),
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
