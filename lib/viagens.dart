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
    CRUDteste batata = CRUDteste();
    batata.api2 = api;
    //final dadosViagem = Provider.of<CRUDteste>(context);
    return Scaffold(
      body: Container(
        child: StreamBuilder(
          stream: batata.buscarViagensAsStream(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              viagens = snapshot.data.documents
                  .map((doc) => ListaViagens.fromMap(doc.data, doc.documentID))
                  .toList();
              return ListView.builder(
                itemCount: viagens.length,
                itemBuilder: (buildContext, index) => Card(
                  child: ListTile(
                    title: Text("Destino: " + viagens[index].localDestino),
                    subtitle: Text("Motorista: " +
                        viagens[index].nomeMotorista +
                        "\nValor: " +
                        viagens[index].precoPago),
                    onTap: () {},
                  ),
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
