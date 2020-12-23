import 'package:eco_bike_rental/model/Bike/Bike.dart';

class TwinBike extends Bike {
  TwinBike.init(int id, String barcode, String color, String category,
      bool lock, int pedal, int saddle, int rear, String imagePath)
      : super.init(id, barcode, color, category, lock, pedal, saddle, rear,
            imagePath) {
    super.setAmount(550000, (10000 * 1.5).round(), (3000 * 1.5).round());
  }
}
