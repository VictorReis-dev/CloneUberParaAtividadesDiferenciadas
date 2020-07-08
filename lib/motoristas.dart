import 'package:flutter/material.dart';
import 'package:suruber/api.dart';
import 'package:suruber/lista-viagens.dart';
import 'package:suruber/testeCRUD.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'lista-motoristas.dart';

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
                    title: Text("Nome: " + motoristas[index].nomeMotorista),
                    subtitle: Text("Carro: " +
                        motoristas[index].modeloCarro +
                        "\nValor: " +
                        motoristas[index].precoPago),
                    onTap: () {
                      _localDestino(context, motoristas[index]);
                    },
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

  _localDestino(context, motorista) {
    Api api = Api('Historico');
    CRUDteste novaViagem = CRUDteste();
    novaViagem.api2 = api;
    TextEditingController txtDestino = TextEditingController();
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Container(
            width: 30,
            height: 100,
            child: Column(
              children: <Widget>[
                Text(
                  "Ponde tu qué i?",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  controller: txtDestino,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(
                'Cancelar',
                style: TextStyle(color: Colors.black),
              ),
            ),
            FlatButton(
              onPressed: () {
                ListaViagens tempViagem = ListaViagens(motorista.nomeMotorista,
                    motorista.precoPago, txtDestino.text);
                novaViagem.adicionarViagem(tempViagem);
                Navigator.of(context).pop();
              },
              child: Text(
                'Ok',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        );
      },
    );
  }
}
