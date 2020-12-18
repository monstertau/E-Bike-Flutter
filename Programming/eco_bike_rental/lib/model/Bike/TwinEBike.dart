import 'package:eco_bike_rental/model/Bike/Bike.dart';

class TwinEBike extends Bike {
  int _battery;

  int get battery => _battery;

  TwinEBike.init(int id, String barcode, String color, String category,
      bool lock, int battery)
      : super.init(id, barcode, color, category, lock) {
    this._battery = battery;
    super.setAmount(700000, (10000 * 2).round(), (3000 * 2).round());
  }
}
