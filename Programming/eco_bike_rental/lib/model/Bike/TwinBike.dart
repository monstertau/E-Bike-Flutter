import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/Bike/BikeInfo.dart';
///This class represents for [TwinBike] model
class TwinBike extends Bike {
  TwinBike.init(
      int id, String category, BikeInfo bikeInfo, String imagePath)
      : super.init(id, category, bikeInfo, imagePath);
}
