
class CardInUseException implements Exception {
  String _message;

  CardInUseException([this._message]);
}