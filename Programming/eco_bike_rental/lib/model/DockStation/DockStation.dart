import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/DB/db_interface.dart';
import 'package:eco_bike_rental/model/DB/db_subsystem.dart';
import 'package:eco_bike_rental/utils/constants.dart';

class DockStation {
  int id;
  String _dockName;
  String _dockArea;
  int _dockSize;
  String _dockAddress;
  String _available;

  List<Bike> _lstBike;

  final DatabaseSubsystemInterface database = new DatabaseSubsystem();

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

  set lstBike(List<Bike> value) {
    _lstBike = value;
  }

  void addBike(Bike bike) {
    this._lstBike.add(bike);
  }

  DockStation getDockById(int id) {
    // // TODO: fix this
    // List<Bike> aListBike = new List<Bike>();
    // return new DockStation(123, 'abc', '12x12', 'abc123', 23);
  }

  Future<List> getAllDock() async {
    // TODO: implement this
    List lstDock = new List<DockStation>();
    List dbDocks = await database.getAllDock();
    for (Map dbDock in dbDocks) {
      DockStation dock = new DockStation(
          dbDock["id"],
          dbDock["name"],
          dbDock["area"],
          dbDock["address"],
          dbDock["size"],
          dbDock["available"]);
      lstDock.add(dock);
    }
    return lstDock;
  }
}
