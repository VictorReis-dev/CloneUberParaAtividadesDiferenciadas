import 'dart:developer';
import 'package:suruber/login.dart';
import 'package:flutter/material.dart';
import 'bottommenu.dart';

class Login2 extends StatefulWidget {
  final String titulo;
  final List<String> bandeiras;
  Login2({Key key, this.titulo, this.bandeiras}) : super();

  @override
  _Login2State createState() => _Login2State();
}

class _Login2State extends State<Login2> {
  GlobalKey<FormState> _chave = GlobalKey<FormState>();
  TextEditingController telefone = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final enviar_bandeiras args = ModalRoute.of(context).settings.arguments;
    log(args.numero);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: Navigator.of(context).pop,
        ),
        backgroundColor: Colors.white12,
        title: Text(widget.titulo),
        elevation: 0.0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 38,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Row(
                      children: <Widget>[
                        DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: args.numero,
                            onChanged: (String novoItem) {
                              setState(() {
                                args.numero = novoItem;

                                if (args.numero == "1") {
                                  args.numero_ddi = "+55";
                                } else if (args.numero == "2") {
                                  args.numero_ddi = "+1";
                                } else {
                                  args.numero_ddi = "+92";
                                }
                              });
                            },
                            hint: Image(
                              image: NetworkImage(
                                  widget.bandeiras[args.bandeiras]),
                              height: 20.0,
                              width: 35.0,
                            ), //texto para aparecer antes de qualquer selecao
                            items: <String>['1', '2', '3']
                                .map<DropdownMenuItem<String>>((String valor) {
                              return DropdownMenuItem<String>(
                                value: valor,
                                child: Image(
                                    image: NetworkImage(
                                        widget.bandeiras[int.parse(valor) - 1]),
                                    height: 20.0,
                                    width: 35.0),
                              );
                            }).toList(),
                          ),
                        ),
                        Container(
                          child: Text(
                            args.numero_ddi,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        SizedBox(width: 10),
                        Container(
                          width: 250,
                          height: 30,
                          child: Form(
                            key: _chave,
                            child: TextFormField(
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  labelText: 'Insira o número de celular',
                                  labelStyle: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                                controller: telefone,
                                validator: (value) {
                                  return (value.isEmpty)
                                      ? "Número inválido"
                                      : null;
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    child: InkWell(
                      child: Text(
                        'Entrar',
                        style: TextStyle(color: Colors.blue),
                      ),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (BuildContext context) => BottomBar(),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
