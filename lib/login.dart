import 'package:flutter/material.dart';

class enviar_bandeiras {
  String titulo;
  String numero_ddi;
  String numero;
  int bandeiras;

  enviar_bandeiras(this.titulo, this.numero_ddi, this.numero, this.bandeiras);
}

class extrair_dados extends StatelessWidget {
  static const routeName = '/extractArguments';

  @override
  Widget build(BuildContext context) {
    final enviar_bandeiras args = ModalRoute.of(context).settings.arguments;
    return Scaffold(
        //args.bandeiras;
        );
  }
}

class Login extends StatefulWidget {
  final String titulo;
  String numero_ddi;
  String numero;
  final List<String> bandeiras;
  Login({Key key, this.titulo, this.bandeiras, this.numero_ddi, this.numero})
      : super();

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text(widget.titulo),
      //   actions: <Widget>[
      //     IconButton(
      //       icon: Icon(Icons.sd_card),
      //      onPressed: () {
      //         print("ola mundo");
      //       },
      //     ),
      //   ],
      //  ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 62,
            child: Container(
              decoration: BoxDecoration(color: Color.fromRGBO(40, 110, 240, 1)),
              child: Padding(
                  padding: EdgeInsets.all(37),
                  child: Image(
                    image: NetworkImage(
                        'https://logospng.org/download/uber/logo-uber-preta-256.png'),
                  )),
            ),
          ),
          Expanded(
            flex: 38,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: Container(
                    child: Center(
                      child: Text(
                        "'Viaje' com a Suruber",
                        style: TextStyle(fontSize: 22),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 225),
                    child: Row(
                      children: <Widget>[
                        DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            value: widget.numero,
                            onChanged: (String novoItem) {
                              setState(() {
                                widget.numero = novoItem;

                                if (widget.numero == "1") {
                                  widget.numero_ddi = "+55";
                                } else if (widget.numero == "2") {
                                  widget.numero_ddi = "+1";
                                } else {
                                  widget.numero_ddi = "+92";
                                }
                              });
                            },
                            hint: Image(
                              image: NetworkImage(widget.bandeiras[0]),
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
                        SizedBox(width: 15),
                        Container(
                          child: Text(
                            widget.numero_ddi,
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        SizedBox(width: 30),
                        Container(
                          //color: Colors.red,
                          child: InkWell(
                            child: Text(
                              'Insira seu número de celular',
                              style: TextStyle(color: Colors.grey[700]),
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                (context),
                                '/login2',
                                arguments: enviar_bandeiras(
                                  widget.titulo,
                                  widget.numero_ddi,
                                  widget.numero,
                                  int.parse(widget.numero)-1,
                                ),
                              );
                            },
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
                        'Ou entre com uma rede social',
                        style: TextStyle(color: Colors.blue),
                      ),
                      onTap: () {
                        print('oi');
                      },
                    ),
                  ),
                ),
                SizedBox(height: 50),
                Expanded(
                  child: Container(
                    padding: EdgeInsets.only(right: 700),
                    child: InkWell(
                      child: Text(
                        'Sobre',
                        style: TextStyle(color: Colors.blue),
                      ),
                      onTap: () {
                        Navigator.pushNamed((context), '/sobre');
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
