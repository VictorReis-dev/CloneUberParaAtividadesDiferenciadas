
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

  ListaViagens.map(dynamic obj) {
    this._id = obj['id'];
    this._nomeMotorista = obj['motorista'];
    this._precoPago = obj['valor'];
    this._localDestino = obj['destino'];
  }

  Map<String, dynamic> toMap() {
    var viagem = Map<String, dynamic>();
    if (_id != null) {
      viagem['id'] = _id;
    }
    viagem['motorista'] = _nomeMotorista;
    viagem['valor'] = _precoPago;
    viagem['destino'] = _localDestino;
    return viagem;
  }

  ListaViagens.fromMap(Map<String, dynamic> viagem, String id) {
    this._id = id ?? '';
    this._nomeMotorista = viagem['motorista'];
    this._precoPago = viagem['valor'];
    this._localDestino = viagem['destino'];
  }
}
