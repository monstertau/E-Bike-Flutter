import 'dart:convert';

import 'package:eco_bike_rental/model/DB/db_boundary.dart';
import 'package:eco_bike_rental/utils/constants.dart';

class DatabaseSubsystemController {
  DatabaseBoundary _databaseBoundary = new DatabaseBoundary();

  Future<Map> getAllDock() async {
    var response = await _databaseBoundary.get(getAllDockPath);
    return jsonDecode(response.body);
  }

  Future<Map> getDetailDock(String dockId) async {
    var response = await _databaseBoundary.get(getDockDetailPath,
        optionalQuery: "?id=${dockId}");
    return jsonDecode(response.body);
  }

  Future<Map> getBike(int id) async {
    Map response = {
      "success": true,
      "bike": {
        "id": 1,
        "barcode": "abcde",
        "color": "red",
        "category": "EBike",
        "bikeValue": 200000,
        "baseRentAmount": 20000,
        "additionalRentAmount": 1000,
        "lock": true
      },
    };
    return response;
  }
}
