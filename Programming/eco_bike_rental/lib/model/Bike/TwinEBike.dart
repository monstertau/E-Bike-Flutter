import 'package:eco_bike_rental/model/Bike/Bike.dart';

class TwinEBike extends Bike {
  int _battery;

  @override
  String getBattery() {
    return "$_battery%";
  }

  TwinEBike.init(int id, String barcode, String color, String category,
      bool lock, int battery, int pedal, int saddle, int rear, String imagePath)
      : super.init(id, barcode, color, category, lock, pedal, saddle, rear,
            imagePath) {
    this._battery = battery;
    super.setAmount(700000, (10000 * 2).round(), (3000 * 2).round());
  }
}
