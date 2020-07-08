import 'package:flutter/material.dart';
import 'package:suruber/testeCRUD.dart';
import 'package:provider/provider.dart';
import 'api.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'lista-usuarios.dart';

class EditarPerfil extends StatefulWidget {
  final List argumentos;
  EditarPerfil(this.argumentos);

  @override
  _EditarPerfilState createState() => _EditarPerfilState();
}

class _EditarPerfilState extends State<EditarPerfil> {
  GlobalKey<FormState> _chave = GlobalKey<FormState>();
  TextEditingController txtNome = TextEditingController();

  TextEditingController txtTelefone = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Editar'),
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(30),
        child: Form(
          key: _chave,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              _logoImagem(),
              _campoNome('Nome', txtNome, widget.argumentos),
              _campoTelefone('Telefone', txtTelefone, widget.argumentos),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  _botao(context, 'Salvar', widget.argumentos),
                  _botao(context, 'Cancelar', widget.argumentos),
                ],
              ),
              // Padding(
              //   padding: EdgeInsets.only(top: 150),
              //   child: InkWell(
              //     child: Text(
              //       'Sobre',
              //       style: TextStyle(color: Colors.blue, fontSize: 18),
              //     ),
              //     onTap: () {
              //       Navigator.pushNamed(context, '/sobre');
              //     },
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  _logoImagem() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Icon(
        Icons.portrait,
        size: 200,
      ),
    );
  }

  _campoNome(label, controle, argumentos) {
    controle.text = argumentos[2].nome;
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

  _campoTelefone(label, controle, argumentos) {
    controle.text = argumentos[2].telefone;
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
          return (value.isEmpty) ? "Senha inválida" : null;
        },
      ),
    );
  }

  _botao(BuildContext context, label, argumentos) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 30),
      child: RaisedButton(
        color: Colors.black,
        child: Text(
          label,
          style: TextStyle(color: Colors.white, fontSize: 16),
        ),
        onPressed: () async {
          if (label == 'Cancelar') {
            Navigator.of(context).pop();
          } else if (label == 'Salvar') {
            if (_chave.currentState.validate()) {
              Usuarios alteraDados = Usuarios(argumentos[2].id, txtNome.text,
                  argumentos[2].senha, txtTelefone.text);
              argumentos[1].atualizarDados(alteraDados);
              Navigator.pushReplacementNamed(context, '/menu',
                  arguments: [argumentos[0], argumentos[1], alteraDados]);
            }
          }
        },
      ),
    );
  }

  _erroDeLogin(context, label) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Text(
            label,
            style: TextStyle(color: Colors.red),
          ),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Ok'),
            ),
          ],
        );
      },
    );
  }
}

// verificaUsuario.pesquisarUsuario(widget.argumentos[0]).then(
//   (value) {
//     //   if (value != null) {
//     //     if (value.senha != txtSenha.text) {
//     //       _erroDeLogin(context, 'Senha incorreta');
//     //     } else {
//     //       Navigator.pushReplacementNamed(context, '/menu',
//     //           arguments: [txtUsuario.text, verificaUsuario]);
//     //     }
//     //   } else {
//     //     _erroDeLogin(context, 'Usuário não cadastrado');
//     //   }
//   },
// );
