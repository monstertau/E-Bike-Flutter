import 'package:eco_bike_rental/model/Bike/BikeFactory.dart';
import 'package:eco_bike_rental/model/DB/db_interface.dart';
import 'package:eco_bike_rental/model/DB/db_subsystem.dart';

import '../Bike/Bike.dart';
import 'CreditCard.dart';
///payment model
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
///constructor
  Payment(this._bike, this._card, this._startRentTime, this._depositAmount,
      this._paymentStatus, this._rentalCode);
///constructor
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
///get payment information
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
///save payment
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
///update dock Id
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
