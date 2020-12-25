import '../Bike/Bike.dart';
import '../CreditCard/CreditCard.dart';
///This class represents the model of [Payment]
class Payment {
  ///[Bike] entity
  Bike _bike;
  /// [CreditCard] entity
  CreditCard _card;
///Rent amount user have to pay
  int _rentAmount;
  ///Deposit amount
  int _depositAmount;
  ///Starting rent time of payment
  DateTime _startRentTime;
  ///Ending rent time of payment
  DateTime _endRentTime;
  ///payment status
  String _paymentStatus;
  ///rental code
  String _rentalCode;
  Payment(this._bike, this._card, this._startRentTime, this._depositAmount,
      this._paymentStatus, this._rentalCode);

  Payment.init();

  Bike get bike => _bike;

  // ignore: unnecessary_getters_setters
  CreditCard get card => _card;

  // ignore: unnecessary_getters_setters
  set card(CreditCard value) {
    _card = value;
  }

  String get rentalCode => _rentalCode;

  String get paymentStatus => _paymentStatus;

  // ignore: unnecessary_getters_setters
  DateTime get endRentTime => _endRentTime;

  // ignore: unnecessary_getters_setters
  int get rentAmount => _rentAmount;

  // ignore: unnecessary_getters_setters
  set rentAmount(int value) {
    _rentAmount = value;
  }

  // ignore: unnecessary_getters_setters
  DateTime get startRentTime => _startRentTime;

  // ignore: unnecessary_getters_setters
  set startRentTime(DateTime value) {
    _startRentTime = value;
  }

  // ignore: unnecessary_getters_setters
  set endRentTime(DateTime value) {
    _endRentTime = value;
  }

  int get depositAmount => _depositAmount;

}
