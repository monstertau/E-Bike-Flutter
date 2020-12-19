import 'package:eco_bike_rental/model/Bike/Bike.dart';

class TwinBike extends Bike {
  TwinBike.init(int id, String barcode, String color, String category,
       bool lock)
      : super.init(id, barcode, color, category, lock){
    super.setAmount(550000, (10000 * 1.5).round(), (3000 * 1.5).round());
  }
}
