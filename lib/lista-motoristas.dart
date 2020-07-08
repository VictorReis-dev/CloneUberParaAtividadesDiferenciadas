//Lista de motoristas disponiveis nas viagens
class Motoristas {
  //
  //atributos que serão salvos na lsita
  String _id;
  String _nomeMotorista;
  String _precoPago;
  String _modeloCarro;

  Motoristas(this._id, this._nomeMotorista, this._precoPago, this._modeloCarro);

  String get id => _id;
  String get nomeMotorista => _nomeMotorista;
  String get precoPago => _precoPago;
  String get modeloCarro => _modeloCarro;

  Motoristas.fromMap(Map motorista, String id)
      : this._id = id ?? '',
        this._nomeMotorista = motorista['motorista'],
        this._precoPago = motorista['valor'],
        this._modeloCarro = motorista['carro'];

  toJson() {
    return {
      "id": _id,
      "motorista": _nomeMotorista,
      "valor": _precoPago,
      "carro": _modeloCarro,
    };
  }
}
