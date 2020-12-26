import 'package:eco_bike_rental/controller/RentingController.dart';
import 'package:eco_bike_rental/model/Payment/Payment.dart';
import 'package:test/test.dart';

void main() {
  RentingController rentingController = new RentingController();
  group("Validate Calculate Renting Amount", () {
    var testMap = [
      {Duration(minutes: 1), 3000, 0},
      {Duration(minutes: 10), 3000, 0},
      {Duration(minutes: 30), 3000, 10000},
      {Duration(minutes: 35), 4000, 14000},
      {Duration(hours: 1), 4500, 19000},
      {Duration(hours: 5, minutes: 33), 3000, 73000},
    ];
    testMap.forEach((element) {
      test("Test $element", () {
        int expected = element.elementAt(2);
        int addRentAmount = element.elementAt(1);
        expect(
            rentingController.calculateRentingAmount(
                element.elementAt(0), 10000, addRentAmount),
            expected);
      });
    });
  });
}
