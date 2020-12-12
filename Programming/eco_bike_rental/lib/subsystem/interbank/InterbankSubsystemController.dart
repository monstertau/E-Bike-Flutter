import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:eco_bike_rental/model/Payment/CreditCard.dart';
import 'package:eco_bike_rental/model/Payment/Payment.dart';
import 'package:eco_bike_rental/model/Payment/Transaction.dart';
import 'package:eco_bike_rental/utils/API.dart';
import 'package:eco_bike_rental/utils/Utils.dart';
import 'package:eco_bike_rental/utils/constants.dart';

import 'InterbankBoundary.dart';

String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}

class InterbankController {
  final APP_CODE = "B96b7GPvoZs=";
  final PAY_COMMAND = "pay";
  final REFUND_COMMAND = "refund";
  final VERSION = "1.0.1";

  static InterbankBoundary _interbankBoundary = new InterbankBoundary();

  Future<Map> payOrder(CreditCard creditCard, int amount) async {
    Map request = {};
    Map response = {};
    var createdAt = Utils.getNow();
    Transaction transaction =
        new Transaction(creditCard, "pay", "ok", amount, createdAt);
    request.putIfAbsent("version", () => VERSION);
    request.putIfAbsent("transaction", () => transaction.getData());
    request.putIfAbsent("appCode", () => APP_CODE);
    request.putIfAbsent(
        "hashCode", () => Utils.makeHash(transaction.getData()));
    // TODO
    var result = await API.Patch(request);
    response.putIfAbsent(
        "success", () => (result['errorCode'] == '00' ? true : false));
    response.putIfAbsent("message", () => parseError(result['errorCode']));
    if (result['errorCode'] == '00')
      response.putIfAbsent("data", () => result['transaction']);
    return response;
  }

  Future<Map> returnOrder(CreditCard card, int amount) async {
    Map request = {};
    Map response = {};
    var createdAt = Utils.getNow();
    Transaction transaction =
        new Transaction(card, "refund", "ok", amount, createdAt);
    request.putIfAbsent("version", () => VERSION);
    request.putIfAbsent("transaction", () => transaction.getData());
    request.putIfAbsent("appCode", () => APP_CODE);
    request.putIfAbsent(
        "hashCode", () => Utils.makeHash(transaction.getData()));
    var result = await API.Patch(request);
    logger.i(result['transaction']);
    response.putIfAbsent(
        "success", () => (result['errorCode'] == '00' ? true : false));
    response.putIfAbsent("message", () => parseError(result['errorCode']));
    if (result['errorCode'] == '00')
      response.putIfAbsent("data", () => result['transaction']);
    return response;
  }

// Payment createPayment(CreditCard card,){
//   return
// }

  String parseError(String errorCode) {
    switch (errorCode) {
      case "00":
        return "Success Payment";
        break;
      case "01":
        return "Invalid Card";
        break;
      case "02":
        return "Not enough Money";
        break;
      case "03":
        return "Internal Server Error";
        break;
      case "04":
        return "Suspicion Transaction";
        break;
      case "05":
        return "Not enough Payment Information";
        break;
      case "06":
        return "No Version information found";
        break;
      case "07":
        return "Invalid amount of money";
        break;
      default:
        return "Unknown Error";
        break;
    }
  }
}
