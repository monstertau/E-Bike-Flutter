import 'package:eco_bike_rental/model/Bike/Bike.dart';
///This class represents the model of [DockStation]
class DockStation {
  ///Dock station id
  int id;
  ///Dock station name
  String _dockName;
  ///Dock station area, example: 100x200
  String _dockArea;
  ///Dock station size, example: 23
  int _dockSize;
  ///Dock station address, samples: hanoi, HCM, ...
  String _dockAddress;
  ///Available status: available or not
  String _available;
///List<Bike>
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
