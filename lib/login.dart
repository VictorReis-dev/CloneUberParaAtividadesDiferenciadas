import 'package:flutter/material.dart';
import 'package:suruber/testeCRUD.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _chave = GlobalKey<FormState>();
  TextEditingController txtUsuario = TextEditingController();
  TextEditingController txtSenha = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Form(
          key: _chave,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _logoImagem('assets/imagens/rebu-logo.jpeg'),
              _campoUsuario('Usuário', txtUsuario),
              _campoSenha('Senha', txtSenha),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _botao(context, 'Entrar'),
                  _botao(context, 'Registrar'),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 150),
                child: InkWell(
                  child: Text(
                    'Sobre',
                    style: TextStyle(color: Colors.blue, fontSize: 18),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, '/sobre');
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  _logoImagem(imagem) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Image(
        image: AssetImage(imagem),
        width: 200.0,
        height: 200.0,
        //fit: BoxFit.fill,
      ),
    );
  }

  _campoUsuario(label, controle) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: TextFormField(
        cursorColor: Colors.black,
        style: TextStyle(fontSize: 16, color: Colors.black),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          labelText: label,
          labelStyle: TextStyle(fontSize: 16, color: Colors.black),
        ),
        controller: controle,
        validator: (value) {
          return (value.isEmpty) ? "Usuário inválido" : null;
        },
      ),
    );
  }

  _campoSenha(label, controle) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
      child: TextFormField(
        obscureText: true,
        cursorColor: Colors.black,
        style: TextStyle(fontSize: 16, color: Colors.black),
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black),
          ),
          labelText: label,
          labelStyle: TextStyle(fontSize: 16, color: Colors.black),
        ),
        controller: controle,
        validator: (value) {
          return (value.isEmpty) ? "Senha inválida" : null;
        },
      ),
    );
  }

  _botao(BuildContext context, label) {
    final verificaUsuario = Provider.of<CRUDteste>(context);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
      child: RaisedButton(
        color: Colors.black,
        child: Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        onPressed: () async {
          if (label == 'Registrar') {
            Navigator.pushNamed(context, '/registro');
          } else if (label == 'Entrar') {
            if (_chave.currentState.validate()) {
              verificaUsuario.pesquisarUsuario(txtUsuario.text).then(
                (value) {
                  if (value != null) {
                    if (value.senha != txtSenha.text) {
                      debugPrint("Senha incorreta");
                    } else {
                      Navigator.pushReplacementNamed(context, '/menu',
                          arguments: [txtUsuario.text, verificaUsuario]);
                    }
                  } else {
                    debugPrint('Usuário invalido');
                  }
                },
              );
            }
          }
        },
      ),
    );
  }
}
