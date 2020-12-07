class CreditCard {
  String _cardCode;

  String get cardCode => _cardCode;
  String _owner;
  int _cvvCode;
  String _dateExpired;

  CreditCard(this._cardCode, this._cvvCode, this._dateExpired, this._owner);

  String get owner => _owner;

  int get cvvCode => _cvvCode;

  String get dateExpired => _dateExpired;
}
