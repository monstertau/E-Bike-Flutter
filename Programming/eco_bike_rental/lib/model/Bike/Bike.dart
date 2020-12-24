import 'package:eco_bike_rental/model/Bike/BikeInfo.dart';

class Bike {
  int _id;
  String _category;
  String _imagePath;

  BikeInfo bikeInfo;


  Bike.newBike();

  Bike.init(this._id, this._category, this.bikeInfo,this._imagePath);

  int get id => _id;
  String get category => _category;

  String get imagePath => _imagePath;
  String showBattery() {
    return "None";
  }
}
