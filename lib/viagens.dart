import 'package:flutter/material.dart';
import 'package:suruber/testeCRUD.dart';
import 'api.dart';
import 'lista-viagens.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Viagens extends StatefulWidget {
  @override
  _ViagensState createState() => _ViagensState();
}

class _ViagensState extends State<Viagens> {
  List<ListaViagens> viagens;
  Api api = Api('Historico');
  @override
  Widget build(BuildContext context) {
    CRUDteste crudViagem = CRUDteste();
    crudViagem.api2 = api;
    //final dadosViagem = Provider.of<CRUDteste>(context);
    return Scaffold(
      body: Container(
        child: StreamBuilder(
          stream: crudViagem.buscarViagensAsStream(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              viagens = snapshot.data.documents
                  .map(
                    (doc) => ListaViagens.fromMap(doc.data, doc.documentID),
                  )
                  .toList();
              return ListView.builder(
                itemCount: viagens.length,
                itemBuilder: (buildContext, index) => Dismissible(
                  direction: DismissDirection.endToStart,
                  key: Key(index.toString()),
                  child: ListTile(
                    title: Text("Destino: " + viagens[index].localDestino),
                    subtitle: Text("Motorista: " +
                        viagens[index].nomeMotorista +
                        "\nValor: " +
                        viagens[index].precoPago),
                    onTap: () {},
                  ),
                  background: Container(
                    child: Text(
                      'Excluir     ',
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                    alignment: Alignment.centerRight,
                    color: Colors.red,
                  ),
                  onDismissed: (direction) {
                    crudViagem.removerViagem(viagens[index].id);
                  },
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.black,
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
