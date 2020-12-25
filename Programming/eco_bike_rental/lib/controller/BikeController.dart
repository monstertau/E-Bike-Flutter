import 'package:eco_bike_rental/services/Bike/bike_service.dart';

class BikeController {
  static BikeController _this;
  BikeService _bikeService = new BikeService();

  BikeController._();

  factory BikeController() {
    if (_this == null) _this = BikeController._();
    return _this;
  }

  Future<bool> unlockBike(String barcode) async =>
      await _bikeService.unlockBike(barcode);

  Future<bool> lockBike(String barcode) async =>
      await _bikeService.lockBike(barcode);

  Future<bool> returnBikeToDock(int dockId, int bikeId) async =>
      await _bikeService.returnBikeToDock(dockId, bikeId);
}
