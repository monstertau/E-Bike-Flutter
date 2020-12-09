import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/DB/db_interface.dart';
import 'package:eco_bike_rental/utils/constants.dart';

class DockStation {
  int id;
  String _dockName;
  String _dockArea;
  int _dockSize;
  String _dockAddress;
  List<Bike> _lstBike;

  int get dockID => id;

  DockStation.origin();

  DockStation(this.id, this._dockName, this._dockArea, this._dockAddress,
      this._dockSize) {
    this._lstBike = new List<Bike>();
  }

  String get dockName => _dockName;

  set dockName(String value) {
    _dockName = value;
  }

  String get dockArea => _dockArea;

  String get dockAddress => _dockAddress;

  set dockAddress(String value) {
    _dockAddress = value;
  }

  int get dockSize => _dockSize;

  set dockSize(int value) {
    _dockSize = value;
  }

  set dockArea(String value) {
    _dockArea = value;
  }

  List<Bike> get lstBike => _lstBike;

  set lstBike(List<Bike> value) {
    _lstBike = value;
  }

  void addBike(Bike bike) {
    this._lstBike.add(bike);
  }

  DockStation getDockById(int id) {
    // TODO: fix this
    List<Bike> aListBike = new List<Bike>();
    return new DockStation(123, 'abc', '12x12', 'abc123', 23);
  }

  Future<List> getAllDock() async {
    // TODO: implement this
    List lstDock = new List<DockStation>();

  }
}
