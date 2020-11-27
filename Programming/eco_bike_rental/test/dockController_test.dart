import 'package:eco_bike_rental/controller/DockController.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Dock Controller Test', () {
    test('get all bikes test', () {
      // Setup
      DockController dockController = new DockController();
      // Implement
      List actual = dockController.getAllBikes();
      // Verify
      expect(actual, 1);
    });
    test('get all docks test', () {
      // Setup
      DockController dockController = new DockController();
      // Implement
      List actual = dockController.getAllDocks();
      // Verify
      expect(actual, new List());
    });
  });

}