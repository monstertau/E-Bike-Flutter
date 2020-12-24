import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/Bike/BikeFactory.dart';
import 'package:eco_bike_rental/model/DB/db_connection.dart';

class BikeService {
  factory BikeService() {
    if (_this == null) _this = BikeService._();
    return _this;
  }

  BikeService._();

  static BikeService _this;
  DatabaseConnection _database = new DatabaseConnection();

  Future<Bike> getBikeByBarcode(String barcode) async {
    Map res = await _database.getBikeByBarcode(barcode);
    Bike bike = BikeFactory.getBike(res);
    return bike;
  }

  Future<bool> lockBike(String barcode) async {
    bool res = await _database.lockBike(barcode);
    return res;
  }

  Future<bool> unlockBike(String barcode) async {
    bool res = await _database.unlockBike(barcode);
    return res;
  }

  Future<bool> returnBikeToDock(int dockId, int bikeId) async {
    Map request = {"dockId": dockId, "bikeId": bikeId};
    bool res = await _database.returnBikeToDock(request);
    return res;
  }
}
