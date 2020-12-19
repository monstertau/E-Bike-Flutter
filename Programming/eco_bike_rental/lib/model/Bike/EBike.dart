import 'package:eco_bike_rental/model/Bike/Bike.dart';

class EBike extends Bike {
  int _battery;

  int get battery => _battery;

  set battery(int value) {
    _battery = value;
  }

  EBike.init(int id, String barcode, String color, String category, bool lock,
      int battery)
      : super.init(id, barcode, color, category, lock) {
    this._battery = battery;
    super.setAmount(700000, (10000 * 1.5).round(), (3000 * 1.5).round());
  }
}
