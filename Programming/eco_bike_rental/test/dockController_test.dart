import 'package:eco_bike_rental/controller/DockController.dart';
import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/DockStation/DockStation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Dock Controller Test', () {
    //Example invalid data

    //End example data

    test('get all bikes test', () {
      // Setup
      List expected = List();
      DockController dockController = new DockController();
      // Implement
      List actual = dockController.getAllBikes(123);
      // Verify
      expect(actual, expected);
    });
    test('get all docks test', () {
      // Setup
      List expected = List();
      DockController dockController = new DockController();
      // Implement
      List actual = dockController.getAllDocks();
      // Verify
      expect(actual, expected);
    });
  });

}