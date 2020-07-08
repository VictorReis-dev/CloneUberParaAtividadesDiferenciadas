import 'package:flutter/material.dart';

class Sobre extends StatelessWidget {
  final TextStyle formatacaoTexto =
      new TextStyle(fontSize: 15, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color(4294967295),
        padding: EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text("Este aplicativo foi criado por motivos de discordia pelo fato de uma empresa de carona não oferecer serviços sexuais no seu projeto, com isso criamos um app para satirizar e resolver este pequeno problema",
                style: TextStyle(color: Color(4278190080), fontSize: 20.0)),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    Image(image: AssetImage("assets/imagens/victor.jpg"),width: 150.0, height: 150.0, fit: BoxFit.fill),
                    Text('Victor Eduardo Silva Reis',
                        style:
                            TextStyle(color: Color(4278190080), fontSize: 15.0))
                  ],
                ),
                Column(
                  children: [
                    Image(
                      image: AssetImage("assets/imagens/lucas.jpg"),
                      width: 150.0, 
                      height: 150.0, 
                      fit: BoxFit.fill
                    ),
                    Text('Lucas Aparicio Castelli',
                        style:
                            TextStyle(color: Color(4278190080), fontSize: 15.0))
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: Text(
          'Sobre',
          style: TextStyle(color: Color(4294967295), fontSize: 20.0),
        ),
      ),
    );
  }
}
