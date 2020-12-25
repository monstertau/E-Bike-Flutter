import '../Bike/Bike.dart';
import '../CreditCard/CreditCard.dart';

class Payment {
  Bike _bike;
  CreditCard _card;

  int _rentAmount;
  int _depositAmount;
  DateTime _startRentTime;
  DateTime _endRentTime;
  String _paymentStatus;
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
