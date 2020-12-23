import 'package:eco_bike_rental/model/Bike/Bike.dart';
///standard bike model
class StandardBike extends Bike {
  StandardBike.init(int id, String barcode, String color, String category,
      bool lock, int pedal, int saddle, int rear, String imagePath)
      : super.init(id, barcode, color, category, lock, pedal, saddle, rear,
            imagePath) {
    super.setAmount(400000, 10000, 3000);
  }
}
