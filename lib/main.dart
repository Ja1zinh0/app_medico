// ignore_for_file: unused_import

import 'package:app_prototipo/view/tela_cadastro.dart';
import 'package:app_prototipo/view/tela_recSenha.dart';
import 'package:flutter/material.dart';
import 'view/tela_login.dart';
import 'view/tela_sobre.dart';
import 'view/tela_principal.dart';

void main() {
  runApp(
    // ignore: prefer_const_constructors
    MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App de consulta',
        initialRoute: 'telaLogin',
        routes: {
          'telaLogin': (context) => const TelaLogin(),
          'telaRecSenha': (context) => const RecuperarSenha(),
          'telaCadastro': (context) => const TelaCadastrar(),
          'telaSobre': (context) => const TelaSobre(),
          'telaPrincipal': (context) => const TelaPrincipal(),
        }),
  );
}
