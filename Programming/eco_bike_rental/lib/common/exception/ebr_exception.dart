///This class is used for eco-bike-rental system
///[EBRException] contains the error messages for common exception of this application
class EBRException implements Exception {
  String _message;

  EBRException.init(this._message);

  String get message => _message;
}
