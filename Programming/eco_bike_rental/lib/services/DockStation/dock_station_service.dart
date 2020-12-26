import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/Bike/BikeFactory.dart';
import 'package:eco_bike_rental/model/DB/db_connection.dart';
import 'package:eco_bike_rental/model/DockStation/DockStation.dart';
///Each of the services in this package handles the task of connecting with the server or database
/// and does the logic of retrieving and getting data
///* Request data from server and send responds to the controller
///* Retrieve data for manipulating
///This is class for services related to [DockStation]
class DockStationService {
  factory DockStationService() {
    if (_this == null) _this = DockStationService._();
    return _this;
  }

  DockStationService._();

  static DockStationService _this;
  DatabaseConnection _database = new DatabaseConnection();

  Future<DockStation> getBikeInDock(DockStation dockStation) async {
    if (dockStation.lstBike.length == 0) {
      List dbBikes = await _database.getDetailDock(dockStation.id);
      for (Map dbBike in dbBikes) {
        Bike bike = BikeFactory.getBike(dbBike);

        dockStation.addBike(bike);
      }
    }
    return dockStation;
  }

  Future<List> getAllDock() async {
    List lstDock = new List<DockStation>();
    List dbDocks = await _database.getAllDock();
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
