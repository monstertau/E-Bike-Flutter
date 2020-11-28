import '../Bike/Bike.dart';

class Payment {
  Bike _bike;
  // CreditCard _card;

  int _deductAmount;
  int _depositeAmount;
  DateTime _startRentTime;
  DateTime _endRentTime;
  String _paymentStatus;
  String _rentalCode;

  Bike get bike => _bike;

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