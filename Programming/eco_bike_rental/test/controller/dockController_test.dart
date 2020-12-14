import 'package:eco_bike_rental/controller/DockController.dart';
import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/DB/db_interface.dart';
import 'package:eco_bike_rental/model/DB/db_subsystem.dart';
import 'package:eco_bike_rental/model/DockStation/DockStation.dart';
import 'package:eco_bike_rental/utils/constants.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {

  group('Dock Controller Test', () {
    //Example invalid data
    //End example data
    final DatabaseSubsystemInterface database = new DatabaseSubsystem();
    test('get all bikes test', ()  {
      // Setup
      DockController dockController = new DockController();
      // Implement
      var expected =  database.getDetailDock(1);
      Future<List<dynamic>> actual = dockController.getAllBikes(1);
      // Verify
      expect(actual, expected);
    });
    test('get all docks test', () async {
      // Setup
      List expected = List<DockStation>();
      DockController dockController = new DockController();
      // Implement
      var actual = await dockController.getAllDocks();
      // Verify
      expect(actual, expected);
    });
  });

}