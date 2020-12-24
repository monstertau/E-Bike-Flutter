import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/Bike/BikeFactory.dart';
import 'package:eco_bike_rental/model/CreditCard/CreditCard.dart';
import 'package:eco_bike_rental/model/DB/db_connection.dart';
import 'package:eco_bike_rental/model/Payment/Payment.dart';

class PaymentService {
  factory PaymentService() {
    if (_this == null) _this = PaymentService._();
    return _this;
  }

  PaymentService._();

  static PaymentService _this;
  DatabaseConnection _database = new DatabaseConnection();

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

  void save(Payment payment) async {
    Map invoice = {
      "payment": {
        "rentalCode": payment.rentalCode,
        "depositAmount": payment.depositAmount,
        "startRentTime": payment.startRentTime.toString().split('.')[0],
        "endRentTime": payment.startRentTime.toString().split('.')[0],
        "bikeId": payment.bike.id,
        "status": 1,
        "card": {
          "cardCode": payment.card.cardCode,
          "cardName": payment.card.owner,
          "dateExpired": payment.card.dateExpired,
          "cvvCode": payment.card.cvvCode
        }
      }
    };
    var result = await _database.savePayment(invoice);
    print(result);
    // return result['success'];
  }

  void update(dockId, Payment payment) async {
    Map invoice = {
      "payment": {
        "rentalCode": payment.rentalCode,
        "rentAmount": payment.rentAmount,
        "endRentTime": payment.endRentTime.toUtc().toString().split('.')[0],
        "status": 2,
        "card": {
          "cardCode": payment.card.cardCode,
        },
        "bike": {"barcode": payment.bike.bikeInfo.barcode, "dockId": dockId}
      }
    };
    var result = await _database.updatePayment(invoice);
    print(result);
  }
}
