import 'package:eco_bike_rental/controller/DockController.dart';
import 'package:eco_bike_rental/model/DB/db_connection.dart';
import 'package:eco_bike_rental/model/DockStation/DockStation.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Dock Controller Test', () {
    //Example invalid data
    //End example data
    // Setup
    final DatabaseConnection database = new DatabaseConnection();

    test('get all bikes test', () async {
      // Setup
      DockController dockController = new DockController();
      List<DockStation> lstDock = await dockController.getAllDocks();

      lstDock.forEach((element) async {
        var expected = element.lstBike;
        var actual = await dockController.getAllBikes(element);
        expect(actual, expected);
      });
    });

    test('get all docks test', () async {
      // Setup
      List expected, actual;
      DockController dockController = new DockController();
      // Implement
      try {
        expected = await database.getAllDock();
        actual = await dockController.getAllDocks();
      } catch (e) {
        expect(e, null);
      }
      // Verify
      expect(actual.length, expected.length);
    });
  });
}
