import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/Bike/EBike.dart';
import 'package:eco_bike_rental/model/Bike/StandardBike.dart';
import 'package:eco_bike_rental/model/Bike/TwinBike.dart';
import 'package:eco_bike_rental/model/Bike/TwinEBike.dart';

class BikeFactory {
  static Bike getBike(Map res) {
    switch (res["category"]) {
      case "Ebike":
        return EBike.init(res["id"], res["barcode"], res["color"],
            res["category"], res["lock"], res["battery"]);
      case "Standardbike":
        return StandardBike.init(res["id"], res["barcode"], res["color"],
            res["category"], res["lock"]);
      case "Twinbike":
        return TwinBike.init(res["id"], res["barcode"], res["color"],
            res["category"], res["lock"]);
      case "TwinEbike":
        return TwinEBike.init(res["id"], res["barcode"], res["color"],
            res["category"], res["lock"], res["battery"]);
      default:
        throw Exception("Cant find bike type");
    }
  }
}
