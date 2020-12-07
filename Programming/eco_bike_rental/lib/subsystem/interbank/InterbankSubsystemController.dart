import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:eco_bike_rental/model/Payment/CreditCard.dart';

String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}

class InterbankController {
  final APP_CODE = "B96b7GPvoZs=";
  final SECRET_KEY = "BUgboJpO5w4=";
  final PAY_COMMAND = "pay";
  final REFUND_COMMAND = "refund";
  final VERSION = "1.0.1";

  String payOrder(CreditCard creditCard, String amount) {
    var transaction = {
      "cardCode": creditCard.cardCode,
      "owner": creditCard.owner,
      "cvvCode": creditCard.cvvCode,
      "dateExpired": creditCard.dateExpired,
      "command": PAY_COMMAND,
      "transactionContent": "ok",
      "amount": amount,
    };
    return "Fail";
  }
}
