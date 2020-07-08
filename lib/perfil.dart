import 'package:flutter/material.dart';
import 'editar_perfil.dart';

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
              title: Text(widget.argumentos[2].nome),
              subtitle: Text(widget.argumentos[2].telefone),
              trailing: IconButton(
                icon: Icon(Icons.edit, color: Colors.black, size: 35),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditarPerfil(widget.argumentos),
                    ),
                  );
                },
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
