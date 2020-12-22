import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/Bike/EBike.dart';
import 'package:eco_bike_rental/model/Bike/StandardBike.dart';
import 'package:eco_bike_rental/model/Bike/TwinBike.dart';
import 'package:eco_bike_rental/model/Bike/TwinEBike.dart';

class BikeFactory {
  static Bike getBike(Map res) {
    switch (res["category"]) {
      case "Ebike":
        return EBike.init(res["id"], res["barcode"], res["color"], "Electric",
            res["lockbike"], res["battery"], 1, 1, 1);
      case "Standardbike":
        return StandardBike.init(res["id"], res["barcode"], res["color"],
            "Standard", res["lockbike"], 1, 1, 1);
      case "Twinbike":
        return TwinBike.init(res["id"], res["barcode"], res["color"], "Twin",
            res["lockbike"], 2, 2, 1);
      case "TwinEbike":
        return TwinEBike.init(res["id"], res["barcode"], res["color"],
            "Twin Electric", res["lockbike"], res["battery"], 2, 2, 1);
      default:
        throw Exception("Cant find bike type");
    }
  }
}
