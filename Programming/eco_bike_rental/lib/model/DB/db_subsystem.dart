import 'package:eco_bike_rental/model/DB/db_controller.dart';
import 'package:eco_bike_rental/model/DB/db_interface.dart';

class DatabaseSubsystem implements DatabaseSubsystemInterface {
  DatabaseSubsystemController _con;

  DatabaseSubsystem() {
    this._con = new DatabaseSubsystemController();
  }

  @override
  Future<List> getAllDock() async {
    // TODO: implement getAllDock
    Map response = await _con.getAllDock();
    return response["docks"];
  }

  @override
  Future<List> getDetailDock(int dockId) async {
    Map response = await _con.getDetailDock(dockId);
    return response["bikes"];
  }
}
