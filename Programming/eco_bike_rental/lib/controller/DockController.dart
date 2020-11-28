import 'package:eco_bike_rental/model/DockStation/DockStation.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class DockController extends ControllerMVC {
  DockController([StateMVC state]) : super(state) {
    dockModel = DockStation();
  }

  DockStation dockModel;

  List getAllBikes() {
    // TODO: implement this
    // return dockModel.lstBike;
    return List();
  }

  List getAllDocks() {
    // TODO: implement this
    // return dock.getAllDock();
    return List();
  }
}
