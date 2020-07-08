import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class Api {
  final Firestore _banco = Firestore.instance;
  String conteudo;
  CollectionReference referencia;

  Api(this.conteudo) {
    referencia = _banco.collection(conteudo);
  }
  Future<DocumentSnapshot> buscarDadosUsuario(String id) {
    return referencia.document(id).get();
  }

  Future<QuerySnapshot> buscarDadosViagem() {
    return referencia.getDocuments();
  }

  Stream<QuerySnapshot> streamDataCollection() {
    return referencia.snapshots();
  }

  Future<void> removerDados(String id) {
    return referencia.document(id).delete();
  }

  Future<DocumentReference> adicionarColecao(Map data) async {
    return referencia.add(data);
  }

  Future<void> adicionarColecaoUser(Map data, String user) async {
    await referencia.document(user).setData(data);
  }

  Future<void> atualizarDocumento(Map dados, String id) {
    return referencia.document(id).updateData(dados);
  }
}
