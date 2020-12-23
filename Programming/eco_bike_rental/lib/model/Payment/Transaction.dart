import 'package:eco_bike_rental/model/Payment/CreditCard.dart';
///transaction model
class Transaction {
  CreditCard _card;

  String _command;
  String _transactionContent;
  int _amount;
  String _createdAt;
///constructor
  Transaction(this._card, this._command, this._transactionContent, this._amount,
      this._createdAt);
///get transaction properties in one object
  Map getData() {
    return {
      "cardCode": this._card.cardCode,
      "owner": this._card.owner,
      "cvvCode": this._card.cvvCode,
      "dateExpired": this._card.dateExpired,
      "command": this._command,
      "transactionContent": this._transactionContent,
      "amount": this._amount,
      "createdAt": this._createdAt
    };
  }
}
