import 'package:flutter/material.dart';

class Principal extends StatefulWidget {
  @override
  _PrincipalState createState() => _PrincipalState();
}

class _PrincipalState extends State<Principal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nova Viagem'),
        backgroundColor: Colors.black,
      ),
      body: Container(
        child: Image(
          image: AssetImage('assets/imagens/mapa.png'),
          fit: BoxFit.fill,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/motoristas');
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.add),
      ),
    );
  }
}

// StreamBuilder(
//                 stream: moto.buscarViagensAsStream(),
//                 builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
//                   if (snapshot.hasData) {
//                     motoristas = snapshot.data.documents
//                         .map((doc) => (doc) =>
//                             Motoristas.fromMap(doc.data, doc.documentID))
//                         .toList();
//                     return ListView.builder(
//                       itemCount: motoristas.length,
//                       itemBuilder: (buildContext, index) => Card(
//                         child: ListTile(
//                           title:
//                               Text("Nome: " + motoristas[index].localDestino),
//                           subtitle: Text("Carro: " +
//                               motoristas[index].nomeMotorista +
//                               "\nValor: " +
//                               motoristas[index].precoPago),
//                           onTap: () {},
//                         ),
//                       ),
//                     );
//                   } else {
//                     return Center(
//                       child: CircularProgressIndicator(
//                         backgroundColor: Colors.black,
//                       ),
//                     );
//                   }
//                 },
//               )
