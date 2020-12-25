import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/DockStation/DockStation.dart';
import 'package:eco_bike_rental/services/DockStation/dock_station_service.dart';

///This [DockController] handles all the business logic related to [DockStation] entity.
///* Manipulate data returned in services package and send to the view in MVC model
///* Accompany with services package, it plays the role of controller in MVC model
class DockController {
  static DockController _this;
  DockStationService _dockStationService = new DockStationService();

  DockController._();
  ///Create a singleton [DockController] instance
  factory DockController() {
    if (_this == null) _this = DockController._();

    return _this;
  }

  ///Method for getting all bikes in dock by dockID
  ///* Input: dock station entity
  ///* Output: List<Bike> in dock station entity
  Future<List<Bike>> getAllBikes(DockStation dockStation) async {
    // TODO: implement this
    DockStation dock = await _dockStationService.getBikeInDock(dockStation);

    return dock.lstBike;
  }

  ///Method for getting all dock stations
  ///* Input: none
  ///* Output: List<DockStation>
  Future<List<DockStation>> getAllDocks() async {
    // TODO: implement this
    // return dock.getAllDock();
    List docks = await _dockStationService.getAllDock();
    return docks;
  }
}
