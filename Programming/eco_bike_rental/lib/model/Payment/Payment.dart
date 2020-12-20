import 'package:eco_bike_rental/model/Bike/BikeFactory.dart';
import 'package:eco_bike_rental/model/DB/db_interface.dart';
import 'package:eco_bike_rental/model/DB/db_subsystem.dart';
import 'package:flutter/material.dart';

import '../Bike/Bike.dart';
import 'CreditCard.dart';

class Payment {
  Bike _bike;
  CreditCard _card;

  int _rentAmount;
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

  set card(CreditCard value) {
    _card = value;
  }

  String get rentalCode => _rentalCode;

  String get paymentStatus => _paymentStatus;

  DateTime get endRentTime => _endRentTime;

  int get rentAmount => _rentAmount;

  set rentAmount(int value) {
    _rentAmount = value;
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

  void save() async {
    Map invoice = {
      "payment": {
        "rentalCode": this.rentalCode,
        "depositAmount": this.depositAmount,
        "startRentTime": this.startRentTime.toString().split('.')[0],
        "endRentTime": this.startRentTime.toString().split('.')[0],
        "bikeId": this.bike.id,
        "status": 1,
        "card": {
          "cardCode": card.cardCode,
          "cardName": card.owner,
          "dateExpired": card.dateExpired,
          "cvvCode": card.cvvCode
        }
      }
    };
    var result = await _database.savePayment(invoice);
    print(result);
    // return result['success'];
  }

  void update(dockId) async {
    Map invoice = {
      "payment": {
        "rentalCode": this.rentalCode,
        "rentAmount": this.rentAmount,
        "endRentTime": this.startRentTime.toUtc().toString().split('.')[0],
        "status": 2,
        "card": {
          "cardCode": this.card.cardCode,
        },
        "bike": {"barcode": this.bike.barcode, "dockId": dockId}
      }
    };
    var result = await _database.updatePayment(invoice);
    print(result);
  }
}
