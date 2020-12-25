import 'package:eco_bike_rental/model/Bike/Bike.dart';

class DockStation {
  int id;
  String _dockName;
  String _dockArea;
  int _dockSize;
  String _dockAddress;
  String _available;

  List<Bike> _lstBike;
  DockStation.origin();

  DockStation(this.id, this._dockName, this._dockArea, this._dockAddress,
      this._dockSize, this._available) {
    this._lstBike = new List<Bike>();
  }

  int get dockID => id;

  String get available => _available;

  String get dockName => _dockName;

  String get dockArea => _dockArea;

  String get dockAddress => _dockAddress;

  int get dockSize => _dockSize;

  List<Bike> get lstBike => _lstBike;

  void addBike(Bike bike) {
    this._lstBike.add(bike);
  }

}
