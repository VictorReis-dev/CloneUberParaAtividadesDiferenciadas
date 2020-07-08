import 'package:flutter/material.dart';

class Perfil extends StatefulWidget {
  final List argumentos;
  Perfil(this.argumentos);

  @override
  _PerfilState createState() => _PerfilState();
}

class _PerfilState extends State<Perfil> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Perfil'),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.exit_to_app,
                color: Colors.white,
                size: 30,
              ),
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/load',
                    arguments: '/login');
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
                color: Colors.black,
                size: 100,
              ),
              title: Text(widget.argumentos[0]),
              subtitle: Text('(16)9.9876-5432'),
              trailing: IconButton(
                icon: Icon(Icons.edit, color: Colors.black, size: 35),
                onPressed: () {},
              ),
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
