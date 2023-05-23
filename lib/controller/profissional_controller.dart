
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../model/profissional.dart';
import 'login_controller.dart';

class ProfissionalController {
  //
  // ADICIONAR uma nova Profissional
  //
  void adicionar(context, Profissional t) {
    FirebaseFirestore.instance
        .collection('clientes')
        .add(t.toJson())
        .then((value) => sucesso(context, 'Cliente adicionado com sucesso'))
        .catchError(
            (e) => erro(context, 'Não foi possível adicionar o cliente.'))
        .whenComplete(() => Navigator.pop(context));
  }

  //
  // ATUALIZAR
  //
  void atualizar(context, id, Profissional t) {
    FirebaseFirestore.instance
        .collection('clientes')
        .doc(id)
        .update(t.toJson())
        .then((value) => sucesso(context, 'Cliente atualizado com sucesso'))
        .catchError(
            (e) => erro(context, 'Não foi possível atualizar o cliente.'))
        .whenComplete(() => Navigator.pop(context));
  }

  //
  // EXCLUIR
  //
  void excluir(context, id) {
    FirebaseFirestore.instance
        .collection('clientes')
        .doc(id)
        .delete()
        .then((value) => sucesso(context, 'Cliente excluído com sucesso'))
        .catchError((e) => erro(context, 'Não foi possível excluir o cliente.'));
  }

  //
  // LISTAR todas as clientes da coleção
  //
  listar() {
    return FirebaseFirestore.instance
        .collection('clientes')
        .where('uid', isEqualTo: LoginController().idUsuario());
  }
  
}