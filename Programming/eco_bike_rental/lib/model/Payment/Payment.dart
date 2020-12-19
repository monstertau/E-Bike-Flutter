import 'package:eco_bike_rental/model/Bike/BikeFactory.dart';
import 'package:eco_bike_rental/model/DB/db_interface.dart';
import 'package:eco_bike_rental/model/DB/db_subsystem.dart';
import 'package:flutter/material.dart';

import '../Bike/Bike.dart';
import 'CreditCard.dart';

class Payment {
  Bike _bike;
  CreditCard _card;

  int _deductAmount;
  int _depositAmount;
  DateTime _startRentTime;
  DateTime _endRentTime;
  String _paymentStatus;
  String _rentalCode;

  final DatabaseSubsystemInterface _database = DatabaseSubsystem();

  Payment(this._bike, this._card, this._startRentTime, this._depositAmount,
      this._paymentStatus, this._rentalCode);

  Payment.init();

  Bike get bike => _bike;

  CreditCard get card => _card;

  String get rentalCode => _rentalCode;

  String get paymentStatus => _paymentStatus;

  DateTime get endRentTime => _endRentTime;

  int get deductAmount => _deductAmount;

  set deductAmount(int value) {
    _deductAmount = value;
  }

  DateTime get startRentTime => _startRentTime;

  set startRentTime(DateTime value) {
    _startRentTime = value;
  }
  set endRentTime(DateTime value) {
    _endRentTime = value;
  }
  int get depositAmount => _depositAmount;

  Future<Payment> getPaymentInfo(String rentalCode) async {
    Map res = await _database.searchPayment(rentalCode);
    Bike rentedBike = BikeFactory.getBike(res["bike"]);
    Map cardRes = res["card"];
    CreditCard rentedCard = new CreditCard(cardRes["cardCode"],
        cardRes["cvvCode"], cardRes["dateExpired"], cardRes["cardName"]);
    Payment payment = new Payment(
        rentedBike,
        rentedCard,
        DateTime.parse(res["startRentTime"]),
        res["depositAmount"],
        res["status"].toString(),
        res["rentalCode"]);
    return payment;
  }


}
