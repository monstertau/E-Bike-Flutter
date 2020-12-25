import 'package:eco_bike_rental/model/Bike/BikeInfo.dart';
///This class represents the model of [Bike] entity
class Bike {
///Id of bike, example: 123456
  int _id;
  ///Category of bike: samples: [TwinBike], [TwinEBike], [Ebike]
  String _category;
  ///Path to image directory
  String _imagePath;
  ///Information of [Bike] entity
  BikeInfo bikeInfo;

  Bike.init(this._id, this._category, this.bikeInfo,this._imagePath);

  int get id => _id;
  String get category => _category;

  String get imagePath => _imagePath;
  String showBattery() {
    return "None";
  }
}
