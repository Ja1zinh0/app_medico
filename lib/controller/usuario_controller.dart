
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../model/usuarios.dart';
import 'login_controller.dart';

class UsuariosController {
  void adicionar(context, Usuarios t) {
    FirebaseFirestore.instance
        .collection('usuarios')
        .add(t.toJson())
        .then((value) => sucesso(context, 'usuario adicionado com sucesso'))
        .catchError(
            (e) => erro(context, 'Não foi possível adicionar o usuario.'))
        .whenComplete(() => Navigator.pop(context));
  }
  void atualizar(context, id, Usuarios t) {
    FirebaseFirestore.instance
        .collection('usuarios')
        .doc(id)
        .update(t.toJson())
        .then((value) => sucesso(context, 'usuario atualizado com sucesso'))
        .catchError(
            (e) => erro(context, 'Não foi possível atualizar o usuario.'))
        .whenComplete(() => Navigator.pop(context));
  }
  void excluir(context, id) {
    FirebaseFirestore.instance
        .collection('usuarios')
        .doc(id)
        .delete()
        .then((value) => sucesso(context, 'usuario excluído com sucesso'))
        .catchError((e) => erro(context, 'Não foi possível excluir o usuario.'));
  }
  listar() {
    return FirebaseFirestore.instance
        .collection('usuarios')
        .where('uid', isEqualTo: LoginController().idUsuario());
  }
  
}