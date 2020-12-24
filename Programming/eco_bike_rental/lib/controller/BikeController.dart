import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class BikeController {
  BikeController() {
    bikeModel = Bike.newBike();
  }

  Bike bikeModel;

  List getBikeInfo() {
    // TODO: implement this
    // return bikeModel.lstInfo;
    return List();
  }

  List getRentedBikeInfo() {
    // TODO: implement this
    // return bikeModel.lstInfo;
    return List();
  }

  bool getBikeLockStatus() {
    // TODO: implement this
    // return bikeModel.lock;
    return bikeModel.bikeInfo.lock;
  }
}
