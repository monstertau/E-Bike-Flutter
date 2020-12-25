import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/Bike/BikeInfo.dart';
///This class represents for [EBike] model
class EBike extends Bike {
  ///Battery
  int _battery;

  @override
  String showBattery() {
    return "$_battery%";
  }

  EBike.init(
      int id, String category, BikeInfo bikeInfo, int battery, String imagePath)
      : super.init(id, category, bikeInfo, imagePath) {
    this._battery = battery;
  }
}
