import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/DockStation/DockStation.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class DockController extends ControllerMVC {
  DockStation dockModel;

  DockController([StateMVC state]) : super(state) {
    dockModel = DockStation.origin();
  }

  //must return a list<object>
  //foreach.split()
  // class Bike {
  // int _id;
  //
  // String _barcode;
  // String _color;
  // String _category;
  // int _bikeValue;
  // int _baseRentAmount;
  // int _addRentAmount;
  // bool _lock;
  bool validateListBike(List<Bike> listBike) {
    // bo di nhe,
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

  // class DockStation {
  // int id;
  // String _dockName;
  // String _dockArea;
  // int _dockSize;
  // String _dockAddress;
  // List<Bike> _lstBike;
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

  List getAllBikes(int dockID) {
    // TODO: implement this
    DockStation dock = dockModel.getDockById(dockID);
    return dock.lstBike;
    // return dockModel.lstBike;
    // List<String> dockStations = dockModel.getAllDock();
    // DockStation aDock = new DockStation.origin();
    // List<DockStation> aDockList = aDock.getAllDock();
    // aDockList.forEach((element)
    // {
    //   // code sai roi nay
    //   if (element.id == dockID) return element.lstBike;
    //   // else return null;
    // });
  }

  List<DockStation> getAllDocks() {
    // TODO: implement this
    // return dock.getAllDock();
    List lstDock = new List<DockStation>();

    lstDock.add(new DockStation(1, "Dock1", "252x252", "HN", 40));
    lstDock.add(new DockStation(2, "Dock2", "252x252", "HN", 42));
    lstDock.add(new DockStation(3, "Dock3", "252x252", "HCM", 41));
    return lstDock;
    // return dockModel.getAllDock();
  }
}
