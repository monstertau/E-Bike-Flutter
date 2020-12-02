import 'package:eco_bike_rental/controller/RentingController.dart';
import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:test/test.dart';

void main() {
  RentingController rentingController = new RentingController();
  group("Validate Calculate Renting Amount", () {
    var testMap = [
      {"2020-02-17 19:27:00", "2020-02-17 19:28:00", 0},
      {"2020-02-17 19:27:00", "2020-02-16 19:28:00", 0},
      {"2020-02-17 19:27:00", "2020-02-17 20:30:00", 0},
      {"2020-02-17 19:27:00", "2020-02-17 19:58:00", 0},
      {"2020-02-17 19:27:00", "2020-02-17 20:30:00", 0},
    ];
    testMap.forEach((element) {
      test("Test $element", () {
        String start = element.elementAt(0);
        String end = element.elementAt(1);
        int expected = element.elementAt(2);
        expect(rentingController.calculateRentingAmount(start, end), expected);
      });
    });
  });
  group("Validate Lock Bike", () {
    var bikelst = [
      {Bike.init(1, "23", "ab", "test", 200000, 20000, 10000, true), false},
      {Bike.init(2, "23", "ab", "test", 200000, 20000, 10000, false), true},
    ];
    bikelst.forEach((item) {
      test("Test Lock Bike", () {
        expect(
            rentingController.lockBike(item.elementAt(0)), item.elementAt(1));
      });
    });
  });
  group("Validate Set Start Renting Time", () {

  });
  group("Validate Set End Renting Time", () {});
}
