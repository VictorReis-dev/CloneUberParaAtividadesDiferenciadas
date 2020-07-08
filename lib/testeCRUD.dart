import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:suruber/usuarios.dart';
import 'detetive.dart';
import 'lista-viagens.dart';
import 'api.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

class CRUDteste extends ChangeNotifier {
  Api _api = detetive<Api>();

  Api api2;

  List<ListaViagens> viagens;

  Future<List<ListaViagens>> buscarViagens() async {
    var resultado = await api2.buscarDadosViagem();

    viagens = resultado.documents
        .map((doc) => ListaViagens.fromMap(doc.data, doc.documentID))
        .toList();
    return viagens;
  }

  Stream<QuerySnapshot> buscarViagensAsStream() {
    return api2.streamDataCollection();
  }

  Future removerViagem(String id) async {
    await api2.removerDados(id);
    return;
  }

  Future adicionarViagem(ListaViagens dados) async {
    var resultado = await api2.adicionarColecao(dados.toJson());
    return resultado;
  }

  //
  //controle de usuarios do banco
  List<Usuarios> usuario;

  Future removerUsuario(String id) async {
    await _api.removerDados(id);
    return;
  }

  Future adicionarUsuario(Usuarios novoUsuario) async {
    var resultado =
        await _api.adicionarColecaoUser(novoUsuario.toJson(), novoUsuario.id);
    return resultado;
  }

  Future<Usuarios> pesquisarUsuario(String id) async {
    var doc = await _api.buscarDadosUsuario(id);
    if (doc.data == null) {
      return null;
    }
    return Usuarios.fromMap(doc.data, doc.documentID);
  }
}
