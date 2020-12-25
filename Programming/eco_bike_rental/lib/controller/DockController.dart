import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/DockStation/DockStation.dart';
import 'package:eco_bike_rental/services/DockStation/dock_station_service.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

///
class DockController {
  static DockController _this;
  DockStationService _dockStationService = new DockStationService();

  DockController._();

  factory DockController() {
    if (_this == null) _this = DockController._();

    return _this;
  }

  ///method for getting all bikes in dock by dockID
  Future<List<Bike>> getAllBikes(DockStation dockStation) async {
    // TODO: implement this
    DockStation dock = await _dockStationService.getBikeInDock(dockStation);

    return dock.lstBike;
  }

  ///method for getting all docks
  Future<List<DockStation>> getAllDocks() async {
    // TODO: implement this
    // return dock.getAllDock();
    List docks = await _dockStationService.getAllDock();
    return docks;
  }
}
