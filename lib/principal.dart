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
      ),
      body: Container(
        child: ListView(
          reverse: false,
          scrollDirection: Axis.vertical,
          children: <Widget>[

            Container(
              child: Image(image: AssetImage('assets/imagens/mapa.png'), height: 300),
              width: 500,
            ),

            Card(
              child: ListTile(
                leading:
                    Icon(Icons.directions_car, color: Colors.blue, size: 40),
                title: Text('João Silva'),
                subtitle: Text('Gol'),
              ),
            ),

            Card(
              child: ListTile(
                leading:
                    Icon(Icons.directions_car, color: Colors.blue, size: 40),
                title: Text('Marta Borges'),
                subtitle: Text('Vectra'),
              ),
            ),

            Card(
              child: ListTile(
                leading:
                    Icon(Icons.directions_car, color: Colors.blue, size: 40),
                title: Text('Robson Souza'),
                subtitle: Text('C3'),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
