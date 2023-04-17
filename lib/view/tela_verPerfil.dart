// ignore: file_names
import 'package:flutter/material.dart';
import '../components/bottomBar.dart';
import '../components/customAppBar.dart';

class VerPerfil extends StatefulWidget {
  const VerPerfil({super.key});

  @override
  State<VerPerfil> createState() => _VerPerfilState();
}

class _VerPerfilState extends State<VerPerfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(),
      drawer: buildDrawer(context),
      endDrawer: buildEndDrawer(context),
      bottomNavigationBar: CustomBottom(context),
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 35.0, left: 45),
                child: Icon(
                  Icons.account_circle_outlined,
                  size: 250,
                  color: Color.fromARGB(255, 77, 77, 77),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 130.0),
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add_a_photo,
                    size: 40,
                    color: Color.fromARGB(255, 77, 77, 77),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 38,
            width: 220,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF96E4F4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () {
                 Navigator.pushNamed(context, 'editarPerfil', arguments: null);
              },
              child: const Text(
                'Editar Perfil',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 39, 39, 39),
                  fontSize: 22,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),

          SizedBox(
            height: 38,
            width: 220,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF96E4F4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Mudar senha',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 39, 39, 39),
                  fontSize: 22,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          SizedBox(
            height: 38,
            width: 220,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF96E4F4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () {},
              child: const Text(
                'Avaliações feitas',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 39, 39, 39),
                  fontSize: 22,
                ),
              ),
            ),
          ),

          const SizedBox(
            height: 25,
          ),
          SizedBox(
            height: 38,
            width: 220,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF96E4F4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
              ),
              onPressed: () {
                Navigator.pushNamed(context, 'telaFavoritos', arguments: null);
              },
              child: const Text(
                'Favoritos',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 39, 39, 39),
                  fontSize: 22,
                ),
              ),
            ),
          ),

        ],
      ),
    );
  }
}
