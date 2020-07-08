import 'package:flutter/material.dart';

class Configuracoes extends StatefulWidget {
  @override
  _ConfiguracoesState createState() => _ConfiguracoesState();
}

class _ConfiguracoesState extends State<Configuracoes> {
  bool switchNotificacao = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Configurações'),
      ),
      body: Container(
        child: ListView(
          reverse: false,
          scrollDirection: Axis.vertical,
          children: <Widget>[
            ListTile(
              trailing: Switch(
                value: switchNotificacao,
                onChanged: (value) {
                  setState(() {
                    switchNotificacao = value;
                  });
                },
                activeTrackColor: Colors.grey,
                activeColor: Colors.black,
              ),
              title: Text('Notificações'),
            ),
          ],
        ),
      ),
    );
  }
}
