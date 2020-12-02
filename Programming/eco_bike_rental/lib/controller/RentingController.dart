import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/DockStation/DockStation.dart';
import 'package:eco_bike_rental/model/Payment/Payment.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class RentingController extends ControllerMVC {
  RentingController([StateMVC state]) : super(state) {
    bikeModel = Bike.newBike();
    dockModel = DockStation.origin();
    paymentModel = Payment();
  }

  Bike bikeModel;
  DockStation dockModel;
  Payment paymentModel;

  bool requestRentBike(String barcode) {
    // TODO: implement this
    return false;
  }

  void rentBike() {
    // TODO: implement this
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
    // TODO: implement this
    return Bike.newBike();
  }

  List getAvailableDock() {
    // TODO: implement this
    return List();
  }

  bool requestReturnBike(Bike bike) {
    // TODO: implement this
    return false;
  }

  void returnBike(DockStation dock, Bike bike) {
    // TODO: implement this
  }

  int calculateRentingAmount(String startTime, String endTime) {
    // TODO: implement this
    DateTime start = DateTime.parse(startTime);
    DateTime end = DateTime.parse(endTime);
    end.difference(start);
    return 0;
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
