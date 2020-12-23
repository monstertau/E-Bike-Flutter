import 'package:eco_bike_rental/model/Bike/BikeFactory.dart';
import 'package:eco_bike_rental/model/DB/db_interface.dart';
import 'package:eco_bike_rental/model/DB/db_subsystem.dart';
///Bike model
class Bike {
  int _id;
  int _saddle;
  int _pedal;
  int _rear;
  String _imagePath;

  String _barcode;
  String _color;
  String _category;
  int _bikeValue;
  int _baseRentAmount;
  int _addRentAmount;
  bool _lock;

  DatabaseSubsystemInterface _database = new DatabaseSubsystem();

  Bike.newBike();

  Bike.init(this._id, this._barcode, this._color, this._category, this._lock,
      this._pedal, this._saddle, this._rear, this._imagePath);

  ///set basic value for bike renting
  void setAmount(int bikeValue, int baseRentAmount, int addRentAmount) {
    this._bikeValue = bikeValue;
    this._baseRentAmount = baseRentAmount;
    this._addRentAmount = addRentAmount;
  }

  int get id => _id;

  int get pedal => _pedal;

  int get rear => _rear;

  int get saddle => _saddle;

  String get barcode => _barcode;

  String get color => _color;

  bool get lock => _lock;

  int get addRentAmount => _addRentAmount;

  int get baseRentAmount => _baseRentAmount;

  int get bikeValue => _bikeValue;

  String get category => _category;

  String get imagePath => _imagePath;

  String getBattery() {
    return "None";
  }
///get bike by barcode
  Future<Bike> getBikeByBarcode(String barcode) async {
    Map res = await _database.getBikeByBarcode(barcode);
    Bike bike = BikeFactory.getBike(res);
    return bike;
  }
}
