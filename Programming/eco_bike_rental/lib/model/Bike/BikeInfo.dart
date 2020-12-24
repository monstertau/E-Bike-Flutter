class BikeInfo {
  int _saddle;
  int _pedal;
  int _rear;
  int _bikeValue;
  int _baseRentAmount;
  int _addRentAmount;
  String _barcode;
  String _color;
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
