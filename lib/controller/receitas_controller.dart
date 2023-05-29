
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/receitas.dart';
import 'login_controller.dart';

class ReceitasController {
  //
  // ADICIONAR uma nova Receitas
  //
  void adicionar(context, Receitas t) {
    FirebaseFirestore.instance
        .collection('receitas')
        .add(t.toJson())
        .then((value) => sucesso(context, 'Receita adicionada com sucesso'))
        .catchError(
            (e) => erro(context, 'Não foi possível adicionar a receita.'))
        .whenComplete(() => Navigator.pop(context));
  }

  //
  // ATUALIZAR
  //
  void atualizar(context, id, Receitas t) {
    FirebaseFirestore.instance
        .collection('receitas')
        .doc(id)
        .update(t.toJson())
        .then((value) => sucesso(context, 'Receita atualizada com sucesso'))
        .catchError(
            (e) => erro(context, 'Não foi possível atualizar a receita.'))
        .whenComplete(() => Navigator.pop(context));
  }

  //
  // EXCLUIR
  //
  void excluir(context, id) {
    FirebaseFirestore.instance
        .collection('receitas')
        .doc(id)
        .delete()
        .then((value) => sucesso(context, 'Receita excluída com sucesso'))
        .catchError((e) => erro(context, 'Não foi possível excluir a receita.'));
  }

  //
  // LISTAR todas as receitas da coleção
  //
  listar() {
    return FirebaseFirestore.instance
        .collection('receitas')
        .where('uid', isEqualTo: LoginController().idUsuario());
  }
  
}