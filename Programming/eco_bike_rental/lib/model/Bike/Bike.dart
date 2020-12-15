import 'package:eco_bike_rental/model/DB/db_interface.dart';
import 'package:eco_bike_rental/model/DB/db_subsystem.dart';

class Bike {
  int _id;

  String _barcode;
  String _color;
  String _category;
  int _bikeValue;
  int _baseRentAmount;
  int _addRentAmount;
  bool _lock;
  DatabaseSubsystemInterface _database = new DatabaseSubsystem();

  Bike.newBike();

  Bike.init(this._id, this._barcode, this._color, this._category,
      this._bikeValue, this._baseRentAmount, this._addRentAmount, this._lock);

  Bike.newBarcode(this._barcode);

  int get id => _id;

  set id(int value) {
    _id = value;
  }

  String get barcode => _barcode;

  set barcode(String value) {
    _barcode = value;
  }

  String get color => _color;

  bool get lock => _lock;

  set lock(bool value) {
    _lock = value;
  }

  int get addRentAmount => _addRentAmount;

  set addRentAmount(int value) {
    _addRentAmount = value;
  }

  int get baseRentAmount => _baseRentAmount;

  set baseRentAmount(int value) {
    _baseRentAmount = value;
  }

  int get bikeValue => _bikeValue;

  set bikeValue(int value) {
    _bikeValue = value;
  }

  String get category => _category;

  set category(String value) {
    _category = value;
  }

  set color(String value) {
    _color = value;
  }

  Future<Bike> getBikeByBarcode(String barcode) async {
    Map res = await _database.getBikeByBarcode(barcode);
    Bike bike = new Bike.init(
        res["id"],
        res["barcode"],
        res["color"],
        res["category"],
        res["bikeValue"],
        res["baseRentAmount"],
        res["additionalRentAmount"],
        res["lock"]);
    return bike;
  }
}
