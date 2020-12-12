import '../Bike/Bike.dart';
import 'CreditCard.dart';

class Payment {
  Bike _bike;
  CreditCard _card;

  int _deductAmount;
  int _depositeAmount;

  CreditCard get card => _card;

  set card(CreditCard value) {
    _card = value;
  }

  DateTime _startRentTime;
  DateTime _endRentTime;
  String _paymentStatus;
  String _rentalCode;

  Bike get bike => _bike;

  Payment(this._bike, this._card, this._deductAmount, this._startRentTime,
      this._paymentStatus, this._rentalCode);

  set bike(Bike value) {
    _bike = value;
  }

  String get rentalCode => _rentalCode;

  set rentalCode(String value) {
    _rentalCode = value;
  }

  String get paymentStatus => _paymentStatus;

  set paymentStatus(String value) {
    _paymentStatus = value;
  }

  DateTime get endRentTime => _endRentTime;

  set endRentTime(DateTime value) {
    _endRentTime = value;
  }

  DateTime get startRentTime => _startRentTime;

  set startRentTime(DateTime value) {
    _startRentTime = value;
  }

  int get depositeAmount => _depositeAmount;

  set depositeAmount(int value) {
    _depositeAmount = value;
  }

  int get deductAmount => _deductAmount;

  set deductAmount(int value) {
    _deductAmount = value;
  }

}
