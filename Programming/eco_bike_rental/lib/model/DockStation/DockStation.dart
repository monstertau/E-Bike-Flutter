import 'package:eco_bike_rental/model/Bike/Bike.dart';

class DockStation {
  int id;
  String _dockName;
  String _dockArea;
  int _dockSize;
  String _dockAddress;
  List<Bike> _lstBike;

  int get dockID => id;
  DockStation.origin(){
    id = 0;
    _dockName = 'ABC';
    _dockSize = 27;
    _dockAddress = 'B1';
    _dockArea = '20x20';
    _lstBike = null;
  }
  DockStation(this.id, this._dockName, this._dockArea, this._dockAddress, this._dockSize, this._lstBike);

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

  List getAllDock() {
  //   // TODO: implement this
  //   //db = new dbconnect();
  //   //list<String> result;
  //   //result = dbconnect->getAllRow(DockStation);
  //   //return result;
  //
  //   List<String> result = new List<String>();
  //   return result;
    return List<DockStation>();
  }
}
