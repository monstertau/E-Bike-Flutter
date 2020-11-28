import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/DockStation/DockStation.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class RentingController extends ControllerMVC {
  RentingController([StateMVC state]) : super(state) {
    bikeModel = Bike.newBike();
    dockModel = DockStation();
  }

  Bike bikeModel;
  DockStation dockModel;

  bool requestRentBike(String barcode) {
    // TODO: implement this
    return false;
  }

  void rentBike() {
    // TODO: implement this
  }

  bool lockBike(String rentalCode) {
    // TODO: implement this
    return false;
  }

  bool unlockBike(String rentalCode) {
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

  bool requestReturnBike(String rentalCode) {
    // TODO: implement this
    return false;
  }

  void returnBike(DockStation dock, Bike bike) {
    // TODO: implement this
  }

  int calculateRentingAmount(String rentalCode) {
    // TODO: implement this
    return 0;
  }
}
