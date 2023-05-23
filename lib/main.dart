// ignore_for_file: unused_import

import 'package:app_prototipo/view/tela_cadastro.dart';
import 'package:app_prototipo/view/tela_calendario.dart';
import 'package:app_prototipo/view/tela_recSenha.dart';
import 'package:app_prototipo/view/tela_receitas.dart';
import 'package:app_prototipo/view/tela_splash.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'firebase_options.dart';
import 'view/tela_login.dart';
import 'view/tela_sobre.dart';
import 'view/tela_principal.dart';
import 'view/editar_perfil.dart';
import 'view/tela_favoritos.dart';
import 'view/tela_verPerfil.dart';

Future<void> main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    DevicePreview(
      enabled: false,
      builder: (context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'App de consulta',
        initialRoute: 'splashScreen',
        routes: {
          'telaLogin': (context) => const TelaLogin(),
          'telaRecSenha': (context) => const RecuperarSenha(),
          'telaCadastro': (context) => const TelaCadastrar(),
          'telaSobre': (context) => const TelaSobre(),
          'telaPrincipal': (context) => const TelaPrincipal(),
          'editarPerfil': (context) => const EditarPerfil(),
          'telaFavoritos': (context) => const TelaFavoritos(),
          'telaVerPerfil': (context) => const VerPerfil(),
          'telaReceitas': (context) => const TelaReceitas(),
          'telaCalendario': (context) => const VerCalendario(),
          'splashScreen': (context) => const SplashScreen(),
        },
      ),
    ),
  );
}
