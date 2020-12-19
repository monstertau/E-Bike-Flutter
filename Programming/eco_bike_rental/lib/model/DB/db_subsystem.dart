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

  @override
  Future<Map> getBikeByBarcode(String barcode) async {
    // TODO: implement getBike
    Map response = await _con.getBikeByBarcode(barcode);
    return response["bike"];
  }

  @override
  Future<Map> checkLockCard(String cardCode) async {
    // TODO: implement checkLockCard
    Map response = await _con.checkLockedCard(cardCode);
    return response;
  }

  @override
  Future<Map> savePayment(Map payment) async {
    // TODO: implement savePayment
    Map response = await _con.savePayment(payment);
    return response;
  }

  Future<Map> updatePayment(Map payment) async {
    // TODO: implement updatePayment
    Map response = await _con.updatePayment(payment);
    return response;
  }
}
