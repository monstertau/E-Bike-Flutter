import 'dart:convert';
import 'package:eco_bike_rental/common/exception/bike_exception.dart';
import 'package:eco_bike_rental/common/exception/payment_exception.dart';
import 'package:eco_bike_rental/model/DB/db_boundary.dart';
import 'package:eco_bike_rental/utils/constants.dart';

class DatabaseConnectionController {
  DatabaseConnectionController._();

  factory DatabaseConnectionController() {
    if (_this == null) _this = DatabaseConnectionController._();
    return _this;
  }

  static DatabaseConnectionController _this;

  Future<Map> getAllDock() async {
    var response = await DatabaseBoundary.get(getAllDockPath);
    Map jsonRes = jsonDecode(response.body);
    return jsonRes;
  }

  Future<Map> getDetailDock(int dockId) async {
    var response = await DatabaseBoundary.get(getDockDetailPath,
        optionalQuery: "?id=$dockId");
    Map jsonRes = jsonDecode(response.body);
    return jsonRes;
  }

  Future<Map> getBikeByBarcode(String barcode) async {
    var response = await DatabaseBoundary.get(getBarcodeBikePath,
        optionalQuery: "?barcode=$barcode");
    Map jsonRes = jsonDecode(response.body);
    if (jsonRes["error"] == "wrong_barcode") {
      throw InvalidBarcodeException.init("Wrong Barcode!");
    }
    if (jsonRes["error"] == "bike_already_rented") {
      throw BikeInUsedException.init("Bike Already In Use");
    }
    return jsonRes;
  }

  Future<Map> lockBike(String barcode) async {
    var response = await DatabaseBoundary.get(lockBikePath,
        optionalQuery: "?barcode=$barcode");
    Map jsonRes = jsonDecode(response.body);
    if (jsonRes["error"] == "wrong_barcode") {
      throw InvalidBarcodeException.init("Wrong Barcode!");
    }
    return jsonRes;
  }

  Future<Map> unlockBike(String barcode) async {
    var response = await DatabaseBoundary.get(unlockBikePath,
        optionalQuery: "?barcode=$barcode");
    Map jsonRes = jsonDecode(response.body);
    if (jsonRes["error"] == "wrong_barcode") {
      throw InvalidBarcodeException.init("Wrong Barcode!");
    }
    return jsonRes;
  }

  Future<Map> returnBikeToDock(Map request) async {
    var response = await DatabaseBoundary.post(returnToDockPath, request);
    Map jsonRes = jsonDecode(response.body);
    // TODO: throw exception
    return jsonRes;
  }

  Future<Map> unlockCard(int cardId) async {
    var response = await DatabaseBoundary.get(unlockCardPath,
        optionalQuery: "?cardId=$cardId");
    Map jsonRes = jsonDecode(response.body);
    // TODO: throw exception
    return jsonRes;
  }

  Future<Map> lockCard(int cardId) async {
    var response = await DatabaseBoundary.get(lockCardPath,
        optionalQuery: "?cardId=$cardId");
    Map jsonRes = jsonDecode(response.body);
    // TODO: throw exception
    return jsonRes;
  }

  Future<Map> searchOrCreateCard(Map card) async {
    var response = await DatabaseBoundary.post(searchOrCreateCardPath, card);
    return jsonDecode(response.body);
  }

  Future<Map> checkLockedCard(String cardCode) async {
    var response = await DatabaseBoundary.get(checkLockedCardPath,
        optionalQuery: "?cardCode=$cardCode");
    Map jsonRes = jsonDecode(response.body);
    if (jsonRes["isLock"] == true) {
      throw CardInUsedException.init("Cant find Rental Code!");
    }
    return jsonRes;
  }

  Future<Map> savePayment(Map payment) async {
    var response = await DatabaseBoundary.post(savePaymentPath, payment);
    return jsonDecode(response.body);
  }

  Future<Map> updatePayment(Map payment) async {
    var response = await DatabaseBoundary.post(updatePaymentPath, payment);
    return jsonDecode(response.body);
  }

  Future<Map> searchPayment(String rentalCode) async {
    Map body = {"rentalCode": "$rentalCode"};
    var response = await DatabaseBoundary.post(searchPaymentPath, body);
    Map jsonRes = jsonDecode(response.body);
    if (jsonRes["error"] == "cant_find_renting_payment") {
      throw WrongRentalCodeException.init("Cant find Rental Code!");
    }
    return jsonRes;

  }
}
