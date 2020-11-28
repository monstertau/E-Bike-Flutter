import 'package:eco_bike_rental/model/Bike/Bike.dart';
import 'package:eco_bike_rental/model/DockStation/DockStation.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class DockController extends ControllerMVC {
  DockStation dockModel;

  DockController([StateMVC state]) : super(state) {
    dockModel = DockStation.origin();
  }

  // int requestDockID() {
  //
  //   return
  // }


  bool validateBikeList() {

  }
  bool validateDockList() {

  }

  List getAllBikes(int dockID) {
    // TODO: implement this
    // return dockModel.lstBike;
    List<String> dockStations = dockModel.getAllDock();
    return List();
  }

  List getAllDocks() {
    // TODO: implement this
    // return dock.getAllDock();
    return dockModel.getAllDock();
  }
}
