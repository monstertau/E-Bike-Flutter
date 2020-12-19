import 'package:eco_bike_rental/model/DB/db_controller.dart';
import 'package:eco_bike_rental/utils/constants.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  DatabaseSubsystemController con = new DatabaseSubsystemController();

  test("Test Get All Dock", () async {
    var res = await con.getAllDock();
    logger.i(res);
  });
  test("Test Get Detail Dock", () async {
    var res = await con.getDetailDock(1);
    logger.i(res);
  });
  test("Test Bike By Barcode", () async {
    var res = await con.getBikeByBarcode("abcde");
    logger.i(res);
  });
  test("Test Payment By rentalCode", () async {
    var res = await con.searchPayment("rentalCode");
    logger.i(res);
  });
}
