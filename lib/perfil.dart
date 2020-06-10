import 'package:flutter/material.dart';
import 'ajuda.dart';

class Perfil extends StatefulWidget {
  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Perfil'),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.help_outline,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (BuildContext context) => Ajuda(),
                  ),
                );
              }),
        ],
      ),
      body: Container(
        
        child: ListView(
          scrollDirection: Axis.vertical,
          reverse: false,
          children: <Widget>[

            ListTile(
              leading: Icon(
                Icons.person,
                color: Colors.blue,
                size: 100,
              ),
              title: Text('Maria Batatinha'),
              subtitle: Text('(16)9.9876-5432'),
              trailing: IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue, size: 35),
                  onPressed: null),
            ),

            Container(
              child: Text(''),
            ),
          ],
        ),
      ),
    );
  }
}
