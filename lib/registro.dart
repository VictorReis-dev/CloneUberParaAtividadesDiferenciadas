import 'package:flutter/material.dart';
import 'package:suruber/testeCRUD.dart';
import 'package:provider/provider.dart';
import 'package:suruber/lista-usuarios.dart';

class Registro extends StatefulWidget {
  final String titulo;
  Registro({Key key, this.titulo}) : super();

  @override
  _RegistroState createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  GlobalKey<FormState> _chave = GlobalKey<FormState>();
  TextEditingController txtUsuario = TextEditingController();
  TextEditingController txtSenha = TextEditingController();
  TextEditingController txtNome = TextEditingController();
  TextEditingController txtTelefone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("Registro"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Form(
          key: _chave,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _logoImagem('assets/imagens/rebu-logo.jpeg'),
              _campoUsuario('Nome', txtNome),
              _campoUsuario('Telefone', txtTelefone),
              _campoUsuario('Usuário', txtUsuario),
              _campoSenha('Senha', txtSenha),
              _botaoSalvar(context),
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
          return (value.isEmpty) ? "Campo obrigatório" : null;
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

  _botaoSalvar(BuildContext context) {
    final verificaUsuario = Provider.of<CRUDteste>(context);

    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
      child: RaisedButton(
        color: Colors.black,
        child: Text(
          'Salvar',
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        onPressed: () {
          if (_chave.currentState.validate()) {
            verificaUsuario.pesquisarUsuario(txtUsuario.text).then(
              (value) {
                if (value != null) {
                  debugPrint('Nome de usuário já está sendo utilizado!');
                } else {
                  debugPrint('Usuario cadastrado com sucesso');
                  Usuarios novoUsuario = Usuarios(txtUsuario.text, txtNome.text,
                      txtSenha.text, txtTelefone.text);
                  verificaUsuario.adicionarUsuario(novoUsuario);
                  Navigator.pushReplacementNamed(context, '/login');
                }
              },
            );
          }
        },
      ),
    );
  }
}
