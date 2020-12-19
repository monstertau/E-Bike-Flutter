import 'package:eco_bike_rental/controller/RentingController.dart';
import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/Payment/Payment.dart';
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
        expect(rentingController.calculateRentingTime(DateTime.parse(start), DateTime.parse(end)), expected);
      });
    });
  });
  group("Validate Set Start Renting Time", () {});
  group("Validate Set End Renting Time", () {});
  test("Get rented bike infomation ", () async {
    Payment payment =
        await rentingController.getRentedBikeInformation("28560dd0-4166-11eb-bc38-c3fcbddcbe31");
    print(payment);
  });
}
