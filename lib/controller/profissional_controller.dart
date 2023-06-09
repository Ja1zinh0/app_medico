
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/profissional.dart';
import 'login_controller.dart';

class ProfissionalController {
  void adicionar(context, Profissional t) {
    FirebaseFirestore.instance
        .collection('profissionais')
        .add(t.toJson())
        .then((value) => sucesso(context, 'Profissional adicionado com sucesso'))
        .catchError(
            (e) => erro(context, 'Não foi possível adicionar o profissional.'))
        .whenComplete(() => Navigator.pop(context));
  }
  void atualizar(context, id, Profissional t) {
    FirebaseFirestore.instance
        .collection('profissionais')
        .doc(id)
        .update(t.toJson())
        .then((value) => sucesso(context, 'Profissional atualizado com sucesso'))
        .catchError(
            (e) => erro(context, 'Não foi possível atualizar o profissional.'))
        .whenComplete(() => Navigator.pop(context));
  }
  void excluir(context, id) {
    FirebaseFirestore.instance
        .collection('profissionais')
        .doc(id)
        .delete()
        .then((value) => sucesso(context, 'Profissional excluído com sucesso'))
        .catchError((e) => erro(context, 'Não foi possível excluir o profissional.'));
  }
  listar() {
    return FirebaseFirestore.instance
        .collection('profissionais')
        .where('uid', isEqualTo: LoginController().idUsuario());
  }
}