import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/DockStation/DockStation.dart';
import 'package:eco_bike_rental/model/Payment/Payment.dart';
import 'package:uuid/uuid.dart';

class RentingController {
  RentingController() {
    bikeModel = Bike.newBike();
    dockModel = DockStation.origin();
  }

  Bike bikeModel;
  DockStation dockModel;
  Payment paymentModel;

  Future<Bike> requestRentBike(String barcode) async {
    // TODO: implement this
    Bike bike = await bikeModel.getBikeByBarcode(barcode);
    return bike;
  }

  bool lockBike(Bike bike) {
    // TODO: implement this
    return false;
  }

  bool unlockBike(Bike bike) {
    // TODO: implement this
    return false;
  }

  Bike getRentedBikeInformation(String rentalCode) {

    return Bike.newBike();
  }

  List getAvailableDock() {
    // TODO: implement this
    return List();
  }

  bool requestReturnBike(DockStation dock) {
    // TODO: implement this
    return false;
  }

  void returnBike(DockStation dock, Bike bike) {
    // TODO: implement this
  }
  String generateRentalCode(){
    var uuid = Uuid();
    return uuid.v1();
  }
  int calculateRentingAmount(String startTime, String endTime) {
    // TODO: implement this
    DateTime start = DateTime.parse(startTime);
    DateTime end = DateTime.parse(endTime);
    end.difference(start);
    return 0;
  }

  double calculateDepositMoney(int baseRentAmount) {
    return baseRentAmount * 40 / 100;
  }

  DateTime setStartRentingTime(String time) {
    // TODO: implement this
    return DateTime.parse(time);
  }

  DateTime setEndRentingTime(String time) {
    // TODO: implement this
    return DateTime.parse(time);
  }
}
