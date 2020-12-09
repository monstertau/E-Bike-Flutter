import 'package:eco_bike_rental/model/DB/db_controller.dart';
import 'package:eco_bike_rental/model/DB/db_interface.dart';

class DatabaseSubsystem implements DatabaseSubsystemInterface {
  DatabaseSubsystemController _con;

  DatabaseSubsystem() {
    this._con = new DatabaseSubsystemController();
  }

  @override
  Future<Map> getAllDock() async{
    // TODO: implement getAllDock
    Map response = await _con.getAllDock();
    return response;
  }

  @override
  Future<Map> getDetailDock(String dockId) {
    // TODO: implement getDetailDock
    throw UnimplementedError();
  }
}
