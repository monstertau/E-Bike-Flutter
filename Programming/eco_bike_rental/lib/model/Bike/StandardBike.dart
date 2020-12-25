import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/Bike/BikeInfo.dart';

class StandardBike extends Bike {
  StandardBike.init(
      int id, String category, BikeInfo bikeInfo, String imagePath)
      : super.init(id, category, bikeInfo, imagePath);
}
