import 'package:eco_bike_rental/model/Bike/Bike.dart';

class DockStation {
  int id;
  String _dockName;
  String _dockArea;
  int _dockSize;
  String _dockAddress;
  List<Bike> _lstBike;

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
  List getAllDock(){
    // TODO: implement this
  }
}
