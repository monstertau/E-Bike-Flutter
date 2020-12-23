import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
///Bike controller
class BikeController extends ControllerMVC {
  BikeController([StateMVC state]) : super(state) {
    bikeModel = Bike.newBike();
  }

  Bike bikeModel;
///get bike info
  List getBikeInfo() {
    // TODO: implement this
    // return bikeModel.lstInfo;
    return List();
  }
///get rented bike info
  List getRentedBikeInfo() {
    // TODO: implement this
    // return bikeModel.lstInfo;
    return List();
  }
///get bike lock status
  bool getBikeLockStatus() {
    // TODO: implement this
    // return bikeModel.lock;
    return bikeModel.lock;
  }
}
