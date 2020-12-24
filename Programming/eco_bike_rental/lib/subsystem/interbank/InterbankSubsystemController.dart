import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:eco_bike_rental/common/exception/payment_exception.dart';
import 'package:eco_bike_rental/model/CreditCard/CreditCard.dart';
import 'package:eco_bike_rental/model/Payment/Transaction.dart';
import 'package:eco_bike_rental/utils/Utils.dart';
import 'package:eco_bike_rental/utils/constants.dart';

import 'InterbankBoundary.dart';

String generateMd5(String input) {
  return md5.convert(utf8.encode(input)).toString();
}

class InterbankController {
  final appCode = "B96b7GPvoZs=";
  final payCommand = "pay";
  final refundCommand = "refund";
  final version = "1.0.1";

  Future<Map> payOrder(CreditCard creditCard, int amount) async {
    Map request = {};
    Map response = {};
    var createdAt = Utils.getNow();
    Transaction transaction =
        new Transaction(creditCard, "pay", "ok", amount, createdAt);
    request.putIfAbsent("version", () => version);
    request.putIfAbsent("transaction", () => transaction.getData());
    request.putIfAbsent("appCode", () => appCode);
    request.putIfAbsent(
        "hashCode", () => Utils.makeHash(transaction.getData()));
    var result = await InterbankBoundary.patch(request);
    response.putIfAbsent(
        "success", () => (result['errorCode'] == '00' ? true : false));
    response.putIfAbsent("message", () => parseError(result['errorCode']));
    if (result['errorCode'] == '00')
      response.putIfAbsent("data", () => result['transaction']);
    else
      throw InvalidTransaction.init(parseError(result['errorCode']));
    return response;
  }

  Future<Map> returnOrder(CreditCard card, int amount) async {
    Map request = {};
    Map response = {};
    var createdAt = Utils.getNow();
    Transaction transaction =
        new Transaction(card, "refund", "ok", amount, createdAt);
    request.putIfAbsent("version", () => version);
    request.putIfAbsent("transaction", () => transaction.getData());
    request.putIfAbsent("appCode", () => appCode);
    request.putIfAbsent(
        "hashCode", () => Utils.makeHash(transaction.getData()));
    var result = await InterbankBoundary.patch(request);
    logger.i(result['transaction']);
    response.putIfAbsent(
        "success", () => (result['errorCode'] == '00' ? true : false));
    // response.putIfAbsent("message", () => parseError(result['errorCode']));
    if (result['errorCode'] == '00')
      response.putIfAbsent("data", () => result['transaction']);
    else
      throw InvalidTransaction.init(parseError(result['errorCode']));
    return response;
  }

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
