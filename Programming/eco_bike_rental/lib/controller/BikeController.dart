import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:mvc_pattern/mvc_pattern.dart';
///This [BikeController] maintain all the logical business related to [Bike]
///* connecting with the database and retrieving information
///* return necessary information to display in the view
class BikeController extends ControllerMVC {
  BikeController([StateMVC state]) : super(state) {
    bikeModel = Bike.newBike();
  }

  Bike bikeModel;
///Get bike info
  List getBikeInfo() {
    // TODO: implement this
    // return bikeModel.lstInfo;
    return List();
  }
///Get rented bike info
  List getRentedBikeInfo() {
    // TODO: implement this
    // return bikeModel.lstInfo;
    return List();
  }
///Get bike lock status
  bool getBikeLockStatus() {
    // TODO: implement this
    // return bikeModel.lock;
    return bikeModel.lock;
  }
}
