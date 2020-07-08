//Lista de usuario que ficará no registro do firebase
class Usuarios {
  //
  //atributos que serão salvos na lsita
  String _id;
  String _nome;
  String _senha;
  String _telefone;

  Usuarios(this._id, this._nome, this._senha, this._telefone);

  String get id => _id;
  String get nome => _nome;
  String get senha => _senha;
  String get telefone => _telefone;

  Usuarios.fromMap(Map usuario, String id)
      : this._id = id ?? '',
        this._nome = usuario['nome'],
        this._senha = usuario['senha'],
        this._telefone = usuario['telefone'];

  toJson() {
    return {
      "id": _id,
      "nome": _nome,
      "senha": _senha,
      "telefone": _telefone,
    };
  }
}
