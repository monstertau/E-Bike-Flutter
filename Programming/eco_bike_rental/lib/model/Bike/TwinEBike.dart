import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/Bike/BikeInfo.dart';

class TwinEBike extends Bike {
  int _battery;

  @override
  String showBattery() {
    return "$_battery%";
  }

  TwinEBike.init(
      int id, String category, BikeInfo bikeInfo, int battery, String imagePath)
      : super.init(id, category, bikeInfo, imagePath) {
    this._battery = battery;
  }
}
