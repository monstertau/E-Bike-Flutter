///This class represents the model of [CreditCard] entity
class CreditCard {
  ///Card code
  String _cardCode;

  String get cardCode => _cardCode;
  ///Owner name
  String _owner;
  ///security code
  int _cvvCode;
  ///expiration date
  String _dateExpired;


  CreditCard.init();

  CreditCard(this._cardCode, this._cvvCode, this._dateExpired, this._owner);

  String get owner => _owner;

  int get cvvCode => _cvvCode;

  String get dateExpired => _dateExpired;

}
