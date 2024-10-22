import 'package:eco_bike_rental/model/CreditCard/CreditCard.dart';
///This class represents the model of [PaymentTransaction]
class Transaction {
  ///[CreditCard] entity
  CreditCard _card;
///Command for transaction, instances: pay, refund, ...
  String _command;
  ///
  String _transactionContent;
  int _amount;
  String _createdAt;

  Transaction(this._card, this._command, this._transactionContent, this._amount,
      this._createdAt);

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
