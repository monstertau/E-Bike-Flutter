import 'package:eco_bike_rental/model/Bike/Bike.dart';

class StandardBike extends Bike {
  StandardBike.init(
      int id, String barcode, String color, String category, bool lock)
      : super.init(id, barcode, color, category, lock) {
    super.setAmount(400000, 10000, 3000);
  }
}
