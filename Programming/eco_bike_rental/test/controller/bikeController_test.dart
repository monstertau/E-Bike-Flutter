import 'package:eco_bike_rental/common/exception/bike_exception.dart';
import 'package:eco_bike_rental/controller/BikeController.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Bike Controller Test', () {
    //Setup
    BikeController controller = new BikeController();
    test('Lock Bike test', () async {
      bool res;
      try {
        res = await controller.lockBike("12344");
      } catch (lockError) {
        expect(lockError, null);
      }
      expect(res, true);
    });
    test('Lock Bike Unsuccessful test', () async {
      bool res;
      try {
        res = await controller.lockBike("12300");
      } catch (lockError) {
        expect(lockError is InvalidBarcodeException,true);
      }
      expect(res, null);
    });
    test('Unlock Bike Successful test', () async {
      bool res;
      try {
        res = await controller.unlockBike("12344");
      } catch (unlockError) {
        expect(unlockError, null);
      }
      expect(res, true);
    });
    test('Unlock Bike Unsuccessful test', () async {
      bool res;
      try {
        res = await controller.unlockBike("12300");
      } catch (unlockError) {
        expect(unlockError is InvalidBarcodeException,true);
      }
      expect(res, null);
    });
    test('return bike to dock test', () async {
      bool res;
      try {
        res = await controller.returnBikeToDock(1, 1);
      } catch (returnError) {
        expect(returnError, null);
      }
      expect(res, true);
    });

  });
}
