import 'package:flutter/material.dart';
import 'package:suruber/api.dart';
import 'package:suruber/testeCRUD.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'motoristas.dart';

class ListaMotorista extends StatefulWidget {
  @override
  _ListaMotoristaState createState() => _ListaMotoristaState();
}

class _ListaMotoristaState extends State<ListaMotorista> {
  List<Motoristas> motoristas;
  Api api = Api('Motoristas');
  @override
  Widget build(BuildContext context) {
    CRUDteste moto = CRUDteste();
    moto.api2 = api;
    return Scaffold(
      appBar: AppBar(
        title: Text('Motoristas'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: StreamBuilder(
          stream: moto.buscarViagensAsStream(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasData) {
              motoristas = snapshot.data.documents
                  .map((doc) => Motoristas.fromMap(doc.data, doc.documentID))
                  .toList();
              return ListView.builder(
                itemCount: motoristas.length,
                itemBuilder: (buildContext, index) => Card(
                  child: ListTile(
                    title: Text("Nome: " + motoristas[index].localDestino),
                    subtitle: Text("Carro: " +
                        motoristas[index].nomeMotorista +
                        "\nValor: " +
                        motoristas[index].precoPago),
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
