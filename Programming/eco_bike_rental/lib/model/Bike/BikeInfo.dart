///This class represents the model of [BikeInfo] class which shows bike's information
class BikeInfo {
  ///Bike saddle
  int _saddle;
  ///Bike pedal
  int _pedal;
  ///Bike rear
  int _rear;
  ///Bike value
  int _bikeValue;
  ///Basic rent amount user have to pay
  int _baseRentAmount;
  ///Basic add amount per hour(after an amount of tinme) user have to pay
  int _addRentAmount;
  ///Barcode, example: abc123
  String _barcode;
  ///Color, example: black, white, ...
  String _color;
  ///Locking status: locked or unlocked
  bool _lock;

  BikeInfo(
      this._saddle,
      this._pedal,
      this._rear,
      this._bikeValue,
      this._baseRentAmount,
      this._addRentAmount,
      this._barcode,
      this._color,
      this._lock);

  int get saddle => _saddle;

  int get pedal => _pedal;

  bool get lock => _lock;

  String get color => _color;

  String get barcode => _barcode;

  int get addRentAmount => _addRentAmount;

  int get baseRentAmount => _baseRentAmount;

  int get bikeValue => _bikeValue;


  int get rear => _rear;
}
