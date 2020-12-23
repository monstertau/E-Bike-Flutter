import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/Bike/EBike.dart';
import 'package:eco_bike_rental/model/Bike/StandardBike.dart';
import 'package:eco_bike_rental/model/Bike/TwinBike.dart';
import 'package:eco_bike_rental/model/Bike/TwinEBike.dart';

class BikeFactory {
  static Bike getBike(Map res) {
    switch (res["category"]) {
      case "Ebike":
        return EBike.init(res["id"], res["barcode"], res["color"], "E-Bike",
            res["lockbike"], res["battery"], 1, 1, 1,"lib/assets/images/electricbike.jpg");
      case "Standardbike":
        return StandardBike.init(res["id"], res["barcode"], res["color"],
            "Standard Bike", res["lockbike"], 1, 1, 1,"lib/assets/images/standardbike.jpg");
      case "Twinbike":
        return TwinBike.init(res["id"], res["barcode"], res["color"], "Twin Bike",
            res["lockbike"], 2, 2, 1,"lib/assets/images/twinbike.jpg");
      case "TwinEbike":
        return TwinEBike.init(res["id"], res["barcode"], res["color"],
            "Twin E-Bike", res["lockbike"], res["battery"], 2, 2, 1,"lib/assets/images/twinebike.jpg");
      default:
        throw Exception("Cant find bike type");
    }
  }
}
