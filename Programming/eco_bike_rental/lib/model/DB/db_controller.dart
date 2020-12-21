import 'dart:convert';
import 'package:eco_bike_rental/model/DB/db_boundary.dart';
import 'package:eco_bike_rental/utils/constants.dart';

class DatabaseSubsystemController {
  DatabaseBoundary _databaseBoundary = new DatabaseBoundary();

  Future<Map> getAllDock() async {
    var response = await _databaseBoundary.get(getAllDockPath);
    return jsonDecode(response.body);
  }

  Future<Map> getDetailDock(int dockId) async {
    var response = await _databaseBoundary.get(getDockDetailPath,
        optionalQuery: "?id=$dockId");
    return jsonDecode(response.body);
  }

  Future<Map> getBikeByBarcode(String barcode) async {
    var response = await _databaseBoundary.get(getBarcodeBikePath,
        optionalQuery: "?barcode=${barcode}");
    return jsonDecode(response.body);
  }

  Future<Map> checkLockedCard(String cardCode) async {
    var response = await _databaseBoundary.get(checkLockedCardPath,
        optionalQuery: "?cardCode=${cardCode}");
    return jsonDecode(response.body);
  }

  Future<Map> savePayment(Map payment) async {
    var response = await _databaseBoundary.post(savePaymentPath, payment);
    return jsonDecode(response.body);
  }

  Future<Map> updatePayment(Map payment) async {
    var response = await _databaseBoundary.post(updatePaymentPath, payment);
    return jsonDecode(response.body);
  }

  Future<Map> searchPayment(String rentalCode) async {
    Map body = {"rentalCode": "${rentalCode}"};
    var response = await _databaseBoundary.post(searchPaymentPath, body);
    return jsonDecode(response.body);
  }
}
