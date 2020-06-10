import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  final TextStyle formatacaoTexto =
      new TextStyle(fontSize: 15, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sobre'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 200, vertical: 20),
        child: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Image(
                  image: AssetImage("imagens/victor.jpg"),
                  height: 100,
                  width: 100,
                ),
                Text("  Victor Eduardo Silva Reis", style: formatacaoTexto),
              ],
            ),
            SizedBox(height: 15),
            Row(
              children: <Widget>[
                Image(
                  image: AssetImage("imagens/lucas.jpg"),
                  height: 100,
                  width: 100,
                ),
                Text("  Lucas Aparicio Castelli", style: formatacaoTexto),
              ],
            ),
            SizedBox(height: 20),
            Container(
              child: Text(
                  "Este aplicativo foi criado por motivos de discordia pelo fato de uma empresa de carona não oferecer serviços sexuais no seu projeto, com isso criamos um app para satirizar e resolver este pequeno problema",
                  style: formatacaoTexto),
            ),
          ],
        ),
      ),
    );
  }
}
