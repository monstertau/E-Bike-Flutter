///exception for eco bike rental system
///[EBRException] contains the error message for common exception of this application
class EBRException implements Exception {
  String _message;

  EBRException.init(this._message);

  String get message => _message;
}
