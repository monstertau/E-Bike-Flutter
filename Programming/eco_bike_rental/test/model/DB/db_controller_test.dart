import 'package:eco_bike_rental/common/exception/bike_exception.dart';
import 'package:eco_bike_rental/model/DB/db_controller.dart';
import 'package:eco_bike_rental/utils/constants.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  DatabaseConnectionController con = new DatabaseConnectionController();

  test("Test Get All Dock", () async {
    var res = await con.getAllDock();
    logger.i(res);
  });
  test("Test Get Detail Dock", () async {
    var res = await con.getDetailDock(1);
    logger.i(res);
  });
  test("Test Bike By Barcode", () async {
    try {
      var res = await con.getBikeByBarcode("abcde");
    } on InvalidBarcodeException {
      print("Invalid Barcode");
    }
  });
  test("Test Payment By rentalCode", () async {
    var res = await con.searchPayment("rentalCode");
    logger.i(res);
  });
  test("Test Lock Bike", () async {
    var res = await con.lockBike("12345");
    logger.i(res);
  });
  test("Test Unlock Bike", () async {
    var res = await con.unlockBike("12345");
    logger.i(res);
  });
  test("Test Lock Card", () async {
    var res = await con.lockCard(5);
    logger.i(res);
  });
  test("Test Unlock Card", () async {
    var res = await con.unlockCard(5);
    logger.i(res);
  });
  test("Test Search Or Create Card", () async {
    Map card = {
      "cardCode": "121319_group1_2020",
      "cardName": "Group 1",
      "dateExpired": "1125",
      "cvvCode": "323"
    };
    var res = await con.searchOrCreateCard(card);
    logger.i(res);
  });
  test("Test return bike to dock", () async {
    Map request = {"dockId": 1, "bikeId": 7};
    var res = await con.returnBikeToDock(request);
    logger.i(res);
  });
}
