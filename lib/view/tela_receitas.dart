import 'package:flutter/material.dart';
import '../components/bottomBar.dart';
import '../components/customAppBar.dart';

class TelaReceitas extends StatefulWidget {
  const TelaReceitas({super.key});

  @override
  State<TelaReceitas> createState() => _TelaReceitasState();
}

class _TelaReceitasState extends State<TelaReceitas> {
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
          TextButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    height: 150,
                    child: AlertDialog(
                      title: const Text(
                        "Receitado dia - 17/04/2023",
                        style: TextStyle(color: Colors.black, fontSize: 22),
                      ),
                      content: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 180.0),
                            child: criarTexto('- remedio1'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 180.0),
                            child: criarTexto('- remedio1'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 180.0),
                            child: criarTexto('- remedio1'),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 180.0),
                            child: criarTexto('- remedio1'),
                          ),
                          criarTexto(
                              'Descrição do que deve ser feito com os medicamentos e tudo mais'),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Fechar",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(top: 10.0),
              child: Text(
                "01. Receita da consulta tal",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 25,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
