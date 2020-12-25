import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/services/Bike/bike_service.dart';
///This [BikeController] handles all the business logic related to [Bike] entity.
///* Manipulate data returned in services package and send to the view in MVC model
///* Accompany with services package, it plays the role of controller in MVC model
class BikeController {
  static BikeController _this;
  BikeService _bikeService = new BikeService();

  BikeController._();

  factory BikeController() {
    if (_this == null) _this = BikeController._();
    return _this;
  }
///Unlock bike
  ///* Input: barcode
  ///* Output: bike unlocked
  Future<bool> unlockBike(String barcode) async =>
      await _bikeService.unlockBike(barcode);
///Lock bike
  ///* Input: barcode
  ///* Output: bike locked
  Future<bool> lockBike(String barcode) async =>
      await _bikeService.lockBike(barcode);
///Return Bike to dock station
  ///* Input: dockID, bikeID
  ///* Output: bike returned to dock station
  Future<bool> returnBikeToDock(int dockId, int bikeId) async =>
      await _bikeService.returnBikeToDock(dockId, bikeId);
}
