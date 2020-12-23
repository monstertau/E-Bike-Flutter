///exception for eco bike rental system
class EBRException implements Exception {
  String _message;

  EBRException.init(this._message);

  String get message => _message;
}
