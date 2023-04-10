import 'package:flutter/material.dart';

class EditarPerfil extends StatefulWidget {
  const EditarPerfil({super.key});

  @override
  State<EditarPerfil> createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {},
                child: const Icon(
                  Icons.menu,
                  size: 50,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width - 114,
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
                    height: 25,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
}
