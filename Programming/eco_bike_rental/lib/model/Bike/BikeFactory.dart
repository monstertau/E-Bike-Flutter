import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/Bike/BikeInfo.dart';
import 'package:eco_bike_rental/model/Bike/EBike.dart';
import 'package:eco_bike_rental/model/Bike/StandardBike.dart';
import 'package:eco_bike_rental/model/Bike/TwinBike.dart';
import 'package:eco_bike_rental/model/Bike/TwinEBike.dart';

class BikeFactory {
  static Bike getBike(Map res) {
    BikeInfo bikeInfo = new BikeInfo(
        res["saddle"],
        res["pedal"],
        res["rear"],
        res["bikevalue"],
        res["baserentamount"],
        res["addrentamount"],
        res["barcode"],
        res["color"],
        res["lockbike"]);

    switch (res["category"]) {
      case "Ebike":
        return EBike.init(res["id"], "E-Bike", bikeInfo, res["battery"],
            "lib/assets/images/electricbike.jpg");
      case "Standardbike":
        return StandardBike.init(res["id"], "Standard Bike", bikeInfo,
            "lib/assets/images/standardbike.jpg");
      case "Twinbike":
        return TwinBike.init(
            res["id"], "Twin Bike", bikeInfo, "lib/assets/images/twinbike.jpg");
      case "TwinEbike":
        return TwinEBike.init(res["id"], "Twin E-Bike", bikeInfo,
            res["battery"], "lib/assets/images/twinebike.jpg");
      default:
        throw Exception("Cant find bike type");
    }
  }
}
