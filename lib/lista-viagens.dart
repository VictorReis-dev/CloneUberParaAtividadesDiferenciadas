//Lista de viagens que ficará no histórico viagens.dart
class ListaViagens {
  //
  //atributos que serão salvos na lsita
  String _id;
  String _nomeMotorista;
  String _precoPago;
  String _localDestino;

  ListaViagens(
      this._id, this._nomeMotorista, this._precoPago, this._localDestino);

  String get id => _id;
  String get nomeMotorista => _nomeMotorista;
  String get precoPago => _precoPago;
  String get localDestino => _localDestino;

  ListaViagens.fromMap(Map viagem, String id)
      : this._id = id ?? '',
        this._nomeMotorista = viagem['motorista'],
        this._precoPago = viagem['valor'],
        this._localDestino = viagem['destino'];

  toJson() {
    return {
      "id": _id,
      "motorista": _nomeMotorista,
      "valor": _precoPago,
      "destino": _localDestino,
    };
  }
}
