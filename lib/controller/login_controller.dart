import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginController {
  criarConta(context, nome, email, senha) {
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
      email: email,
      password: senha,
    )
        .then(
      (resultado) {
        FirebaseFirestore.instance.collection('usuarios').add(
          {
            'uid': resultado.user!.uid,
            'nome': nome,
          },
        );

        sucesso(context, 'Usuário criado com sucesso.');
        Navigator.pushNamed(context, 'telaLogin');
      },
    ).catchError(
      (e) {
        switch (e.code) {
          case 'email-already-in-use':
            erro(context, 'O email já foi cadastrado.');
            break;
          case 'invalid-email':
            erro(context, 'O email informado é inválido.');
            break;
          default:
            erro(context, 'ERRO: ${e.code.toString()}');
        }
      },
    );
  }

  login(context, email, senha) {
    FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: senha)
        .then(
      (value) {
        sucesso(context, 'Usuário autenticado com sucesso.');
        Navigator.pushNamed(context, 'telaPrincipal');
      },
    ).catchError(
      (e) {
        switch (e.code) {
          case 'user-not-found':
            erro(context, 'Usuário não encontrado.');
            break;
          default:
            erro(context, 'ERRO: ${e.code.toString()}');
        }
      },
    );
  }

  esqueceuSenha(context, String email) {
    if (email.isNotEmpty) {
      FirebaseAuth.instance.sendPasswordResetEmail(email: email);
      sucesso(context, 'E-mail enviado com sucesso.');
    } else {
      erro(context, 'Não foi possível enviar o e-mail');
    }
    Navigator.pushNamed(context, 'telaLogin');
  }

  logout() {
    FirebaseAuth.instance.signOut();
  }

  idUsuario() {
    return FirebaseAuth.instance.currentUser!.uid;
  }

  Future<String> usuarioLogado() async {
    var usuario = '';
    await FirebaseFirestore.instance
        .collection('usuarios')
        .where('uid', isEqualTo: idUsuario())
        .get()
        .then(
      (resultado) {
        usuario = resultado.docs[0].data()['nome'] ?? '';
      },
    );
    return usuario;
  }
}

void erro(context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Color.fromARGB(255, 255, 53, 53).withOpacity(0.4),
      content: Text(
        msg,
        style: const TextStyle(color: Colors.black),
      ),
      duration: const Duration(seconds: 3),
    ),
  );
}

void sucesso(context, String msg) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Color.fromARGB(255, 12, 240, 23).withOpacity(0.4),
      content: Text(
        msg,
        style: const TextStyle(color: Colors.black),
      ),
      duration: const Duration(seconds: 3),
    ),
  );
}
