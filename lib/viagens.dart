import 'package:flutter/material.dart';

class Viagens extends StatefulWidget {
  @override
  _ViagensState createState() => _ViagensState();
}

class _ViagensState extends State<Viagens> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Histórico',
          style: TextStyle(
            fontSize: 20, 
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Container(
        child: ListView(
          scrollDirection: Axis.vertical,
          reverse: false,
          children: <Widget>[
            Card(
              child: ListTile(
                leading: Icon(Icons.directions_car),
                title: Text('Rua: X'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.directions_car),
                title: Text('Rua: A'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.directions_car),
                title: Text('Rua: Y'),
              ),
            ),
            Card(
              child: ListTile(
                leading: Icon(Icons.directions_car),
                title: Text('Rua: Z'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
