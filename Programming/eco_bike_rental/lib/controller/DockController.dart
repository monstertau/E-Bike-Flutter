import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/DockStation/DockStation.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

///This [DockController] maintain all the logical business related to [DockStation]
///* connecting with the database and retrieving information
///* return necessary information to display in the view
class DockController extends ControllerMVC {
  DockStation dockModel;

  DockController([StateMVC state]) : super(state) {
    dockModel = DockStation.origin();
  }

///method for validate attributes in listBike
  bool validateListBike(List<Bike> listBike) {

    listBike.forEach((element) {
      if (element.id == null)
        return false;
      else if (!(element.id is int)) return false;

      if (element.barcode == null)
        return false;
      else if (!(element.barcode is String)) return false;

      if (element.color == null)
        return false;
      else if (!(element.color is String)) return false;

      if (element.category == null)
        return false;
      else if (!(element.category is String)) return false;

      if (element.bikeValue == null)
        return false;
      else if (!(element.bikeValue is int)) return false;

      if (element.baseRentAmount == null)
        return false;
      else if (!(element.baseRentAmount is int)) return false;

      if (element.addRentAmount == null)
        return false;
      else if (!(element.addRentAmount is int)) return false;

      if (element.lock == null)
        return false;
      else if (!(element.lock is bool)) return false;
    });
    return true;
  }

  ///Method for validate attributes in listDock
  bool validateListDock(List<DockStation> listDock) {
    listDock.forEach((element) {
      if (element.id == null)
        return false;
      else if (!(element.id is int)) return false;

      if (element.dockName == null)
        return false;
      else if (!(element.dockName is String)) return false;

      if (element.dockArea == null)
        return false;
      else if (!(element.dockArea is String)) return false;

      if (element.dockSize == null)
        return false;
      else if (!(element.dockSize is int)) return false;

      if (element.dockAddress == null)
        return false;
      else if (!(element.dockAddress is String)) return false;

      if (element.lstBike == null)
        return false;
      else if (!(element.lstBike is List<Bike>)) return false;
    });
    return true;
  }

  ///Method for getting all bikes in dock by dockID
  Future<List<Bike>> getAllBikes(int dockID) async {
    // TODO: implement this
    DockStation dock = await dockModel.getBikeInDock(dockID);
    return dock.lstBike;
  }
  ///Method for getting all docks
  Future<List<DockStation>> getAllDocks() async {
    // TODO: implement this
    // return dock.getAllDock();
    List docks = await dockModel.getAllDock();
    return docks;
  }
}
