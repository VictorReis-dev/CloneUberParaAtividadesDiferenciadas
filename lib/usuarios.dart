//Lista de usuario que ficará no registro do firebase
class Usuarios {
  //
  //atributos que serão salvos na lsita
  String _id;
  String _nome;
  String _senha;

  Usuarios(this._id, this._nome, this._senha);

  String get id => _id;
  String get nome => _nome;
  String get senha => _senha;

  Usuarios.fromMap(Map usuario, String id)
      : this._id = id ?? '',
        this._nome = usuario['nome'],
        this._senha = usuario['senha'];

  toJson() {
    return {
      "id": _id,
      "nome": _nome,
      "senha": _senha,
    };
  }
}
