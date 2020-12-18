import 'package:eco_bike_rental/model/DB/db_interface.dart';
import 'package:eco_bike_rental/model/DB/db_subsystem.dart';

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

  final DatabaseSubsystemInterface _database = DatabaseSubsystem();

  Payment(this._bike, this._card, this._startRentTime, this._depositAmount,
      this._paymentStatus, this._rentalCode);

  Bike get bike => _bike;

  CreditCard get card => _card;

  String get rentalCode => _rentalCode;

  String get paymentStatus => _paymentStatus;

  DateTime get endRentTime => _endRentTime;

  double get deductAmount => _deductAmount;

  DateTime get startRentTime => _startRentTime;

  set startRentTime(DateTime value) {
    _startRentTime = value;
  }

  double get depositAmount => _depositAmount;

  Payment getPaymentInfo(String rentalCode) {}
}
