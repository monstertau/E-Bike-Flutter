import 'package:eco_bike_rental/controller/BikeController.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Bike Controller Test', () {
    test('getBikeInfo test', () {
      // Setup
      BikeController bikeController = new BikeController();
      // Implement
      List actual = bikeController.getBikeInfo();
      // Verify
      expect(actual, new List());
    });
    test('getRentedBikeInfo test', () {
      // Setup
      BikeController bikeController = new BikeController();
      // Implement
      List actual = bikeController.getRentedBikeInfo();
      // Verify
      expect(actual, new List());
    });
    test('getBikeLockStatus test', () {
      // Setup
      BikeController bikeController = new BikeController();
      // Implement
      bool actual = bikeController.getBikeLockStatus();
      // Verify
      expect(actual, false);
    });
  });
}
