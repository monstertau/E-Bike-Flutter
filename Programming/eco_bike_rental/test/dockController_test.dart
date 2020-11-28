import 'package:eco_bike_rental/controller/DockController.dart';
import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/DockStation/DockStation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Dock Controller Test', () {
    //Example invalid data
    Object invalidBikeObject;
    invalidBikeObject = {'abc',123};
    List<Bike> listBikeNull;
    List<Object> invalidListBike;
    invalidListBike.add(invalidBikeObject);
    List<DockStation> listDockNull;
    //End example data

    test('get all bikes test', () {
      // Setup
      DockController dockController = new DockController();
      // Implement
      List actual = dockController.getAllBikes(909);
      // Verify
      expect(actual, invalidListBike);
    });
    test('get all docks test', () {
      // Setup
      DockController dockController = new DockController();
      // Implement
      List actual = dockController.getAllDocks();
      // Verify
      expect(actual, listDockNull);
    });
  });

}