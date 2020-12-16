import '../Bike/Bike.dart';
import 'CreditCard.dart';

class Payment {
  Bike _bike;
  CreditCard _card;

  double _deductAmount;
  double _depositAmount;
  DateTime _startRentTime;
  DateTime _endRentTime;
  String _paymentStatus;
  String _rentalCode;

  Bike get bike => _bike;

  CreditCard get card => _card;

  set card(CreditCard value) {
    _card = value;
  }

  Payment(this._bike, this._card, this._startRentTime, this._depositAmount,
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

  double get deductAmount => _deductAmount;

  DateTime get startRentTime => _startRentTime;

  set deductAmount(double value) {
    _deductAmount = value;
  }

  set startRentTime(DateTime value) {
    _startRentTime = value;
  }

  set depositAmount(double value) {
    _depositAmount = value;
  }

  double get depositAmount => _depositAmount;
}
