import 'package:eco_bike_rental/model/Bike/Bike.dart';

class EBike extends Bike {
  int _battery;

  int get battery => _battery;

  set battery(int value) {
    _battery = value;
  }

  EBike.init(int id, String barcode, String color, String category,
      int bikeValue, int baseRentAmount, int addRentAmount, bool lock)
      : super.init(id, barcode, color, category, bikeValue, baseRentAmount,
            addRentAmount, lock);
}
